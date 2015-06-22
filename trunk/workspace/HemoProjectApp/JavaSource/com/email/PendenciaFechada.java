package com.email;

import java.util.ArrayList;

import com.model.Iteracao;
import com.model.Prioridade;

public class PendenciaFechada {
	public static void enviaEmail(Iteracao iteracao) {
		Email email = new Email();
		
		String assunto = "Pend�ncia " + iteracao.getPendencia().getId() + " foi encerrada - Sistema de Gerenciamento de Tarefas";
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
					"<p>Ol�, <br>A pend�ncia n�mero <b>" + iteracao.getPendencia().getId() + "</b> foi encerrada!<br>" +
						"Por favor verifique se est� tudo de acordo!</p>" +
					
					"Seguem os dados da pend�ncia:" +
					"<ul>" +
						"<li><b>ID:</b> " + iteracao.getPendencia().getId() + "</li>" +
						"<li><b>Setor:</b> " + iteracao.getPendencia().getSetor().getNome() + "</li>" +
						"<li><b>Categoria:</b> " + iteracao.getCategoria().getLabel() + "</li>" +
						"<li><b>Prioridade:</b> " + iteracao.getPrioridade().getLabel() + "</li>" +
						"<li><b>Descri��o:</b> " + iteracao.getDescricao() + "</li>" +
					"</ul>" +
					"<br>" +
					"<p>" +
						"Atenciosamente,<br> <b>Equipe GTC</b>" +
					"</p>" +
					"<small>Este relat�rio foi gerado automaticamente pelo sistema.</small>" +
				"</body>" +
				"</html>";
		
		//Envia para o usu�rio que cadastrou
		if(iteracao.getPendencia().getUsuario().getEmail() != null)
			addressList.add(iteracao.getPendencia().getUsuario().getEmail());
		
		//Envia para a SOFIS se a prioridade for GRAVE
		if(iteracao.getPendencia().getPrioridade() == Prioridade.GRAVE)
			//MUDAR O ENDERE�O PARA UM ENDER�O DA SOFIS
			addressList.add("fabriciotn@yahoo.com.br");

		
		email.enviaEmail(assunto, textoDaMensagem, addressList);
	}
}
