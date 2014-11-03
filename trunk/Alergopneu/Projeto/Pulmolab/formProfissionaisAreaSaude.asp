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
			telefone = rs("telefone")
			celular = rs("celular")
			opcaoResposta = Lcase(rs("opcaoResposta"))
			profissao = Lcase(rs("profissao"))
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

			IF profissao = "fisioterapia" THEN
				fisio = "selected"
			ELSEIF profissao = "nutricionista" THEN
				nutri = "selected"
			ELSEIF profissao = "psic&oacute;loco (a) 2" THEN
				psico = "selected"
			ELSEIF profissao = "bioqu&iacute;mica" THEN
				bioqui = "selected"
			ELSEIF profissao = "enfermagem" THEN
				enfer = "selected"
			ELSEIF profissao = "auxiliar de enfermagem" THEN
				auxiliar = "selected"
			ELSEIF profissao = "secret&aacute;ria" THEN
				secre = "selected"
			ELSEIF profissao = "m&eacute;dico" THEN
				medic = "selected"
			ELSEIF profissao = "estudante" THEN
				estud = "selected"
			ELSEIF profissao <> "" THEN 
				outro = "selected"
			END IF
			
		END IF
			
	END IF
%>  

<form method="post" name="form_CorpoOutro" id="form_CorpoOutro" action="cadastroOutros_ok.asp">
  <table class="table_cadastro_exemplo">
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Nome: </td>
      <td class="dado_maior"><input type="text" name="nome" id="nome" class="dado_maior" value="<%=Ucase(nome)%>" />      </td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Profiss&atilde;o: </td>
      <td><select name="profissao" id="profissao">
          <option <%=auxiliar%> value="AuxiliarEnfermagem">Auxiliar de Enfermagem&nbsp;&nbsp;</option>
          <option <%=bioqui%> value="Bioquimico">Bioqu&iacute;mico&nbsp;&nbsp;</option>
          <option <%=enfer%> value="Enfermeira">Enfermeira&nbsp;&nbsp;</option>
          <option <%=estud%> value="Estudante">Estudante&nbsp;&nbsp;</option>
          <option <%=fisio%> value="Fisioterapeuta">Fisioterapeuta&nbsp;&nbsp;</option>
          <option <%=medic%> value="M&eacute;dico">M&eacute;dico&nbsp;&nbsp;</option>
          <option <%=nutri%> value="Nutricionista">Nutricionista&nbsp;&nbsp;</option>
          <option <%=outro%> value="Outro">Outro&nbsp;&nbsp;</option>
          <option <%=psico%> value="Psicologo">Psic&oacute;logo (a)&nbsp;&nbsp;</option>
          <option <%=secre%> value="Secret&aacute;ria">Secret&aacute;ria&nbsp;&nbsp;</option>
        </select>      </td>
    </tr>
    <tr class="Esconde1">
      <td class="dado">Outra profiss&atilde;o:&nbsp;</td>
      <td class="dado_maior"><input type="text" name="outraProfissao" id="outraProfissao"  class="dado_maior" value="<%=profissao%>" />      </td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Outras atividades: </td>
      <td>
	  	<select name="atividades" id="atividades">
          <option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
          <option value="Sim">Sim&nbsp;&nbsp;</option>
        </select>      
	  </td>
    </tr>
    <tr class="Esconde2">
      <td class="dado">Otro&nbsp;</td>
      <td class="dado_maior"><input type="text" name="outraAtividade" class="dado_maior" <%=atividade%>/>      </td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Universidade/Curso: </td>
      <td><input type="text" name="universidade" id="universidade" class="dado_maior" value="<%=universidade%>" />      </td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Ano de Formatura: </td>
      <td><input type="text" name="formaturaGraduacao" id="formaturaGraduacao" class="ano" value="<%=formaturaGraduacao%>" style="width:100px;" />      </td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Especializa&ccedil;&atilde;o: </td>
      <td>
	   	<select name="possuiEspecializacao" id="possuiEspecializacao">
          <option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
          <option value="Sim">Sim&nbsp;&nbsp;</option>
        </select>      
	  </td>
    </tr>
    <tr class="Esconde0">
      <td class="dado">Especializa&ccedil;&atilde;o: </td>
      <td><input type="text" name="especializacao" id="especializacao" class="dado_maior" value="<%=especializacao%>" />      </td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Possui Mestrado: </td>
      <td><select name="FezMestrado" id="FezMestrado">
          <option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
          <option value="Sim">Sim&nbsp;&nbsp;</option>
        </select>      </td>
    </tr>
    <tr class="Esconde3">
      <td class="dado">Mestrado:</td>
      <td><input type="text" name="mestrado" id="mestrado" class="dado_maior" value="<%=mestrado%>"/>      </td>
    </tr>
    <tr class="Esconde3">
      <td class="dado">Ano:</td>
      <td><input type="text" name="formaturaMestrado" id="formaturaMestrado" class="ano" value="<%=formaturaMestrado%>"/></td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Possui Doutorado: </td>
      <td><select name="FezDoutorado" id="FezDoutorado">
          <option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
          <option value="Sim">Sim&nbsp;&nbsp;</option>
        </select>
      </td>
    </tr>
    <tr class="Esconde4">
      <td class="dado">Doutorado:</td>
      <td><input type="text" name="doutorado" id="doutorado" class="dado_maior" value="<%=doutorado%>"/>      </td>
    </tr>
    <tr class="Esconde4">
	  <td class="dado">Ano:</td>
      <td><input type="text" name="formaturaDoutorado" id="formaturaDoutorado" value="<%=formaturaDoutorado%>" class="ano"/></td>
    </tr>
    <tr>
      <td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Area de Interesse: </td>
      <td><input type="text" name="areaInteresse" id="areaInteresse" class="dado_maior" value="<%=areaInteresse%>" />      </td>
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
				<input type="text" name="enderecoConsultorio" id="enderecoConsultorio" class="dado_maior" value="<%=enderecoConsultorio%>" />
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
				<input type="text" name="cidadeConsultorio" id="cidadeConsultorio" value="<%=cidadeConsultorio%>" class="dado_maior" />
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
<!--
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Endere&ccedil;o residencial:
			</td>
			<td>
				<input type="text" name="endereco" id="endereco" class="dado_maior" value="<%'=endereco%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Cidade:
			</td>
			<td>
				<input type="text" name="cidade" id="cidade" class="dado_maior" value="<%'=cidade%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Estado:
			</td>
			<td>
				<input type="text" name="estado" id="estado" class="dado_maior" value="<%'=estado%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>CEP:
			</td>
			<td>
				<input type="text" name="cep" id="cep" class="cep" value="<%'=cep%>" style="width:110px;" />
			</td>
		</tr>
