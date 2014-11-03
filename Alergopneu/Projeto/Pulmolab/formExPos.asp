<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<%

	botao = "Cadastrar"
	id = Request.QueryString("id")
	IF id <> "" THEN

		botao = "Salvar"
		
		SQL = "SELECT c.*, cat.nome as nomeCategoria FROM corpoclinico c"
		SQL = SQL & " INNER JOIN categoria cat ON cat.id = c.categoria"
		SQL = SQL & " WHERE c.id = "& id 
		Set rs = Server.CreateObject("ADODB.RecordSet")
	'	Response.Write(SQL)
		rs.Open SQL, ObjDB, 3, 1
		IF rs.eof = false THEN
		
			categoria = rs("nomeCategoria")
			foto = rs("foto")
			nome = rs("nome")
			email = rs("email")
			endereco = rs("endereco")
			cidade = rs("cidade")
			estado = rs("estado")
			cep = rs("cep")
			telefone = rs("telefone")
			celular = rs("celular")
			opcaoResposta = Lcase(rs("opcaoResposta"))
			atividade = rs("atividade")
			universidade = rs("universidade")
			anoFormatura = rs("formaturaGraduacao")
			residenciaPediatria = rs("residenciaPediatria")
			inicioPediatria = rs("inicioPediatria")
			fimPediatria = rs("fimPediatria")
			outraResidencia = rs("outraResidencia")
			inicioTreinamento = rs("inicioTreinamento")
			fimTreinamento = rs("fimTreinamento")
			localOutra = rs("localOutra")
			inicioOutra = rs("inicioOutra")
			fimOutra = rs("fimOutra")
			posGraduacao = rs("posGraduacao")
			localPOS = rs("localPOS")
			mestrado = rs("mestrado")
			formaturaMestrado = rs("formaturaMestrado")
			doutorado = rs("doutorado")
			titulo1 = rs("titulo1")
			titulo2 = rs("titulo2")
			titulo3 = rs("titulo3")
			titulo4 = rs("titulo4")
			titulo5 = rs("titulo5")
			titulo6 = rs("titulo6")
			anoTitulo1 = rs("anoTitulo1")
			anoTitulo2 = rs("anoTitulo2")
			anoTitulo3 = rs("anoTitulo3")
			anoTitulo4 = rs("anoTitulo4")
			anoTitulo5 = rs("anoTitulo5")
			anoTitulo = rs("anoTitulo")
			outroTitulo = rs("outroTitulo")
			enderecoConsultorio = rs("enderecoConsultorio")
			complementoConsultorio = rs("complementoConsultorio")
			numConsultorio = rs("numConsultorio")
			cidadeConsultorio = rs("cidadeConsultorio")
			ufConsultorio = rs("ufConsultorio")
			cepConsultorio = rs("cepConsultorio")
			bairroConsultorio = rs("bairroConsultorio")
			telConsultorio = rs("telConsultorio")
			areaInteresse = rs("areaInteresse")
						
			IF foto = "" THEN
				foto = "breve.png"
			END IF

			
		END IF
			
	END IF

%>
<form method="post" name="form_CorpoClinico" id="form_CorpoClinico" action="cadastroExPos_ok.asp" enctype="multipart/form-data">
	<table class="tableCadastraCorpo">
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Nome:
			</td>
			<td class="dado_maior">
				<input type="text" name="nome" id="nome" class="dado_maior" value="<%=nome%>" />
			</td>
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
		</tr>
		<tr class="Esconde1">
			<td class="dado">
				Atividade:
			</td>
			<td>
				<input type="text" name="atividade" id="atividade" class="dado_maior" value="<%=atividade%>"/>
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Universidade/Curso:
			</td>
			<td>
				<input type="text" name="universidade" id="universidade" class="dado_maior" value="<%=universidade%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Ano de Formatura:
			</td>
			<td>
				<input type="text" name="formaturaGraduacao" id="formaturaGraduacao" class="ano" value="<%=anoFormatura%>" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Resid&ecirc;ncia pediatria:
			</td>
			<td>
				<input type="text" name="residenciaPediatria" id="residenciaPediatria" class="dado_maior" value="<%=residenciaPediatria%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioPediatria" id="inicioPediatria" class="data" value="<%=inicioPediatria%>" style="width:60px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimPediatria" id="fimPediatria" class="data" value="<%=fimPediatria%>" style="width:60px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				 <i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Per&iacute;odo P&oacute;s gradua&ccedil;&atilde;o:
			</td>
			<td>
				<input type="text" name="inicioTreinamento" id="inicioTreinamento" class="data" value="<%=inicioTreinamento%>" style="width:60px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimTreinamento" id="fimTreinamento" class="data" value="<%=fimTreinamento%>" style="width:60px;" />
			</td>
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
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Especialidade
			</td>
			<td>
				<input type="text" name="residencia" id="residencia" value="<%=outraResidencia%>" class="dado_maior"/>
			</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Local resid&ecirc;ncia:
			</td>
			<td>
				<input type="text" name="localResidencia" id="localResidencia" class="dado_maior" value="<%=localOutra%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioOutra" id="inicioOutra" class="data" value="<%=inicioOutra%>" style="width:110px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimOutra" id="fimOutra" class="data" value="<%=fimOutra%>" style="width:110px;" />
			</td>
		</tr>
