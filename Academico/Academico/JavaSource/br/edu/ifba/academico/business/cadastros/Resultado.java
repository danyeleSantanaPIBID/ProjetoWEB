package br.edu.ifba.academico.business.cadastros;

import java.util.Date;



public class Resultado {
	private Double mediaTrabEscolar;
	private Double mediaFinal;
	private int conceito;
	private boolean aprovado;
	private boolean necessarioFinal;
	private int totalFaltas;
	public Double getMediaTrabEscolar() {
		return mediaTrabEscolar;
	}
	public void setMediaTrabEscolar(Double mediaTrabEscolar) {
		this.mediaTrabEscolar = mediaTrabEscolar;
	}
	public Double getMediaFinal() {
		return mediaFinal;
	}
	public void setMediaFinal(Double mediaFinal) {
		this.mediaFinal = mediaFinal;
	}
	public int getConceito() {
		return conceito;
	}
	public void setConceito(int conceito) {
		this.conceito = conceito;
	}
	public boolean isAprovado() {
		return aprovado;
	}
	public void setAprovado(boolean aprovado) {
		this.aprovado = aprovado;
	}
	public boolean isNecessarioFinal() {
		return necessarioFinal;
	}
	public void setNecessarioFinal(boolean necessarioFinal) {
		this.necessarioFinal = necessarioFinal;
	}
	public int getTotalFaltas() {
		return totalFaltas;
	}
	public void setTotalFaltas(int totalFaltas) {
		this.totalFaltas = totalFaltas;
	}
	
	

}
