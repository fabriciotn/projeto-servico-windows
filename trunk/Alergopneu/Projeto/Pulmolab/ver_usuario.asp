<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<style>
h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	text-align:center;
	color: #003399;
	border-bottom: 2px solid;
}
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
	padding: 0px 20px 10px 20px;
}
</style>

<!--#include file="conexao.asp"-->

</head>
<body>

<p align="center">
	<img src="img/logo3.png" alt="" border="0" />
</p>

<%
cod = request.QueryString("cod")

SQL = "SELECT u.dataUltimoLogin, u.usuario, u.email, COALESCE(c.foto, '') AS foto, u.obs"
SQL = SQL & " FROM usuario u"
SQL = SQL & " LEFT JOIN corpoclinico c ON c.nome LIKE '%u.usuario%' OR c.email = u.email"
SQL = SQL & " WHERE u.id = " & cod

set rs  = server.CreateObject("ADODB.RecordSet")

'Response.Write(SQL)

rs.Open SQL, objdb,3,1

IF rs.EOF = FALSE THEN

	nome = rs("usuario")
	email = rs("email")
	foto = rs("foto")
	data = rs("dataUltimoLogin")
	obs = rs("obs")

END IF

'Response.Write("|" & foto)

IF foto = "" THEN
	foto = "img/default.jpg"
ELSE
	foto = "foto\"&email&"\"&foto
END IF

%>
<h2>Administrador</h2>

<div style="border: 1px double #999999; padding: 4px 4px 4px 4px;">
<table width="480" align="center" style="background-color: #DFDFDF; border: 1px double #999999;">           
	<tr>
		<td width="70" rowspan="5" valign="middle" align="center" title="<%=foto%>"><img src="<%=foto%>" alt="" width="74" height="82" /></td>
		<td width="409" colspan="4" style="padding-left: 10px;"><label style="color: #207C96; font-weight:bold; font-size: 12pt;"><%=nome%></label></td>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" style="padding-left: 10px;"><b>E-mail:</b> <%=email%></td>
	</tr>
	<tr>
		<td colspan="4" style="padding-left: 10px;"><b>Último Login:</b> <%=data%></td>
	</tr>
	<tr>
		<td colspan="4" style="padding-left: 10px;"><b>Obs:</b> <%=obs%></td>
	</tr>
</table>       
</div>
 
       

</div>
</body>
</html>