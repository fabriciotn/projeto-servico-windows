<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	usuario = Session("usuario")
	Session("usuario") = usuario

cod = request("cod")

SQL ="DELETE FROM eventos WHERE cod = "&cod

objdb.execute SQL

Response.Redirect("ferramenta_calendario.asp?excluido=sim")

%>
<!--#include file="conexaoOFF.asp" -->
