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
       <div id="titulo_centro"><img src="img/titulo_outros.png" width="76" height="16" border="0" /></div>
       
       <div id="texto_centro">
 <%
 	SQL = "SELECT cod, data, titulo, texto FROM textos WHERE tipo = 7"

	Set rsFibrose = Server.CreateObject("ADODB.RecordSet")
	
	rsFibrose.Open SQL, ObjDb, 3, 1
	
	IF rsFibrose.EOF = FALSE THEN
	
		titulo = rsFibrose("titulo")
		texto = rsFibrose("texto")
	END IF
 %>
 <p>
 	<%=titulo%>
 </p>
 <br /><br />
 <p>
 	<%=texto%>
 </p>
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
