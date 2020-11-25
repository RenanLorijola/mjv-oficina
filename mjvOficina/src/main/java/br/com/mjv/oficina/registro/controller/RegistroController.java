package br.com.mjv.oficina.registro.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.mjv.oficina.defeito.model.Defeito;
import br.com.mjv.oficina.defeito.service.DefeitoService;
import br.com.mjv.oficina.peca.model.Peca;
import br.com.mjv.oficina.peca.service.PecaService;
import br.com.mjv.oficina.problema.model.Problema;
import br.com.mjv.oficina.registro.model.Registro;
import br.com.mjv.oficina.registro.service.RegistroService;
import br.com.mjv.oficina.registroTela.model.RegistroTela;
import br.com.mjv.oficina.veiculo.model.Veiculo;
import br.com.mjv.oficina.veiculo.service.VeiculoService;

/**
 * Classe controller para o cadastro de {@link Registro}
 * @author renan
 *
 */
@Controller
@RequestMapping("/registro")
public class RegistroController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(RegistroController.class);
	
	@Autowired
	private RegistroService registroService;
	
	@Autowired
	private VeiculoService veiculoService;
	
	@Autowired
	private PecaService pecaService;
	
	@Autowired
	private DefeitoService defeitoService;
	
	/**
	 * Controller para a rota /registro
	 * @return uma página de cadastro de registros, com o atributo veiculosList vindo do return da função {@link VeiculoService}.getAllVeiculos()
	 * @routes
	 * GET /registro
	 */
	@GetMapping("/cadastro")
	public String cadastroRegistro(Model model) {
		LOGGER.info("Início do método @Get cadastrarRegistro");
		
		model.addAttribute("veiculosList", veiculoService.getAllVeiculos());
		
		LOGGER.info("Fim do método @Get cadastrarRegistro");
		return "cadastrarregistro";
	}
	
	@PostMapping("/cadastrar")
	public String cadastrarRegistro(@RequestParam("problema") Integer[] problemas,@RequestParam("nomeCliente") String nomeCliente) { 
		try {
			Registro registro = new Registro();			
			
			LOGGER.info("Inicio do método cadastrarRegistro");
			registro.setNomeCliente(nomeCliente);
			
			Integer idRegistro = registroService.cadastrarRegistro(registro, problemas);
			
			for(Integer idProblema : problemas) {
				registroService.linkarProblemas(idProblema, idRegistro);
			}
			
			LOGGER.info("Fim do método cadastrarRegistro");
			return "cadastroconcluido";
		}catch (NullPointerException e) {
			LOGGER.error("Erro do método cadastrarRegistro: " + e.getMessage());
			return "redirect:/cadastrarregistro";
		}
	}
	
	/**
	 * Método para puxar um problema a partir do nome do veiculo
	 * @param name
	 * @return {@link ResponseEntity}
	 */
	@RequestMapping(value="/getproblemas", method=RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody 
	public ResponseEntity<Object> getProblemas(@RequestParam(required = true) String name) {
		LOGGER.info("Inicio do método @Get getProblemas");
		
		String cap = name.substring(0, 1).toUpperCase() + name.substring(1);
		
		Veiculo veiculo = veiculoService.getVeiculoFirstResultByName(cap);
		
		if(veiculo == null) {
			LOGGER.info("Fim do método @Get getProblemas");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}else {
			List<Problema> listProblema = registroService.getProblemaListByVeiculoId(veiculo.getIdVeiculo());
			
			List<RegistroTela> list = new ArrayList<>();
			
			for(Problema item : listProblema) {
				Defeito defeito = defeitoService.getById(item.getFkIdDefeito()); 
				Peca peca = pecaService.getById(item.getFkIdPeca());
				
				RegistroTela registroTela = new RegistroTela();
				
				registroTela.setDefeito(defeito.getNome());
				registroTela.setPeca(peca.getNome());
				registroTela.setFkIdProblema(item.getIdProblema());
				
				list.add(registroTela);
			}
			
			return new ResponseEntity<Object>(list, HttpStatus.OK);
		}
	}
	
	@GetMapping("/consulta")
	public String consultarRegistro(Model model) {
		LOGGER.info("Início do método @Get consultarRegistro");
		
		model.addAttribute("veiculosList", veiculoService.getAllVeiculos());
		model.addAttribute("registrosList", registroService.getAllRegistros(null, null, null));
		
		LOGGER.info("Fim do método @Get consultarRegistro");
		return "consultarregistro";
	}
	
}
