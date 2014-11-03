<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file="conexao.asp" -->
<%
	ultima_pagina = Session("ultima_pagina")
	Session ("ultima_pagina") = ultima_pagina

'	Response.Write(ultima_pagina)
	'Response.End()
	id = Request.QueryString("id")
	Session("id") = id
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
$(document).ready(function(){	

	$('#prosseguir').click(function(){
		if( $('#imagem').val() == '' ){
			alert('Insira uma foto.');
			return false;
		}
	});
	
	$('#Cadastrar').click(function(){
		window.close();
		<%IF ultima_pagina = "http://testes.hbatecnologia.com/pulmolab2010/ferramenta_corpo.asp" THEN%>
		window.close();
		window.opener.location = "ferramenta_corpo.asp";
		<%ELSE%>
		window.location = "corpo_clinico.asp";
		<%END IF%>
		window.opener.focus();
	});
	
	
		$('#inserir').click(function(){
			
			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
		
			window.open("cadastrar_imagem1c.asp?id=<%=id%>", "Exposystems2" , "height=300,width=380,top=" + topo + ",left=" + 	esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

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

<%


	SQL = "SELECT categoria, foto FROM corpoclinico WHERE id = "& id
'	RESPONSE.Write(SQL)
	set rs = server.CreateObject("ADODB.RecordSet")

	rs.Open SQL, ObjDB,3,1
	
	IF rs.eof = FALSE THEN
	
		foto = Server.HTMLEncode(rs("foto"))
		
	END IF

%>
</head>

<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>


	<table class="tableCadastraCorpo" style="padding-left:150px;">
		<tr>
			<%IF foto <> "" THEN%>
				<td class="dado_maior" style="text-align:center; padding-top:10px;" colspan="4">
					<img width="200" height="200" src="img/<%=foto%>" />
					<br />
					<a href="delete_imagem.asp?id=<%=id%>" style="cursor:pointer; text-decoration:none; font-weight: bold; color: #4F7C6C;">
						<img alt="Excluir imagem" src="img/delete.png"style:"border: none;" title="Excluir imagem" border="0" />
						Excluir imagem
					</a>
				</td>
			<%ELSE%>
				<td class="dado_maior">
				
				<td class="dado">
					Inserir foto:
	
					<a id="inserir" name="inserir" style="cursor:pointer; padding-left:10px; font-weight: bold; color: #4F7C6C;">
						<img alt="Inserir imagem" src="img/add.png"style:"border: none;" title="Inserir imagem" border="0" />
					</a>
					
	
				</td>
			<%END IF%>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td class="dado_maior">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:center">
					<input type="button" value="Salvar" id="Cadastrar"/>
			</td>
		</tr>
	</table>
</form>


</body>
</html>