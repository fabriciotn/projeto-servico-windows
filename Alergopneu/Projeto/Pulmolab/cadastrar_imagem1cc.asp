<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<link rel="stylesheet" href="estilo.css" />
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="include/js/jquery.js"></script>
<script type="text/javascript" src="include/js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
	<%
		usuario = Session("usuario")
		Session("usuario") = usuario
		
		cod = Request.QueryString("cod")
		modelo = Request.QueryString("modelo")
	%>
	
	
	
	$('#cadastra').click(function(){

		if ($('#imagem').val() == '')
             
              {
			          alert("Erro! Selecione a imagem que deseja inserir.");
                      return false;                                 
              }
		
	});
	
});	
</script>
<!--#include file="conexao.asp"-->

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

		<p align="center"><img src="img/logo.png" alt="" border="0" width="300" /></p>
<br />



<% idAtual = Request.QueryString("idAtual") %>


		
        <form method="post" action="cadastrar_imagem1cc_ok.asp?cod=<%=cod%>&modelo=<%=modelo%>" enctype="multipart/form-data" onSubmit="return validate_form(this)">
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
