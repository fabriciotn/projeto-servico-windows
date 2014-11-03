<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Instituto de Ortopedia e Traumatologia</title>
<!--#include file="conexao.asp"-->
<%
	usuario = Session("usuario")
	Session("usuario") = usuario
	cod = request.QueryString("cod")
	modelo = Request.QueryString("modelo")
%> 
<link href="estilo.css" rel="stylesheet" type="text/css" />
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	$('#cadastra').click(function(){

		if ($('#imagem').val() == '')
             
              {
			          alert("Erro! Selecione a imagem que deseja inserir.");
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
-->
</style>


<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<br />



<% idAtual = Request.QueryString("idAtual") %>


		
        <form method="post" action="cadastrar_imagem1d_ok.asp?cod=<%=cod%>&modelo=<%=modelo%>" enctype="multipart/form-data" onSubmit="return validate_form(this)">
        <table style="font-family: Tahoma; font-size: 8pt;">
        
		<tr>
		  <td>
		 
		  <b>Primeira imagem:</b>
		  </td>
		  </tr>
		<tr>
		  <td>&nbsp;</td>
		  </tr>
		<tr>
        <td><input type="file" name="imagem" id="imagem" class="file"></td>
        </tr>
				<tr>
		  <td>&nbsp;</td>
		  </tr>
		  		<tr>
		  <td><input type="submit" class="botoes" id="cadastra" value="Inserir" style="cursor: pointer;"></td>
		  </tr>
        </table>
   
        
		</form>

</body>
</head>
</html>
