<!--#include file="conexao.asp"-->
<img src="img/icons/ajax-loader.gif"  />
<%
usuario = Session("usuario")
Session("usuario") = usuario


	tipo = Request.Form("tipo")
	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	


	
sql = "insert into textos (data, titulo, texto, tipo) values (now(), '"&titulo&"', '"&texto&"', "&tipo&")"
'RESPONSE.Write(sql)
'response.End()
objdb.execute sql


%>
		<script type="text/javascript">
			alert('Texto cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_textos.asp";
			window.opener.focus();
		</script>