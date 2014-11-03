<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	cod = Request.QueryString("cod")

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "select * from noticias where cod = "&cod&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1

	tipo = rs("modelo")
	
	if tipo = 3 then
	
		if fs.FileExists(caminho&"\anexo\"&rs("imagem1")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem1")
		end if
		

		if fs.FileExists(caminho&"\anexo\"&rs("imagem2")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem2")
		end if
		

		sql = "delete from noticias where cod=" & cod 
		objdb.execute sql
	
	
	elseif tipo = 2 then
	
		sql = "select * from noticias where cod = "&cod&""
		set rs = Server.CreateObject("ADODB.RecordSet")
		rs.Open sql, objdb, 3, 1


		if fs.FileExists(caminho&"\anexo\"&rs("imagem1")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem1")
		end if
		

		sql = "delete from noticias where cod=" & cod 
		objdb.execute sql
		
	else
	
		sql = "delete from noticias where cod=" & cod 
		objdb.execute sql
	
	end if
	
	rs.Close


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Notícia excluída com sucesso!');
			window.location = "ferramenta_noticias.asp";
		</script>