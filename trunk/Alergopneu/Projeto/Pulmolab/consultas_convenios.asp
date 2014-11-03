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
       <div id="titulo_centro"><img src="img/titulo_consultaconvenios.png" width="200" height="17" border="0" /></div>
       
       <div id="texto_centro">
     <%

'	tipo 5 = tipo consulta convenios

	sqlTextos = "SELECT titulo, texto, cod FROM textos WHERE tipo = 5 ORDER BY cod DESC LIMIT 1"
	
	Set rsTextos = server.CreateObject("ADODB.RecordSet")
	
'	Response.Write(sqlTextos)
'	Response.End()
	
	rsTextos.Open sqlTextos, ObjDB,3,1

	IF rsTextos.EOF = FALSE THEN
	
		texto = rsTextos("texto")
		titulo = rsTextos("titulo")
		cod = rsTextos("cod")
%>	
    <p><span class="destaque_vermelho"><%=titulo%></span><br /><br />
     <%=texto%>
  <%
	END IF
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
