<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PULMOLAB</title>
<!-- #include file="includes.asp" -->
<%
	ultima_pagina = Request.ServerVariables("HTTP_REFERER")	
	Session ("ultima_pagina") = ultima_pagina
'	Response.Write(ultima_pagina)
%>


</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">

		<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<br />
	<form action="cadastrar_medico1.asp" method="post">
	      <table style="font-family: Tahoma; font-size: 8pt; margin-left:10px;">
			<tr>
			  <td colspan="4" class="area"><b>Selecione o tipo de formulário:</b></td>
			</tr>
			<tr>
			  <td colspan="4" class="area">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area">
					<select name="categoria" id="categoria">
						<option value="1">Corpo Clínico</option>
						<!--<option value="3">Pós-Graduandos em Atividade</option>-->
						<option value="4">Ex Pós-Graduandos</option>
<!--						<option value="5">Médicos / Estudantes</option>-->	
						<option value="2">Profissionais da área de saúde</option>
						<option value="6">Leigos</option>
					</select>
				</td>
			</tr>
			<tr>
			  <td colspan="4" class="area">&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Prosseguir" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>