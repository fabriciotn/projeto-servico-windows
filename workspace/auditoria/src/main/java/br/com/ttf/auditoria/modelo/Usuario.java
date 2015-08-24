package br.com.ttf.auditoria.modelo;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@NamedQuery(name = "Usuario.findUserByMasp", query = "select u from Usuario u where u.masp = :masp")
public class Usuario implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String FIND_BY_MASP = "Usuario.findUserByMasp";

	@Id
	private int id;

	@Column(unique = true)
	private String masp;  //MASP usado como login
	private String password;
	private String nome;
	private String email;
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar ultimoAcesso;
	private Permissao permissao;
	
	public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Calendar getUltimoAcesso() {
		return ultimoAcesso;
	}
	public void setUltimoAcesso(Calendar ultimoAcesso) {
		this.ultimoAcesso = ultimoAcesso;
	}
	public Permissao getPermissao() {
		return permissao;
	}
	public void setPermissao(Permissao permissao) {
		this.permissao = permissao;
	}
	public int getId() {
		return id;
	}
	
	public boolean isAdministrador() {
		return Permissao.ADMINISTRADOR.equals(permissao);
	}
	public boolean isMaster() {
		return Permissao.MASTER.equals(permissao);
	}
	public boolean isAuditor() {
		return Permissao.AUDITOR.equals(permissao);
	}
	public boolean isRestrito() {
		return Permissao.RESTRITO.equals(permissao);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
