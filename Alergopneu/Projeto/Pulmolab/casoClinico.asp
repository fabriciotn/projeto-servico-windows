<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<script type="text/javascript">
	$(document).ready(function(){	
		$('.abre_texto').click(function(){
			$('.tr_texto').hide();
			var cod = $(this).attr("lang");
			$('#tr_texto_' + cod).fadeIn();
		});
	});
	$(document).ready(function(){	
		$('.abre_img').click(function(){
			$('.tr_img').hide();
			var cod = $(this).attr("lang");
			$('#tr_img_' + cod).fadeIn();
		});
	});

</script>
</head>

<body>

<!-- #include file="topo.asp" --> 

<!-- #include file="menu.asp" -->

<div id="geral">
  <div id="centro">
    <div id="texto">
      <div id="titulo_centro"><img src="img/titulo_casoclinicomes.png" border="0" /></div>
      <div id="texto_centro">
        <table width="620" cellspacing="15">
          <%
	SQL = "SELECT titulo, data, texto, arquivo, autor, cod, texto FROM casoclinico ORDER BY data DESC "
'	Response.Write(SQL)
	Set rsCaso = Server.CreateObject("ADODB.RecordSet")
	
	rsCaso.Open SQL, ObjDb, 3, 1
	
	WHILE rsCaso.EOF = FALSE
		
		cod		= rsCaso("cod")
		data	= rsCaso("data")
		autor	= rsCaso("autor")
		nome	= rsCaso("titulo")
		arquivo = rsCaso("arquivo")
		texto	= rsCaso("texto")
 
 %>
	
		<%if texto <> "" then%>
			<tr>
				<td><a href="#" class="abre_texto" lang="<%=cod%>"><%=nome%></a></td>
			</tr>
		<%end if
		if arquivo <> "" then%>
			<tr>
				<td><a href="#" class="abre_img" lang="<%=cod%>"><%=nome%></a></td>
			</tr>
		<%end if%>
		<% if texto <> "" then%>
			<tr id="tr_texto_<%=cod%>" class="tr_texto" style="display:none">
				<td colspan="2" style="padding-left:10px; font-style:italic"><%=texto%></td>
			</tr>
		<%end if%>
		<% if arquivo <> "" then%>
			<tr id="tr_img_<%=cod%>" class="tr_img" style="display:none">
				<td colspan="2" style="padding-left:10px; font-style:italic"><%=texto%> <a href="casoClinico/<%=arquivo%>" target="_blank"><img src="img/pdf.png" width="119" height="19" border="0" align="left" />
				</td>
			</tr>
		<%end if%>
<%
		rsCaso.MOVENEXT
	WEND
%>
        </table>
      </div>
    </div>
    
    <!-- #include file="direita_menor.asp" --> 
    
  </div>
</div>
</div>

<!-- #include file="rodape.asp" --> 

<!--#include file="conexaoOFF.asp" -->

</body>
</html>
