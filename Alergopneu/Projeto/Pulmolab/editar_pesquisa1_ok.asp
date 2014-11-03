<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	autor = Request.Form("autor")
	cod = Request.Form("cod")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	
sql = "update pesquisa set titulo = '"&titulo&"', texto = '"&texto&"', autor = '"&autor&"'  where cod = "&cod&""
objdb.execute sql


'Response.Redirect("editar_noticia2.asp?cod="&cod)
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Pesquisa atualizada com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_pesquisa.asp";
			window.opener.focus();
		</script>