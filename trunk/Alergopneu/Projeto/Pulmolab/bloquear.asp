<!--#include file="conexao.asp"-->
<%
	id = Request.QueryString("id")
	
	
	SQL = "UPDATE usuario SET acesso = 0 WHERE id = " & id
'	Response.Write(SQL)
	ObjDb.execute SQL
	
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Acesso bloqueado com sucesso!');
			window.location = "ferramenta_usuario.asp";
		</script>