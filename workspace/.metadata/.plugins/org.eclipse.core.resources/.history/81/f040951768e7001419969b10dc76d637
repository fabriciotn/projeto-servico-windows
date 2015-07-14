package br.org.mg.hemoproject.util;

import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.org.mg.hemoproject.controle.ProjetoBean;
import br.org.mg.hemoproject.modelo.Categoria;
import br.org.mg.hemoproject.modelo.Pendencia;
import br.org.mg.hemoproject.modelo.Prioridade;
import br.org.mg.hemoproject.modelo.Projeto;
import br.org.mg.hemoproject.modelo.Setor;
import br.org.mg.hemoproject.modelo.Status;
import br.org.mg.hemoproject.modelo.Usuario;

public class teste {
	public static void main(String[] args) {

		ProjetoBean p = new ProjetoBean();
		List<Projeto> projetos = p.getProjetosList();
		
		for (Projeto projeto : projetos) {
			System.out.println(projeto.getNome());
		}
	}

	public void teste() {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();

		Usuario usuario = new Usuario();
		usuario.setMasp("123");
		usuario.setNome("fabricio");

		Setor setor = new Setor();
		setor.setNome("");
		// setor.getFuncionarios().add(usuario);

		Pendencia pendencia = new Pendencia();
		pendencia.setCategoria(Categoria.FLUXO);
		pendencia.setData(new GregorianCalendar());
		pendencia.setDescricao("problema 1 - descricao");
		pendencia.setItemDoEdital("item1");
		pendencia.setObs("observação das pendnecias");
		pendencia.setPrioridade(Prioridade.LEVE);
		pendencia.setSetor(setor);
		pendencia.setStatus(Status.ABERTO);
		pendencia.setTitulo("Problema 1 - titulo");

		Projeto projeto = new Projeto();
		projeto.setNome("Ciclo do Sangue");
		// projeto.getPendencias().add(pendencia);

		// manager.persist(usuario);
		// manager.persist(setor);
		// manager.persist(pendencia);
		manager.persist(projeto);

		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
}
