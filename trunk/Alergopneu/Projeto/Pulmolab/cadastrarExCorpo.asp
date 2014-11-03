<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
$(document).ready(function(){	

	$('#Cadastrar').click(function(){
		<%
		campo_ob = "setor,nome,outraAtividade,universidade,formaturaGraduacao,residenciaPediatria,inicioPediatria,fimPediatria,FezPosGraduacao,FezDoutorado,tituloEspecialista,possuiConsultorio,areaInteresse,telefone,email,foto"
		campos_ob = SPLIT(campo_ob,",")
		for i = 0 to Ubound(campos_ob)
		%>
			if( $('#<%=campos_ob(i)%>').val() == '' ){
				alert('O campo <%=Ucase( Replace( campos_ob(i) ,"_", " ") )%> é obrigatório.');
				return false;
			}
		<%
		next
		%>
	});

// mascara para campos especificos
	$('.data').mask("99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999");
	$('.cep').mask("99999-999");

//esconde campos

	$('.Esconde1').hide();
	$('.Esconde2').hide();
	$('.Esconde3').hide();
	$('.Esconde4').hide();
	$('.Esconde5').hide();
	$('.Esconde6').hide();
	$('.Esconde7').hide();
	
	
	$('#setor').click(function(){
		if( $(this).val() == '0' )
		{
			window.location = "tipoC.asp";
		}
	
	});
	
	$('#outraAtividade').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde1').fadeIn();
		}
		else
		{
			$('.Esconde1').fadeOut();
		}
	
	});
	
	$('#outraResidencia').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde2').fadeIn();
		}
		else
		{
			$('.Esconde2').fadeOut();
		}
	
	});
	
	$('#FezPosGraduacao').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde3').fadeIn();
		}
		else
		{
			$('.Esconde3').fadeOut();
		}
	
	});
	
	$('#FezMestrado').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde4').fadeIn();
		}
		else
		{
			$('.Esconde4').fadeOut();
		}
	
	});
	
	$('#FezDoutorado').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde5').fadeIn();
		}
		else
		{
			$('.Esconde5').fadeOut();
		}
	
	});
	
	$('#Outro').click(function(){

		$('.Esconde6').toggle();
	
	});

	$('#possuiConsultorio').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde7').fadeIn();
		}
		else
		{
			$('.Esconde7').fadeOut();
		}
	
	});
});
	
</script>

<style type="text/css">
<!--

	body
	{
		background-color: #F7F7F7;
		font-family: Tahoma;
		font-size: 8pt;
	}

	.tableCadastraCorpo tr td
	{
		border:2px;
		border-left:2px;
		border-right:2px;
		border-top:3px;
		font-family:Arial, Helvetica, sans-serif;
		text-align:left;
	}
	#form_CorpoClinico{
		font-family:Arial, Helvetica, sans-serif;
		font-size:8px;
		color:#000000;
	}
	.dado{
		font-size:11px;
		width:180px;
		background:#E0E7FA;
	}
	.dado_maior{
		width:250px;
	}
	#titulo{
		color:#FFFFFF;
		font-size:18px;
		background:#69A7CB;
		text-align:center;
	}
-->
</style>


</head>

<body>

		<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<%

	ultima_pagina = Session("ultima_pagina")
	Session ("ultima_pagina") = ultima_pagina

%>


