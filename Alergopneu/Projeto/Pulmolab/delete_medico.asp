<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	id = Request.QueryString("id")

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "SELECT * FROM corpoclinico WHERE id = "&id&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1
	
	if fs.FolderExists(caminho&"foto/"&rs("email")) then
		fs.DeleteFolder(caminho&"foto/"&rs("email"))
	end if
	
	
	sql = "DELETE FROM corpoclinico WHERE id = " & id 
	objdb.execute sql
	
	
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Cadastro excluído com sucesso!');
			window.location = "ferramenta_corpo.asp";
		</script>