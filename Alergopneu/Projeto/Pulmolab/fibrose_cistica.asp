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
       <div id="titulo_centro"><img src="img/titulo_fibrosecistica.png" width="166" height="20" border="0" /></div>
       
       <div id="texto_centro">
      <p align="center"><img src="img/logofibrose.jpg" width="184" height="94" border="0" /></p>
 <p>&nbsp;</p>
 <%
 	SQL = "SELECT cod, data, titulo, texto FROM textos WHERE tipo = 8"

	Set rsFibrose = Server.CreateObject("ADODB.RecordSet")
	
	rsFibrose.Open SQL, ObjDb, 3, 1
	
	IF rsFibrose.EOF = FALSE THEN
	
		titulo = rsFibrose("titulo")
		texto = rsFibrose("texto")
	END IF
 %>
 <p>
 
 	<%=texto%>
 </p>



<p>&nbsp;</p>
<p align="center"><img src="img/fibrose.jpg" width="313" height="125" border="0" /><br />
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Criada em 1982 a AMAM –  Associação Mineira de Assistência à Mucoviscidose – Fibrose Cística, é uma  entidade filantrópica, cujo principal objetivo é garantir aos seus associados  de forma gratuita, os medicamentos/ suplementos nutricional e equipamentos  indispensáveis ao tratamento da doença. A associação não recebe subvenção  governamental. É mantida por doações voluntárias de pacientes, familiares e  parceiros, o que não supre suas despesas. </p>
<p>&nbsp;</p>
A AMAM possui Título de Utilidade Pública Municipal,  Estadual e Federal o que comprova a idoneidade de seus trabalhos.  Conheça  melhor os trabalhos desenvolvidos pela AMAM acessando o site <span class="link"><a href="http://www.amam.org.br" target="_blank">www.amam.org.br</a></span>.
<p>&nbsp;</p>

       
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
