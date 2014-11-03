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
		
		window.open("cadastrar_medico.asp", "Pulmolab" , "height=800,width=570,left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
			var id_atual = $(this).attr("lang");
			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
			
			window.open("verMedico.asp?id=" + id_atual, "Pulmolab" , "height=700 ,width=680,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("editar_medico0.asp?id=" + id_atual, "Pulmolab" , "height=800,width=570,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	<% if Request("pesquisa") <> "" then %>
		$('#pesquisa').val('<%=Request("pesquisa")%>');
	<% end if %>
	
	
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
.linhaA{
}
.linhaB{
	background:#F0F0F0;
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


          <h2>Gerenciador de Corpo Cl&iacute;nico</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Cadastrados no sistema.</span>
<br />

<span style="padding-left: 600px;">
	<a id="novo" style="cursor: pointer; font-size: 8pt;">
		<img src="img/add.png" title="Cadastrar um novo médico" style="border: none;" />
	</a>
</span>

<table>
	<tr>
		<td>
			Exibir:
		</td>
		<td>
			<%
			pesquisa = Request("pesquisa")
			if pesquisa = "" then
				pesquisa = "*"
			end if
			%>
			<form action="ferramenta_corpo.asp" method="post">
			<select name="pesquisa" id="pesquisa">
				<option value="*">Todos</option>
				<option value="1">Médicos - Corpo Clínico</option>
				<option value="2">Outros Profissionais da área de saúde</option>
				<option value="3">Pós-Graduandos em Atividade</option>
				<option value="4">Ex Pós-Graduandos</option>
				<option value="5">Médicos / Estudantes</option>
				<option value="6">Leigos</option>
			</select>
			<input type="submit" value="Buscar" />
			</form>
		</td>
	</tr>
</table>

<%
	SQL = "SELECT upper(c.nome) as nome, c.id, c.aprovado, c.categoria as codCategoria, s.nome as nomeSetor, cat.nome as nomeCategoria FROM corpoclinico c"
	SQL = SQL & " INNER JOIN categoria cat ON cat.id = c.categoria"
	SQL = SQL & " LEFT JOIN setor s ON s.cod = c.setor"

IF pesquisa = "*" THEN
	SQL = SQL & " WHERE 1 = 1"
ELSE
	SQL = SQL & " WHERE categoria = "& pesquisa
END IF
	
	SQL = SQL & " ORDER BY categoria, nome"

set rs = server.CreateObject("ADODB.RecordSet")
'Response.Write(sql)
rs.Open sql, ObjDB,3,1

if rs.EOF= false then

%>
<br />

<table style="width: 550px; border: 1px solid #666666; background:#FFFFFF">
	<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center; font-size:14px">
		<td class="t">Nome</td>
		<td class="t">Categoria</td>
		<td class="t" style="width:90px">A&ccedil;&otilde;es</td>
	</tr>
<%
cont = 0
WHILE NOT rs.EOF
	
		setor = rs("nomeSetor")
		
		codCategoria = rs("codCategoria")
		
		categoria = rs("nomeCategoria")
		if categoria = "" THEN
			categoria = "Não informado"
		end if
		
		nome = rs("nome")
		IF Len(nome) > 30 THEN
			nome = Mid(nome, 1, 30) & "..."
		END IF
		
		IF cont MOD 2 = 0 THEN
		'IF categoria <> categoriaAnterior THEN
			estilo = "linhaA"
		ELSE
			estilo = "linhaB"
		END IF
%>
<tr class="<%=estilo%>">
	<td class="t">&nbsp;<%=nome%></td>
	<td class="t">&nbsp;<%=categoria%></td>
	<td class="t" style="text-align:right; padding-right:5px;">
		<%
		IF codCategoria <> "5" AND codCategoria <> "6" AND codCategoria <> "2" THEN
			IF rs("aprovado") <> 1 THEN
		%>
			<a href="aprovar.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente aprovar este médico?')"><img style="border: none;" src="img/off.png" title="Aprovar cadastro" /></a>
		<%	ELSE		%>
			<a href="desaprovar.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente desaprovar este médico?')"><img style="border: none;" src="img/aprovado.png" title="Desaprovar cadastro" /></a>
		<%
			END IF
		END IF	
		%>
		<a lang="<%=rs("id")%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar cadastro" /></a>
		<a lang="<%=rs("id")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar cadastro" /></a>
		<a href="delete_medico.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente excluir este médico?')"><img style="border: none; padding:0 0 0 0" src="img/delete.png" title="Excluir cadastro" /></a>
	</td>
</tr>
<%
	cont = cont + 1
	categoriaAnterior = categoria
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
       
 <!-- #include file="direitaADM.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->



</body>
</html>

<!--#include file="conexaoOFF.asp" -->