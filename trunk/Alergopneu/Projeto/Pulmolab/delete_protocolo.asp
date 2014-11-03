<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(request.ServerVariables("PATH_INFO")), INstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

	cod = Request.QueryString("cod")

	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")


	sql = "select * from protocolos where cod = "&cod&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, objdb, 3, 1


	if fs.FileExists(caminho&"\protocolos\"&rs("arquivo")) then
		fs.DeleteFile caminho&"\protocolos\"&rs("arquivo")
	end if
	

	sql = "delete from protocolos where cod=" & cod 
	objdb.execute sql
	
	rs.Close


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Protocolo excluído com sucesso!');
			window.location = "ferramenta_protocolos.asp";
		</script>