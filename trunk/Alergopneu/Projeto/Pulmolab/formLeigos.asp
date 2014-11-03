<%
	id = Request.QueryString("id")
	botao = "Cadastrar"
	IF id <> "" THEN

		botao = "Salvar"
		
		SQL = "SELECT nome, email, foto, cliente, localAtendimento, opcaoResposta FROM corpoclinico"
		SQL = SQL & " WHERE id = "& id 
		Set rs = Server.CreateObject("ADODB.RecordSet")
	'	Response.Write(SQL)
		rs.Open SQL, ObjDB, 3, 1
		IF rs.eof = false THEN
		
			foto = rs("foto")
			nome = rs("nome")
			email = rs("email")
			cliente = rs("cliente")
			opcaoResposta = Lcase(rs("opcaoResposta"))
			localAtendimento = Lcase(rs("localAtendimento"))
						
			IF foto = "" THEN
				foto = "breve.png"
			END IF
	END IF
			
	END IF
%>

<form method="post" name="form_CorpoClinico" id="form_CorpoClinico" action="leigos_ok.asp">
	<table class="tableCadastraCorpo">
		<tr>
			<td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Nome: </td>
			<td class="dado_maior"><input type="text" name="nome" id="nome" class="dado_maior" value="<%=Ucase(nome)%>" /></td>
		</tr>
		<tr>
			<td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>E-mail: </td>
			<td><input type="text" name="email" id="email" class="dado_maior" value="<%=email%>" /></td>
		</tr>
		<!--{
		<tr>
			<td class="dado">
				<i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>Foto:
			</td>
			<td class="dado_maior">
				<input type="file" name="imagem" id="imagem" class="dado_maior" value="<%'=foto%>" />
			</td>
		</tr>}-->
		<tr>
			<td class="dado"><i style="color:#FF0000; font-weight:bold">&nbsp;*&nbsp;</i>J&aacute; &eacute; cliente do servi&ccedil;o </td>
			<td>
				<select name="cliente" id="cliente">
					<option value="Nao">N&atilde;o&nbsp;&nbsp;</option>
					<option value="Sim">Sim&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr class="Esconde1">
			<td class="dado">Onde: </td>
			<td><%
				if localAtendimento = "Hosp. Infantil João Paulo II" then
					JoaoPauloII = "selected"
				elseif localAtendimento = "hospital felício rocho" then
					FelicioRocho = "selected"
				elseif localAtendimento = "consultório" then
					Consultorio = "selected"
				end if
				%>
				<select name="localAtendimento" id="localAtendimento">
					<option value="JoaoPauloII" <%=JoaoPauloII%> >Hosp. Infantil Jo&aacute;o Paulo II&nbsp;&nbsp;</option>
					<option value="FelicioRocho" <%=FelicioRocho%> >Hospital Fel&iacute;cio Rocho&nbsp;&nbsp;</option>
					<option value="Consultorio" <%=Consultorio%> >Consult&oacute;rio&nbsp;&nbsp;</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="dado"> Gostaria de receber: </td>
			<td><%
				if opcaoResposta = "Notícias" then
					noticias = "selected"
				elseif opcaoResposta = "Informações Úteis" then
					InformacoesUteis = "selected"
				end if
				%>
				<select name="opcaoResposta" id="opcaoResposta">
					<option value="noticias" <%=Newsletter%> >Not&iacute;cias&nbsp;&nbsp;</option>
					<option value="InformacoesUteis" <%=InformacoesUteis%> >Informa&ccedil;&otilde;es &Uacute;teis&nbsp;&nbsp;</option>
				</select></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center"><input type="hidden" name="idRegistro" id="idRegistro" value="<%=id%>" />
				<input type="hidden" name="tipoCadastro" id="tipoCadastro" value="<%=botao%>" />
				<input type="hidden" value="<%=volta%>" name="volta" id="volta" />
				<input type="submit" value="<%=botao%>" name="Cadastrar" id="<%=botao%>" /></td>
		</tr>
	</table>
</form>
<script src="js/AC_RunActiveContent.js" language="javascript"></script> 
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script> 
<script type="text/javascript">
$(document).ready(function(){	

	$('#Cadastrar').click(function(){
		<%
		campo_ob = "nome,cliente,email"
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
	$('.data').mask("99/99/9999");
	$('.ano').mask("9999");
	$('.telefone').mask("(999) 9999-9999 ");

//esconde campos
	$('.Esconde1').hide();
<%IF cliente = "Sim" THEN%>

	$('.Esconde1').show();

<%END IF%>	

	$('#cliente').click(function(){
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
