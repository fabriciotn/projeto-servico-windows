<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	cod = Request.Form("cod")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	
sql = "update informacoes set titulo = '"&titulo&"', texto = '"&texto&"' where cod = "&cod&""
objdb.execute sql


'Response.Redirect("editar_noticia2.asp?cod="&cod)
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Atualizado com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_informacoes.asp";
			window.opener.focus();
		</script>