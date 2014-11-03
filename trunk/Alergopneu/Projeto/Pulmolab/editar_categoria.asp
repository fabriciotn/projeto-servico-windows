<!--#include file="conexao.asp" -->  <!-- CONEXAO BASICA COM BANCO DE DADOS -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>	<!-- JQUERY BASICA -->
<script type="text/javascript">
$(function($){       
	$('#alt_cat_cancel').click(function(){  
		history.back(-1); 
		//window.opener.location = "cadastrar_informacao.asp";
		//window.opener.focus();
	});
}); 
</script>
<style type="text/css">
<!--
body {
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
}
.style1 {
	font-size: 14px;
	font-weight: bold;
}
td {
	padding-left: 50px;
}
-->
</style>
<title>PULMOLAB</title>
</head>
</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">
<%
	Dim id_categoria
	id_categoria = Request.QueryString("id_categoria")
	if id_categoria="" then response.end
	set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * from categoria_informacoes where categoria_informacoes.cod=" & id_categoria , ObjDB
%>

<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<div id="content">
	<form method="post" action="editar_categoria_ok.asp" > 
    	<input type="hidden" name="cod_cat_alt" id="cod_cat_alt" value="<%=rs("cod")%>" />
		<table style="font-family: Tahoma; font-size: 8pt;">
			<tr>
				<td colspan="4" class="area"><b>Categoria:</b></td>
			</tr>
			<tr>
    			<td class="area" colspan="4">
  					<input type="text" value="<%=rs("nome")%>" size="34" id="name_cat_alt" name="name_cat_alt"/>
        			<input type="submit" value="Alterar"/>
                    <input type="button" value="Cancelar" id="alt_cat_cancel" name="alt_cat_cancel"/>
       			 </td>
       		 </tr>
        </table>
    </form>
</div>
<!--#include file="conexaoOFF.asp" -->
</body>
</html>