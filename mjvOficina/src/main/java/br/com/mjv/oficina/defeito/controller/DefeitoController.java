package br.com.mjv.oficina.defeito.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Classe controller para o cadastro de {@link Defeito}
 * @author renan
 *
 */
@Controller
@RequestMapping("/defeitos")
public class DefeitoController {
	
	
	@GetMapping
	public String iniciarDefeito() {
		return "cadastrardefeito";
	}
	
}
