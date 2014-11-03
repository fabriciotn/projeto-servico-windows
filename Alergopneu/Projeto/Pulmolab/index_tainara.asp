<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<!-- #include file="includes.asp" -->

<link rel="icon" href="img/favicon (3).ico" type="image/gif"/>

</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<!-- #include file="superior.asp" -->
    
<div id="geral">
<div id="centro"> 

<div id="engloba_blocos">

<!--BLOCO 1 -->

<div id="bloco">
<div id="titulo_bloco"><img src="img/titulo_bloco1.png" width="154" height="25" border="0" /></div>
<div id="fundo1">

        
        
<%
	SQL = "SELECT id, nome, email, atividade, foto FROM corpoclinico WHERE categoria = 1 AND aprovado = 1 ORDER BY RAND() LIMIT 1"
	Set rsMedico = Server.CreateObject("ADODB.RecordSet")
	rsMedico.Open SQL, ObjDB, 3, 1
	
	IF rsMedico.EOF = FALSE THEN
		
		idMedico		= rsMedico("id")
		nome			= rsMedico("nome")
		foto			= rsMedico("foto")
		email			= rsMedico("email")
		atividade		= rsMedico("atividade")
		
	END IF
	
	
	IF foto = "" THEN
		foto = "img/foto_breve.jpg"
	ELSE
		foto = "foto\" & foto
	END IF
%>
        
        <div id="fundo_fotocorpoclinico"><img src="<%=foto%>" width="45" height="68" style="margin-top:3px;" /></div>
        
				<div id="englobatexto_corpoclinico">
					<div id="titulo_corpoclinico_1"><%=Server.HTMLEncode(nome)%></div>
						<div id="texto_corpoclinico_1"><%=Server.HTMLEncode(atividade)%></div>        
					</div>
					<div id="mais_corpoclinico">
						<span class="link">
						<a href="corpo_clinico.asp?x=<%=idMedico%>">mais</a>
						</span><a href="corpo_clinico.asp?x=<%=idMedico%>">
						<img src="img/mais_m.png" width="20" height="18" hspace="5" vspace="5" border="0" /></a>
			</div>
</div>
</div>

<!--BLOCO 2 -->
<%
	SQL = "SELECT cod, evento FROM eventos WHERE tipo LIKE '%Congresso%' ORDER BY cod DESC"
	
	Set rsEvento = Server.CreateObject("ADODB.RecordSet")
	
	rsEvento.Open SQL, ObjDb, 3, 1
	
	IF rsEvento.EOF = FALSE THEN
		codCongresso = rsEvento("cod")	
	END IF
	
%>
<div id="bloco">
<div id="titulo_bloco"><img src="img/titulo_bloco2.png" width="154" height="25" border="0" /></div>
<img src="img/bloco2.png" width="326" height="197" border="0" usemap="#Map2" />
<map name="Map2" id="Map2">
  <area shape="rect" coords="63,161,258,189" href="http://www.alergopneumoped.com.br/jornada" target="_blank" />
</map>
</div>

<!--BLOCO 3 -->

<div id="bloco">
<div id="titulo_bloco"><img src="img/titulo_bloco3.png" width="154" height="25" border="0" /></div>
<div id="fundo3">
<div id="calendario_home">

	<div id="fundo_calendario">
		
		<!-- *************************			CALENDARIO ********************** -->
			<!-- #include file="calendario_wesley.asp" -->      
		
			<div id="boxes">
			
				<div id="verEvento" class="window">
					<div id="quadradoEvento">					
						<a href="#" class="close">Fechar [X]</a><br />
						<!--#include file="verEvento.asp"-->
					</div>
				</div>
		
			</div>
			<div id="mask"></div>
		<!-- *************************			CALENDARIO ********************** -->

	</div>


</div>

</div>
</div>

</div>
<!--INFERIOR 1 -->

<div id="tira_duvida">
	<div id="titulo_duvida">
		<img src="img/titulo_duvida.png" width="262" height="28" border="0" /></div>
		<div id="texto_duvida">Participe do fórum de discussão com assuntos relacionados a Alergia e Pneumologia Pediátrica!</div>
		<div id="mais_corpoclinico"><span class="link"><a href="forum.asp">confira aqui</a> </span><img src="img/mais_d.png" width="21" height="17" border="0" />
	</div>
</div>

<div id="linha_inferior"><img src="img/linha_inferior.jpg" width="1" height="169" border="0" /></div>

<!--INFERIOR 2 -->

<div id="tira_duvida">
	<div id="titulo_duvida">
		<img src="img/titulo_historia.png" width="266" height="22" border="0" /></div>
		<div id="foto_historia"><img src="img/fotowilson.jpg" width="41" height="65" border="0" /></div>
		<div id="texto_historia"><img src="img/conheca_historia.png" width="139" height="39" border="0" /></div>
		<div id="mais_corpoclinico"><span class="link"><a href="historiawilson.asp">confira aqui</a> </span><img src="img/mais_d.png" width="21" height="17" border="0" />
	</div>
</div>


<div id="linha_inferior"><img src="img/linha_inferior.jpg" width="1" height="169" border="0" /></div>

<!--INFERIOR 3 -->
<%
	SQL = "SELECT titulo, noticia, cod FROM noticias ORDER BY cod DESC LIMIT 1"
	Set rsNoticia = Server.CreateObject("ADODB.RecordSet")
'	Response.Write(SQL)
	rsNoticia.Open SQL, ObjDb, 3, 1
	
	IF rsNoticia.EOF = FALSE THEN
		
		titulo = rsNoticia("titulo")
		texto = rsNoticia("noticia")
		cod = rsNoticia("cod")

		maxTam = 130

		IF LEN(texto) > maxTam THEN
			texto = MID(texto, 1, maxTam) & "..."
			texto = replace(replace(replace(texto,"<br>",""), "<br />", ""), chr(13), "")
		END IF 
	
	ELSE

		titulo = "Adrenalina auto-injetável no Brasil"
		texto = "Está para ser lançado no Brasil em 2007 a adrenalina auto-injetável nacional, ainda sem nome, que certamente terá um custo mais acessível quando comparado com o produto importado. O processo está..."
		
	END IF

%>		


<div id="tira_duvida">
	<div id="titulo_duvida">
		<img src="img/titulo_noticiainferior.png" width="285" height="27" border="0" /></div>
		<div id="titulo_noticia1_home"><%=titulo%></div>
		<div id="texto_noticia_home"><%=texto%></div>	
		<div id="mais_corpoclinico"><span class="link"><a href="verNoticia.asp?cod=<%=cod%>">confira aqui</a> </span><img src="img/mais_d.png" width="21" height="17" border="0" /></div>
	</div>
</div>
</div>
</div>

<!-- #include file="rodape.asp" -->



</body>
</html>
