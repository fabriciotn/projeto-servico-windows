<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario


	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	comentario = Request.Form("comentario")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	comentario = replace(comentario,"'","")
	comentario = replace(comentario,chr(13),"<br />")

	

	
	
SQL = "INSERT INTO artigos (comentario, data, titulo, texto) values ('"&comentario&"', now(), '"&titulo&"', '"&texto&"')"
'RESPONSE.Write(SQL)
'response.End()
ObjDb.execute SQL

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Artigo cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_artigo.asp";
			window.opener.focus();
		</script>