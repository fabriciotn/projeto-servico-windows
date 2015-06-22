package com.testes;

import java.util.ArrayList;

import com.email.Email;

public class TesteDeEnvioDeEmail {

	public static void main(String[] args) {
		Email email = new Email();
		
		String assunto = "Teste de envio de e-mail - fabricio";
		String textoDaMensagem;
		ArrayList<String> addressList = new ArrayList<String>();
		
		textoDaMensagem = "<!DOCTYPE html>" +
							"<html>" +
							"<head>" +
							"<meta charset=\"ISO-8859-1\">" +
							"<title></title>" +
							"<style>" +
							"body {" +
								"font-family: verdana;" +
								"font-size: 0.9em;" +
							"}" +
							"</style>" +
							"</head>" +
							"<body>" +
								"<img src=\"http://localhost:8080/HemoProjectApp/images/logoHemominasEmail.png\">" +
								"<br>" +
								"<h2>Nova pend�ncia cadastrada</h2>" +
								"<p>" +
									"Ol�, <br>Uma nova pend�ncia foi cadastrada pelo usu�rio: XXXX" +
								"</p>" +
								"Seguem os dados da pend�ncia:" +
								"<ul>" +
									"<li>ID: XX</li>" +
									"<li>Setor: XXX</li>" +
									"<li>Categoria: XXX</li>" +
									"<li>Prioridade: XXX</li>" +
									"<li>Descri��o: XXXXXXXXXXXXXX</li>" +
								"</ul>" +
								"<br>" +
								"<p>" +
									"Atenciosamente,<br> <b>Equipe GTC</b>" +
								"</p>" +
								"<small>Este relat�rio foi gerado automaticamente pelo sistema.</small>" +
							"</body>" +
							"</html>";
		
		addressList.add("fabricio.teixeira@hemominas.mg.gov.br");
		addressList.add("fabriciotn@yahoo.com.br");
		addressList.add("fabricio.hemominas@gmail.com");
		addressList.add("vanessa.cruz@hemominas.mg.gov.br");
		
		//enviaEmail est� como protected para for�ar a sempre enviar e-mail pelas classes 
		//PendenciaCadastrada, PendenciaFechada e PendenciaAlterada
		email.enviaEmail(assunto, textoDaMensagem, addressList);
	}
}
