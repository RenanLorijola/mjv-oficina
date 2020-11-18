package br.com.mjv.oficina.registro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Classe controller para o cadastro de {@link Registro}
 * @author renan
 *
 */
@Controller
@RequestMapping("/registro")
public class RegistroController {
	
	@GetMapping("/cadastro")
	public String cadastrarRegistro() {
		return "cadastrarregistro";
	}
	
	@GetMapping("/consulta")
	public String consultarRegistro() {
		return "consultarregistro";
	}
	
}
