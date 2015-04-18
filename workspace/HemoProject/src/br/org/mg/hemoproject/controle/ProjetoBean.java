package br.org.mg.hemoproject.controle;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import br.org.mg.hemoproject.dao.ProjetoDaoImp;
import br.org.mg.hemoproject.modelo.Projeto;

@ManagedBean
public class ProjetoBean {

	private Projeto projeto;
	private List<Projeto> projetosList = new ArrayList<Projeto>();
	
	@PostConstruct
	public void init(){
		
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public List<Projeto> getProjetosList() {
		this.projetosList = new ProjetoDaoImp().list();
		return projetosList;
	}

	public void setProjetosList(List<Projeto> projetosList) {
		this.projetosList = projetosList;
	}
	
	
}
