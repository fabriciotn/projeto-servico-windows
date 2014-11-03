<!--#include file="conexao.asp" -->
<%


	nome	=	Request.Form("nome")
	email	=	Request.Form("email")
	
	SQL = "SELECT id, email, nome, categoria FROM corpoclinico WHERE nome LIKE '%"&nome&"%' AND email = '"&email&"'" 
	
	Set rsLogin = Server.CreateObject("ADODB.RecordSet")
	
'	Response.Write(SQL)
'	Response.End()

	rsLogin.Open SQL, ObjDB, 3, 1
	
	IF rsLogin.EOF = FALSE THEN
	
		categoriaForum = rsLogin("categoria")
		emailForum = rsLogin("email")
		emailForum = rsLogin("nome")
		idForum = rsLogin("id")
		Session("nomeForum") = nomeForum
		Session("emailForum") = emailForum
		Session("categoriaForum") = categoriaForum
		Session("idForum") = idForum
	
		IF  categoriaForum = 6 THEN
	%>
			<script type="text/javascript">
	//			alert('categoria = 6');
//				alert('Login efetuado com sucesso!');
				window.location = "forum_leigos.asp";
			</script>
	<%	ELSE  %>
			<script type="text/javascript">
	//			alert('categoria <> 6');
//				alert('Login efetuado com sucesso!');
				window.location = "forum_medicos.asp";
			</script>
	<%	END IF  

	ELSE
%>

			<script type="text/javascript">
				alert('Erro! Dados incorretos, ou este email e usuário não estão cadastrados no sistema.');
				history.go(-1);
			</script>
<%	
	END IF
%>
<!--#include file="conexaoOFF.asp" -->