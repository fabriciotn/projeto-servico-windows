<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

usuario = Session("usuario")
Session("usuario") = usuario

	tipo = Request.Form("tipo")
	cod = Request.Form("cod")

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	
	if tipo = 1 then
	
		sql = "select * from noticias where cod = "&cod&""
		set rs = Server.CreateObject("ADODB.RecordSet")
		rs.Open sql, objdb, 3, 1

		
		if fs.FileExists(caminho&"\anexo\"&rs("imagem1")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem1")
		end if
		

		if fs.FileExists(caminho&"\anexo\"&rs("imagem2")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem2")
		end if

		rs.Close

		sql = "update noticias set imagem1 = '', imagem2 = '' where cod="&cod 
		objdb.execute sql
	
	
	elseif tipo = 2 then
	
	
		sql = "select * from noticias where cod = "&cod&""
		set rs = Server.CreateObject("ADODB.RecordSet")
		rs.Open sql, objdb, 3, 1


		if fs.FileExists(caminho&"\anexo\"&rs("imagem2")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem2")
		end if

		rs.Close

		sql = "update noticias set imagem2 = '' where cod=" & cod 
		objdb.execute sql

	
	else
	end if



sql = "update noticias set modelo = '"&tipo&"' where cod="&cod
objdb.execute sql

%>
		<script type="text/javascript">
			alert('Notícia cadastrada com sucesso!');
			window.close();
			window.opener.location = "ferramenta_noticias.asp";
			window.opener.focus();
		</script>