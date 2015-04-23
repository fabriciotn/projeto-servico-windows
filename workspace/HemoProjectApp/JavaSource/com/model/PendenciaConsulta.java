package com.model;


public class PendenciaConsulta {

	private int id;
    private String titulo;
    private String setor;
    private String status;
    private String categoria;
    private int qtdDePendencias;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getSetor() {
		return setor;
	}
	public void setSetor(String setor) {
		this.setor = setor;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public int getQtdDePendencias() {
		return qtdDePendencias;
	}
	public void setQtdDePendencias(int qtdDePendencias) {
		this.qtdDePendencias = qtdDePendencias;
	}
	

}
