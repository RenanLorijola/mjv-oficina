package br.com.mjv.oficina.registro.service;

import java.util.Date;
import java.util.List;

import br.com.mjv.oficina.problema.model.Problema;
import br.com.mjv.oficina.registro.model.Registro;

public interface RegistroService {

	/**
	 * Cadastra um novo registro
	 * @param registro
	 */
	Integer cadastrarRegistro(Registro registro, Integer[] problemas);
	
	/**
	 * 
	 * Retorna uma List<{@link Problema}> que tenham o id do veiculo
	 * @param id
	 * @return List<{@link Problema}>
	 */
	List<Problema> getProblemaListByVeiculoId(Integer id);
	
	/**
	 * Cria os vinculos entre as tabelas TB_REGISTRO e TB_PROBLEMA
	 * @param idProblema, idRegistro
	 */
	void linkarProblemas(Integer idProblema, Integer idRegistro);
	
	/**
	 * Retorna uma List<{@link Problema}>, parametros name, dataInicio e dataFim são opcionais
	 * @param name, dataInicio, dataFim
	 */
	List<Registro> getAllRegistros(String name, Date dataInicio, Date dataFim);
}
