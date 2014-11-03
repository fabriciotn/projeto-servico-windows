<!--#include file="conexao.asp"-->
<%

	cod = Request.QueryString("cod")

	
	sql = "DELETE FROM casoclinico WHERE cod=" & cod 
	objdb.execute sql




%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Caso excluído com sucesso!');
			window.location = "ferramenta_casoClinico.asp";
		</script>