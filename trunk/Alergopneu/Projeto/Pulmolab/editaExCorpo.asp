<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="conexao.asp"-->
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


// mascara para campos especificos
	$('.data').mask("99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999 ");

//esconde campos

/*	$('.Esconde1').hide();
	$('.Esconde2').hide();
	$('.Esconde3').hide();
	$('.Esconde4').hide();
	$('.Esconde5').hide();
	$('.Esconde6').hide();
	$('.Esconde7').hide();
*/	
	
	$('#atividade').click(function(){
		if( $(this).val() != '' )
		{
			$('.Esconde1').fadeIn();
		}
		else
		{
			$('.Esconde1').fadeOut();
		}
	
	});
	
	$('#residencia').click(function(){
		if( $(this).val() != '' )
		{
			$('.Esconde2').fadeIn();
		}
		else
		{
			$('.Esconde2').fadeOut();
		}
	
	});
	
	$('#posGraduacao').click(function(){
		if( $(this).val() != '' )
		{
			$('.Esconde3').fadeIn();
		}
		else
		{
			$('.Esconde3').fadeOut();
		}
	
	});
	
	$('#mestrado').click(function(){
		if( $(this).val() != '' )
		{
			$('.Esconde4').fadeIn();
		}
		else
		{
			$('.Esconde4').fadeOut();
		}
	
	});
	
	$('#doutorado').click(function(){
		if( $(this).val() != '' )
		{
			$('.Esconde5').fadeIn();
		}
		else
		{
			$('.Esconde5').fadeOut();
		}
	
	});
	
	$('#tituloEspecialista').click(function(){
		if( $(this).val() != '' )
		{
			$('.Esconde6').fadeIn();
		}
		else
		{
			$('.Esconde6').fadeOut();
		}
	
	});

	$('#enderecoConsultorio').click(function(){
		if( $(this).val() != '' )
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

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<%

	id = Request.QueryString("id")
	SQL = "SELECT * FROM ex_corpoclinico WHERE id = "& id
'	RESPONSE.Write(SQL)
	set rs = server.CreateObject("ADODB.RecordSet")

	rs.Open SQL, ObjDB,3,1
	
	if rs.eof = false then
		
%>


<form method="post" name="form_CorpoClinico" id="form_CorpoClinico" action="editaExCorpo_ok.asp">
	<table class="tableCadastraCorpo" style="padding-left:70px;">
		<tr>
			<td id="titulo" colspan="2">
				Cadastro de Corpo Cl&iacute;nico - M&Eacute;DICOS
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Nome:
			</td>
			<td class="dado_maior">
				<input type="text" name="nome" id="nome" class="dado_maior" value="<%=rs("nome")%>" />
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
				<input type="text" name="atividade" id="atividade" class="dado_maior" value="<%=rs("atividade")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Universidade:
			</td>
			<td>
				<input type="text" name="universidade" id="universidade" class="dado_maior" value="<%=rs("universidade")%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Ano de Formatura:
			</td>
			<td>
				<input type="text" name="formaturaGraduacao" id="formaturaGraduacao" class="ano" style="width:100px;" value="<%=rs("formaturaGraduacao")%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Resid&ecirc;ncia pediatria:
			</td>
			<td>
				<input type="text" name="residenciaPediatria" id="residenciaPediatria" class="dado_maior" value="<%=rs("residenciaPediatria")%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioPediatria" id="inicioPediatria" class="data" style="width:100px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimPediatria" id="fimPediatria" class="data" style="width:100px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				Outra Resid&ecirc;ncia:
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
				<input type="text" name="residencia" id="residencia" class="dado_maior" value="<%=rs("outraResidencia")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Local resid&ecirc;ncia:
			</td>
			<td>
				<input type="text" name="localResidencia" id="localResidencia" class="dado_maior" value="<%=rs("localOutra")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioOutra" id="inicioOutra" class="data" style="width:100px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimOutra" id="fimOutra" class="data" style="width:100px;" />
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
				<input type="text" name="posGraduacao" id="posGraduacao" class="dado_maior" value="<%=rs("posGraduacao")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3" >
			<td class="dado">
				Local:
			</td>
			<td>
				<input type="text" name="LocalposGraduacao" id="LocalposGraduacao" class="dado_maior" value="<%=rs("localPOS")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3">
			<td class="dado">
				Formatura (mm/ano):
			</td>
			<td>
				<input type="text" name="formaturaPOS" id="formaturaPOS" class="data" style="width:100px;" />
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
				<input type="text" name="mestrado" id="mestrado" class="dado_maior" value="<%=rs("mestrado")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde4">	
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="formaturaMestrado" id="formaturaMestrado" class="ano" style="width:100px;" />
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
				<input type="text" name="doutorado" id="doutorado" class="dado_maior" value="<%=rs("doutorado")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde5">
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="formaturaDoutorado" id="formaturaDoutorado" class="ano" style="width:100px;" />
			</td>	
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>T&iacute;tulos de Especialista:
			</td>
			<td>
				<select name="tituloEspecialista" id="tituloEspecialista">
					<option value="Pediatria">Pediatria&nbsp;&nbsp;</option>
					<option value="Alergia">Alergia&nbsp;&nbsp;</option>
					<option value="AlergiaPediatrica">Alergia pedi&aacute;trica&nbsp;&nbsp;</option>
					<option value="PneumologiaPediatrica">Pneumologia Pedi&aacute;trica&nbsp;&nbsp;</option>
					<option value="Pneumologia">Pneumologia&nbsp;&nbsp;</option>
					<option value="Outro">Outro&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="Esconde6">
			<td class="dado">
				T&iacute;tulo:
			</td>
			<td>
				<input type="text" name="outroTituloEspecialista" id="outroTituloEspecialista" class="dado_maior" value="<%=rs("tituloEspecialista")%>" />
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
				Local:
			</td>
			<td>
				<input type="text" name="enderecoConsultorio" id="enderecoConsultorio" class="dado_maior" value="<%=rs("enderecoConsultorio")%>"/>
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Telefone:
			</td>
			<td>
				<input type="text" name="telConsultorio" id="telConsultorio" class="telefone" style="width:100px;" value="<%=rs("telConsultorio")%>" />
			</td>	
		</tr>

		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Area de Interesse:
			</td>
			<td>
				<input type="text" name="areaInteresse" id="areaInteresse" class="dado_maior" value="<%=rs("areaInteresse")%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Endere&ccedil;o:
			</td>
			<td>
				<input type="text" name="endereco" id="endereco" class="dado_maior" value="<%=rs("endereco")%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Telefone:
			</td>
			<td>
				<input type="text" name="telefone" id="telefone" class="telefone" style="width:100px;" value="<%=rs("telefone")%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Celular:
			</td>
			<td>
				<input type="text" name="celular" id="celular" class="telefone" style="width:100px;" value="<%=rs("celular")%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>E-mail:
			</td>
			<td>
				<input type="text" name="email" id="email" class="email" style="width:100px;" value="<%=rs("email")%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				Gostaria de receber:
			</td>
			<td>
				<%
				if rs("opcaoResposta") = "Artigos Médicos" then
					ArtigosMedicos = "selected"
				elseif rs("opcaoResposta") = "Newsletter" then
					Newsletter = "selected"
				elseif rs("opcaoResposta") = "Informações Úteis" then
					InformacoesUteis = "selected"
				elseif rs("opcaoResposta") = "Caso clínico" then
					CasoClinico = "selected"
				end if
				%>
				<select name="opcaoResposta" id="opcaoResposta">
					<option value="ArtigosMedicos" <%=ArtigosMedicos%> >Artigos M&eacute;dicos&nbsp;&nbsp;</option>
					<option value="newsletter" <%=Newsletter%> >Newsletter&nbsp;&nbsp;</option>
					<option value="InformacoesUteis" <%=InformacoesUteis%> >Informa&ccedil;&otilde;es &Uacute;teis&nbsp;&nbsp;</option>
					<option value="CasoClinico" <%=CasoClinico%> >Caso cl&iacute;nico do m&ecirc;s&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="dado"></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				<input type="hidden" name="id" id="id" value="<%=id%>" />
				<input type="submit" value="Salvar" name="Cadastrar" id="Cadastrar" />
			</td>
		</tr>
	</table>
</form>
<%

end if

%>

</body>
</html>
<!--#include file="conexaoOFF.asp" -->
