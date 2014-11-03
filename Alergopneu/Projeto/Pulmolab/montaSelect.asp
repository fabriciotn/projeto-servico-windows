<!--#include file="conexao.asp" -->
<%
Response.ContentType="text/xml"
Response.Write("<?xml version=""1.0"" encoding=""ISO-8859-1""?>" & vbcrlf)
sql_select = "SELECT cod, nome FROM categoria_informacoes ORDER BY nome"
response.write("<sql>")
Set rs_select = Server.CreateObject("ADODB.Recordset") 
	rs_select.Open sql_select, ObjDB
		while not rs_select.eof
		id = rs_select("cod")
		nome = rs_select("nome")
		response.write("<opcao>")
		response.write("<id>" & id & "</id>")
		response.write("<nome>" & nome & "</nome>")
		response.write("</opcao>")
	rs_select.movenext
wend
	rs_select.Close
response.write("</sql>")
%>