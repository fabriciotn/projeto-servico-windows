<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pulmolab</title>
<link href="css.css" rel="stylesheet" type="text/css" />.
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">

<!-- #include file ="includes.asp" -->

</head>

<body>



<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
	<div id="centro"> 
		<div id="texto">
            <div id="titulo_centro"><img src="img/titulo_estudoandamento.png" width="218" height="16" border="0" /></div>
            <div id="texto_centro">
                     <%
                    cod = Request.QueryString("cod")
                    sqlPesquisa = "SELECT titulo, texto, cod, autor FROM pesquisa WHERE cod = "&cod&""
                    Set rsPesquisa = server.CreateObject("ADODB.RecordSet")
                    rsPesquisa.Open sqlPesquisa, ObjDB,3,1
                
                IF rsPesquisa.EOF = FALSE THEN
                
                    autor = rsPesquisa("autor")
                    texto = rsPesquisa("texto")
					texto = replace(texto,"'","")
					texto = replace(texto,chr(13),"<br />")
					titulo = rsPesquisa("titulo")
                    cod = rsPesquisa("cod")
                    %>	
                    <b><%=titulo%></b>
                        <br />
                            <br />
                        <br />
                     <%=texto%>
                        <br />
                        <br />
                    <i><%=autor%></i>
                <%END IF%>       
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
