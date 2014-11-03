<%
	botao = "Cadastrar"
	id = Request.QueryString("id")
	IF id <> "" THEN

		botao = "Salvar"
		
		SQL = "SELECT c.*, cat.nome as nomeCategoria, s.nome as nomeSetor FROM corpoclinico c"
		SQL = SQL & " INNER JOIN categoria cat ON cat.id = c.categoria"
		SQL = SQL & " LEFT JOIN setor s ON s.cod = c.setor"
		SQL = SQL & " WHERE c.id = "& id 
		Set rs = Server.CreateObject("ADODB.RecordSet")
	'	Response.Write(SQL)
		rs.Open SQL, ObjDB, 3, 1
		IF rs.eof = false THEN
		
			categoria = rs("nomeCategoria")
			codSetor = rs("setor")
			setor = rs("nomeSetor")
			foto = rs("foto")
			nome = rs("nome")
			email = rs("email")
			endereco = rs("endereco")
			telefone = rs("telefone")
			celular = rs("celular")
			opcaoResposta = Lcase(rs("opcaoResposta"))
			atividade = rs("atividade")
			universidade = rs("universidade")
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
				foto = "foto_breve.jpg"
			END IF

		END IF
			
	END IF
%>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<form method="post" name="form_CorpoClinico" id="form_CorpoClinico" action="medicoEstudantes_ok.asp">
	<table class="tableCadastraCorpo">
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Nome:
			</td>
			<td class="dado_maior">
				<input type="text" name="nome" id="nome" class="dado_maior" value="<%=Ucase(nome)%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i> Tipo:
			</td>
			<td>
				<select name="tipo" id="tipo">
					<option value="Estudante">Estudante&nbsp;&nbsp;</option>
					<option value="Medico">M&eacute;dico&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
			</td>
			<td class="dado_maior">
				<select name="area" id="area">
					<option value="Medicina">Medicina&nbsp;&nbsp;</option>
					<option value="Fisioterapia">Fisioterapia&nbsp;&nbsp;</option>
					<option value="Nutri&ccedil;&atilde;o">Nutri&ccedil;&atilde;o&nbsp;&nbsp;</option>
					<option value="Biomedicina">Biomedicina&nbsp;&nbsp;</option>
					<option value="Auxiliar de Enfermagem">Auxiliar de Enfermagem&nbsp;&nbsp;</option>
					<option value="Enfermeira">Enfermeira&nbsp;&nbsp;</option>
					<option value="Outro">Outro&nbsp;&nbsp;</option>
				</select>

			</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Universidade:
			</td>
			<td class="dado_maior">
				<input type="text" name="universidade" id="universidade" class="dado_maior" value="<%=universidade%>" />
			</td>
		</tr>
		<tr class="Esconde2">
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Conclus&atilde;o (mm/ano):
			</td>
			<td class="dado_maior">
				<input type="text" name="anoFormatura" id="anoFormatura" class="data" value="<%=anoFormatura%>" />
			</td>
		</tr>
		<tr class="Esconde0">
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>CRM:
			</td>
			<td>
				<input type="text" name="CRM" id="CRM" style="width:100px;" value="<%=crm%>"  />
			</td>
		</tr>
		<tr class="Esconde0">
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>T&iacute;tulos de Especialista:
			</td>
			<td colspan="2">
				<%
					if Lcase(titulo1) = "pediatria" then
						titulo1 = "checked"
					elseif Lcase(titulo2) = "alergia" then
						titulo2 = "checked"
					elseif Lcase(titulo3) = "pneumologia pediátrica" then
						titulo3 = "checked"
					elseif Lcase(titulo4) = "alergia pediátrica" then
						titulo4 = "checked"
					elseif Lcase(titulo5) = "pneumologia" then
						titulo5 = "checked"
					elseif Lcase(titulo6) = "outro" then
						titulo6 = "checked"
					end if
				%>
				<input type="checkbox" <%=titulo1%>  name="titulo1" id="titulo1" value="Pediatria" /> Pediatria&nbsp;&nbsp 
					<span class="anoTituloEsconde" id="anoTitulo1">Ano: <input type="text" name="anoTitulo" class="ano anoTitulos" /></span><br />

				<input type="checkbox" <%=titulo2%>  name="titulo2" id="titulo2" value="Alergia" />  Alergia&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo2">Ano: <input type="text" name="anoTitulo2" class="ano anoTitulos" /></span><br />

				<input type="checkbox" <%=titulo3%>  name="titulo3" id="titulo3" value="Pneumologia Pedi&aacute;trica" /> Pneumologia Pedi&aacute;trica&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo3">Ano: <input type="text" name="anoTitul3" class="ano anoTitulos" /></span><br />

				<input type="checkbox" <%=titulo4%>  name="titulo4" id="titulo4" value="Alergia pedi&aacute;trica" /> Alergia pedi&aacute;trica&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo4">Ano: <input type="text" name="anoTitul4" class="ano anoTitulos" /></span><br />

				<input type="checkbox" <%=titulo5%>  name="titulo5" id="titulo5" value="Pneumologia" /> Pneumologia&nbsp;&nbsp;
					<span class="anoTituloEsconde" id="anoTitulo5">Ano: <input type="text" name="anoTitulo5" class="ano anoTitulos" /></span><br />

				<input type="checkbox" <%=titulo6%>  name="titulo6" id="Outro" value="Outro" /> Outro
		<tr class="Esconde1">
			<td class="dado">
			</td>
			<td>
				<input type="text" name="outroTituloEspecialista" id="outroTituloEspecialista" class="dado_maior" value="<%=outroTitulo%>" />
			</td>
		</tr>
		<tr class="Esconde1">
			<td class="dado">
				Ano:
			</td>
			<td>
				<input type="text" name="anoTitulo" id="anoTitulo" class="ano" value="<%=anoTitulo%>" />
			</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Endere&ccedil;o:
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
				<input type="text" name="cep" id="cep" class="cep" value="<%'=cep%>" style="width:110px;" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Estado:
			</td>
			<td>
				<input type="text" name="estado" id="estado" class="dado_maior" value="<%'=uf%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Cidade:
			</td>
			<td>
				<input type="text" name="cidade" id="cidade" class="dado_maior" value="<%=cidade%>" />
			</td>
			<td class="dado_maior">&nbsp;</td>
		</tr>
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
				<input type="file" name="imagem" id="imagem" value="Enviar" />
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
				<b>OBS.:</b> Endere&ccedil;o residencial, telefone, email, celular n&atilde;o ser&atilde;o divulgados no site sendo apenas para uso interno do servi&ccedil;o!
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
		campo_ob = "nome,universidade,CRM,endereco,cep,cidade,email"
		campos_ob = SPLIT(campo_ob,",")
		for i = 0 to Ubound(campos_ob)
		%>
			if( $('#<%=campos_ob(i)%>').val() == '' ){
				alert('Preencha corretamente o campo <%=Ucase( Replace( campos_ob(i) ,"_", " ") )%>!');
				return false;
			}
		<%
		next
		%>
	});




// mascara para campos especificos
	$('.data').mask("99/99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999 ");
	$('.cep').mask("99999-999");

//esconde campos

	$('.Esconde0').hide();
	$('.Esconde1').hide();
	$('.anoTituloEsconde').hide();
	
// ano titulo

	$('#titulo1').click(function(){
		$('#anoTitulo1').toggle();
	});

	$('#titulo2').click(function(){
		$('#anoTitulo2').toggle();
	});

	$('#titulo3').click(function(){
		$('#anoTitulo3').toggle();
	});


	$('#titulo4').click(function(){
		$('#anoTitulo4').toggle();
	});

	$('#titulo5').click(function(){
		$('#anoTitulo5').toggle();
	});


	$('#tipo').click(function(){
		if( $(this).val() == 'Medico' )
		{
			$('.Esconde0').fadeIn();
			$('.Esconde2').fadeOut();
		}
		else
		{
			$('.Esconde0').fadeOut();
			$('.Esconde2').fadeIn();
		}
	
	});
	
	$('#Outro').click(function(){

		$('.Esconde1').toggle();
	
	});

});
	
</script>