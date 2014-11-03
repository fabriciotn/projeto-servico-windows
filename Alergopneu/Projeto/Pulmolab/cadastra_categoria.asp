<!--#include file="conexao.asp" -->
<%
	Response.ContentType="text/xml"
	Response.Write("<?xml version=""1.0"" encoding=""ISO-8859-1""?>" & vbcrlf)
		categoria 	= Replace(Request("categoria"),"|#"," ")
		if categoria <> "" then
			SQL = "INSERT INTO categoria_informacoes (nome) VALUES ('" & categoria & "')"
			ObjDb.execute SQL
			Response.Write("<hba>" & vbcrlf)
				Response.Write("<msg>ok</msg>" & vbcrlf)
			Response.Write("</hba>" & vbcrlf)
		else
			Response.Write("<hba>" & vbcrlf)
					Response.Write("<msg>errado</msg>" & vbcrlf)
			Response.Write("</hba>" & vbcrlf)
		end if %>