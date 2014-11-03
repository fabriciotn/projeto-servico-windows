<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PULMOLAB</title>
<!--#include file="includes.asp"-->
<style>
.anoTitulos{
	width:80px;
	height:10px;
}
a{
	text-decoration:none;
}
a:hover{
	text-decoration:underline;
	color:#69A7CB;
}
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
	padding: 0px 20px 10px 20px;
}
.tipo
{
	font-size:11px;
	width:100px;
	background:#E0E7FA;
	padding-left:5px;
}
.titulo{
	font-size:14px;
	background:#69A7CB;
	text-align:center;
}

</style>
<%
	id = request.QueryString("id")
%> 
</head>

<body>
<%
	SQL = "SELECT c.*, cat.nome as nomeCategoria, s.nome as nomeSetor FROM corpoclinico c"
	SQL = SQL & " INNER JOIN categoria cat ON cat.id = c.categoria"
	SQL = SQL & " LEFT JOIN setor s ON s.cod = c.setor"
	SQL = SQL & " WHERE c.id = "& id 
	Set rs = Server.CreateObject("ADODB.RecordSet")
'	Response.Write(SQL)
	rs.Open SQL, ObjDB, 3, 1
	if rs.eof = false then
	
		categoria = rs("nomeCategoria")
		setor = rs("nomeSetor")
		foto = rs("foto")
		
		IF foto = "" THEN
			foto = "img/foto_breve.jpg"
		ELSE
			foto = "foto\"& foto
		END IF
		
							IF rs("titulo1") <> "" THEN
								vetorTitulos = rs("titulo1") & " " & rs("anotitulo1")
							END IF
							IF rs("titulo2") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo2") & " " & rs("anotitulo2")
							END IF
							IF rs("titulo3") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo3") & " " & rs("anotitulo3")
							END IF
							IF rs("titulo4") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo4") & " " & rs("anotitulo4")
							END IF
							IF rs("titulo5") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo5") & " " & rs("anotitulo5")
							END IF   ' vetor titulo de especialista
%>

<div id="cadastro_exemplo">
	<div id="titulo_cadastro_exemplo"><%=categoria%></div>
	<div id="table_cadastro_exemplo">
