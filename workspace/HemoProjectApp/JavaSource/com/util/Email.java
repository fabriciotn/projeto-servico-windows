package com.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.mail.SimpleEmail;

public class Email {

	public void enviaEmail() {
		try {
			SimpleEmail email = new SimpleEmail();
			email.setDebug(true);
			email.setSmtpPort(587);

			email.setHostName("200.198.4.36"); // o servidor SMTP
			email.addTo("fabricio.teixeira@hemominas.mg.gov.br"); // destinatário
			email.setFrom("fabricio.teixeira@hemominas.mg.gov.br", "Fabricio teste"); // remetente
			email.setSubject("Mensagem de Teste");// assunto do e-mail
			email.setMsg("Teste de Email utilizando commons-email");// conteudo

			//email.setStartTLSEnabled(true);
			//email.setStartTLSRequired(true);
			
			email.setAuthentication("fabricio.teixeira", "fabricioadm00!");
			
			// email.setAuthentication("hemocurriculo", "$i$Hem0cur");
			email.send(); // envia oe-mail
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void enviaEmailSimples() {
		try {
			SimpleEmail email = new SimpleEmail();
			email.setDebug(true);
			email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio
			email.addTo("fabricio.teixeira@hemominas.mg.gov.br", "Fabricio Hemo"); // destinatário
			email.setFrom("fabricio.hemominas@gmail.com", "Fabricio gmail"); // remetente
			email.setSubject("Teste -> Email simples"); // assunto do e-mail
			email.setMsg("Teste de Email utilizando commons-email"); // conteudo
																		// do
																		// e-mail
			email.setAuthentication("fabricio.hemominas@gmail.com", "fabricioadm00!");
			email.setSmtpPort(587);
			email.setStartTLSEnabled(true);
			email.setStartTLSRequired(true);
			email.send();
			System.out.println("funfou");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void teste() {
		String emailto = "fabricio.teixeira@hemominas.mg.gov.br";
		String assunto = "teste";
		String mensagem = "teste";

		Properties p = new Properties();

		p.put("mail.transport.protocol", "smtp");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "mail.hemominas.mg.gov.br");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.user", "fabricio.teixeira@hemominas.mg.gov.br");
		p.put("mail.smtp.auth", "true");
		p.put("mail.debug", "true");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.quitwait", "false");

		Session session = Session.getInstance(p, null);
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setFrom(new InternetAddress("fabricio.hemominas@gmail.com"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(emailto));
			msg.setSentDate(new Date());
			msg.setSubject(assunto);
			msg.setText(mensagem);
			Transport.send(msg);

		} catch (AddressException e) {
			System.out.println("erro: " + e.getMessage() + "\nClasse: " + e.getClass());
			e.printStackTrace();
		} catch (MessagingException e) {
			System.out.println("erro: " + e.getMessage() + "\nClasse: " + e.getClass());
			e.printStackTrace();
		}

	}

	public void teste1() {
		try {
			Properties p = new Properties();
			
			p.put("mail.debug", "true");
			p.put("mail.smtps.host", "mail.hemominas.mg.gov.br");
			p.put("mail.smtps.auth", "true");
			p.put("mail.smtps.port", "587");
			p.put("mail.smtps.starttls.enable", "true");

			Session session = Session.getInstance(p, null);

			Transport t = session.getTransport("smtps");
			Message msg = new MimeMessage(session);

			t.connect("mail.hemominas.mg.gov.br", "fabricio.teixeira@hemominas.mg.gov.br", "fabricioadm00!");
			t.sendMessage(msg, new Address[] { new InternetAddress("fabricio.hemominas@gmail.com") });

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Email mail = new Email();
		// mail.enviaEmailSimples();
		mail.enviaEmail();
		//mail.teste();
		//mail.teste1();
	}
}
