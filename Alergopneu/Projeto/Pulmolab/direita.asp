<link href="modal.css" rel="stylesheet" type="text/css" />
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
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

			/*{*/
		  $.ajax({
			   type: 'GET',
			   url: 'carregaComboEvento.asp?codProcura='+codProcura,
			   dataType: 'xml',
			   success: function(xml) {
				$('tabela_evento',xml).each(function(){
					var eventoVer = $('eventoVer', this).text();
					var coluna1 = $('coluna1', this).text();
					var coluna2 = $('coluna2', this).text();
					var linha = $('linha', this).text();
					var local = $('localEvento', this).text();
					var apresentacao = $('apresentacao', this).text();
					
//					alert(eventoVer + '\n\n\n\n' + coluna1 + '\n\n\n\n' + linha)

					$('#textoApresentacao').html(apresentacao);
					$('#eventoVer').html(eventoVer);
					$('#textoLocal').html(local);
					$('#coluna1').html(coluna1);
					$('#coluna2').html(coluna2);
					$('#linha').html(linha);
				});
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

<div id="direita">
        <div id="titulo_agenda"><img src="img/titulo_agenda.png" width="82" height="19" border="0" /></div>
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
        <div id="historia_wilson"><a href="historiawilson.asp"><img src="img/historia_wilson.jpg" width="373" height="133" border="0" /></a></div>
        
        
        </div>