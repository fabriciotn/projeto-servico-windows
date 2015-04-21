package br.org.mg.hemoproject.modelo;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class ProjetoRepository {
	
	private EntityManager manager;

	public ProjetoRepository(EntityManager manager){
		this.manager = manager;
	}
	
	public void adiciona(Projeto projeto){
		this.manager.persist(projeto);
	}
	
	public List<Projeto> buscaTodos(){
		Query query = this.manager.createQuery("select x from projeto x");
		
		if(query == null)
			System.out.println("QUERY NULLLLLLL");
		else
			System.out.println("QUERY NÃOOOO NULLLL");
		
		return query.getResultList();
	}
}
