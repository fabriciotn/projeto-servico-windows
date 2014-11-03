<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file ="includes.asp" -->
<!--' # i n c l u d e   f i l e="sessao.asp"-->
<script type="text/javascript">
	
$(document).ready(function(){
	
	$('#novo').click(function(){
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("cadastrar_noticia.asp", "ICUH" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_noticia.asp?cod=" + id_atual, "ICUH" , "height="+screen.height+",width=700,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.coment').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_comentariosADM.asp?cod=" + id_atual, "ICUH" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});

	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("editar_noticia.asp?cod=" + id_atual, "ICUH" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
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
<!-- '# i n c l u d e   f i l e="sessao.asp" -->
    
<!-- '# i n c l u d e   f  i l  e="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
 
 <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
 	<div class="conteudo_adm" style="padding-bottom:100px">

          <h2>Gerenciador de Notícias</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Notícias cadastradas no sistema.</span>
<br />
<span style="padding-left: 500px;"><a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar uma nova notícia" style="border: none;" /></a></span>



    <br />

<%
'sql =  "SELECT * FROM noticias ORDER BY cod desc"
'set rs = server.CreateObject("ADODB.RecordSet")
'rs.Open sql, ObjDB,3,1

'if rs.EOF= false then
%>
<br />

<table style="width: 600px; border: 1px solid #666666;">

<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center">
<td class="t"  style="width:90px;">Data</td>
<td class="t">Autor(a)</td>
<td class="t">T&iacute;tulo</td>
<td class="t"  style="width: 80px;">A&ccedil;&otilde;es</td>
</tr>
<%

sql = "select * from noticias ORDER BY data DESC "
set rs = server.CreateObject("ADODB.RecordSet")
rs.open sql, objdb, 3, 1


WHILE NOT rs.EOF

autor = Server.HTMLEncode(rs("autor"))
if autor = "" then
	autor = "n&atilde;o informado"
end if
titulo = Server.HTMLEncode(rs("titulo"))

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
<%if len(autor) > 22 then Response.Write(mid(autor,1,25)&"...") else Response.Write(autor) end if%>
</td>
<td class="t" style="font-weight:bold;">&nbsp;
<%if len(titulo) > 40 then Response.Write(mid(titulo,1,30)&"...") else Response.Write(titulo) end if%>
</td>
<td class="t" style="text-align: center;">
<a lang="<%=rs("cod")%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar notícia" /></a>
<!--<a lang="<%=rs("cod")%>" class="coment" style="cursor: pointer;"><img style="border: none;" src="img/coment.png" title="Visualizar comentários da notícia" width="18" /></a>-->
<a lang="<%=rs("cod")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar notícia" /></a>
<a href="delete_noticia.asp?cod=<%=rs("cod")%>" onClick="return confirm('Deseja realmente excluir esta notícia?')"><img style="border: none;" src="img/delete.png" title="Excluir notícia" /></a>
</td>
</tr>
<%
rs.MOVENEXT
WEND
%>
</table>
<%'else%>
<!--<p style="color:#CC0000; font-weight:bold;">Não há nenhuma notícia cadastrada.</p>-->
<%'end if%>

</div>
 <!-- ***********************************************************************	FIM CONTEUDO ADM ********************************************************************* -->

       </div>
       
 <!-- '# i n c l u d e   f i l e="direitaADM.asp" -->      

        
</div>
</div>
    

<!-- '# i n c l u d e   f i l e="rodape.asp" -->



</body>
</html>
<!--#include  file="conexaoOFF.asp" -->
