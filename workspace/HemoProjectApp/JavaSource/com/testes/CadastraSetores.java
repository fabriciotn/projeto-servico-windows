package com.testes;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.model.Projeto;
import com.model.Setor;

public class CadastraSetores {
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		
		//Adicionando 21 linhas no banco.. depois atualizei os nomes via banco mesmo
		for(int i=0; i < 21; i++){
			Setor setor = new Setor();
			setor.setNome("");
			manager.persist(setor);
		}
		
		
			
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
}
