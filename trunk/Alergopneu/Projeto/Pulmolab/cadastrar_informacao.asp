<!--#include file="conexao.asp" -->  <!-- CONEXAO BASICA COM BANCO DE DADOS -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%
	usuario = Session("usuario")
	Session("usuario") = usuario %>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>	<!-- JQUERY BASICA -->
<script type="text/javascript">
$(function($){       
	$('#btn_edit_cat').click(function(){      
		var pega_id = $('#categoria').val();
		$('#id_cat').val(pega_id);
	});
}); 

$(document).ready(function(){
	$('#btn_edit_cat').click(function(){
		var verificaVazio;
		verificaVazio = $('#categoria').val();
		if(verificaVazio != "") {
	
	//Abre novo fórmulario para editar categoria
	
		var id_categoria;
		id_categoria = $('#id_cat').val()
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		window.open("editar_categoria.asp?id_categoria=" + id_categoria + "", "PULMOLAB" , "height=650,width=610,top=" + topo + ",left=" + esquerda + 					     ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	;} else{
		alert("Deve ser selecionada uma categoria!");
	}
	});
	function montaSelect (){
	$.ajax({
		type: 'GET',
		url:  'montaSelect.asp',
		dataType: 'xml',
		success:  function(xml){
		
		$('#categoria').html('');
		$('#categoria').append('<option value=\"\"></option>');
		
		$('sql',xml).each(function(){
			$('opcao',xml).each(function(){
				var id   = $('id', this).text();
				var nome = $('nome', this).text();
				$('#categoria').append('<option value="' + id + '">' + nome + '</option>');
			});
		});
		}
	});}
	montaSelect ();

			$('#nova_categoria').val('');

//			$('#select').load('select_categoria.asp');
			$('.campos_aparecer').hide();				
			$('#loaging').hide();				
			$('#cadastra').click(function(){
				if ($('#titulo').val() == ''){
	        		alert("Erro! Preencha corretamente o título da informação.");
            		return false;                                 
    			}
				$("#campos").fadeOut("slow", function(){
					$('#loaging').show();				
				});
			});
			$('#add_cat').click(function(){
				$('.campos_esconde').hide();				
				$('.campos_aparecer').show("normal");				
			});
			
			$('#cadastra_cat').click(function(){
				
				var categoria = $('#nova_categoria').val();
				var tamanho_total = categoria.length;
				var categoria_nova = '';
				for(i = 0;i <= tamanho_total; i++ ){
					var caracter_novo = (categoria.substring(i,tamanho_total))
					var caracter = caracter_novo.substring(0,1);
					if( caracter == ' ' ){
						caracter = '|#';
					}
					categoria_nova = categoria_nova + caracter;
				}
				$('#categoria_nova').val(categoria_nova);
				
				if( $('#nova_categoria').val() != '' ){
					$.ajax({
						type: 'POST',
						data: 'categoria='+$('#categoria_nova').val(),
						url: 'cadastra_categoria.asp',
						cache: false,
						dataType: 'xml',
						success: function(xml){
							$('hba',xml).each(function(){
								var msg = $('msg', this).text();
								if ( msg == 'ok' ){
									alert('Categoria Cadastrada com sucesso!');
									montaSelect ();
									$('.campos_aparecer').hide();	
									$('#categoria_nova').val('');
									$('.campos_esconde').show("normal");				
								}else{
									alert('O sistema encontrou um erro, favor tentar novamente mais tarde!');
									return false		
								}
							});
						}
					});
				}
			});
	});		
</script>
<style type="text/css">
<!--
body {
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
}
.style1 {
	font-size: 14px;
	font-weight: bold;
}
td {
	padding-left: 50px;
}
#loaging {
	height:100px;
	width:300px;
	padding:30px;
	margin:auto;
	vertical-align:middle;
	border:2px solid #CCC;
	background-color:white;}
textarea {
	background:#F5F5F5;
	border:1px solid #CCCCCC;
	font-family:Arial, Helvetica, sans-serif;
	font-size:11px;
}
-->
</style>
<title>PULMOLAB</title>
</head>
</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">
<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<div id="campos">
	<form method="post" action="cadastrar_informacao_ok.asp" enctype="multipart/form-data">
		<table style="font-family: Tahoma; font-size: 8pt;">
			<tr>
				<td colspan="4" class="area"><b>Categoria:</b></td>
			</tr>
			<tr>
				<td class="area" colspan="4">
					<input type="text" name="nova_categoria" id="nova_categoria" class="campos_aparecer" />
					<input type="hidden" name="categoria_nova" id="categoria_nova"/>
					<div align="right" style="width:200px;">
						<img src="img/add.png" name="add_cat" id="add_cat" title="Adicionar Categoria" style="cursor:pointer" class="campos_esconde" />
<!--						<img src="img/add.png" name="editar" id="editar" title="Adicionar Categoria" style="cursor:pointer" class="campos_esconde editar" />-->
					</div>	
<!--					<div id="select" style="width:280px;"></div>-->
					<select name="categoria" id="categoria" class="campos_esconde">
					</select>
                    <input type="hidden" id="id_cat" name="id_cat"/>
					<input type="button" name="btn_edit_cat" id="btn_edit_cat"  value="Editar" class="campos_esconde" style="cursor:pointer"/>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><b>T&iacute;tulo:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="text" name="titulo" id="titulo" size="51"/></td>
			</tr>
			<tr>
				<td class="area">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><b>Arquivo:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="file" name="arquivo" id="arquivo" size="35" /></td>
			</tr>
			<tr>
				<td class="area">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td class="area"><b>Texto:</b></td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><textarea name="obs" id="obs" style="width: 350px; height: 60px; font-size:12px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Para colocar um trecho em negrito, it&aacute;lico ou
					
					sublinhado, <br />
					coloque-o entre as respectivas tags: 
					&lt;b&gt;&lt;/b&gt;, &lt;i&gt;&lt;/i&gt; ou &lt;u&gt;&lt;/u&gt;. <br />
					<br />
					<u>Exemplo:</u> <br />
					&lt;u&gt;Venha&lt;/u&gt; &lt;i&gt;conhecer&lt;/i&gt; a&lt;b&gt;PULMOLAB&lt;/b&gt;! <br />
					<br />
					<u>Resultado:</u> <br />
					<u>Venha</u> <i>conhecer</i> a <b>PULMOLAB</b>! </td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" class="botoes" id="cadastra" value="Cadastrar" style="cursor: pointer;"></td>
			</tr>
		</table>
	</form>
</div>
<div id="loaging" align="center"> <img src="img/icons/ajax-loader.gif"  /><br />
	<h1>ENVIANDO...</h1>
</div>
</body>
</html>