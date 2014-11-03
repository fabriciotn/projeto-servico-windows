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
		
		window.open("cadastrar_aula.asp", "Pulmolab" , "height=650,width=530,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
	var arquivo = $(this).attr("lang");
/*	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_protocolo.asp?cod=" + id_atual, "Pulmolab" , "height=300,width=700,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
*/
	window.open("aulas/"+arquivo);
	});
	
	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("editar_aula.asp?cod=" + id_atual, "Pulmolab" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	
});
</script>
<style type="text/css">

h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	color: #66808F;
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
.style1 {
	font-size: 11px;
	font-weight: bold;
}
.titulo {
font-family:Arial, Helvetica, sans-serif;
font-size:13px;
color:#666666;
text-align:justify;
cursor:pointer;
font-weight:bold;
}

.conteudo {
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
color:#333333;
text-align:justify;
display:none;

}

.conteudo1 {
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
color:#333333;
text-align:justify;
width:430px;
float:left;
margin-top:10px;
margin-right:10px;
margin-bottom:10px;



}

.foto {
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
color:#333333;
text-align:justify;
width:150px;
margin-top:10px;
float:right;


}


.clica3 {
cursor:pointer;
}



.style2 {font-size: 11px
}
.tabela {border-color:#000000; border-width:5px;
}

#padding {padding:5px 10px 5px 10px;}
.titulo1 {font-family:Arial, Helvetica, sans-serif;
font-size:13px;
color:#666666;
text-align:justify;
cursor:pointer;
font-weight:bold;
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
 	<div class="conteudo_adm" style="padding-bottom:100px">

          <h2>Gerenciador de Aulas</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Aulas cadastradas no sistema.</span>
<br />
<span style="padding-left: 500px;">
	<a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar uma nova aula" style="border: none;" /></a>
</span>



    <br />

<%
sql =  "SELECT cod, nome, data, arquivo, obs FROM aulas ORDER BY cod desc"
set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if rs.EOF= false then
%>
<br />

<table style="width: 600px; border: 1px solid #666666; background:#FFFFFF">
	
	<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center">
		<td style="width:70px;text-align:center;">Data</td>
		<td style="width: 220px;">T&iacute;tulo</td>
		<td style="width: 220px;">Observa&ccedil;&otilde;es</td>
		<td class="t">A&ccedil;&otilde;es</td>
	</tr>
	<%
	
	WHILE NOT rs.EOF
	
		nome = rs("nome")
		arquivo = Server.HTMLEncode(rs("arquivo"))
		obs = Server.HTMLEncode(rs("obs"))
			
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
		<td class="t" style="text-align:center;">
		<%=data%>

        </td>
		<td style="text-align:left;">
		<%if len(nome) > 30 then Response.Write(mid(nome,1,30)&"...") else Response.Write(nome) end if%>
		<%'if len(texto) > 30 then Response.Write(mid(texto,1,30)&"...") else Response.Write(texto) end if%>
		</td>
		<td class="t" style="text-align:left;">
		<%if len(obs) > 30 then Response.Write(mid(obs,1,30)&"...") else Response.Write(obs) end if%>
		</td>
		<td class="t" style="text-align:center;">
		<a lang="<%=arquivo%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar arquivo" /></a>
		<a lang="<%=rs("cod")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar aula" /></a>
		<a href="delete_aula.asp?cod=<%=rs("cod")%>" onClick="return confirm('Deseja realmente excluir este texto?')"><img style="border: none;" src="img/delete.png" title="Excluir aula" /></a>
		</td>
	</tr>
	<%
	rs.MOVENEXT
	WEND
	
	%>
</table>
<%else%>
<p style="color:#CC0000; font-weight:bold;">Não há nenhuma aula cadastrada.</p>
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
