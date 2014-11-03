<!--#include file="conexao.asp"-->
<%

	cod = Request.QueryString("cod")

	
	sql = "DELETE FROM informacoes WHERE cod=" & cod 
	objdb.execute sql
	

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Informação excluída com sucesso!');
			window.location = "ferramenta_informacoes.asp";
		</script>