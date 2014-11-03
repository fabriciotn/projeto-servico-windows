<%@ LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<!--#include file="conexao.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">

$(document).ready(function(){

		$('#cadastra').click(function(){

				if ($('#titulo').val() == '')          
    			{
	        		alert("Erro! Preencha corretamente o título do texto.");
            		return false;                                 
    			}
			 
				if ($('#texto').val() == '')
    			{
			 		alert("Erro! Preencha corretamente o texto do texto.");
             		return false;                                 
    			}
	
		});

});		

</script>

<style type="text/css">
<!--
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
}

.style1 {
	font-size: 14px;
	font-weight: bold;
}
td
{
	padding-left: 50px;
}

textarea {
background:#F5F5F5;
border:1px solid #CCCCCC;
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
}
-->
</style>

</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<%
				cod = Request.QueryString("cod")
				
				SQL = "select * from textoHome where cod="&cod
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1
				
				texto = replace(rs("texto"),"<br />",chr(13))
%>

<form method="post" action="editar_txt_ok.asp">
	<table style="font-family: Tahoma; font-size: 8pt;">
		<tr>
			<td colspan="4" class="area"><b>T&iacute;tulo:</b></td>
		</tr>
		<tr>
			<td colspan="4" class="area"><input type="text" name="titulo" id="titulo" size="51" value="<%=rs("titulo")%>" /></td>
		</tr>
		<tr>
			<td class="area">&nbsp;</td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td class="area"><b>Texto:</b></td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td>
			<b>Aten&ccedil;&atilde;o:</b> A quantidade máxima de caracteres para o texto é de 214.
			</td>
		</tr>
		<tr>
			<td colspan="4" class="area">
				<textarea name="texto" id="texto" style="width: 320px; height: 100px;"><%=texto%></textarea>
			</td>
		</tr>	
		<tr>
			<td colspan="4">
				<b>Aten&ccedil;&atilde;o:</b> Para colocar um trecho em negrito, it&aacute;lico ou
				sublinhado,
				<br /> coloque-o entre as respectivas tags: 
				&lt;b&gt;&lt;/b&gt;, &lt;i&gt;&lt;/i&gt; ou &lt;u&gt;&lt;/u&gt;.
				<br />
				<br />
				<u>Exemplo:</u>
				<br />			
				&lt;u&gt;Venha&lt;/u&gt; &lt;i&gt;conhecer&lt;/i&gt; o&lt;b&gt;PULMOLAB&lt;/b&gt;!
				<br />
				<br />
				<u>Resultado:</u>
				<br />			
				<u>Venha</u> <i>conhecer</i> o <b>PULMOLAB</b>!	  
			</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="hidden" name="cod" id="cod" value="<%=cod%>" />
				<input type="submit" class="botoes" id="cadastra" value="Atualizar" style="cursor: pointer;">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<!--#include file="conexaoOFF.asp" -->
