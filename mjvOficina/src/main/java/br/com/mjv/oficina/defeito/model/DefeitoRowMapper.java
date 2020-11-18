package br.com.mjv.oficina.defeito.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/**
 * Classe de mapeamento do modelo {@link Defeito} para a tabela TB_DEFEITO
 * @author renan
 *
 */
public class DefeitoRowMapper implements RowMapper<Defeito> {

	@Override
	public Defeito mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Defeito defeito = new Defeito();
		
		defeito.setIdDefeito(rs.getInt("idDefeito"));
		defeito.setNome(rs.getString("nome"));
		
		return defeito;
	}

}
