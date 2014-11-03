<!-- #include file="conexao.asp" -->
<%
cod = Request("cod")

	
		sql = "SELECT arquivo FROM protocolos WHERE cod = "&cod
		set rs = server.CreateObject("ADODB.RecordSet")
		rs.open sql, objdb, 3, 1
	
		

		if rs("arquivo") = "" then
		
			Response.Write("invalido")
		else
			Response.Write("valido")
		end if

%>
<!--#include file="conexaoOFF.asp" -->