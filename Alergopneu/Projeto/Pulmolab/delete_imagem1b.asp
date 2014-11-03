<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	cod = Request.QueryString("cod")
	cod = cint(cod)

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "select * from noticias where cod = "&cod&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1
	
		if fs.FileExists(caminho&"\anexo\"&rs("imagem1")) then
			fs.DeleteFile caminho&"\anexo\"&rs("imagem1")
		end if
		
		sql = "update noticias set imagem1 = '' where cod="&cod&"" 
		objdb.execute sql
	
	rs.Close

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Imagem excluída com sucesso!');
			window.location = "editar_noticia2.asp?cod=<%=cod%>"
		</script>