package br.com.mjv.oficina.registro.dao;

import java.util.Date;
import java.util.List;

import br.com.mjv.oficina.peca.model.Peca;
import br.com.mjv.oficina.problema.model.Problema;
import br.com.mjv.oficina.registro.model.Registro;
import br.com.mjv.oficina.registroProblema.model.RegistroProblema;

public interface RegistroDao {

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
	 * 
	 * Retorna uma {@link RegistroProblema} que tenham o id do registro
	 * @param id
	 * @return {@link RegistroProblema}
	 */
	RegistroProblema getFirstRegistroProblemaIdByRegistroId(Integer id);
	
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
	
	/**
	 * Retorna um {@link Problema} a partir de seu id
	 * @param id
	 * @return
	 */
	Problema getProblemaById(Integer id);
}
