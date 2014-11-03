<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<!--#include file="sessao.asp"-->

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

          <h2>Gerenciador de Administradores</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Administradores cadastrados no sistema.</span>
<br />
<span style="padding-left: 500px;"><a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar uma nova notícia" style="border: none;" /></a></span>



    <br />

<%
sql =  "SELECT id, usuario, email, acesso, date_format(dataUltimoLogin, '%d/%m/%Y %H:%i:%s') AS dataUltimoLogin, obs FROM usuario ORDER BY usuario"
set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if rs.EOF= false then
%>
<br />

<table style="width: 620px; border: 1px solid #666666;">

<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold; text-align:center; font-size:14px">
<td class="t">&Uacute;ltimo Login</td>
<td class="t">Nome</td>
<td class="t">E-mail</td>
<td class="t"  style="width: 80px;">A&ccedil;&otilde;es</td>
</tr>
<%

WHILE NOT rs.EOF

nome = rs("usuario")
acesso = rs("acesso")

	data = rs("dataUltimoLogin")
'	hora = t(rs("dataUltimoLogin"))
'	dia = day(data)
'	mes = month(data)
'	ano = year(data)
	
'	if len(dia) = 1 then
'	dia = 0&dia
'	end if
	
'	if len(mes) = 1 then
'	mes = 0&mes
'	end if
	
	IF data = "" THEN
		data = "Ainda n&atilde;o acessou"
	END IF
	
'	data = dia &"/"& mes &"/"& ano & " - " & hora
	
email = rs("email")
'texto = replace(rs("obs"),"<br />",chr(13))
texto=rs("obs")

%>
<tr>
<td class="t" style="text-align:center;">&nbsp;
<%=data%>

</td>
<td class="t" style="font-weight:bold; cursor:help" title="<%=texto%>">&nbsp;
	<%if len(nome) > 35 then Response.Write(mid(nome,1,25)&"...") else Response.Write(nome) end if%>
</td>
<td class="t">&nbsp;
	<a href="mailTo:<%=email%>" id="emailUsuario" title="Enviar e-mail para <%=nome%>"><%=email%></a>
</td>
<td class="t" style="text-align: center;">
<%IF acesso <> 1 THEN%>
	<a href="liberar.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente liberar o acesso para este usu&aacute;rio?')"><img style="border: none;" src="img/off.png" title="Liberar acesso" /></a>
<%ELSE%>
	<a href="bloquear.asp?id=<%=rs("id")%>" onClick="return confirm('Deseja realmente bloquear este usu&aacute;rio?')"><img style="border: none;" src="img/aprovado.png" title="Bloquear acesso" /></a>
<%END IF%>
<a lang="<%=rs("id")%>" class="ver" style="cursor: pointer;"><img style="border: none;" src="img/zoom.png" title="Visualizar usu&aacute;rio" /></a>
<a lang="<%=rs("id")%>" class="editar" style="cursor: pointer;"><img style="border: none;" src="img/wrench_orange.png" title="Editar usu&aacute;rio" /></a>
<a href="delete_usuario.asp?cod=<%=rs("id")%>" onClick="return confirm('Deseja realmente excluir este usu&aacute;rio?')"><img style="border: none;" src="img/delete.png" title="Excluir usu&aacute;rio" /></a>
</td>
</tr>
<%
rs.MOVENEXT
WEND

%>
</table>
<%else%>
<p style="color:#CC0000; font-weight:bold;">Não há nenhum administrador cadastrado.</p>
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
<script type="text/javascript">
	
$(document).ready(function(){
	
	$('#novo').click(function(){
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("usuario.asp", "PULMOLAB" , "height=550,width=570,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
	});
	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("ver_usuario.asp?cod=" + id_atual, "PULMOLAB" , "height=300,width=630,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});
	
	$('.editar').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("usuario.asp?cod=" + id_atual, "PULMOLAB" , "height=550,width=570,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
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

.tabela {border-color:#000000; border-width:5px;
}

td{
	border:1px solid #666666;
}
#emailUsuario {
	color:#333333;
	text-decoration:none;
}
#emailUsuario:hover{
	color:#0066CC;
	font-style:italic;
	text-decoration:underline;
}

-->
</style>
