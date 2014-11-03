<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<script type="text/javascript">
	$(document).ready(function(){	
		$('.abre_obs').click(function(){
			$('.tr_obs').hide();
			var cod = $(this).attr("lang");
			$('#tr_obs_' + cod).fadeIn();
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
       <div id="titulo_centro"><img src="img/titulo_protocolo.png" width="112" height="16" border="0" /></div>
       
       <div id="texto_centro">
<table width="409" cellspacing="15">

 <%
 	SQL = "SELECT nome, arquivo, cod, obs FROM protocolos ORDER BY nome"
	
	Set rsProtocolo = Server.CreateObject("ADODB.RecordSet")
	
	rsProtocolo.Open SQL, ObjDb, 3, 1
	
	WHILE rsProtocolo.EOF = FALSE
		
		nome = rsProtocolo("nome")
		arquivo = rsProtocolo("arquivo")
		cod = rsProtocolo("cod")
 		obs = rsProtocolo("obs")
 %>
     <tr>
       <td><%=nome%> <%if obs <> "" then%>&nbsp;&nbsp;&nbsp;<label class="abre_obs" lang="<%=cod%>"  style="display:none" /><%end if%></td>
       <td><a href="protocolos/<%=arquivo%>" target="_blank"><img src="img/pdf.png" width="119" height="19" border="0" align="right" /></a></td>
     </tr>
	  <%if obs <> "" then%>
			<tr id="tr_obs_<%=cod%>" class="tr_obs" style="display:none">
				<td colspan="2" style="padding-left:10px; font-style:italic"><%=obs%></td>
			</tr>
	  <%end if%>
	  
<%
		rsProtocolo.MOVENEXT
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
