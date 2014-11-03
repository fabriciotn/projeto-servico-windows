<%@ LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<!--#include file="conexao.asp"-->
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">

$(document).ready(function(){

		$('#Responder').click(function(){

				if ($('#resposta').val() == '')          
    			{
	        		alert("Erro! Preencha corretamente a resposta.");
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
width:350px;
height:150px;
}
-->
</style>

</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<%
usuario = Session("usuario")
Session("usuario") = usuario

				cod = Request.QueryString("cod")
				SQL = "SELECT data, pergunta, respondido, id_pessoa FROM forum WHERE cod="&cod
'				Response.Write(sql)
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1

if not rs.eof then            

	idAutor = rs("id_pessoa")
	respondido = rs("respondido")
	pergunta = rs("pergunta")
	
	sqlAutor = "SELECT nome, email FROM corpoclinico WHERE id="&idAutor
	'				Response.Write(sql)
	set rsAutor  = server.CreateObject("ADODB.RecordSet")
	rsAutor.Open sqlAutor, objdb,3,1
	
	IF rsAutor.EOF = FALSE THEN
		
		autor = rsAutor("nome")
		email = rsAutor("email")
		
	END IF
		
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
	
	
	
	dataCadastro = dia&"/"&mes&"/"&ano&" "
	
end if
%>

<form method="post" action="responder_ok.asp">
	<table style="font-family: Tahoma; font-size: 8pt;">
		<tr>
			<td colspan="2" class="area"><b>Pergunta:</b></td>
			<td colspan="2" style="float:right"><%=dataCadastro%></td>
		</tr>
		<tr>
			<td colspan="2" class="area">&nbsp;<%=pergunta%></td>
		</tr>
		<tr>
			<td colspan="2" class="area"><b>Autor:</b>&nbsp;<%=autor%></td>
			<td colspan="2" class="area"><b>E-mail:</b>&nbsp;<%=email%></td>
		</tr>
		<tr>
			<td class="area">&nbsp;</td>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" class="area"><b>Resposta:</b></td>
		</tr>
		<tr>
			<td colspan="4" class="area"><textarea name="resposta" id="resposta"></textarea></td>
		</tr>
		<tr>
			<td class="area">&nbsp;</td>
			<td colspan="3">&nbsp;</td>
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
			<td colspan="4">
				<input type="hidden" name="cod" id="cod" value="<%=cod%>" />
				<input type="submit" class="botoes" id="cadastra" value="Atualizar" style="cursor: pointer;">
			</td>
		</tr>
	</table>
</form>
</body>
</html>