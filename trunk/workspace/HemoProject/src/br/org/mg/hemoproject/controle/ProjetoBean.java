package br.org.mg.hemoproject.controle;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import br.org.mg.hemoproject.modelo.Projeto;
import br.org.mg.hemoproject.modelo.ProjetoRepository;

@ManagedBean
public class ProjetoBean {

	private Projeto projeto;
	
	public void adicionaProjeto(){
		EntityManager manager = this.getEntityManager();
		ProjetoRepository repository = new ProjetoRepository(manager);
		
		repository.adiciona(projeto);
		this.projeto = new Projeto();
	}
	
	public List<Projeto> getProjetos(){
		EntityManager manager = this.getEntityManager();
		ProjetoRepository repository = new ProjetoRepository(manager);
		return repository.buscaTodos();
	}

	private EntityManager getEntityManager() {
		FacesContext fc = FacesContext.getCurrentInstance();
		ExternalContext ec = fc.getExternalContext();
		HttpServletRequest request = (HttpServletRequest) ec.getRequest();
		EntityManager manager = (EntityManager) request.getAttribute("EntityManager");
		return manager;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}
	
	
}
