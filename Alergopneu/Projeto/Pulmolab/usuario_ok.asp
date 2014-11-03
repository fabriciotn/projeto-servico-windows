<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	tipoForm = Lcase(Request.Form("tipoForm"))
	nome = Request.Form("nome")
	obs = Request.Form("obs")
	email = Request.Form("email")
	cod = Request.Form("cod")
	
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")
	
	
IF tipoForm = "cadastrar" THEN
	SQL = "INSERT INTO usuario (usuario, email, obs, nivel, senha) VALUES ('"&nome&"', email = '"&email&"', obs = '"&obs&"', 3, 123456)"
	ObjDb.execute SQL
ELSE
	SQL = "UPDATE usuario SET usuario = '"&nome&"', obs = '"&obs&"', email = '"&email&"'  WHERE id = "&cod&""
	ObjDb.execute SQL
END IF


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Atualizado com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_usuario.asp";
			window.opener.focus();
		</script>