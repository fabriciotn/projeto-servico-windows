<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<%

	pergunta		=		Request.Form("pergunta")
	nome			=		Request.Form("nome")
	email			=		Request.Form("email")


	tipo 			=		Request.Form("tipo")
'	Response.Write(tipo&"<br >|||||")
'	Response.End()
	
	SQL = "SELECT nome, id, email, categoria FROM corpoclinico WHERE nome LIKE '"&nome&"' AND email = '"&email&"' "
		
	Set rsPerguntar = Server.CreateObject("ADODB.RecordSet")

'	Response.Write(SQL)
'	Response.End()
	
	rsPerguntar.Open SQL, ObjDB, 3, 1
	
	IF rsPerguntar.EOF = FALSE THEN

		categoria = rsPerguntar("categoria")
		id = rsPerguntar("id")
	
	END IF
	
	IF categoria = 6 THEN
		tipo = 2		' TIPO DE FORUM PARA LEIGOS = 2
	ELSE
		tipo = 1		' TIPO DE FORUM PARA MEDICOS = 1
	END IF
	
'	data = Now()
	tipo = 2
	INSERT = "INSERT INTO forum (respondido, tipo, data, id_pessoa, pergunta ) VALUES (0, '"&tipo&"', NOW(), '"&id&"', '"&pergunta&"')"

'	Response.Write(INSERT)
'	Response.End()
	
	ObjDb.execute INSERT

%>
<!--#include file="conexaoOFF.asp" -->
<!--#include file="email_forum.asp" -->
<%
	IF tipo = 2 THEN
%>
		<script type="text/javascript">
			alert('Pergunta cadastrada com sucesso!');
			window.location = "forum_leigos.asp";
		</script>
<%
	ELSE
%>
		<script type="text/javascript">
			alert('Pergunta cadastrada com sucesso!');
			window.location = "forum_medicos.asp";
		</script>
<%
	END IF
%>