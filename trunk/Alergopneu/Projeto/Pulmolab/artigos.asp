<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
       <div id="titulo_centro"><img src="img/titulo_artigoscomentado.png" width="197" height="19" border="0" /></div>
       
       <div id="texto_centro">
<%

	SQL = "SELECT cod, titulo FROM artigos ORDER BY cod DESC"
	
	Set rsArtigo = server.CreateObject("ADODB.RecordSet")
	
'	Response.Write(SQL)
	rsArtigo.Open SQL, ObjDB,3,1

	WHILE rsArtigo.EOF = FALSE
	
		titulo = rsArtigo("titulo")
		cod = rsArtigo("cod")
%>
			<div class="destaque_vermelho" style="padding-bottom:20px;"><a href="verArtigo.asp?cod=<%=cod%>" class="link"><%=titulo%></a></div>
<%

		rsArtigo.MOVENEXT
	WEND


%>
       </div>
       
       </div>
       
 <!-- #include file="direita_menor.asp" -->      

</div>        
</div>
</div>
    

<!-- #include file="rodape.asp" -->

<!--#include file="conexaoOFF.asp" -->

</body>
</html>
