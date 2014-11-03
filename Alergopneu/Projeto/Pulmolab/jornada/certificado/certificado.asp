<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="conexao.asp" -->
<% if Session("cod") = "" then 
		Response.Redirect("entrar_certificado.asp")
	end if	
	%>

<style type="text/css">
#nome{
	width:900px;
	height:29px;
	color:#000;
	font-family:calibri;
	font-size:28px;
	font-weight:bold;
	margin-left:40px;
	position:absolute;
	left:31px;
	top: 250px;}
</style>

<style type="text/css" media="print">
 .impressao{display:none;}
</style>

<%
 cod = Session("cod")

'-------------------------------------------------------VERIFICA SE ESSE CLIENTE J� EST� CADASTRADO USANDO COD COMO BUSCA--------------------------------

Set rs = Server.CreateObject("ADODB.RecordSet")
SQL = "SELECT cod, nome FROM cliente WHERE cod = "& cod &" "

'Response.Write(SQL)
'Response.End()
if cod = "" then%>
		<script type="text/javascript">
			alert('Seus dados não foram encontrados, tente fazer o login novamente.');
			window.location = 'entrar_certificado.asp';
		 </script>
<%	Response.End()
end if

Rs.open SQL, objdb, 3, 1
cod = rs("cod")
nome = rs("nome")
Rs.close
Set Rs=nothing

if err.number <> 0 then	
	Response.Write(err.description)
	Response.End()
end if

%>

<div align="right" class="impressao" style="width:1035px; height:160px; margin-right:10px; margin-top:7px; margin-bottom:7px; padding-bottom:10px; background-color:#E8E8E8; border:#999 2px solid">
  <p align="left" style="margin-left:5px; font-family:Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold">
    (Este cabeçalho não sairá na impressão.)<br /><br />Instruções para impressão:
  <li style="text-align:left; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight:bold; margin-left:2px">Para melhor impressão de seu certificado, configure sua impressora para o modo paisagem.</li>
	</p>
<a class="impressao" href="#" onclick="window.print()" style="color:#000; text-decoration:none">
     <span style="font-family:Arial, Helvetica, sans-serif; font-weight:bold">Clique aqui para imprimir</span>
     <img src="img/imprimir.png" border="0" onClick="javascript: window.print()" style="cursor:pointer; margin-right:5px; margin-left:3px" />
   </a>  
</div>	

<div style="width:1050px; height:700px; position:absolute">
	<img src="img/Certificado.jpg"  />
	<div align="center" id="nome">
			<i><%=nome%></i>
	</div>
</div>

