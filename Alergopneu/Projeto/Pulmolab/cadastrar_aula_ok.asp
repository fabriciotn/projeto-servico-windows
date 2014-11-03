<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<!-- #include file="freeaspupload.asp" -->
<img src="img/icons/ajax-loader.gif"  />
<%
	Response.Charset = "iso-8859-1"
Dim uploadsDirVar
  uploadsDirVar = "c:\pulmolab\aulas" 
  

%>
<!-- #include file="funcaoUpload.asp" -->
<%


' PEGA VARIAVEIS

	nome = Upload.Form("nome")
	obs = Upload.Form("obs")
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")
	
	data = Upload.Form("data")
'	Response.Write(data & "<br />")
	'08/02/2011

	data = year(data)&"-"&month(data)&"-"&day(data)
'	Response.Write(data & "<br />")
'	Response.End()
	
SQL = "INSERT INTO aulas (nome, arquivo, obs, data) VALUES ('"&nome&"', '"&nome_arquivo&"', '"&obs&"', '"&data&"')"
'Response.Write(sql)
'Response.End()
ObjDb.execute SQL


%>
<!--#include file="conexaoOFF.asp" -->

		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_aulas.asp";
			window.opener.focus();
		</script>