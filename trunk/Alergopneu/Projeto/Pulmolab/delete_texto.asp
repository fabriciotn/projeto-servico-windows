<!--#include file="conexao.asp"-->
<%

	cod = Request.QueryString("cod")

	
	sql = "DELETE FROM textos WHERE cod=" & cod 
	objdb.execute sql
	

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Texto excluída com sucesso!');
			window.location = "ferramenta_textos.asp";
		</script>