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
        
	<div id="texto">
 <div class="titulo"><img src="img/titulo_informacoes.png" width="133" height="27" border="0" /></div>
 <div class="texto_centro">
<%
	cod = Request.QueryString("cod")
	SQL = "SELECT titulo, texto, cod FROM informacoes WHERE cod = " & cod
	
	Set rsInfo = Server.CreateObject("ADODB.RecordSet")
	
	rsInfo.Open SQL, ObjDB, 3, 1
	
	IF rsInfo.EOF = FALSE THEN
		
		titulo = Server.HTMLEncode(rsInfo("titulo"))

		texto = rsInfo("texto")
%>
     <div class="destaque_vermelho"><%=titulo%></div>
       <br />
       <br />
	       <%=texto%>
       <br />
       <br />
        <span class="link"> <a href="informacoes.asp" class="link">veja outras informações </a></span></p>
<%

	END IF

%>

		</div>
		
	</div>
       
 <!-- #include file="direita_menor.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->

<!--#include file="conexaoOFF.asp" -->

</body>
</html>
