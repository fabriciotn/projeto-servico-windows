<!--#include file="conexao.asp"-->
<%

	cod = Request.QueryString("cod")

	
	sql = "DELETE FROM textohome WHERE cod=" & cod 
	objdb.execute sql
	

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Texto exclu�da com sucesso!');
			window.location = "ferramenta_txt.asp";
		</script>