<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	id = Request.QueryString("id")
	id = cint(id)

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "select * from corpoclinico where id = "&id&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1
	
		if fs.FileExists(caminho&"\img\"&rs("foto")) then
			fs.DeleteFile caminho&"\img\"&rs("foto")
		end if
		
		sql = "update corpoclinico set foto = '' where id="&id&"" 
		objdb.execute sql
	
	rs.Close

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Imagem excluída com sucesso!');
			window.location = "inserirFoto.asp?id=<%=id%>"
		</script>