<form method="post" name="form_CorpoClinico" id="form_CorpoClinico" action="cadastraExCorpo_ok.asp" enctype="multipart/form-data">
	<table class="tableCadastraCorpo" style="padding-left:70px;">
		<tr>
			<td id="titulo" colspan="2">
				Cadastro de Corpo Cl&iacute;nico
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Nome:
			</td>
			<td class="dado_maior">
				<input type="text" name="nome" id="nome" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Outras atividades:
			</td>
			<td>
				<select name="outraAtividade" id="outraAtividade">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde1">
			<td class="dado">
				Atividade:
			</td>
			<td>
				<input type="text" name="atividade" id="atividade" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Universidade:
			</td>
			<td>
				<input type="text" name="universidade" id="universidade" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Ano de Formatura:
			</td>
			<td>
				<input type="text" name="formaturaGraduacao" id="formaturaGraduacao" class="ano" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Resid&ecirc;ncia pediatria:
			</td>
			<td>
				<input type="text" name="residenciaPediatria" id="residenciaPediatria" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioPediatria" id="inicioPediatria" class="data" style="width:110px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimPediatria" id="fimPediatria" class="data" style="width:110px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				Outra Resid&ecirc;ncia m&eacute;dica:
			</td>
			<td>
				<select name="outraResidencia" id="outraResidencia">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Especialidade
			</td>
			<td>
				<input type="text" name="residencia" id="residencia" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Local resid&ecirc;ncia:
			</td>
			<td>
				<input type="text" name="localResidencia" id="localResidencia" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioOutra" id="inicioOutra" class="data" style="width:110px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimOutra" id="fimOutra" class="data" style="width:110px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Possui P&oacute;s Gradua&ccedil;&atilde;o:
			</td>
			<td>
				<select name="FezPosGraduacao" id="FezPosGraduacao">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3" >
			<td class="dado">
				P&oacute;s:
			</td>
			<td>
				<input type="text" name="posGraduacao" id="posGraduacao" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3" >
			<td class="dado">
				Local:
			</td>
			<td>
				<input type="text" name="LocalposGraduacao" id="LocalposGraduacao" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3">
			<td class="dado">
				Formatura (mm/ano):
			</td>
			<td>
				<input type="text" name="formaturaPOS" id="formaturaPOS" class="data" style="width:110px;" />
			</td>	
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Possui Mestrado:
			</td>
			<td>
				<select name="FezMestrado" id="FezMestrado">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde4">
			<td class="dado">
				Mestrado:
			</td>
			<td>
				<input type="text" name="mestrado" id="mestrado" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde4">	
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="formaturaMestrado" id="formaturaMestrado" class="ano" style="width:110px;" />
			</td>	
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Possui Doutorado:
			</td>
			<td>
				<select name="FezDoutorado" id="FezDoutorado">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="Esconde5">
			<td class="dado">
				Doutorado:
			</td>
			<td>
				<input type="text" name="doutorado" id="doutorado" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde5">
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="formaturaDoutorado" id="formaturaDoutorado" class="ano" style="width:110px;" />
			</td>	
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>T&iacute;tulos de Especialista:
			</td>
			<td colspan="2">
					<input type="checkbox" name="tituloEspecialista" id="Pediatria" value="Pediatria" /> Pediatria&nbsp;&nbsp 
					<input type="checkbox" name="tituloEspecialista" id="Alergia" value="Alergia" />  Alergia&nbsp;&nbsp;
					<input type="checkbox" name="tituloEspecialista" id="PneumologiaPediatrica" value="Pneumologia Pedi&aacute;trica" /> Pneumologia Pedi&aacute;trica&nbsp;&nbsp;<br /> 
					<input type="checkbox" name="tituloEspecialista" id="AlergiaPediatrica" value="Alergia pedi&aacute;trica" /> Alergia pedi&aacute;trica&nbsp;&nbsp;
					<input type="checkbox" name="tituloEspecialista" id="Pneumologia" value="Pneumologia" /> Pneumologia&nbsp;&nbsp;
					<input type="checkbox" name="tituloEspecialista" id="Outro" value="Outro" /> Outro
<!--				<select name="tituloEspecialista" id="tituloEspecialista">
					<option value="Pediatria">Pediatria&nbsp;&nbsp;</option>
					<option value="Alergia">Alergia&nbsp;&nbsp;</option>
					<option value="AlergiaPediatrica">Alergia pedi&aacute;trica&nbsp;&nbsp;</option>
					<option value="PneumologiaPediatrica">Pneumologia Pedi&aacute;trica&nbsp;&nbsp;</option>
					<option value="Pneumologia">Pneumologia&nbsp;&nbsp;</option>
					<option value="Outro">Outro&nbsp;&nbsp;</option>
				</select>
