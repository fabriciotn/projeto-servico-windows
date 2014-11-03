<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Instituto de Ortopedia e Traumatologia</title>
<!--#include file="conexao.asp"-->
<link href="estilo.css" rel="stylesheet" type="text/css" />
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('.telefone').mask("(999) 9999-9999 ");
	$('.data').mask("99 - 99 - 9999");
});
</script>
</head>

<body>
<div class="geral">
<div class="topo">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="990" height="226">
    <param name="movie" value="flash/topo.swf" />
    <param name="quality" value="high" />
    <param name="wmode" value="opaque" />
    <embed src="flash/topo.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="990" height="226"></embed>
  </object>
</div>

<div class="texto_centro">
<div class="titulo_centro"><img src="img/titulo_contato.png" width="64" height="13" border="0"></div>

<div id="com_foto_conteudo" style="float:left">
		
<form method="post" action="cadastro_noticia_ok.asp" id="form_cad2" enctype="multipart/form-data" >
	<table>
		<tr>
			<td>Data</td>
			<td>
			<input type="text" name="data" id="data" class="data">
			</td>
		</tr>
		<tr>
			<td>Titulo</td>
			<td><input type="text" name="titulo" id="titulo" class="titulo" size="30" /></td>
		</tr>
		<tr>
			<td>
				Sub-titulo
			</td>
			<td>
				<input type="text" name="sub_titulo" id="sub_titulo" class="sub_titulo"  size="30" /></td>
			</td>		
		</tr>
		<tr>
			<td>
				Notícia
			</td>
			<td align="left">
				<textarea name="noticia_cadastro" id="noticia_cadastro" class="noticia_cadastro" style="width:210px; height:70px;"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				Imagem
			</td>
			<td>
				<input type="file"  name="foto" id="foto"  size="30" />
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit"  value="Voltar"  onclick="location.href ='index_teste.asp'" class="botao" />&nbsp;
				<input type="submit" id="cadastrar"  value="cadastrar" class="botao" />&nbsp;
				<input type="reset" value="Limpar" class="botao"/>&nbsp;

			</td>
		</tr>
	</table>
</form>
</div>

</div>

<!--#include file="esquerda2.asp" -->

<div class="fundo_rodape">
<div class="telefone">
  <p><img src="img/telefone.png" width="15" height="11" hspace="20" border="0" />  (31) 3213.8166</p>
</div>
<div class="texto_rodape">Rua Bernardo Guimarães, 1444 - Lourdes - Belo Horizonte - MG - CEP: 30140-081</div>
<div class="hba">
  <p>desenvolvimento</p>
  <p><a href="http://www.hbatecnologia.com.br" target="_blank"><img src="img/hba.png" width="34" height="18" vspace="20" border="0" /></a></p>
</div>
</div>

</div>
</body>
</html>
