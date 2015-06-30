package com.email;

import java.util.ArrayList;
import java.util.List;

import com.model.Iteracao;
import com.model.Prioridade;
import com.model.User;

public class PendenciaAlterada {
	public static void enviaEmail(Iteracao iteracao) {
		Email email = new Email();
		
		String assunto = "Pend�ncia " + iteracao.getPendencia().getId() + " sofreu modifica��es - Sistema de Gerenciamento de Tarefas";
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
					"<p>Ol�, <br>A pend�ncia n�mero <b>" + iteracao.getPendencia().getId() + "</b> foi alterada por: <b> " + iteracao.getUsuario().getName() + " </b>!<br>" +
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
		
		// Envia para todos os respons�veis pelo setor
		List<User> usuariosResponsaveisPeloSetor = new ArrayList<User>();
		usuariosResponsaveisPeloSetor = iteracao.getPendencia().getSetor().getUsuarios();
		for (User user : usuariosResponsaveisPeloSetor) {
			addressList.add(user.getEmail());
		}
		
		//Envia para a SOFIS, Fernando e Maildes se a prioridade for GRAVE
		if(iteracao.getPendencia().getPrioridade() == Prioridade.GRAVE){
			addressList.add("antonio.mendes@sofis.com.br");
			addressList.add("fernando.basques@hemominas.mg.gov.br");
			addressList.add("maildes.junqueira@hemominas.mg.gov.br");
		}

		
		email.enviaEmail(assunto, textoDaMensagem, addressList);
	}
}