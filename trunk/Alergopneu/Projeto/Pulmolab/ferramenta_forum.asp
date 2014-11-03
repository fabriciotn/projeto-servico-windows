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
	
/*	$('#novo').click(function(){
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("cadastrar_noticia.asp", "cean" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
*/	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_pergunta.asp?cod=" + id_atual, "cean" , "height=550,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.responder').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("responder.asp?cod=" + id_atual, "cean" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

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
<!-- #include file="sessao.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
 
 <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
 	<div class="conteudo_adm" style="padding-bottom:250px">

          <h2>Gerenciador de Fórum</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Perguntas cadastradas no sistema.</span>
<!--
<span style="padding-left: 500px;"><a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar uma nova notícia" style="border: none;" /></a></span>
-->


<%
sql =  "SELECT * FROM forum ORDER BY cod desc"
set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if rs.EOF= false then
%>
<br />

<table style="width: 600px; border: 1px solid #666666;">

<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center">
<td class="t"  style="width:90px;">Data</td>
<td class="t">Autor(a)</td>
<td class="t">Tipo de f&oacute;rum</td>
<td class="t" style="width:75px;">A&ccedil;&otilde;es</td>
</tr>
<%

WHILE NOT rs.EOF

	idAutor = rs("id_pessoa")
	respondido = rs("respondido")
	
	sqlAutor =  "SELECT nome, email FROM corpoclinico WHERE id = "&idAutor
	set rsAutor = server.CreateObject("ADODB.RecordSet")

'RESPONSE.Write(sqlAutor)

	rsAutor.Open sqlAutor, ObjDB,3,1
	
	IF	rsAutor.EOF = FALSE THEN
		autor = rsAutor("nome")
	END IF

	tipo = rs("tipo")
	pergunta = Server.HTMLEncode(rs("pergunta"))
	
	IF tipo = 2 THEN
		tipo = "Leigos"
	ELSE
		tipo = "Médicos"
	END IF

	data = rs("data")
	dia = day(data)
	mes = month(data)
	ano = year(data)
	
	if len(dia) = 1 then
	dia = 0&dia
	end if
	
	if len(mes) = 1 then
	mes = 0&mes
	end if
	
	
	data = dia &"/"& mes &"/"& ano
%>
<tr>
<td class="t">&nbsp;
<%=data%>

</td>
<td class="t">&nbsp;
<%if len(autor) > 22 then 
	Response.Write(mid(autor,1,25)&"...") 
elseif autor = "" then
	Response.Write("Autor desconhecido")
else 
	Response.Write(autor) 
end if%>
</td>
<td class="t" style="font-weight:bold;">&nbsp;
<%=tipo%>
</td>
<td class="t" style="text-align: center;">
<%IF respondido = 0 THEN%>
	<a lang="<%=rs("cod")%>" class="responder" style="cursor: pointer;"><img style="border: none;" src="img/off.png" title="Pergunta ainda não respondida" /></a>
<%ELSE%>
	<img style="border: none;" src="img/aprovado.png" title="Pergunta respondida!" />
<%END IF%>
<a lang="<%=rs("cod")%>" class="ver" style="cursor: help;"><img style="border: none;" src="img/zoom.png" title="Visualizar pergunta" /></a>
<a href="delete_pergunta.asp?cod=<%=rs("cod")%>" onClick="return confirm('Deseja realmente excluir esta pergunta?')"><img style="border: none;" src="img/delete.png" title="Excluir pergunta" /></a>
</td>
</tr>
<%
rs.MOVENEXT
WEND

%>
</table>
<%else%>
<p style="color:#CC0000; font-weight:bold; padding-top:60px;">Não há nenhuma pergunta cadastrada.</p>
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
