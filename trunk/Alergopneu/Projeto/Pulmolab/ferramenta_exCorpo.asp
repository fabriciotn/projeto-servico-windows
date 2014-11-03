<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Pulmolab</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#include file="sessao.asp"-->
<script src="js/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	
	$('#novo').click(function(){
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("cadastrarExCorpo.asp", "cean" , "height=630,width=570,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
			var id_atual = $(this).attr("lang");
			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
			
			window.open("verExCorpo.asp?id=" + id_atual, "cean" , "height=auto ,width=700,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("editaExCorpo.asp?id=" + id_atual, "cean" , "height=700,width=570,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
});
</script>
<style type="text/css">
<!--
h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	color:#749FC2;
	border-bottom: 2px solid;
}
h3 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	color: #333333;
}
h4 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #00496C;
}

td
{
	border: 1px solid #666666;
}
-->
</style>
</head>

<body>
<div class="geral">
<div class="engloba_geral">
<!--#include file="topo.asp" -->

<div class="esquerda">
 <div class="texto_centro">
 
 
 <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
 	<div class="conteudo_adm" style="padding-bottom:100px">


          <h2>Gerenciador de Ex-Corpo Cl&iacute;nico</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Cadastrados no sistema.</span>
<br />

<span style="padding-left: 600px;">
	<a id="novo" style="cursor: pointer; font-size: 8pt;">
		<img src="img/add.png" title="Cadastrar um novo médico" style="border: none;" />
	</a>
</span>
<%
sql =  "SELECT nome, id, areaInteresse, aprovado, categoria FROM ex_corpoclinico ORDER BY setor"
set rs = server.CreateObject("ADODB.RecordSet")
'Response.Write(sql)
rs.Open sql, ObjDB,3,1

if rs.EOF= false then

%>
<br />

<table style="width: 550px; border: 1px solid #666666; background:#FFFFFF">

<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold;">
<td class="t">Nome</td>
<td class="t">&Aacute;rea Interesse</td>
<td class="t">A&ccedil;&otilde;es</td>
</tr>
<%

WHILE NOT rs.EOF
	
%>
<tr>
	<td class="t">
		<%=Server.HTMLEncode(rs("nome"))%>
	</td>
	<td class="t">
		<%=Server.HTMLEncode(rs("areaInteresse"))%>
	</td>
	<td class="t" style="text-align: center;">
		<%IF rs("aprovado") <> 1 THEN%>
			<a href="aprovarEx.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente aprovar este médico?')"><img style="border: none;" src="img/off.png" title="Aprovar médico" /></a>
		<%ELSE%>
			<a href="desaprovarEx.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente desaprovar este médico?')"><img style="border: none;" src="img/aprovado.png" title="Desaprovar médico" /></a>
		<%END IF%>
		<a lang="<%=rs("id")%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar médico" /></a>
		<a lang="<%=rs("id")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar médico" /></a>
		<a href="deleteExCorpo.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente excluir este médico?')"><img style="border: none;" src="img/delete.png" title="Excluir médico" /></a>
	</td>
</tr>
<%

rs.MOVENEXT
WEND

%>
</table>
<%else%>
<p style="color:#CC0000; font-weight:bold;">Não há nenhum médico cadastrado.</p>
<%end if%>
		
</div>
 <!-- ***********************************************************************	FIM CONTEUDO ADM ********************************************************************* -->


 </div>
</div>
<!--#include file="direitaADM.asp" -->

<!--#include file="rodape.asp" -->
</div>
</div>

</body>
</html>
<!--#include file="conexaoOFF.asp" -->
