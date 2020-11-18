package br.com.mjv.oficina.pecas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Classe controller para o cadastro de {@link Peca}
 * @author renan
 *
 */
@Controller
@RequestMapping("/peca")
public class PecasController {
	
	@GetMapping
	public String iniciarPeca() {
		return "cadastrarpeca";
	}
}
