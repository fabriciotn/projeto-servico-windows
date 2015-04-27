package com.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
//@Table(name="PR_ITERACAO") 
public class Iteracao implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @ManyToOne
    @JoinColumn(name="id_pendencia",nullable=false)
    private Pendencia pendencia;
    
    @Lob
    private String descricao;
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar dataDaPendencia;
    
    @Enumerated(EnumType.STRING)
    private Categoria categoria;
    
    @OneToOne
    private User usuario;
    
    @Enumerated(EnumType.STRING)
    private Status status;
    
    
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public User getUsuario() {
		return usuario;
	}
	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
