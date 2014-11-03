<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<!--#include file="sessao.asp"-->
<script type="text/javascript">
	
$(document).ready(function(){
	
	$('#novo').click(function(){
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("cadastrar_link.asp", "PULMOLAB" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_link.asp?cod=" + id_atual, "PULMOLAB" , "height="+screen.height+",width=700,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("editar_link.asp?cod=" + id_atual, "PULMOLAB" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	
});
</script>
<style type="text/css">
<!--
h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	color: #66808F;
	border-bottom: 2px solid;
}
td{
	border:1px solid #666666;
}
-->
</style>

</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
 
 <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
 	<div class="conteudo_adm" style="padding-bottom:100px">

          <h2>Gerenciador de Links</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Links cadastrados no sistema.</span>
<br />
<span style="padding-left: 500px;">
	<a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar um novo link" style="border: none;" /></a>
</span>



    <br />

<%
sql =  "SELECT cod, pagina, texto, titulo FROM link ORDER BY cod desc"
set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if rs.EOF= false then
%>
<br />

<table style="width: 550px; border: 1px solid #666666; background:#FFFFFF">
	
	<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center">
		<td class="t"  style="width:90px;">T&iacute;tulo</td>
		<td class="t">Texto</td>
		<td class="t"  style="width: 80px;">A&ccedil;&otilde;es</td>
	</tr>
	<%
	
	WHILE NOT rs.EOF
	
		titulo = Server.HTMLEncode(rs("titulo"))
		texto = Server.HTMLEncode(rs("texto"))
		
	
	%>
	<tr>
		<td class="t" style="font-weight:bold;">&nbsp;
		<%if len(titulo) > 15 then Response.Write(mid(titulo,1,10)&"...") else Response.Write(titulo) end if%>&nbsp;
		</td>
		<td class="t">&nbsp;
		<%if len(texto) > 35 then Response.Write(mid(texto,1,35)&"...") else Response.Write(texto) end if%>&nbsp;
		</td>
		<td class="t" style="text-align: center;">
		<a lang="<%=rs("cod")%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar Link" /></a>
		<a lang="<%=rs("cod")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar Link" /></a>
		<a href="delete_link.asp?cod=<%=rs("cod")%>" onClick="return confirm('Deseja realmente excluir este texto?')"><img style="border: none;" src="img/delete.png" title="Excluir Link" /></a>
		</td>
	</tr>
	<%
	rs.MOVENEXT
	WEND
	
	%>
</table>
<%else%>
<p style="color:#CC0000; font-weight:bold;">Não há nenhum link cadastrada.</p>
<%end if%>

</div>
 <!-- ***********************************************************************	FIM CONTEUDO ADM ********************************************************************* -->

       </div>
       
 <!-- #include file="direitaADM.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->



</body>
</html>
<!--#include file="conexaoOFF.asp" -->
