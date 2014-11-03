<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PULMOLAB</title>
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
$(document).ready(function(){	

	$('#Perguntar').click(function(){
		<%
		campo_ob = "pergunta"
		campos_ob = SPLIT(campo_ob,",")
		for i = 0 to Ubound(campos_ob)
		%>
			if( $('#<%=campos_ob(i)%>').val() == '' ){
				alert('O campo <%=Ucase( Replace( campos_ob(i) ,"_", " ") )%> é obrigatório');
				return false;
			}
		<%
		next
		%>
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

	.dado{
		font-size:11px;
	}
	.dado_maior{
		width:300px;
		height:150px;
	}
	
-->
</style>


</head>

<body>

<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>

<form method="post" name="formPerguntar" id="formPerguntar" action="perguntar_ok.asp">
	<table class="tablePerguntar">
		<tr>
			<td class="dado">
				Pergunta:
			</td>
			<td>
				<textarea name="pergunta" id="pergunta" class="dado_maior"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:right">
				<input type="submit" value="Perguntar" name="Perguntar" id="Perguntar"/>
			</td>
		</tr>
	</table>
</form>


</body>
</html>
