<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
		 <div class="titulo"><img src="img/titulo_cadastroforum.png" width="152" height="16" border="0" /></div>
 <div class="texto_centro">
   <p>&nbsp;</p>
   <p>&nbsp;</p>
	      <table style="font-family: Tahoma; font-size: 8pt;">
			<tr>
			  <td colspan="4" class="area"><b>Selecione o tipo de formul&aacute;rio:</b></td>
			</tr>
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="4" class="area">
						<select name="categoria" id="categoria">
							<option value="0">Selecionar</option>
							<option value="1">Corpo Cl&iacute;nico</option>
<!--							<option value="3">Pós-Graduandos em Atividade</option>-->
							<option value="4">Ex P&oacute;s-Graduandos</option>
<!--							<option value="5">Médicos / Estudantes</option>-->
							<option value="2">Profissionais da &aacute;rea de sa&uacute;de</option>
							<option value="6">Leigos</option>
						</select>
				</td>
			</tr>
			<tr>
				<td>
				</td>
			</tr>
		</table>
       </div>
       
       </div>
       
 <!-- #include file="direita_menor.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->



</body>
</html>
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$('#categoria').change(function(){

			if( $(this).val() == '1' )
			{
				window.location = "cadastroCorpo.asp";
			}
			else if( $(this).val() == '2')
			{
				window.location = "cadastroOutrosProfissionais.asp";
			}/*else if ( $(this).val() == '3' )
			{
				window.location = "formPosGraduandoAtivo.asp";
			}*/
			else if( $(this).val() == '4')
			{
				window.location = "cadastroExPosGraduando.asp";
			}
			else if( $(this).val() == '5')
			{
				window.location = "medicoEstudantes.asp";
			}
			else if( $(this).val() == '6')
			{
				window.location = "leigos.asp";
			}
		
		});
	
	});
</script>
