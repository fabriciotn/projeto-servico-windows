<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
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

		<p align="center"><img src="img/logo.png" alt="" border="0" style="padding-bottom:20px;" /></p>

<%
				cod = request.QueryString("cod")
				
				SQL = "SELECT titulo, data, texto, cod FROM textos WHERE cod="&cod
				'Response.Write(sql)
				'response.End()
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1

if not rs.eof then            
    
    
dia = day(rs("data"))
mes = month(rs("data"))
ano = year(rs("data"))

if len(dia) = 1 then
dia = 0&dia
end if

if len(mes) = 1 then
mes = 0&mes
end if



dataCadastro = dia&"/"&mes&"/"&ano&" "

%>
<div>
<b style="font-size:15px; font-weight:bold; text-align:left;"><%=Server.HTMLEncode(rs("titulo"))%> </b> 

<br />
<span style="font-size:10px; text-align:right; float:right;"> <%=dataCadastro%></span>
<br />
<br />
<div style="text-align: justify">
<%=rs("texto")%>
</div>
</div>

<%end if%>
 
       

</body>
</head>
</html>
     
<!--#include file="conexaoOFF.asp" -->
