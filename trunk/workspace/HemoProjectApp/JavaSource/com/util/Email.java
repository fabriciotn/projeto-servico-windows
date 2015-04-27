package com.util;

import org.apache.commons.mail.SimpleEmail;

public class Email {

	public void enviaEmail() {
		try {
			SimpleEmail email = new SimpleEmail();
			email.setSmtpPort(587);
			email.setHostName("200.198.4.36"); // o servidor SMTP para envio do
												// e-mail
			email.setSSL(true);
			email.setAuthentication("fabricio.teixeira", "fabricioadm00!");
			email.addTo("fabricio.teixeira@hemominas.mg.gov.br", "John Doe"); // destinatário
			email.setFrom("fabricio.teixeira@hemominas.mg.gov.br",
					"Fabricio teste"); // remetente
			email.setSubject("Mensagem de Teste");// assunto do e-mail
			email.setMsg("Teste de Email utilizando commons-email");// conteudo
																	// do e-mail
			email.send(); // envia oe-mail
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Email mail = new Email();
		mail.enviaEmail();
	}
}
