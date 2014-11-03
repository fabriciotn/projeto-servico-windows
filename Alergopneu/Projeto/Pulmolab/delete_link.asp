<!--#include file="conexao.asp"-->
<%

	cod = Request.QueryString("cod")

	
	sql = "DELETE FROM link WHERE cod=" & cod 
	objdb.execute sql
	

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Link excluído com sucesso!');
			window.location = "ferramenta_link.asp";
		</script>