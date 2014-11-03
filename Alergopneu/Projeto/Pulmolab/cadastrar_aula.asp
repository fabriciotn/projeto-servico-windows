<%@ LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	usuario = Session("usuario")
	Session("usuario") = usuario

%>
<!--#include file="conexao.asp"-->
<link href="estilo.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="js/resources/css/xtheme-gray.css" />
<script src="js/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript" src="js/ext.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $('#loaging').hide();

        $('.data').mask("99/99/9999");

        $('#cadastra').click(function() {


            if ($('#titulo').val() == '') {
                alert("Erro! Preencha corretamente o título do caso.");
                return false;
            }

            if ($('#texto').val() == '') {
                alert("Erro! Preencha corretamente o texto do caso.");
                return false;
            }

            if ($('#arquivo').val() == '') {
                alert("Erro! Insira um arquivo.");
                return false;
            }
            if ($('#arquivo').val().substr($('#arquivo').val().length - 4).toLowerCase() != ".pdf") {
                alert("Erro! Extensão invalida.");
                return false;
            }
            if ($('#data').val() == '') {
                alert("Erro! Insira uma data.");
                return false;
            }
            $("#campos").fadeOut("slow", function() {
                $('#loaging').show();
            });

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
#loaging {
	height:100px;
	width:300px;
	padding:30px;
	margin:auto;
	vertical-align:middle;
	border:2px solid #CCC;
	background-color:white;
}
textarea {
	background:#F5F5F5;
	border:1px solid #CCCCCC;
	font-family:Arial, Helvetica, sans-serif;
	font-size:11px;
}
-->
</style>
<title>PULMOLAB</title>
</head>
</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">
<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<div id="campos">
	<form method="post" action="cadastrar_aula_ok.asp" enctype="multipart/form-data">
		<table style="font-family: Tahoma; font-size: 8pt;">
			<tr>
				<td colspan="4" class="area"><b>T&iacute;tulo:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="text" name="nome" id="nome" size="51"/></td>
			</tr>
			<tr>
				<td class="area">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><b>Arquivo:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="file" name="arquivo" id="arquivo" size="35" /></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><b>Data:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="text" name="data" id="data" class="data" size="10" /></td>
			</tr>
			<tr>
				<td class="area">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
				</tr>
			
			<tr>
				<td class="area"><b>Obs:</b></td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><textarea name="obs" id="obs" style="width: 350px; height: 60px; font-size:12px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Para colocar um trecho em negrito, it&aacute;lico ou
					
					sublinhado, <br />
					coloque-o entre as respectivas tags: 
					&lt;b&gt;&lt;/b&gt;, &lt;i&gt;&lt;/i&gt; ou &lt;u&gt;&lt;/u&gt;. <br />
					<br />
					<u>Exemplo:</u> <br />
					&lt;u&gt;Venha&lt;/u&gt; &lt;i&gt;conhecer&lt;/i&gt; a&lt;b&gt;PULMOLAB&lt;/b&gt;! <br />
					<br />
					<u>Resultado:</u> <br />
					<u>Venha</u> <i>conhecer</i> a <b>PULMOLAB</b>! </td>
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
				<td colspan="4"><input type="submit" class="botoes" id="cadastra" value="Cadastrar" style="cursor: pointer;"></td>
			</tr>
		</table>
	</form>
</div>
<div id="loaging" align="center"> <img src="img/icons/ajax-loader.gif"  /><br />
	<h1>ENVIANDO...</h1>
</div>
</body>
