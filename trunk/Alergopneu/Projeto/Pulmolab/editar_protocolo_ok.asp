<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	nome = Request.Form("nome")
	obs = Request.Form("obs")
	cod = Request.Form("cod")
	
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")
	
	
SQL = "UPDATE protocolos SET nome = '"&nome&"', obs = '"&obs&"'  WHERE cod = "&cod&""
ObjDb.execute SQL

Response.Redirect("editar_protocolo2.asp?cod="&cod)
%>
<!--#include file="conexaoOFF.asp" -->