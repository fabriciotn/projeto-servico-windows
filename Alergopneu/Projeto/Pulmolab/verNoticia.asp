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
 <div class="titulo" style="margin-bottom:20px;"><img src="img/titulo_noticia.png" width="90" height="17" /></div>
 <div class="texto_centro">
<%
cod = Request.QueryString("cod")

SQL = "SELECT cod, titulo, noticia, data FROM noticias WHERE cod = "& cod 
Set rs = Server.CreateObject("ADODB.RecordSet")
'response.Write(SQL)
rs.Open SQL, ObjDB, 3, 1
if rs.eof = false then
	
	noticia = rs("noticia")

	dia = day(rs("data"))
	mes = month(rs("data"))
	ano = year(rs("data"))
	hora = hour(rs("data"))
	minuto = minute(rs("data"))
	segundo = second(rs("data"))
	
	if len(dia) = 1 then
	dia = 0&dia
	end if
	
	if len(mes) = 1 then
	mes = 0&mes
	end if
	
	if len(hora) = 1 then
	hora = 0&hora
	end if
	
	if len(minuto) = 1 then
	minuto = 0&minuto
	end if
	
	if len(segundo) = 1 then
	segundo = 0&segundo
	end if
	
	
	data = dia&"/"&mes&"/"&ano&" "
	

%>

<p style="font-size:15px; font-weight:bold; text-align:left;"><%=rs("titulo")%> </p>
<br />
<span style="font-size:10px; font-weight:bold; text-align:right; float:right"> <%=data%></span>
<br /><br />
<div style="text-align: justify; font-weight:normal">
<%=noticia%>
</div>

<%
	end if
	

%>


<br /><br />

<span class="destaque_vermelho" style="font-size:24px; font-weight:bold">.  </span>
<span style="font-weight:bold; font-size:12px;">Outras not&iacute;cias	</span>

<br /><br />

<%
SQL = "SELECT titulo, cod FROM noticias WHERE cod <> " & rs("cod") & " ORDER BY cod desc"
Set rs_noticias = Server.CreateObject("ADODB.RecordSet")
rs_noticias.Open SQL, ObjDB, 3, 1
while rs_noticias.eof = false

%>
<div class="link_links">
	<a href="verNoticia.asp?cod=<%=rs_noticias("cod")%>"><%=Server.HTMLEncode(rs_noticias("titulo"))%></a>
</div>

<br />

<% 
	rs_noticias.movenext
	wend
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