-->			</td>
		</tr>
		<tr class="Esconde6">
			<td class="dado">
				T&iacute;tulo:
			</td>
			<td>
				<input type="text" name="outroTituloEspecialista" id="outroTituloEspecialista" class="dado_maior" />
			</td>
		</tr>
		<tr class="Esconde6">
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="anoTitulo" id="anoTitulo" class="ano" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Consult&oacute;rio:
			</td>
			<td>
				<select name="possuiConsultorio" id="possuiConsultorio">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				CEP:
			</td>
			<td>
				<input type="text" name="cepConsultorio" id="cepConsultorio" class="cep" style="width:110px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Estado:
			</td>
			<td>
				<input type="text" name="estadoConsultorio" id="estadoConsultorio" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Cidade:
			</td>
			<td>
				<input type="text" name="cidadeConsultorio" id="cidadeConsultorio" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Endere&ccedil;o:
			</td>
			<td>
				<input type="text" name="enderecoConsultorio" id="enderecoConsultorio" class="dado_maior"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Telefone:
			</td>
			<td>
				<input type="text" name="telConsultorio" id="telConsultorio" class="telefone" style="width:110px;" />
			</td>	
		</tr>

		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Area de Interesse:
			</td>
			<td>
				<input type="text" name="areaInteresse" id="areaInteresse" class="dado_maior" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Endere&ccedil;o residencial:
			</td>
			<td>
				<input type="text" name="endereco" id="endereco" class="dado_maior" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>CEP:
			</td>
			<td>
				<input type="text" name="cep" id="cep" class="cep" style="width:110px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Estado:
			</td>
			<td>
				<input type="text" name="estado" id="estado" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Cidade:
			</td>
			<td>
				<input type="text" name="cidade" id="cidade" class="dado_maior" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Telefone residencial:
			</td>
			<td>
				<input type="text" name="telefone" id="telefone" class="telefone" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Celular:
			</td>
			<td>
				<input type="text" name="celular" id="celular" class="telefone" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>E-mail:
			</td>
			<td>
				<input type="text" name="email" id="email" class="email" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				Gostaria de receber:
			</td>
			<td>
				<input type="checkbox" name="opcaoResposta" id="ArtigosMedicos" value="Artigos M&eacute;dicos" /> Artigos M&eacute;dicos&nbsp;&nbsp;<br />
				<input type="checkbox" name="opcaoResposta" id="newsletter" value="Newsletter"  /> Newsletter &nbsp;&nbsp;<br />
				<input type="checkbox" name="opcaoResposta" id="InformacoesUteis" value="Informa&ccedil;&otilde;es &Uacute;teis"  /> Informa&ccedil;&otilde;es &Uacute;teis&nbsp;&nbsp;<br />
				<input type="checkbox" name="opcaoResposta" id="CasoClinico" value="Caso cl&iacute;nico do m&ecirc;s"  /> Caso cl&iacute;nico do m&ecirc;s&nbsp;&nbsp;<br />

<!--				<select name="opcaoResposta" id="opcaoResposta">
					<option value="ArtigosMedicos">Artigos M&eacute;dicos&nbsp;&nbsp;</option>
					<option value="newsletter">Newsletter&nbsp;&nbsp;</option>
					<option value="InformacoesUteis">Informa&ccedil;&otilde;es &Uacute;teis&nbsp;&nbsp;</option>
					<option value="CasoClinico">Caso cl&iacute;nico do m&ecirc;s&nbsp;&nbsp;</option>
				</select>
-->			</td>
		</tr>
		<tr>
			<td class="dado">
				Foto:
			</td>
			<td>
				<input type="file" name="foto" id="foto" />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; color:#FF0000" class="dado">
				<b>OBS.:</b> Endere&ccedil;o residencial, telefone, email, celular n&atilde;o ser&atilde;o divulgados no site sendo apenas para uso interno do servi&ccedil;o!
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				<input type="submit" value="Cadastrar" name="Cadastrar" id="Cadastrar" />
			</td>
		</tr>
	</table>
</form>


</body>
</html>