<!--#include file="conexao.asp"-->
<%
	id = Request.QueryString("id")
	
	
	SQL = "UPDATE usuario SET acesso = 1 WHERE id = " & id
'	Response.Write(SQL)
	ObjDb.execute SQL
	
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Acesso liberado com sucesso!');
			window.location = "ferramenta_usuario.asp";
		</script>