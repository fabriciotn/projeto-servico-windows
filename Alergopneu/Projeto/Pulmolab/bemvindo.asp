<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->

</head>

<body>

<!-- #include file="topo.asp" --> 

<!-- #include file="menu.asp" -->

<div id="geral">
	<div id="centro">
		<%

	SQL = "SELECT texto, titulo FROM textohome ORDER BY cod DESC"
	Set rsTxt = Server.CreateObject("ADODB.RecordSet")
'	Response.Write(SQL)
	rsTxt.Open SQL, ObjDB, 3, 1
	
	IF rsTxt.EOF = FALSE THEN
		
		titulo = rsTxt("titulo")
		texto = rsTxt("texto")

	END IF
	

%>
		<div id="texto">
			<div id="titulo_centro"><img src="img/tituloHome.png" /><%=titulo%></div>
			<div id="texto_centro"><%=texto%></div>
		</div>
		
		<!-- #include file="direita_menor.asp" --> 
		
	</div>
</div>

<!-- #include file="rodape.asp" --> 

<!--#include file="conexaoOFF.asp" -->

</body>
</html>
