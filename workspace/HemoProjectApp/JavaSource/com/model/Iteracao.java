package com.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Iteracao implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String titulo;
    
    @ManyToOne(cascade=CascadeType.ALL) 
    @JoinColumn(name="id_iteracao") 
    private Pendencia pendencia;
    
    @Lob
    private String descricao;
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar dataDaPendencia;
    
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
	public Pendencia getPendencia() {
		return pendencia;
	}
	public void setPendencia(Pendencia pendencia) {
		this.pendencia = pendencia;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Calendar getDataDaPendencia() {
		return dataDaPendencia;
	}
	public void setDataDaPendencia(Calendar dataDaPendencia) {
		this.dataDaPendencia = dataDaPendencia;
	}
    
    
}
