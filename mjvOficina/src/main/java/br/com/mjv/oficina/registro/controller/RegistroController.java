package br.com.mjv.oficina.registro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.mjv.oficina.defeito.service.DefeitoService;
import br.com.mjv.oficina.peca.service.PecaService;
import br.com.mjv.oficina.veiculo.controller.VeiculoController;
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
	private DefeitoService defeitoService;
	
	@Autowired
	private PecaService pecaService;
	
	@Autowired
	private VeiculoService veiculoService;
	
	/**
	 * Controller para a rota /registro
	 * @return uma página de cadastro de registros, com o atributo veiculosList vindo do return da função {@link VeiculoService}.getAllVeiculos()
	 * @routes
	 * GET /registro
	 */
	@GetMapping("/cadastro")
	public String cadastrarRegistro(Model model) {
		LOGGER.info("Início do método @Get cadastrarRegistro");
		
		model.addAttribute("veiculosList", veiculoService.getAllVeiculos());
		
		LOGGER.info("Fim do método @Get cadastrarRegistro");
		return "cadastrarregistro";
	}
	
	/**
	 * Método para pegar os valores de {@link Peca} e {@link Defeito} a partir do nome do {@link Veiculo}
	 * @param name
	 * @return {@link ResponseEntity}
	 */
	@RequestMapping(value="/defeitospecas", method=RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody 
	public ResponseEntity<Object> getDefeitosPecas(@RequestParam(required = false) String name) {
		LOGGER.info("Inicio do método @Get checkVeiculosName");
		
		String cap = name.substring(0, 1).toUpperCase() + name.substring(1);
		
		Veiculo veiculo = veiculoService.getVeiculoFirstResultByName(cap);
		
		if(veiculo == null) {
			LOGGER.info("Fim do método @Get checkVeiculosName");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}else {
			LOGGER.info("Fim do método @Get checkVeiculosName");
			return new ResponseEntity<>("body", HttpStatus.OK);
		}
	}
	
	@GetMapping("/consulta")
	public String consultarRegistro() {
		return "consultarregistro";
	}
	
	
	
}
