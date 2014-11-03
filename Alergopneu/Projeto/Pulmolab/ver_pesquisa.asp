<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<style>
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
	padding: 0px 20px 10px 20px;
}
</style>

<!--#include file="conexao.asp"-->

<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>

<%
				cod = request.QueryString("cod")
				
				SQL = "SELECT cod, titulo, texto, data, autor FROM pesquisa WHERE cod = "& cod 
				'Response.Write(sql)
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1

if rs.eof = false then
	noticia = rs("texto")
	autor = rs("autor")
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

<b style="font-size:15px; font-weight:bold; text-align:left;"><%=Server.HTMLEncode(rs("titulo"))%> </b> 
<br />
<span style="font-size:10px; font-weight:bold; text-align:right; float:right"> <%=data%></span>
<br /><br />
<div style="text-align: justify">
<%=noticia%>
</div>
<br />
<br />
<i><%=autor%></i>
<%
	end if
	

%>
       

</body>
</head>
</html>
     
<!--#include file="conexaoOFF.asp" -->
