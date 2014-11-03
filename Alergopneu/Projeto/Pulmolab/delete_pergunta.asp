<!--#include file="conexao.asp"-->
<%
	cod = Request.QueryString("cod")

	sql = "select cod from forum where cod = "&cod&""
	set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql, ObjDb, 3, 1
	if rs.eof = false then
		cod = rs("cod")
		
		sql = "delete from resposta where idForum=" & cod 
		ObjDb.execute sql

	end if
	
	sql = "delete from forum where cod=" & cod 
	ObjDb.execute sql

	rs.Close

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Pergunta excluída com sucesso!');
			window.location = "ferramenta_forum.asp";
		</script>