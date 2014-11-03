<!-- #include file="conexao.asp" -->
<%
modelo = Request("modelo")
cod = Request("cod")

	
		sql = "select * from noticias where cod = "&cod
		set rs = server.CreateObject("ADODB.RecordSet")
		rs.open sql, objdb, 3, 1
	
		
		if modelo = 3 then
	
			if rs("imagem1") = "" or rs("imagem2") = "" then
			
				Response.Write("invalido")
			else
			
				Response.Write("valido")
			end if
		elseif modelo = 2 then
	
			if rs("imagem1") = "" then
			
				Response.Write("invalido")
			else
				Response.Write("valido")
			end if
			
		else
			Response.Write("valido")
		end if

%>