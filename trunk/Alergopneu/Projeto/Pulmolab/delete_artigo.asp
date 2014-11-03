<!--#include file="conexao.asp"-->
<%

	cod = Request.QueryString("cod")

	
	SQL = "DELETE FROM artigos WHERE cod=" & cod 
	ObjDb.execute SQL
	

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Artigo excluído com sucesso!');
			window.location = "ferramenta_artigo.asp";
		</script>