<table>
	<tr>
		<td class="titulo" colspan="8" style="color:#FFFFFF"><%=rs("nome")%></td>
	</tr>
	
	<tr>
		<td class="tipo">Foto:</td>
		<td colspan="4" style="text-align:center"><img src="<%=foto%>" width="100" height="90" /></td>
	</tr>
	
	<tr>
		<td class="tipo">Categoria:</td>
		<td style="width:230px"><%=categoria%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">Setor:</td>
		<td style="width:230px"><%=setor%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%IF categoria = "Médicos / Estudantes" THEN%>
	<tr>
		<td class="tipo">C.R.M.:</td>
		<td><%=rs("CRM")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">Cliente:</td>
		<td><%=rs("cliente")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%END IF%>
	<%IF categoria = "Leigos" THEN%>
		<tr>
			<td class="tipo">Local de atendimento:</td>
			<td><%=rs("localAtendimento")%></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	<%END IF%>
	<%IF categoria = "Ex Pós-Graduandos" THEN%>
	<tr>
		<td class="tipo">Cargo atual:</td>
		<td><%=rs("cargoAtual")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%END IF%>
	<%IF categoria <> "Leigos" THEN%>
		<%IF rs("profissao") <> "" THEN%>
			<tr>
				<td class="tipo">Profiss&atilde;o:</td>
				<td><%=rs("profissao")%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		<%END IF%>
		<%IF rs("atividade") <> "" THEN%>
			<tr>
				<td class="tipo">Atividade:</td>
				<td colspan="2"><%=rs("atividade")%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		<%END IF%>
	<tr>
		<td class="tipo">Endere&ccedil;o:</td>
		<td>
		<a href="http://www.google.com.br/maps?source=embed&amp;f=q&amp;hl=pt-BR&amp;geocode=&amp;q=<%=rs("endereco")%>, <%=rs("cidade")%>&nbsp;<%=rs("estado")%>, <%=rs("cep")%>" target="_blank" title="Clique aqui para exibir o endere&ccedil;o" >
			<%=rs("endereco")%>
		</a>
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">Cidade:</td>
		<td><%=rs("cidade")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">Estado:</td>
		<td><%=rs("estado")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">CEP:</td>
		<td><%=rs("cep")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">Telefone:</td>
		<td><%=rs("telefone")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">Celular:</td>
		<td><%=rs("celular")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="tipo">E-mail:</td>
		<td><a href="mailTo:<%=rs("email")%>" id="emailUsuario" title="Enviar e-mail para <%=rs("nome")%>"><%=rs("email")%></a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%IF rs("residenciaPediatria") <> "" THEN%>
		<tr>
			<td class="tipo">Resid&ecirc;ncia pediatria:</td>
			<td><%=rs("residenciaPediatria")%></td>
			<td><%=rs("inicioPediatria")%>&nbsp;&nbsp;&agrave;&nbsp;&nbsp;<%=rs("fimPediatria")%></td>
			<td>&nbsp;</td>
		</tr>
	<%END IF%>

	<%IF rs("outraResidencia") <> "" THEN%>	
		<tr>
			<td class="tipo">Outra resid&ecirc;ncia:</td>
			<td><%=rs("outraResidencia")%></td>
			<td colspan="2"><%=rs("inicioOutra")%>&nbsp;&agrave;&nbsp;<%=rs("fimOutra")%></td>
			<td></td>
		</tr>
	<%END IF%>
	<%IF rs("universidade") <> "" THEN%>
		<tr>
			<td class="tipo">Universidade:</td>
			<td><%=rs("universidade")%></td>
			<td class="tipo">Formatura:</td>
			<td><%=rs("formaturaGraduacao")%></td>
		</tr>
	<%END IF%>
	<%IF rs("mestrado") <> "" THEN%>
		<tr>
			<td class="tipo">Mestrado:</td>
			<td><%=rs("mestrado")%></td>
			<td class="tipo">Formatura:</td>
			<td><%=rs("formaturaMestrado")%></td>
		</tr>
	<%END IF%>
	<%IF rs("doutorado") <> "" THEN%>
		<tr>
			<td class="tipo">Doutorado:</td>
			<td><%=rs("doutorado")%></td>
			<td class="tipo">Formatura:</td>
			<td><%=rs("formaturaDoutorado")%></td>
		</tr>
	<%END IF%>
	<tr>
		<td class="tipo">&Aacute;rea de interesse:</td>
		<td><%=rs("areaInteresse")%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%END IF%>
	<%IF vetorTitulos <> "" THEN%>
		<tr>
			<td class="tipo">T&iacute;tulo de  Especialista:</td>
			<td colspan="3">
				<%=vetorTitulos%>
			</td>
		</tr>
	<%END IF%>
	<%IF rs("outroTitulo") <> "" THEN%>
		<tr>
			<td class="tipo">Outro t&iacute;tulo:</td>
			<td><%=rs("outroTitulo")%></td>
			<td><%=rs("anoTitulo")%></td>
		</tr>
	<%END IF%>
	<%IF rs("enderecoConsultorio") <> "" THEN%>
	<tr>
		<td class="tipo">Rua/Av.:</td>
		<td colspan="3">
			<a href="http://www.google.com.br/maps?source=embed&amp;f=q&amp;hl=pt-BR&amp;geocode=&amp;q=<%=rs("enderecoConsultorio")%>, <%=rs("numConsultorio")%>, <%=rs("cidadeConsultorio")%>&nbsp; <%=rs("ufConsultorio")%>, <%=rs("cepConsultorio")%>" target="_blank" title="Clique aqui para exibir o endere&ccedil;o" >
				<%=rs("enderecoConsultorio")%>
			</a>
		</td>
	</tr>
	<tr>
		<td class="tipo">
			Complemento:
		</td>
		<td>
			<%=rs("complementoConsultorio")%>
		</td>
		<td style="	font-size:11px;	background:#E0E7FA;	padding-left:5px;">
			N&uacute;mero:
		</td>
		<td>
			<%=rs("numConsultorio")%>
		</td>
	</tr>
	<tr>
		<td class="tipo">
			Bairro
		</td>
		<td>
			<%=rs("bairroConsultorio")%>
		</td>
	</tr>
	<tr>
		<td class="tipo">
			Cidade
		</td>
		<td>
			<%=rs("cidadeConsultorio")%>
		</td>
	</tr>
	<tr>
		<td class="tipo">
			Estado
		</td>
		<td>
			<%=rs("ufConsultorio")%>
		</td>
	</tr>
	<tr>
		<td class="tipo">
			CEP
		</td>
		<td>
			<%=rs("cepConsultorio")%>
		</td>
	</tr>
	<tr>
		<td class="tipo">
			Telefone:
		</td>
		<td>
			<%=rs("telConsultorio")%>
		</td>
	<%END IF%>
	<tr>
		<td class="tipo">Op&ccedil;&atilde;o de resposta:</td>
		<td colspan="3">
			<%
				opcaoResposta = Lcase(rs("opcaoResposta") )
				IF opcaoResposta <> "" THEN
					vetResposta = Split(opcaoResposta, ",")
					for i = 0 to Ubound(vetResposta)
							if vetResposta(i) = "artigos médicos" then
								ArtigosMedicos = "checked"
							elseif vetResposta(i) = "newsletter" then
								Newsletter = "checked"
							elseif vetResposta(i) = "informações úteis" then
								InformacoesUteis = "checked"
							elseif vetResposta(i) = "caso clínico" then
								CasoClinico = "checked"
							end if
					next
				END IF
			%>
			<input type="checkbox" <%=ArtigosMedicos%> name="opcaoResposta" id="ArtigosMedicos" value="Artigos M&eacute;dicos" /> Artigos M&eacute;dicos&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" <%=Newsletter%> name="opcaoResposta" id="newsletter" value="Newsletter"  /> Newsletter &nbsp;&nbsp;<br />
			<input type="checkbox" <%=InformacoesUteis%> name="opcaoResposta" id="InformacoesUteis" value="Informa&ccedil;&otilde;es &Uacute;teis"  /> Informa&ccedil;&otilde;es &Uacute;teis&nbsp;&nbsp;
			&nbsp;&nbsp;
			<input type="checkbox" <%=CasoClinico%> name="opcaoResposta" id="CasoClinico" value="Caso cl&iacute;nico do m&ecirc;s"  /> Caso cl&iacute;nico do m&ecirc;s&nbsp;&nbsp;
		</td>
	</tr>
</table>
  <%end if%>

	</div>
</div>  

</div>

</body>
</html>
<!--#include file="conexaoOFF.asp" -->
