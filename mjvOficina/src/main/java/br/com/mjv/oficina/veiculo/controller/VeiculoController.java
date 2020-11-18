package br.com.mjv.oficina.veiculo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Classe controller para o cadastro de {@link Veiculo}
 * @author renan
 *
 */
@Controller
@RequestMapping("/veiculo")
public class VeiculoController {

	@GetMapping
	public String iniciarVeiculo() {
		return "cadastrarveiculo";
	}
	
}
