package br.org.mg.hemoproject.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.org.mg.hemoproject.modelo.Projeto;
import br.org.mg.hemoproject.util.Constantes;

public class ProjetoDaoImp implements ProjetoDao {

	@Override
	public void save(Projeto projeto) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(projeto);
		manager.getTransaction().commit();
		manager.close();
	}

	@Override
	public Projeto getLivro(long id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();
		return manager.find(Projeto.class, id);
	}

	@Override
	public List<Projeto> list() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		List projetos = manager.createQuery("from Projeto").getResultList();
		return projetos;
	}

	@Override
	public void remove(Projeto projeto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Projeto projeto) {
		// TODO Auto-generated method stub

	}

}
