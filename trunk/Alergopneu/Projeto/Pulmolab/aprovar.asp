<!--#include file="conexao.asp"-->
<%

	id = Request.QueryString("id")

	sql = "UPDATE corpoclinico SET aprovado = 1 WHERE id=" & id 
	objdb.execute sql
	
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Cadastro aprovado com sucesso!');
			window.location = "ferramenta_corpo.asp";
		</script>