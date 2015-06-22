package com.email;

import java.util.ArrayList;

import com.model.Pendencia;
import com.model.Prioridade;

public class PendenciaCadastrada {

	public static void enviaEmail(Pendencia pendencia) {
		Email email = new Email();
		
		String assunto = "Nova pend�ncia cadastrada - Sistema de Gerenciamento de Tarefas";
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
					"<img src=\"http://10.14.124.101:8080/HemoProjectApp/images/logoHemominasEmail.png\">" +
					"<br>" +
					"<h3> " + assunto + "</h3>" +
					"<p>Ol�, <br>Uma nova pend�ncia foi cadastrada pelo usu�rio: <b>" + pendencia.getUsuario().getName() + "</b></p>" +
					"Seguem os dados da pend�ncia:" +
					"<ul>" +
						"<li><b>ID:</b> " + pendencia.getId() + "</li>" +
						"<li><b>Setor:</b> " + pendencia.getSetor().getNome() + "</li>" +
						"<li><b>Categoria:</b> " + pendencia.getCategoria().getLabel() + "</li>" +
						"<li><b>Prioridade:</b> " + pendencia.getPrioridade().getLabel() + "</li>" +
						"<li><b>Descri��o:</b> " + pendencia.getDescricao() + "</li>" +
					"</ul>" +
					"<br>" +
					"<p>" +
						"Atenciosamente,<br> <b>Equipe GTC</b>" +
					"</p>" +
					"<small>Este relat�rio foi gerado automaticamente pelo sistema.</small>" +
				"</body>" +
				"</html>";
		
		//Envia para o usu�rio que cadastrou
		if(pendencia.getUsuario().getEmail() != null)
			addressList.add(pendencia.getUsuario().getEmail());
		
		//Envia para a SOFIS se a prioridade for GRAVE
		if(pendencia.getPrioridade() == Prioridade.GRAVE)
			//MUDAR O ENDERE�O PARA UM ENDER�O DA SOFIS
			addressList.add("fabriciotn@yahoo.com.br");

		
		email.enviaEmail(assunto, textoDaMensagem, addressList);
	}
}
