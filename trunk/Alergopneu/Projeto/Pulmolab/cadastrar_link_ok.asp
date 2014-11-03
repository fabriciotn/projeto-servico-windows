<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario


	titulo = Request.Form("titulo")
	pagina = Request.Form("pagina")
	texto = Request.Form("texto")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	

	
sql = "insert into link (titulo, pagina, texto) values ('"&titulo&"', '"&pagina&"', '"&texto&"')"
'RESPONSE.Write(sql)
'response.End()
objdb.execute sql


%>
		<script type="text/javascript">
			alert('Link cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_link.asp";
			window.opener.focus();
		</script>