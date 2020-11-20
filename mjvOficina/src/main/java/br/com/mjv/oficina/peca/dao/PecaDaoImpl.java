package br.com.mjv.oficina.peca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import br.com.mjv.oficina.defeito.model.Defeito;
import br.com.mjv.oficina.defeito.model.DefeitoRowMapper;
import br.com.mjv.oficina.peca.model.Peca;
import br.com.mjv.oficina.peca.model.PecaRowMapper;

@Repository
public class PecaDaoImpl implements PecaDao {

	@Autowired
	private NamedParameterJdbcTemplate template;
	
	@Autowired
	private DataSource dataSource;
	
	private final Logger LOGGER = LoggerFactory.getLogger(PecaDaoImpl.class);
	
	@Override
	public List<Peca> getAllPecas() {
		String sql = "SELECT * FROM TB_PECA";
		
		List<Peca> list = new ArrayList<>();
		
		try {
			LOGGER.info("Inicio do método getAllPecas");
			
			list.addAll(template.query(sql, new PecaRowMapper()));
			LOGGER.info("Inicio do método getAllPecas");
			return list;
		}catch(EmptyResultDataAccessException e) {
			LOGGER.error("Erro emptyResult no método getAllPecas: " + e.getMessage());
			return list;
		}
	}

	@Override
	public Integer cadastrarPeca(Peca peca) {
		LOGGER.info("Inicio do método cadastrarPeca");
		
		SimpleJdbcInsert insert = new SimpleJdbcInsert(dataSource).withTableName("TB_PECA").usingColumns("nome").usingGeneratedKeyColumns("idPeca");
		MapSqlParameterSource params = new MapSqlParameterSource().addValue("nome", peca.getNome());
		Integer key = (Integer) insert.executeAndReturnKey(params);
		
		LOGGER.info("Fim do método cadastrarPeca");
		return key;
	}

	@Override
	public Peca getPecaFirstResultByName(String name) {
		String sql = "SELECT * FROM TB_PECA WHERE nome = :nome";
		try {
			LOGGER.info("Inicio do método getPecaFirstResultByName");

			MapSqlParameterSource params = new MapSqlParameterSource().addValue("nome", name);
			Peca peca = template.queryForObject(sql, params, new PecaRowMapper());
			
			LOGGER.info("Fim do método getPecaFirstResultByName");
			return peca;
		}catch (EmptyResultDataAccessException e) {
			LOGGER.error("Erro emptyResult no método getPecaFirstResultByName: " + e.getMessage());
			return null;
		}
	}

	@Override
	public void linkarDefeitos(List<Defeito> list, Integer idPeca) {
		LOGGER.info("Inicio do método linkarDefeitos");
		
		SimpleJdbcInsert insert = new SimpleJdbcInsert(dataSource).withTableName("TB_DEFEITO_PECA").usingColumns("fkIdDefeito", "fkIdPeca");
		
		for(Defeito defeito : list) {
			MapSqlParameterSource param = new MapSqlParameterSource().addValue("fkIdDefeito", defeito.getIdDefeito()).addValue("fkIdPeca", idPeca);
			
			insert.execute(param);
		}
		
		LOGGER.info("Fim do método linkarDefeitos");
	}

	@Override
	public List<Defeito> listarDefeitosPecas(Peca peca) {
		LOGGER.info("Inicio do método getPecaFirstResultByName");
		
		String sql = "SELECT p.nome, d.*, dp.fkIdDefeito, pd.fkIdPeca \r\n"
				+ " FROM TB_PECA p, TB_DEFEITO d, TB_DEFEITO_PECA dp\r\n"
				+ " WHERE fkIdDefeito = idDefeito \r\n"
				+ " AND fkIdPeca = idPeca";
		try {
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("idPeca", peca.getIdPeca());
			
			List<Defeito> list = template.query(sql, params, new DefeitoRowMapper());
			return list;
		}catch(EmptyResultDataAccessException e) {
			LOGGER.error("MangaHQDaoImpl - " + e.getMessage());
			return null;
		}finally {
			LOGGER.info("MangaHQDaoImpl - Fim do método listarMangasHqsUsuario");
		}
	}

}
