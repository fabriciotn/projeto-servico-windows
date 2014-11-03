<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Pulmolab</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<!--#include file="includes.asp"-->
<!--#include file="sessao.asp"-->
<script type="text/javascript">
	
$(document).ready(function(){
	
	$('#novo').click(function(){
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("cadastrar_estrutura.asp", "cean" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_estrutura.asp?cod=" + id_atual, "cean" , "height=500,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("editar_estrutura.asp?cod=" + id_atual, "cean" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	
});
</script>
<style type="text/css">
<!--
h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	color:#66808F;
	border-bottom: 2px solid;
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

          <h2>Gerenciador de estrutura</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Textos cadastrados no sistema.</span>
<br />
<span style="padding-left: 500px;">
	<a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar um novo texto para estrutura" style="border: none;" /></a>
</span>



    <br />

<%
sql =  "SELECT cod, data, titulo, tipo FROM textos ORDER BY cod desc"
set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if rs.EOF= false then
%>
<br />

<table style="width: 550px; border: 1px solid #666666;">
	
	<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center">
		<td class="t"  style="width:90px;">Data</td>
		<td class="t">T&iacute;tulo</td>
		<td class="t">Tipo</td>
		<td class="t">A&ccedil;&otilde;es</td>
	</tr>
	<%
	
	WHILE NOT rs.EOF
	
		titulo = Server.HTMLEncode(rs("titulo"))
		
		dia = Day(rs("data"))
		
		IF Len(dia) = 1 THEN
			dia = 0 & dia
		END IF
		
		mes = Month(rs("data"))
		
		IF Len(mes) = 1 THEN
			mes = 0 & mes
		END IF
		
		ano = Year(rs("data"))
		
		data = dia &"/"& mes &"/"& ano
		
		tipo = rs("tipo")
	
	%>
	<tr>
		<td class="t">&nbsp;
			<%=data%>
		</td>
		<td class="t" style="font-weight:bold;">&nbsp;
		<%if len(titulo) > 40 then Response.Write(mid(titulo,1,30)&"...") else Response.Write(titulo) end if%>&nbsp;
		</td>
		<td class="t" style="font-weight:bold;">&nbsp;
			<%=tipo%>
		</td>
		<td class="t" style="text-align: center;">
		<a lang="<%=rs("cod")%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar" /></a>
		<a lang="<%=rs("cod")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar" /></a>
		<a href="delete_estrutura.asp?cod=<%=rs("cod")%>" onClick="return confirm('Deseja realmente excluir este texto?')"><img style="border: none;" src="img/delete.png" title="Excluir" /></a>
		</td>
	</tr>
	<%
	rs.MOVENEXT
	WEND
	
	%>
</table>
<%else%>
<p style="color:#CC0000; font-weight:bold;">Não há nenhum texto cadastrado.</p>
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
