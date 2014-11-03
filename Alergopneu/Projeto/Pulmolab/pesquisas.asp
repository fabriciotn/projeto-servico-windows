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
       <div id="titulo_centro"><img src="img/titulo_estudoandamento.png" width="218" height="16" border="0" /></div>
       
       <div id="texto_centro">
 <div>
     <ul>
       <div>
 <%
	SQL_3 = "SELECT titulo as nome, texto as obs, cod, data  FROM pesquisa ORDER BY cod DESC"
	Set rsAula = Server.CreateObject("ADODB.RecordSet")
	rsAula.Open SQL_3, ObjDB, 3, 1
	
	WHILE rsAula.EOF = FALSE
		
		data	= rsAula("data")
		titulo = rsAula("nome")
		texto = rsAula("obs")
	        cod = rsAula("cod")

		texto = Replace(Replace(texto, "<b>", ""), "</b>", "")
		IF Len(texto) > 100 THEN
			texto = mid(texto,1,100)&"..."	
		END IF
		
	
%>
       
           <p class="destaque_vermelho"><span class="link"><a href="estudo_andamento.asp?cod=<%=cod%>"><%=Server.HTMLEncode(titulo)%></a></span></p>
           <p class="destaque_vermelho">&nbsp;</p>
           <p><%=Server.HTMLEncode(texto)%></p>
           <p>&nbsp;</p>
		   
<%
	rsAula.MOVENEXT
	WEND

	Set rsAula = Nothing
%>

       </div>
     </ul>
   </div>
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
