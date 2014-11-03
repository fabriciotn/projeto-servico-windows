<!--#include file="conexao.asp"-->
<%

	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	cod = Request.Form("cod")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	
sql = "update textoHome set titulo = '"&titulo&"', texto = '"&texto&"'  where cod = "&cod&""
objdb.execute sql


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Texto atualizado com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_txt.asp";
			window.opener.focus();
		</script>