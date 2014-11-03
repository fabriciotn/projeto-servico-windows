<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<style type="text/css">
<!--
	#formContato{
		font-size:11px;
	}
	.dado_maior{
		width:198px;
	}
-->
</style>
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
       <div id="titulo_centro"><img src="img/titulo_contato.png" width="89" height="16" border="0" /></div>
       
       <div id="texto_centro">
 <div id="texto_centro_contato">
   <div>
     <ul>
       <div>

			<form name="formContato" id="formContato" action="contato_ok.asp" method="post">
				<p>&nbsp;</p>
				<table cellspacing="6">
					<tr>
						<td>
							Nome:
						</td>
						<td colspan="2">
							<input type="text" name="nome" id="nome" class="dado_maior" />
						</td>
					</tr>
					<tr>
						<td>
							E-mail:
						</td>
						<td colspan="2">
							<input type="text" name="email" id="email" class="dado_maior" />
						</td>
					</tr>
					<tr>
						<td>
							Cidade/UF:
						</td>
						<td>
							<input type="text" name="local" id="local"  />
						</td>
						<td>
							<select name="uf" class="box" id="uf" tabindex=5>
								<option value="MG" selected>MG&nbsp;</option>
								<option value="AC">AC&nbsp;</option>
								<option value="AL">AL&nbsp;</option>
								<option value="AM">AM&nbsp;</option>
								<option value="AP">AP&nbsp;</option>
								<option value="BA">BA&nbsp;</option>
								<option value="CE">CE&nbsp;</option>
								<option value="DF">DF&nbsp;</option>
								<option value="ES">ES&nbsp;</option>
								<option value="GO">GO&nbsp;</option>
								<option value="MA">MA&nbsp;</option>
								<option value="MS">MS&nbsp;</option>
								<option value="MT">MT&nbsp;</option>
								<option value="PA">PA&nbsp;</option>
								<option value="PN">PN&nbsp;</option>
								<option value="PR">PR&nbsp;</option>
								<option value="PE">PE&nbsp;</option>
								<option value="PI">PI&nbsp;</option>
								<option value="RJ">RJ&nbsp;</option>
								<option value="RN">RN&nbsp;</option>
								<option value="RO">RO&nbsp;</option>
								<option value="RS">RS&nbsp;</option>
								<option value="RR">RR&nbsp;</option>
								<option value="SC">SC&nbsp;</option>
								<option value="SE">SE&nbsp;</option>
								<option value="SP">SP&nbsp;</option>
								<option value="TO">TO&nbsp;</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							Telefone:
						</td>
						<td>
							<input type="text" name="tel" id="tel" class="telefone"  />
						</td>
					</tr>
					<tr>
						<td>
							Mensagem:
						</td>
						<td colspan="2">
							<textarea name="mensagem" id="mensagem" class="dado_maior"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:right">
							<input type="submit" value="Enviar" name="Enviar" />
						</td>
					</tr>
				</table>
			</form>
      
       </div>
     </ul>
   </div>
 </div>
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
<script type="text/javascript">
	$(document).ready(function(){
		
	// mascara para campos especificos
		$('.telefone').mask("(99)9999-9999");
		
		$('#email').blur(function(){
//        var obj = $(this).val(); // eval("document.forms[0].email");
			var txt = $('#email').val();//obj.value;
			if ((txt.length != 0) && ((txt.indexOf("@") < 1) || (txt.lastIndexOf('.') < 7)))
			{
				alert('Por favor, informe o e-mail corretamente.');
				$('#email').focus();
				return false;
			}
		});

		
		$('#formContato').submit(function(){
		
			if( $('#nome').val() == '' )
			{
				alert('O campo nome é obrigatório!');
				return false;
			}
			if( $('#mensagem').val() == '' )
			{
				alert('O campo mensagem é obrigatório!');
				return false;
			}
			if( $('#email').val() == '' )
			{
				alert('O campo e-mail é obrigatório!');
				return false;
			}
		
		});
		
	});
</script>
