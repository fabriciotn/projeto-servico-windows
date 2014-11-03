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
.link_links a{
	color: #333;
	text-decoration:none
	
	}
.link_links a:hover{
	color: #333;
	text-decoration: underline
	
	}	
</style>
</head>

<!--#include file="conexao.asp"-->

<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>

<%
				cod = request.QueryString("cod")
				
				SQL = "SELECT cod, nome, arquivo, obs FROM protocolos WHERE cod="&cod
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1

if not rs.eof then            
%>
<br />
<br />
			
			
<div>
	<div class="link_links">
		<a href="protocolos/<%=rs("arquivo")%>"><%=rs("nome")%></a>
	</div>
	<br />
	<br />
	<div style="text-align: justify">
	<%=rs("obs")%>
	</div>
	<br />
	<br />
	
</div>

<%end if%>
 
       

<!--#include file="conexaoOFF.asp"-->
</body>
</html>