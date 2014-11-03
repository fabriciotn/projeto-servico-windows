<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>PULMOLAB</title>
<!--#include file="conexao.asp"-->
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.ver').click(function(){
				var id_atual = $(this).attr("lang");
				var esquerda = (screen.width - 900)/2;
				var topo = (screen.height - 670)/2;
				
				window.open("verMedico.asp?id=" + id_atual, "cean" , "height=700 ,width=680,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
		});
	});

</script>
<style>
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
	width:85px;
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
	SQL = "SELECT * FROM ex_corpoclinico WHERE id = "& id 
	Set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open SQL, ObjDB, 3, 1
	if rs.eof = false then
							
	
%>

<table>
	<tr>
		<td class="titulo" colspan="8" style="color:#FFFFFF"><%=rs("nome")%></td>
	</tr>
	<%IF rs("foto") <> "" THEN%>
	<tr>
		<td class="tipo">Foto:</td>
		<td colspan="4" style="text-align:center"><img src="img/<%=rs("foto")%>" width="125" height="110" /></td>
	</tr>
	<%END IF%>
	<tr>
		<td class="tipo">C.R.M.:</td>
		<td><%=rs("CRM")%></td>
	</tr>
	<tr>
		<td class="tipo">Profiss&atilde;o:</td>
		<td><%=rs("profissao")%></td>
	</tr>
	<tr>
		<td class="tipo">Atividade:</td>
		<td colspan="3"><%=rs("atividade")%></td>
	</tr>
	<tr>
		<td class="tipo">Endere&ccedil;o:</td>
		<td><%=rs("endereco")%></td>
	</tr>
	<tr>
		<td class="tipo">Telefone:</td>
		<td><%=rs("telefone")%></td>
	</tr>
	<tr>
		<td class="tipo">Celular:</td>
		<td><%=rs("celular")%></td>
	</tr>
	<tr>
		<td class="tipo">E-mail:</td>
		<td><%=rs("email")%></td>
	</tr>
	<%IF rs("residenciaPediatria") <> "" THEN%>
	<tr>
		<td class="tipo">Resid&ecirc;ncia pediatria:</td>
		<td><%=rs("residenciaPediatria")%></td>
		<td><%=rs("inicioPediatria")%>&nbsp;&nbsp;&agrave;&nbsp;&nbsp;<%=rs("fimPediatria")%></td>
	</tr>
	<tr>
		<td class="tipo">Outra resid&ecirc;ncia:</td>
	<%IF rs("outraResidencia") <> "" THEN%>
		<td><%=rs("outraResidencia")%></td>
		<td><%=rs("inicioOutra")%>&agrave;<%=rs("fimOutra")%></td>
	<%ELSE%>
		<td>N&atilde;o informado</td>
		<td></td>
	<%END IF%>
	</tr>
	<tr>
		<td class="tipo">Universidade:</td>
		<td><%=rs("universidade")%></td>
		<td class="tipo">Formatura:</td>
		<td><%=rs("formaturaGraduacao")%></td>
	</tr>
	<tr>
		<td class="tipo">Mestrado:</td>
		<td><%=rs("mestrado")%></td>
		<td class="tipo">Formatura:</td>
		<td><%=rs("formaturaMestrado")%></td>
	</tr>
	<tr>
		<td class="tipo">Doutorado:</td>
		<td><%=rs("doutorado")%></td>
		<td class="tipo">Formatura:</td>
		<td><%=rs("formaturaDoutorado")%></td>
	</tr>
	<tr>
		<td class="tipo">&Aacute;rea de interesse:</td>
		<td><%=rs("areaInteresse")%></td>
	</tr>
	<%END IF%>
	<%IF rs("tituloEspecialista") <> "" THEN%>
	<tr>
		<td class="tipo">T&iacute;tulo de Especialista:</td>
		<td><%=rs("tituloEspecialista")%></td>
		<%IF rs("anoTitulo") <> "" THEN%>
		<td><%=rs("anoTitulo")%></td>
		<%END IF%>
	</tr>
	<%END IF%>
	<%IF rs("enderecoConsultorio") <> "" THEN%>
	<tr>
		<td class="tipo">Endere&ccedil;o Consult&oacute;rio:</td>
		<td>
			<a href="http://www.google.com.br/maps?source=embed&amp;f=q&amp;hl=pt-BR&amp;geocode=&amp;q=<%=rs("enderecoConsultorio")%>" target="_blank" title="Clique aqui para exibir o endere&ccedil;o">
				<%=Server.HTMLEncode(rs("enderecoConsultorio"))%>
			</a>
		</td>
		<%IF rs("telConsultorio") <> "" THEN%>
		<td class="tipo">
			Telefone:
		</td>
		<td>
			<%=rs("telConsultorio")%>
		</td>
		<%END IF%>
	<%END IF%>
	<tr>
		<td class="tipo">Op&ccedil;&atilde;o de resposta:</td>
		<td><%=rs("opcaoResposta")%></td>
	</tr>
</table>
  <%end if%>
  

</div>

</body>
</html>
<!--#include file="conexaoOFF.asp" -->
