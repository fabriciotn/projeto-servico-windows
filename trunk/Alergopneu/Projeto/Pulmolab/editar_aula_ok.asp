<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario


' PEGA VARIAVEIS
	
	cod = Request.Form("cod")
	
	nome = Request.Form("nome")
	obs = Request.Form("obs")
	
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")


SQL = "UPDATE aulas SET nome = '"&nome&"', obs = '"&obs&"'  WHERE cod = " & cod
ObjDb.execute SQL

Response.Redirect("editar_aula2.asp?cod=" & cod)

%>
<!--#include file="conexaoOFF.asp" -->