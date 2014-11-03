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
	
	/*
	jQuery(function($){
				$("#data_inicio").datepicker();
				$("#data_fim").datepicker();
		});*/
	
	<%if Request.QueryString("excluido") = "sim" then%>
	alert("Evento excluído com sucesso!")
	<%end if%>

	$('.novo').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("cadastrar_evento.asp", "PULMOLAB" , "height=710,width=540,top=" + topo + ",left=" + 				    esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("eventos_ver.asp?cod=" + id_atual, "PULMOLAB" , "height=600,width=540,top=" + topo + ",left=" + 				    esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});	
	
	$('.editar').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("editar_evento.asp?cod=" + id_atual, "PULMOLAB" , "height=650,width=540,top=" + topo + ",left=" + 				    esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});	
		

});
</script>
<style type="text/css">
	
	.linha {
		width:100%;
		height:1px;
		border-bottom:1px dotted #999999;
		clear:both;
	}
	
	table {
		text-align:justify;
		font-size:11px;
	}
	
	
	#logo_impressao, #rodape_impressao {
		display:none;
	}
	
	.titulo_grande {
		font-size:18px;
		font-weight:bold;
	}
	
	#link_imprimir{
		text-decoration:underline;
		color:#207C97;
	}
	
	.botoes{
		color:#FF8484;
		background-color:#B70000;
		border:1px solid #CCCCCC;
		font-weight:bold;
		font-size:11px
	}
<!--
h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	color: #FF6600;
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
<div class="conteudo_adm" style="padding-bottom:150px">

<div class="titulo_grande" style="padding-left:30px;">
	Eventos
	<a style="text-decoration: none; padding-left: 500px; cursor:pointer;" class="novo"><img alt="" title="Cadastrar novo evento" style="border:none;" src="img/add.png" /></a>
</div>


<table>
	<tr>
		<td style="color:#8E1C4F; font-weight: bold; font-size:10pt; text-align: center; width: 600px;"><%Response.Write(msg)%></td>
	</tr>
</table>
<br />


<Table style="border: 1px solid #666666; width: 600px;">

	<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold;">
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td class="t" style="width:75px;">Data Início</td>
		<td class="t" style="width:75px;">Data Final</td>
		<td class="t">Evento</td>
		<td class="t">Tipo</td>
		<td class="t" style="width:70px">A&ccedil;&otilde;es</td>
	</tr>
	
<%
	SQL = "SELECT dataInicio, dataFinal, evento, tipo, cod FROM eventos ORDER BY dataInicio"
	set rs = server.CreateObject("ADODB.RecordSet")
	rs.Open SQL, ObjDB,3,1

	cont = 0

	WHILE NOT rs.EOF

		cont = cont + 1

		nome = rs("evento")
		
		IF Len(nome) > 30 THEN
			nome = mid(nome,1,28)&"..."
		END IF
		
		tipo = rs("tipo")
		
		dataInicio = rs("dataInicio")
		dataFinal = rs("dataFinal")
%>
<tr>
	<td style="background-color:#666666; color: #FFFFFF; font-weight: bold; font-size: 16px; text-align: center;">
		<%=cont%>
	</td>

	<td class="t">&nbsp;
		<%=dataInicio%>
	</td>
	<td class="t">&nbsp;
		<%=dataFinal%>
	</td>
	<td class="t">&nbsp;
		<%=nome%>
	</td>
	<td class="t">&nbsp;
		<%=tipo%>
	</td>
	<td class="t">
		<div id="icones" style="text-align:center; padding-left:10px;">
			<a lang="<%=rs("cod")%>" class="ver" style="cursor:pointer"><img style="border: none;" src="img/zoom.png" title="Visualizar cirurgia" /></a>
			<a lang="<%=rs("cod")%>" class="editar" style="cursor:pointer"><img style="border: none;" src="img/wrench_orange.png" title="Editar cirurgia" /></a>
			<a href="delete_evento.asp?cod=<%=rs("cod")%>" onclick="return confirm('Deseja realmente excluir este evento?');"><img style="border: none;" src="img/delete.png" title="Deletar cirurgia" /></a>
		</div>
	</td>
</tr>
<%
	'end if
	rs.MOVENEXT
	WEND

%>

</Table>
<br />
<input class="botoes2" onclick="window.location = 'ferramenta_calendario.asp'" value="Voltar" style="text-align:center; width:65px; cursor:pointer"/>
<br />
<div class="linha">
</div>

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
