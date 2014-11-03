<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<link href="modal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script> 
<script type="text/javascript">

$(document).ready(function(){

	$('.clica').click(function(){
		$div = $(this).next(); 
		/*$('.clicar').slideUp("fast");
		$div.slideToggle("fast");*/
	
		if($div.css("display")=="none")
		{
			$('.clicar').slideUp('fast');
			$div.slideDown('fast');
		}
		else
		{
			$div.slideUp('fast');
		}
	
	});
	
	$('#primeira').show();		
		
	$('a[name=modal]').click(function(e) {
		e.preventDefault();
		
		var id = $(this).attr('href');
	
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
	
		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(1000);	
		$('#mask').fadeTo("slow",0.8);	
	
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
              
		$(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);
	
		$(id).fadeIn(2000); 
	
	});
	
	$('.window .close').click(function (e) {
		e.preventDefault();
		
		$('#mask').hide();
		$('.window').hide();
	});		
	
	$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
	});			
	
});			
</script>

<style type="text/css">
<!--

.clicar {

font-size:12px;
display:none; 

}

.clica {
cursor:pointer;
display:block;
text-align:justify;
margin-bottom:10px;
margin-top:-10px;
}
-->
</style> 
</head>

<body>
<div class="geral">
<div class="engloba_geral">
<!--#include file="sessaoOFF.asp"-->
<!--#include file="topo.asp" -->

<div class="centro">
<div class="banner_foto">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="539" height="240">
    <param name="movie" value="flash/banner_foto.swf" />
    <param name="quality" value="high" />
    <param name="wmode" value="transparent" />
    <embed src="flash/banner_foto.swf" quality="high" wmode="transparent" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="539" height="240"></embed>
  </object>
</div>

<%

	SQL = "SELECT texto, titulo FROM textoHome ORDER BY cod DESC"
	Set rsTxt = Server.CreateObject("ADODB.RecordSet")
	rsTxt.Open SQL, ObjDB, 3, 1
	
	IF rsTxt.EOF = FALSE THEN
		
		texto = rsTxt("texto")
		titulo = rsTxt("titulo")
		
	END IF
	
	Set rsTxt = Nothing

%>
<div class="apresentacao">
<div class="titulo_apresentacao"><img src="img/tituloHome.png" /> <%=Server.HTMLEncode(titulo)%></div>
<div class="texto_apresentacao">
	<%=Server.HTMLEncode(texto)%>
</div>  
  
  <div class="fundo_newsletter"><a href="historiawilson.asp"><a href="historiawilson.asp"><img src="img/historiawilson.png" width="375" height="132" border="0" /></a></a></div>
  
</div>

<div class="engloba_tudo">

<div class="engloba_esquerda">

<div class="fundo_corpo_clinico">
<div class="titulo_corpo_clinico"><img src="img/titulo_corpoclinico.png" width="114" height="16" border="0" /></div>
<%
	SQL = "SELECT nome, atividade, foto FROM corpoclinico WHERE categoria = 1 ORDER BY RAND() LIMIT 1"
	Set rsMedico = Server.CreateObject("ADODB.RecordSet")
	rsMedico.Open SQL, ObjDB, 3, 1
	
	IF rsMedico.EOF = FALSE THEN
		
		nome = rsMedico("nome")
		atividade = rsMedico("atividade")
		foto = rsMedico("foto")
		
	END IF
	
	Set rsMedico = Nothing
%>



 <div class="foto_esquerda">
              <img src="img/<%=foto%>" width="84" height="112" />
      </div>
              
<div class="caixa_palestrante">

<div style="width:320px; float:left; margin-left:20px; margin-top:12px;">
<div style="width:320px; color:#58581A; float:left"><%=Server.HTMLEncode(nome)%></div>
<div style="width:320px; height:10px; float:left"></div>
<div style="width:320px; color:#333333; font-size:11px; height:auto; float:left"><%=Server.HTMLEncode(atividade)%></div>
<div style="width:320px; float:left; text-align:right; margin-top:10px;"><a href="corpo_clinico.asp"><img src="img/vejamais.png" width="31" height="11" border="0" align="right" /></a></div>

</div>               
</div>

</div>

<div class="titulo_noticia"><img src="img/titulo_noticia.png" width="74" height="13" border="0" /></div>

<%
	SQL_2 = "SELECT titulo, noticia, cod FROM noticias ORDER BY data DESC LIMIT 3"
	Set rsNoticia = Server.CreateObject("ADODB.RecordSet")
	rsNoticia.Open SQL_2, ObjDB, 3, 1
	
	cont = 0
	WHILE rsNoticia.EOF = FALSE
		
		cod = rsNoticia("cod")
		titulo = rsNoticia("titulo")
		noticia = rsNoticia("noticia")

		noticia = Replace(Replace(noticia, "<b>", ""), "</b>", "")
		IF Len(noticia) > 165 THEN
			noticia = mid(noticia,1,160)&"..."	
		END IF
		
%>



<div class=" bloco_noticia">

	<div class="tit_noticia"><%=Server.HTMLEncode(titulo)%></div>
	<div class="texto_noticia"><%=Server.HTMLEncode(noticia)%></div>
	<div class="vejamais">
		<a href="verNoticia.asp?cod=<%=cod%>">
			<img src="img/vejamais.png" width="31" height="11" border="0" />
		</a>
	</div>
</div>


	<%IF cont <> 3 THEN%>
		<div class="divisoria"><img src="img/divisoria.png" width="454" height="2" border="0" /></div>
	<%END IF%>
<%
	
	cont = cont + 1
	rsNoticia.MOVENEXT
	WEND

	Set rsNoticia = Nothing
%>
</div>



<div class="engloba_direita">
<div class="titulo_agenda"><img src="img/titulo_agenda.png" width="67" height="16" border="0" /></div>
<div class="calendario">
<!-- *************************			CALENDARIO ********************** -->
	<!--#include file="calendario.asp" -->

	<div id="boxes">
	
		<div id="verEvento" class="window">
		<a href="#" class="close">Fechar [X]</a><br />
			<!--#include file="verEvento.asp"-->
		</div>

	</div>
	<div id="mask"></div>
<!-- *************************			CALENDARIO ********************** -->



<!--	<img src="img/calendarionovo.png" width="375" height="227" border="0" />	-->
</div>

<div class="titulo_link"><img src="img/titulo_link.png" width="155" height="12" border="0" /></div>

<div class="texto_link">
<%
	SQL_3 = "SELECT titulo, texto, pagina, cod FROM link ORDER BY cod DESC LIMIT 3"
	Set rsLink = Server.CreateObject("ADODB.RecordSet")
	rsLink.Open SQL_3, ObjDB, 3, 1
	
	WHILE rsLink.EOF = FALSE
		
		titulo = rsLink("titulo")
		texto = rsLink("texto")
		pagina = rsLink("pagina")

		texto = Replace(Replace(texto, "<b>", ""), "</b>", "")
		IF Len(texto) > 100 THEN
			texto = mid(texto,1,100)&"..."	
		END IF
		
	
%>

<p><span class="destaque_vermelho">.</span>
	<span class=" link_links">
		<a href="<%=pagina%>" target="_blank"><%=Server.HTMLEncode(texto)%></a>
	</span>
</p>
<p>&nbsp;</p>


<%
	rsLink.MOVENEXT
	WEND

	Set rsLink = Nothing
%>

<div class="vejamaislinks"><a href="links.asp"><img src="img/vejamais.png" width="31" height="11" border="0" /></a></div>

</div>

</div>
</div>
<!--#include file="rodape.asp" -->
</div>
</div>







</body>
</html>