-->
		<tr>
			<td class="dado">
				Telefone residencial:
			</td>
			<td>
				<input type="text" name="telefone" id="telefone" class="telefone" value="<%=telefone%>" style="width:110px;" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				Celular:
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
				<input type="text" name="email" id="email" class="email" value="<%=email%>" style="width:110px;" />
			</td>
		</tr>
<!--
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Foto:
			</td>
			<td>
				<input type="file" name="imagem" id="imagem" class="dado_maior" />
			</td>
		</tr>
-->
		<tr>
			<td class="dado">
				Gostaria de receber:
			</td>
			<td>
				<%
					IF opcaoResposta <> "" THEN
						vetResposta = Split(opcaoResposta, ",")
						for i = 0 to Ubound(vetResposta)
'							Response.Write("<br />*"&vetResposta(i)&"*")
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
				<input type="checkbox" <%=Newsletter%> name="opcaoResposta" id="newsletter" value="Newsletter"  /> Newsletter &nbsp;&nbsp;<br />
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
		campo_ob = "nome,outraAtividade,universidade,formaturaGraduacao,residenciaPediatria,FezDoutorado,possuiConsultorio,areaInteresse,telefone,email"
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
	$('.data').mask("99/99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999 ");
	$('.cep').mask("99999-999");

//esconde campos
	$('.Esconde0').hide();
	$('.Esconde1').hide();
	$('.Esconde2').hide();
	$('.Esconde3').hide();
	$('.Esconde4').hide();
	$('.Esconde7').hide();

	$('#possuiEspecializacao').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde0').fadeIn();
		}
		else
		{
			$('.Esconde0').fadeOut();
		}
	
	});
	
	$('#profissao').click(function(){
		if( $(this).val() == 'Outro' )
		{
			$('.Esconde1').fadeIn();
		}
		else
		{
			$('.Esconde1').fadeOut();
		}
	
	});
	
	$('#atividades').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde2').fadeIn();
		}
		else
		{
			$('.Esconde2').fadeOut();
		}
	
	});
	$('#FezMestrado').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde3').fadeIn();
		}
		else
		{
			$('.Esconde3').fadeOut();
		}
	
	});
	
	$('#FezDoutorado').click(function(){
		if( $(this).val() == 'Sim' )
		{
			$('.Esconde4').fadeIn();
		}
		else
		{
			$('.Esconde4').fadeOut();
		}
	
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
