<!--#include file="conexao.asp"-->
<%

	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	cod = Request.Form("cod")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	
sql = "update textos set titulo = '"&titulo&"', texto = '"&texto&"', data = now()  where cod = "&cod&""
'Response.Write(sql)
'response.End()

objdb.execute sql


%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Texto atualizado com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_textos.asp";
			window.opener.focus();
		</script>