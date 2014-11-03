<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<!-- #include file="freeaspupload.asp" -->
<%
usuario = Session("usuario")
Session("usuario") = usuario

Response.Charset = "iso-8859-1"

Dim uploadsDirVar
  uploadsDirVar = "c:\pulmolab\casoclinico" 
  

%>
<!-- #include file="funcaoUpload.asp" -->
<%

	titulo = Upload.Form("titulo")
	texto = Upload.Form("texto")
	autor = Upload.Form("autor")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	data = Upload.Form("data")
	data = year(data) & "-" & month(data) & "-" & day(data)


sql = "INSERT INTO casoclinico (autor, data, data_cadastro, titulo, texto, arquivo) values ('"&autor&"', '"&data&"', now(), '"&titulo&"', '"&texto&"', '"&nome_arquivo&"')"
RESPONSE.Write(sql)
'response.End()
objdb.execute sql

%>
<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_casoClinico.asp";
			window.opener.focus();
		</script>

