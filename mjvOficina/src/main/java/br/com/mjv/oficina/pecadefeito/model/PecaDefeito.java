package br.com.mjv.oficina.pecadefeito.model;

public class PecaDefeito {

	private Integer idPecaDefeito;
	private Integer fkIdPeca;
	private Integer fkIdDefeito;
	
	public Integer getIdPecaDefeito() {
		return idPecaDefeito;
	}
	public void setIdPecaDefeito(Integer idPecaDefeito) {
		this.idPecaDefeito = idPecaDefeito;
	}
	public Integer getFkIdPeca() {
		return fkIdPeca;
	}
	public void setFkIdPeca(Integer fkIdPeca) {
		this.fkIdPeca = fkIdPeca;
	}
	public Integer getFkIdDefeito() {
		return fkIdDefeito;
	}
	public void setFkIdDefeito(Integer fkIdDefeito) {
		this.fkIdDefeito = fkIdDefeito;
	}
	
	
}
