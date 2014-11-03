<!--#include file="conexao.asp" -->  <!-- CONEXAO BASICA COM BANCO DE DADOS -->

<!--#include file="sessaoForum.asp" --> <!-- SESSAO DE LOGIN PARA FORUM -->

<link rel="stylesheet" type="text/css" href="js/resources/css/ext-all.css" /> <!-- USADO NA PAGINA AREA_ADMIN -->
<link rel="stylesheet" type="text/css" href="js/resources/css/xtheme-gray.css" /> <!-- USADO NA PAGINA AREA_ADMIN -->

<link href="modal.css" rel="stylesheet" type="text/css" /> <!-- ESTILO GERAL DO CALENDARIO -->


<link href="css.css" rel="stylesheet" type="text/css" /> <!-- ESTILO GERAL DO SITE -->

<link rel="stylesheet" href="css_menu/style.css" type="text/css" media="screen"/> <!-- ESTILO DO MENU - TAINARA -->

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>	<!-- JQUERY BASICA -->

<script src="js/AC_RunActiveContent.js" language="javascript"></script>		<!-- JQUERY BASICA -->

<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>		<!-- JQUERY BASICA -->

<script type="text/javascript" src="js/ext.js"></script>		<!-- JQUERY BASICA PARA FUNCIONAMENTO DO LOGIN DA PG AREA_ADMIN-->

<script type="text/javascript" language="javascript" src="js/jquery.dropdownPlain.js"></script> 	<!-- INCLUDE - TAINARA -->


<script type="text/javascript" src="js/jquery.easing.1.3.js"></script> 	<!-- INCLUDE - TAINARA -->
<script type="text/javascript" src="js/jquery.galleryview-1.1.js"></script> 	<!-- INCLUDE - TAINARA -->
<script type="text/javascript" src="js/jquery.galleryview-1.1-pack.js"></script> 	<!-- INCLUDE - TAINARA -->
<script type="text/javascript" src="js/jquery.timers-1.2.js"></script> 	<!-- INCLUDE - TAINARA -->
<link href="menu.css" rel="stylesheet" type="text/css" /> 	<!-- INCLUDE - TAINARA -->

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

		var codProcura = $(this).attr('lang');
		$('#idVaga').val(codProcura);
//		alert('Codigo: ' + codProcura)
			var cont_evento = 0;
			/*{*/
			$('.tabela_evento_extra').hide();

		  $.ajax({
			   type: 'GET',
			   url: 'carregaComboEvento.asp?codProcura='+codProcura,
			   dataType: 'xml',
			   success: function(xml) {
				$('tabela_evento',xml).each(function(){
					cont_evento = cont_evento + 1;
					
					var tipo = $('tipoEvento', this).text();
					var linha = $('linha', this).text();
					var coluna1 = $('coluna1', this).text();
					var coluna2 = $('coluna2', this).text();
					var local = $('localEvento', this).text();
					var eventoVer = $('eventoVer', this).text();
					var horario = $('horarioEventoVer', this).text();
					var apresentacao = $('apresentacao', this).text();
					
//					alert(eventoVer + '\n\n\n\n' + coluna1 + '\n\n\n\n' + linha)
					if( cont_evento == 1 ){
	
						$('#textoApresentacao').html(apresentacao);
						$('#horarioEventoVer').html(horario);
						$('#eventoVer').html(eventoVer);
						$('#textoLocal').html(local);
						$('#coluna1').html(coluna1);
						$('#coluna2').html(coluna2);
						$('#linha').html(linha);
						
						if(tipo == 'Congresso')
						{
							$('#ApresentacaoEvento').fadeOut();
							$('#horario').fadeOut();
							$('#conteudoAdicional').fadeOut();
						}
						else
						{
							$('#ApresentacaoEvento').fadeIn();
							$('#horario').fadeIn();
							$('#conteudoAdicional').fadeIn();
						}
						
					}else{
						
						
						var txt_evento = '';
						txt_evento = txt_evento + '<br />';
						txt_evento = txt_evento + '<table class="tabela_evento tabela_evento_extra" border="0" cellspacing="1" cellpadding="5" width="700">';
						txt_evento = txt_evento + '	<tr>';
						txt_evento = txt_evento + '		<td id="eventoVer" colspan="5">';
						txt_evento = txt_evento + '		</td>';
						txt_evento = txt_evento + '		</tr>';
						txt_evento = txt_evento + '		<tr>';
						txt_evento = txt_evento + '			<td colspan="4" id="espaco">&nbsp;';
						txt_evento = txt_evento + '			</td>';
						txt_evento = txt_evento + '		</tr>';
						txt_evento = txt_evento + '		<tr>';
						txt_evento = txt_evento + '			<td class="horarioEvento">';
						txt_evento = txt_evento + '				<span id="dataEventoVer">Data:&nbsp;</span>';
						txt_evento = txt_evento + '				<span id="coluna1">' + coluna1 + '</span>';
						txt_evento = txt_evento + '				<span id="coluna2"> ' + coluna2 + '</span>';
						txt_evento = txt_evento + '				<span id="horario">Hor&aacute;rio: &nbsp;</span>';
						txt_evento = txt_evento + '				<span id="horarioEventoVer">' + horario + '</span>';
						txt_evento = txt_evento + '				&nbsp;&nbsp;&nbsp;&nbsp;';
						txt_evento = txt_evento + '			</td>';
						txt_evento = txt_evento + '		</tr>';
						txt_evento = txt_evento + '		<tr>';
						txt_evento = txt_evento + '			<td colspan="4" id="espacoEvento">&nbsp;';
						txt_evento = txt_evento + '			</td>';
						txt_evento = txt_evento + '		</tr>';
						txt_evento = txt_evento + '		<tr>';
						txt_evento = txt_evento + '			<td valign="top">';
						txt_evento = txt_evento + '			<span id="ApresentacaoEvento">Apresenta&ccedil;&atilde;o:&nbsp;<span id="textoApresentacao">'+ apresentacao +'</span><br /></span>';
						txt_evento = txt_evento + '			<span id="localEvento">Local:&nbsp;<span id="textoLocal">' + local + '</span><br /></span>';
						txt_evento = txt_evento + '			<span id="conteudoAdicional">Assunto:&nbsp;</span><span id="linha">' + linha + '</span>';
						txt_evento = txt_evento + '			</td>';
						txt_evento = txt_evento + '		</tr>';
  						txt_evento = txt_evento + '</table>';
						
						$('#div_texto_evento').append(txt_evento);
					}
					
					
				});
				cont_evento = 0;
			   }
			});
			/*}*/

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
