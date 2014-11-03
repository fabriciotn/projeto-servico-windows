<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	usuario = Session("usuario")
	Session("usuario") = usuario

%>
<script src="js/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<style>
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
	padding: 0px 20px 10px 20px;
}
h1{
	font-size:14px;
	background:#69A7CB;
	text-align:center;
	color:#FFFFFF;
}
</style>

<!--#include file="conexao.asp"-->

<title>Vanucci</title>
</head>

</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">

		<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<%

				cod = request.QueryString("cod")
				
				SQL = "SELECT * FROM eventos WHERE cod = " & cod
				
				
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1

    if not rs.eof then
	
		horario = rs("horario")
		
		conteudo = rs("conteudo")
		conteudo = replace(conteudo,chr(13),"<br />")

%>            
    
    
<h1>Evento</h1>
<table width="491" align="center" style="padding-top: 10px;">           


<tr>
  <td colspan="5">&nbsp;</td>
</tr>

<tr>
<td colspan="5"><b>Nome:</b> <%=rs("evento")%>&nbsp;</td>
</tr>

<tr>
  <td colspan="5">&nbsp;</td>
</tr>

<tr>
<td colspan="5"><b>Local:</b> <%=rs("local")%>&nbsp;</td>
</tr>

<tr>
  <td colspan="5">&nbsp;</td>
</tr>
<tr>

<td colspan="5">
	<b>In&iacute;cio:</b><%=rs("dataInicio")%>&nbsp;
	<%if rs("dataFinal") <> "" then %>
		&nbsp;&nbsp;&nbsp;<b>Fim:</b> <%=rs("dataFinal")%>&nbsp;&nbsp;&nbsp;&nbsp;
	<%end if%>
</td>
</tr>
<tr>
  <td colspan="5">&nbsp;</td>
</tr>

<tr>
	<td>
		<b>Hor&aacute;rio:</b>	<%=horario%>
	</td>
</tr>

<tr>
  <td colspan="5">&nbsp;</td>
</tr>
<tr>
<td colspan="5"><b>Informa&ccedil;&otilde;es:</b> <%=conteudo%></td>
</tr>

<tr>
  <td colspan="5">&nbsp;</td>
</tr>
</table>       
</div>
 
		<%end if%>
       

</body>
</head>
</html>
     
<!--#include file="conexaoOFF.asp" -->
