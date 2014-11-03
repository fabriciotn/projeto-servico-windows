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
			cep = rs("cep")
			endereco = rs("endereco")
			cidade = rs("cidade")
			estado = rs("estado")
			telefone = rs("telefone")
			celular = rs("celular")
			opcaoResposta = Lcase(rs("opcaoResposta"))
			atividade = rs("atividade")
			universidade = rs("universidade")
			formaturaGraduacao = rs("formaturaGraduacao")
			residenciaPediatria = rs("residenciaPediatria")
			inicioPediatria = rs("inicioPediatria")
			fimPediatria = rs("fimPediatria")
			outraResidencia = rs("outraResidencia")
			localOutra = rs("localOutra")
			inicioOutra = rs("inicioOutra")
			fimOutra = rs("fimOutra")
			posGraduacao = rs("posGraduacao")
			localPOS = rs("localPOS")
			mestrado = rs("mestrado")
			formaturaMestrado = rs("formaturaMestrado")
			doutorado = rs("doutorado")
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


<form method="post" name="form_CorpoClinico" id="form_CorpoClinico" action="posGraduandos_ok.asp" enctype="multipart/form-data">
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
				<input type="text" name="formaturaGraduacao" id="formaturaGraduacao" class="ano" value="<%=formaturaGraduacao%>" style="width:100px;" />
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
				Per&iacute;odo (mm/ano):
			</td>
			<td>
				<input type="text" name="inicioPediatria" id="inicioPediatria" class="data" value="<%=inicioPediatria%>" style="width:100px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimPediatria" id="fimPediatria" class="data" value="<%=fimPediatria%>" style="width:100px;" />
			</td>
		</tr>
			<td class="dado">
				 <i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>P&oacute;s gradua&ccedil;&atilde;o<br />Alergia/Pneumologia:
			</td>
			<td>
				<input type="text" name="inicioTreinamento" id="inicioTreinamento" class="data" value="<%=inicioTreinamento%>" style="width:60px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimTreinamento" id="fimTreinamento" class="data" value="<%=fimTreinamento%>" style="width:60px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				Outra Resid&ecirc;ncia:
			</td>
			<td>
				<select name="residencia" id="residencia">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="Esconde1">
			<td class="dado">Resid&ecirc;ncia:
			</td>
			<td>
				<input type="text" name="outraResidencia" class="dado_maior" value="<%=outraResidencia%>"/>
			</td>
		</tr>
		<tr class="Esconde1">
			<td class="dado">
				Per&iacute;odo (mm/ano):
			</td>
			<td colspan="2">
				<input type="text" name="inicioOutra" id="inicioOutra" class="data" value="<%=inicioOutra%>" style="width:100px;" />
					&nbsp;&agrave;&nbsp;
				<input type="text" name="fimOutra" id="fimOutra" class="data" value="<%=fimOutra%>" style="width:100px;" />
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
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Telefone residencial:
			</td>
			<td>
				<input type="text" name="telefone" id="telefone" class="telefone" value="<%=telefone%>" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Celular:
			</td>
			<td>
				<input type="text" name="celular" id="celular" class="telefone" value="<%=celular%>" style="width:110px;" />
			</td>
		</tr>
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
								if TRIM(vetResposta(i)) = "artigos médicos" then
									ArtigosMedicos = "checked"
								elseif TRIM(vetResposta(i)) = "newsletter" then
									Newsletter = "checked"
								elseif TRIM(vetResposta(i)) = "informações úteis" then
									InformacoesUteis = "checked"
								elseif TRIM(vetResposta(i)) = "caso clínico do mês" then
									CasoClinico = "checked"
								end if
						next
					END IF
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
		campo_ob = "nome,anoFormatura,universidade,residenciaPediatria,endereco,telefone,email"
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
	});

// mascara para campos especificos
	$('.data').mask("99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999 ");
	$('.cep').mask("99999-999");

//esconde campos

	$('.Esconde1').hide();
	
	
	$('#residencia').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde1').fadeIn();
		}
		else
		{
			$('.Esconde1').fadeOut();
		}
	
	});
	
});
</script>
