<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	cod = Request.QueryString("cod")

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "select * from aulas where cod = "&cod&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1

	if fs.FileExists(caminho&"\aulas\"&rs("arquivo")) then
		fs.DeleteFile caminho&"\aulas\"&rs("arquivo")
	end if
	

	sql = "delete from aulas where cod=" & cod 
	objdb.execute sql
	
	rs.Close


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Aula excluída com sucesso!');
			window.location = "ferramenta_aulas.asp";
		</script>