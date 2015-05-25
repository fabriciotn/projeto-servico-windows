package com.testes;

import java.util.GregorianCalendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.dao.UserDAO;
import com.facade.PendenciaFacade;
import com.model.Categoria;
import com.model.Iteracao;
import com.model.Pendencia;
import com.model.Status;
import com.model.User;

public class CadastraIteracao {
	public static void main(String[] args) {
		Pendencia pendencia00 = new PendenciaFacade().findPendencia(239);
		Pendencia pendencia01 = new PendenciaFacade().findPendencia(240);
		Pendencia pendencia02 = new PendenciaFacade().findPendencia(241);
		Pendencia pendencia03 = new PendenciaFacade().findPendencia(242);
		Pendencia pendencia04 = new PendenciaFacade().findPendencia(243);
		Pendencia pendencia05 = new PendenciaFacade().findPendencia(244);
		Pendencia pendencia06 = new PendenciaFacade().findPendencia(245);
		Pendencia pendencia07 = new PendenciaFacade().findPendencia(246);
		Pendencia pendencia08 = new PendenciaFacade().findPendencia(247);
		Pendencia pendencia09 = new PendenciaFacade().findPendencia(248);
		Pendencia pendencia10 = new PendenciaFacade().findPendencia(249);
		Pendencia pendencia11 = new PendenciaFacade().findPendencia(251);
		Pendencia pendencia12 = new PendenciaFacade().findPendencia(252);
		Pendencia pendencia13 = new PendenciaFacade().findPendencia(257);
		Pendencia pendencia14 = new PendenciaFacade().findPendencia(434);
		Pendencia pendencia15 = new PendenciaFacade().findPendencia(435);
		
		insereIteracao(pendencia00);
		insereIteracao(pendencia01);
		insereIteracao(pendencia02);
		insereIteracao(pendencia03);
		insereIteracao(pendencia04);
		insereIteracao(pendencia05);
		insereIteracao(pendencia06);
		insereIteracao(pendencia07);
		insereIteracao(pendencia08);
		insereIteracao(pendencia09);
		insereIteracao(pendencia10);
		insereIteracao(pendencia11);
		insereIteracao(pendencia12);
		insereIteracao(pendencia13);
		insereIteracao(pendencia14);
		insereIteracao(pendencia15);
	}

	private static void insereIteracao(Pendencia pendencia) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("hemoproject");
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		
		UserDAO usuariodao = new UserDAO();
		
		//obtem o usuário
		usuariodao.beginTransaction();
		User usuario = usuariodao.findUserByMasp("@Importacao");
		usuariodao.closeTransaction();
		
		Iteracao iteracao = new Iteracao();
		iteracao.setCategoria(Categoria.CONFIGURACAO);
		iteracao.setDescricao("PENDENTE.Conforme reunião realizada em 21/05");
		iteracao.setStatus(Status.EXECUCAO);
		iteracao.setUsuario(usuario);
		iteracao.setPendencia(pendencia);
		iteracao.setDataDaPendencia(new GregorianCalendar().getInstance());
		
		manager.persist(iteracao);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
		
		System.out.println("gravou");
	}
}