<!--
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
				<input type="text" name="posGraduacao" id="posGraduacao" class="dado_maior" value="<%'=posGraduacao%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3" >
			<td class="dado">
				Local:
			</td>
			<td>
				<input type="text" name="LocalposGraduacao" id="LocalposGraduacao" class="dado_maior" value="<%'=localPOS%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr class="Esconde3">
			<td class="dado">
				Formatura (mm/ano):
			</td>
			<td>
				<input type="text" name="formaturaPOS" id="formaturaPOS" class="data" value="<%'=formaturaPOS%>" style="width:110px;" />
			</td>	
			<td class="dado_maior">&nbsp;</td>
		</tr>
-->
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
		</tr>
		<tr class="Esconde4">
			<td class="dado">
				Mestrado:
			</td>
			<td>
				<input type="text" name="mestrado" id="mestrado" class="dado_maior" value="<%=mestrado%>"/>
			</td>
		</tr>
		<tr class="Esconde4">	
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="formaturaMestrado" id="formaturaMestrado" class="ano" value="<%=formaturaMestrado%>" style="width:110px;" />
			</td>	
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
				<input type="text" name="doutorado" id="doutorado" class="dado_maior" value="<%=doutorado%>"/>
			</td>
		</tr>
		<tr class="Esconde5">
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="formaturaDoutorado" id="formaturaDoutorado" class="ano" value="<%=formaturaDoutorado%>" style="width:110px;" />
			</td>	
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Possui titulo de especialista:
			</td>
			<td>
				<select name="possuiTitulo" id="possuiTitulo">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="trTitulos">
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>T&iacute;tulos de Especialista:
			</td>
			<td colspan="2">
				<%
					if Lcase(titulo1) = "pediatria" then
						titulo1 = "checked"
					end if
					if Lcase(titulo2) = "alergia" then
						titulo2 = "checked"
					end if
					if Lcase(titulo3) = "pneumologia pediátrica" then
						titulo3 = "checked"
					end if
					if Lcase(titulo4) = "alergia pediátrica" then
						titulo4 = "checked"
					end if
					if Lcase(titulo5) = "pneumologia" then
						titulo5 = "checked"
					end if
					if outroTitulo <> "" then
						titulo6 = "checked"
					end if
				%>
				<input type="checkbox" <%=titulo1%>  name="titulo1" id="titulo1" value="Pediatria" class="titulosEspecialista" /> Pediatria&nbsp;&nbsp 
					<span class="anoTituloEsconde" id="anoTitulo1">Ano: <input type="text" name="anoTitulo1" class="ano anoTitulos" value="<%=anoTitulo1%>" /></span><br />

				<input type="checkbox" <%=titulo2%>  name="titulo2" id="titulo2" value="Alergia" class="titulosEspecialista" />  Alergia&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo2">Ano: <input type="text" name="anoTitulo2" class="ano anoTitulos" value="<%=anoTitulo2%>" /></span><br />

				<input type="checkbox" <%=titulo3%>  name="titulo3" id="titulo3" value="Pneumologia Pedi&aacute;trica" class="titulosEspecialista" /> Pneumologia Pedi&aacute;trica&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo3">Ano: <input type="text" name="anoTitulo3" class="ano anoTitulos" value="<%=anoTitulo3%>" /></span><br />

				<input type="checkbox" <%=titulo4%>  name="titulo4" id="titulo4" value="Alergia pedi&aacute;trica" class="titulosEspecialista" /> Alergia pedi&aacute;trica&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo4">Ano: <input type="text" name="anoTitulo4" class="ano anoTitulos" value="<%=anoTitulo4%>" /></span><br />

				<input type="checkbox" <%=titulo5%>  name="titulo5" id="titulo5" value="Pneumologia" class="titulosEspecialista" /> Pneumologia&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo5">Ano: <input type="text" name="anoTitulo5" class="ano anoTitulos" value="<%=anoTitulo5%>" /></span><br />

				<input type="checkbox" <%=titulo6%>  name="titulo6" id="Outro" value="Outro" /> Outro

			</td>
		</tr>
		<tr class="Esconde6">
			<td class="dado">
				T&iacute;tulo:
			</td>
			<td>
				<input type="text" name="outroTituloEspecialista" id="outroTituloEspecialista" class="dado_maior" value="<%=outroTitulo%>" />
			</td>
		</tr>
		<tr class="Esconde6">
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="anoTitulo" id="anoTitulo" class="ano" value="<%=anoTitulo%>" />
			</td>
		</tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Area de Interesse:
			</td>
			<td>
				<input type="text" name="areaInteresse" id="areaInteresse" class="dado_maior" value="<%=areaInteresse%>" />
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
				Rua/Av.:
			</td>
			<td>
				<input type="text" name="enderecoConsultorio" id="enderecoConsultorio" class="dado_maior" value="<%=enderecoConsultorio%>"/>
			</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				N&uacute;mero:
			</td>
			<td>
				<input type="text" name="numConsultorio" id="numConsultorio" value="<%=numConsultorio%>" style="width:50px" />
				<span class="dado">Complemento</span>
				<input type="text" name="complementoConsultorio" id="complementoConsultorio" value="<%=complementoConsultorio%>" style="width:110px;" />
			</td>
			
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Bairro:
			</td>
			<td>
				<input type="text" name="bairroConsultorio" id="bairroConsultorio" value="<%=bairroConsultorio%>" style="width:110px;" />
			</td>
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Cidade:
			</td>
			<td>
				<input type="text" name="cidadeConsultorio" id="cidadeConsultorio" class="dado_maior" value="<%=cidadeConsultorio%>" />
			</td>
			
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Estado:
			</td>
			<td>
				<input type="text" name="ufConsultorio" id="ufConsultorio" class="dado_maior" value="<%=ufConsultorio%>" />
			</td>
			
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				CEP:
			</td>
			<td>
				<input type="text" name="cepConsultorio" id="cepConsultorio" class="cep" value="<%=cepConsultorio%>" style="width:110px;" />
			</td>
			
		</tr>
		<tr class="Esconde7">
			<td class="dado">
				Telefone:
			</td>
			<td>
				<input type="text" name="telConsultorio" id="telConsultorio" class="telefone" value="<%=telConsultorio%>" style="width:110px;" />
			</td>	
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Endere&ccedil;o residencial:
			</td>
			<td>
				<input type="text" name="endereco" id="endereco" class="dado_maior" value="<%=endereco%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Cidade:
			</td>
			<td>
				<input type="text" name="cidade" id="cidade" class="dado_maior" value="<%=cidade%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Estado:
			</td>
			<td>
				<input type="text" name="estado" id="estado" class="dado_maior" value="<%=estado%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>CEP:
			</td>
			<td>
				<input type="text" name="cep" id="cep" class="cep" value="<%=cep%>" style="width:110px;" />
			</td>
		</tr>
