<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Sustentar 2010</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery-1.3.2.min.js"></script>
</head>

<body>

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
.titulo {
width:100%;
background:#999;
font-size:11px;
text-align:justify;
cursor:pointer;
font-weight:bold;
display:block;
}
.clica h2 {
font-size:12px;
color:#999;	
padding-left:10px;
width:100%;
display:block;
line-height:24px;
background:url(img/nomeprogramacao.png) no-repeat;
text-transform:uppercase;
}

.clica h4 {
font-size:12px;
color:#999;	
padding-left:10px;
width:100%;
display:block;
line-height:24px;
background:url(img/nomeprogramacao_gd.png) no-repeat;
text-transform:uppercase;
}

.clica h5 {
font-size:12px;
color:#999;	
padding-left:10px;
width:100%;
display:block;
line-height:24px;
background:url(img/nomeprogramacao_over.png) no-repeat;
text-transform:uppercase;
}

.clica h2:hover {
background:url(img/nomeprogramacao.png) no-repeat;
color:#333;
}

.clica h4:hover {
background:url(img/nomeprogramacao_over_gd.png) no-repeat;
color:#333;
}

.clica h4:hover {
background:url(img/nomeprogramacao_gd.png) no-repeat;
color:#333;
}

.clica h5:hover {
background:url(img/nomeprogramacao_over.png) no-repeat;
color:#333;
}

.div_texto {
text-align:left;
font-size:12px;
margin-bottom:10px;

}

#geral_perguntas {
margin-left:5px;

}

-->
</style> 

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
		

	});
</script>


	<div id="centraliza">


		<div id="topo">
		  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="745" height="215">
		    <param name="movie" value="flash/topo.swf" />
		    <param name="quality" value="high" />
		    <param name="wmode" value="transparent" />
		    <embed src="flash/topo.swf" quality="high" wmode="transparent" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="745" height="215"></embed>
	      </object>
	  </div>
        
        
        <div id="conteudo_interno">
          <img src="img/titulo_programacao.png" width="177" height="29" /><br />
          <br />
          
          Lista de Eventos (Clique no nome de cada evento para vizualizá-lo)<br />
<br />

          

		<!--#include file="solenidade_abertura.asp" -->
        <!--#include file="dialogo_abertura.asp" -->
        <!--#include file="forum_responsabilidade_socioambiental.asp" -->
        <!--#include file="educacao_sociedade.asp" -->
        <!--#include file="biodiversidade_biotecnologia.asp" -->
        <!--#include file="comunicacao_responsabilidade.asp" -->
        <!--#include file="mudancas_climaticas.asp" -->
        <!--#include file="mineracao.asp" -->   
        <!--#include file="construcao_sustentavel.asp"-->  
        <!--#include file="reputacao_sustentabilidade.asp" -->    
        <!--#include file="local_turismo.asp" -->    
        <!--#include file="energia_solar.asp" -->
        <!--#include file="legislacao.asp" -->
        <!--#include file="oficina.asp" -->
		<!--#include file="workshop_planejar.asp" -->
        
          </div>
            
                                                                                                
          
          
          

      </div>
	</div>
	<div id="rodape">
    
    	<div id="rodape_conteudo">
        
        <!--#include file="rodape.asp" -->
        
    	</div>
    
    </div>

<div id="hba"> <a href="http://www.hbatecnologia.com.br" target="_blank"><img src="img/logohba.png" width="87" height="27" border="0" /></a></div>

</body>
</html>
