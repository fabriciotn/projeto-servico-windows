<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	pagina = Request.Form("pagina")
	cod = Request.Form("cod")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	
sql = "update link set titulo = '"&titulo&"', pagina = '"&pagina&"', texto = '"&texto&"'  where cod = "&cod&""
objdb.execute sql


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Link atualizado com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_link.asp";
			window.opener.focus();
		</script>