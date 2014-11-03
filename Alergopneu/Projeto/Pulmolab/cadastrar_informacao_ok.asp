<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<!-- #include file="freeaspupload.asp" -->
<%
	Response.Charset = "iso-8859-1"


Dim uploadsDirVar
  uploadsDirVar = "c:\pulmolab\informacoes" 
  

%>
<!-- #include file="funcaoUpload.asp" -->
<%

'Salva o arquivo no servidor
		titulo = Upload.Form("titulo")
		categoria = Upload.Form("categoria")
   

' PEGA VARIAVEIS


	
	obs = Upload.Form("obs")
	
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")
	

	
SQL = "INSERT INTO informacoes (titulo, arquivo, texto, cod_categoria_informacoes, data) VALUES ('"&titulo&"', '"&nome_arquivo&"','"&obs&"', '"&categoria&"', curDate())"
'Response.Write(sql)
'Response.End()
ObjDb.execute SQL

%>
<!--#include file="conexaoOFF.asp" -->

		<script type="text/javascript">
			alert('Informação cadastrada com sucesso!');
			window.close();
			window.opener.location = "ferramenta_informacoes.asp";
			window.opener.focus();
		</script>