package br.com.caelum.jdbc.model;

public class Categoria {

	private Integer id;
	private String nome;
	
	public Categoria(Integer id, String nome) {
		this.id = id;
		this.nome = nome;
	}

	public Integer getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}
	
	
}