<!--
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Telefone residencial:
			</td>
			<td>
				<input type="text" name="telefone" id="telefone" class="telefone" value="<%'=telefone%>" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Celular:
			</td>
			<td>
				<input type="text" name="celular" id="celular" class="telefone" value="<%'=celular%>" style="width:110px;" />
			</td>
		</tr>
-->
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>E-mail:
			</td>
			<td>
				<input type="text" name="email" id="email" class="email" value="<%=email%>" style="width:250px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Foto:
			</td>
			<td>
				<input type="file" name="imagem" id="imagem" class="dado_maior" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				Gostaria de receber:
			</td>
			<td>
				<%
					IF opcaoResposta <> "" THEN
						vetResposta = Split(opcaoResposta, ",")
						for i = 0 to Ubound(vetResposta)
							'Response.Write(vetResposta(i) & "?" & i & "<br />")
								if TRIM(vetResposta(i)) = "artigos médicos" then
									ArtigosMedicos = "checked"
								end if
								if TRIM(vetResposta(i)) = "newsletter" then
									Newsletter = "checked"
								end if
								if TRIM(vetResposta(i)) = "informações úteis" then
									InformacoesUteis = "checked"
								end if
								if TRIM(vetResposta(i)) = "caso clínico do mês" then
									CasoClinico = "checked"
								end if
							next
					END IF
					'Response.Write(opcaoResposta & "<br /><br />")
					'Response.Write(ArtigosMedicos & "||" & Newsletter & "||" & InformacoesUteis & "||" & CasoClinico)
				%>
				<input type="checkbox" <%=ArtigosMedicos%> name="opcaoResposta" id="ArtigosMedicos" value="Artigos M&eacute;dicos" /> Artigos M&eacute;dicos&nbsp;&nbsp;<br />
				<!--<input type="checkbox" <%=Newsletter%> name="opcaoResposta" id="newsletter" value="Newsletter"  /> Newsletter &nbsp;&nbsp;<br />-->
				<input type="checkbox" <%=InformacoesUteis%> name="opcaoResposta" id="InformacoesUteis" value="Informa&ccedil;&otilde;es &Uacute;teis"  /> Informa&ccedil;&otilde;es &Uacute;teis&nbsp;&nbsp;<br />
				<input type="checkbox" <%=CasoClinico%> name="opcaoResposta" id="CasoClinico" value="Caso cl&iacute;nico do m&ecirc;s"  /> Caso cl&iacute;nico do m&ecirc;s&nbsp;&nbsp;<br />
			</td>
		</tr>
		<tr>
			<td colspan="2" id="observacao_cadastro_exemplo">
				<b>OBS.:</b> Endere&ccedil;o residencial, telefone, email, celular n&atilde;o ser&atilde;o divulgados no site sendo apenas para uso interno do servi&ccedil;o!<br />
				* Campos Obrigat&oacute;rios
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
				<% Session("idRegistro") = id%>
				<input type="hidden" value="<%=id%>" name="idRegistro" id="idRegistro" />
				<input type="submit" value="<%=botao%>" name="Cadastrar" id="<%=botao%>" />
				<input type="hidden" value="<%=volta%>" name="volta" id="volta" />
				<input type="hidden" value="<%=botao%>" name="tipoCadastro" id="tipoCadastro" />
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
$(document).ready(function(){	

	$('#Cadastrar').click(function(){
		<%
		campo_ob = "nome,outraAtividade,universidade,formaturaGraduacao,residenciaPediatria,inicioPediatria,fimPediatria,FezPosGraduacao,FezDoutorado,tituloEspecialista,possuiConsultorio,areaInteresse,email,imagem"
		campos_ob = SPLIT(campo_ob,",")
		for i = 0 to Ubound(campos_ob)
		%>
			if( $('#<%=campos_ob(i)%>').val() == '' ){
				alert('O campo <%=Ucase( Replace( campos_ob(i) ,"_", " ") )%> é obrigatório');
				return false;
			}
		<%
		next
		%>
		if( $('#outraAtividade').val() == 'Sim' )
		{
			if( $('#atividade').val() == '' )
			{
				alert('Preencha corretamente o campo de outra atividade');
				return false;
				$('#atividade').focus();
			}
		}
		if( $('#outraResidencia').val() == 'Sim' )
		{
			if( $('#residencia').val() == '' )
			{
				alert('Preencha corretamente o campo de especialidade');
				return false;
			}
			if( $('#localResidencia').val() == '' )
			{
				alert('Preencha corretamente o local da especialidade!')
				return false;
			}
			if( ($('#inicioOutra').val() == '') || ($('#fimOutra').val() == '') )
			{
				alert('Preencha corretamente o periodo da especialidade!')
				return false;
			}
		}
		if( $('#FezPosGraduacao').val() == 'Sim' )
		{
			if( $('#posGraduacao').val() == '' )
			{
				alert('Preencha corretamente o campo de pós-graduação');
				return false;
			}
			if( $('#LocalposGraduacao').val() == '' )
			{
				alert('Preencha corretamente o local da pós!')
				return false;
			}
			if( $('#formaturaPOS').val() == '' )
			{
				alert('Preencha corretamente o ano de conclusão da pós!')
				return false;
			}
		}
		if( $('#FezMestrado').val() == 'Sim' )
		{
			if( $('#mestrado').val() == '' )
			{
				alert('Preencha corretamente o campo de mestrado');
				return false;
			}
			if( $('#formaturaMestrado').val() == '' )
			{
				alert('Preencha corretamente a formatura do mestrado!')
				return false;
			}
		}
		if( $('#FezDoutorado').val() == 'Sim' )
		{
			if( $('#doutorado').val() == '' )
			{
				alert('Preencha corretamente o campo de doutorado');
				return false;
			}
			if( $('#formaturaDoutorado').val() == '' )
			{
				alert('Preencha corretamente a formatura do doutorado!')
				return false;
			}
		}
	});

// mascara para campos especificos
	//$('.data').mask("99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999");
	$('.cep').mask("99999-999");

//esconde campos
if( $('#atividade').val() == '')
{
	$('#outraAtividade').val('Não');
	$('.Esconde1').hide();
}
else
{
	$('#outraAtividade').val('Sim');
}
if( $('#residencia').val() == '')
{
	$('#outraResidencia').val('Não');
	$('.Esconde2').hide();
}
else
{
	$('#outraResidencia').val('Sim');
}
if( $('#mestrado').val() == '')
{
	$('#FezMestrado').val('Não')
	$('.Esconde4').hide();
}
else
{
	$('#FezMestrado').val('Sim');
}
if( $('#doutorado').val() == '')
{
	$('#FezDoutorado').val('Não')
	$('.Esconde5').hide();
}
else
{
	$('#FezDoutorado').val('Sim');
}
if( $('#outroTituloEspecialista').val == '' )
{
	$('.Esconde6').hide();
}
if( $('#enderecoConsultorio').val() == '' )
{
	$('#possuiConsultorio').val('Não');
	$('.Esconde7').hide();
}
else
{
	$('#possuiConsultorio').val('Sim');
}
//	$('.anoTituloEsconde').hide();
	
// ano titulo
	if( ($('#tipoCadastro').val() == 'Salvar') && ($('#titulo1:checked').val()!= null) )
	{
		$('#anoTitulo1').show();
	}
	else
	{
		$('#anoTitulo1').hide();
	}

	$('#titulo1').click(function(){
		$('#anoTitulo1').toggle();
	});

	if( ($('#tipoCadastro').val() == 'Salvar') && ($('#titulo2:checked').val()!= null) )
	{
		$('#anoTitulo2').show();
	}
	else
	{
		$('#anoTitulo2').hide();
	}
	$('#titulo2').click(function(){
		$('#anoTitulo2').toggle();
	});


	if( ($('#tipoCadastro').val() == 'Salvar') && ($('#titulo3:checked').val()!= null) )
	{
		$('#anoTitulo3').show();
	}
	else
	{
		$('#anoTitulo3').hide();
	}
	$('#titulo3').click(function(){
		$('#anoTitulo3').toggle();
	});


	if( ($('#tipoCadastro').val() == 'Salvar') && ($('#titulo4:checked').val()!= null) )
	{
		$('#anoTitulo4').show();
	}
	else
	{
		$('#anoTitulo4').hide();
	}
	$('#titulo4').click(function(){
		$('#anoTitulo4').toggle();
	});

	if( ($('#tipoCadastro').val() == 'Salvar') && ($('#titulo5:checked').val()!= null) )
	{
		$('#anoTitulo5').show();
	}
	else
	{
		$('#anoTitulo5').hide();
	}
	$('#titulo5').click(function(){
		$('#anoTitulo5').toggle();
	});
	
	
	if( $('.titulosEspecialista:checked').val() == null )
	{
		$('.trTitulos').hide();
		$('#possuiTitulo').val('Não');
	}
	else
	{
		$('.trTitulos').show();
		$('#possuiTitulo').val('Sim');
	}
	
	$('#possuiTitulo').change(function(){
		if( $('#possuiTitulo').val() == 'Sim')
		{
			$('.trTitulos').fadeIn();
		}
		else
		{
			$('.trTitulos').fadeOut();
		}
	});



	$('#outraAtividade').change(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde1').fadeIn();
		}
		else
		{
			$('.Esconde1').fadeOut();
		}
	
	});
	
	$('#outraResidencia').change(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde2').fadeIn();
		}
		else
		{
			$('.Esconde2').fadeOut();
		}
	
	});
	
	$('#FezPosGraduacao').change(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde3').fadeIn();
		}
		else
		{
			$('.Esconde3').fadeOut();
		}
	
	});
	
	$('#FezMestrado').change(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde4').fadeIn();
		}
		else
		{
			$('.Esconde4').fadeOut();
		}
	
	});
	
	$('#FezDoutorado').change(function(){
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

	$('#possuiConsultorio').change(function(){
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