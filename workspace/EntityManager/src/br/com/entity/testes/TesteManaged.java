package br.com.entity.testes;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.entity.modelo.Pessoa;

public class TesteManaged {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("entity_manager");
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		
		//OBJETO NO ESTADO MANAGED
		Pessoa p = manager.find(Pessoa.class, 2L);
		
		//ALTERANDO O CONTE�DO DO OBJETO
		p.setNome("Maria Das Couves");
		
		//SINCRONIZANDO E CONFIRMANDO A TRANSA��O
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
}
