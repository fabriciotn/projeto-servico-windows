<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!--#include file="includes.asp" -->
<link href="estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>


  <!--#include file="topo.asp" -->
  <!-- #include file="menu.asp" --> 
  
<div id="geral">
<div id="centro">
  
  <div id="texto">
    <div id="titulo"><img src="img/titulo_artigoscomentado.png" width="207" height="27" border="0" /></div>
    <div class="texto_centro">
<%

	cod = Request.QueryString("cod")

	SQL = "SELECT titulo, texto, comentario, data FROM artigos WHERE cod = " & cod
	
	Set rsArtigo = server.CreateObject("ADODB.RecordSet")
	
'	Response.Write(SQL)
	rsArtigo.Open SQL, ObjDB,3,1
	
	IF rsArtigo.EOF = FALSE	THEN
		
		titulo = rsArtigo("titulo")
		texto = rsArtigo("texto")
		comentario = rsArtigo("comentario")

%>	
		  <p class="destaque_vermelho"><%=titulo%></p>
			<br />
			<br />
			<%=texto%>
			<br />
			Comentário:<%=comentario%><br />
			<br />
<%

	END IF

%>			
			

		<span class="link"> <a href="artigos.asp" class="link">veja outras artigos </a></span></p>
    </div>
  </div>
  
  <!--#include file="direita_menor.asp" -->


</div>
</div>
<!--#include file="rodape.asp" -->
<!--#include file="conexaoOFF.asp" -->
</body>
</html>
