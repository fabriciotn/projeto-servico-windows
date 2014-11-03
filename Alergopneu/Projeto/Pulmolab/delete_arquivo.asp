<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	cod = Request.QueryString("cod")
	cod = cint(cod)

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "SELECT arquivo FROM aulas WHERE cod = "&cod&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1
	
		if fs.FileExists(caminho&"\aulas\"&rs("arquivo")) then
			fs.DeleteFile caminho&"\aulas\"&rs("arquivo")
		end if
		
		sql = "UPDATE aulas SET arquivo = '' WHERE cod="&cod&"" 
		objdb.execute sql
	
	rs.Close

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Arquivo removido com sucesso!');
			window.location = "editar_aula2.asp?cod=<%=cod%>"
		</script>