package com.testes;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.model.User;

public class CadastraUsuarios {
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		
		User fabricio = new User();
		fabricio.setName("FABRICIO");
		fabricio.setMasp("12546446");
		manager.persist(fabricio);
		
		User vanessa = new User();
		vanessa.setName("VANESSA");
		vanessa.setMasp("13819578");
		manager.persist(vanessa);
		
		User rose = new User();
		rose.setName("rose");
		rose.setMasp("03664661");
		manager.persist(rose);
		
		User luciene = new User();
		luciene.setName("luciene");
		luciene.setMasp("12801908");
		manager.persist(luciene);
		
		User helton = new User();
		helton.setName("helton");
		helton.setMasp("13675384");
		manager.persist(helton);
		
		User maildes = new User();
		maildes.setName("maildes");
		maildes.setMasp("11684545");
		manager.persist(maildes);
		
			
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
}