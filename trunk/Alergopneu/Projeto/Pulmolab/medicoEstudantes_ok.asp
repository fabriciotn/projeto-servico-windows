<!--#include file="conexao.asp"-->
<!--# include file="salvaFoto.asp"--> <!-- FOTO DESATIVADA PARA ESTE CADASTRO -->
<%
'	Response.Charset = "utf-8"
	idEdita					=	Request.Form("idRegistro")
	email					=	Request.Form("email")
	

	tipoCadastro 					=	Lcase(Request.Form("tipoCadastro"))
	
'REQUEST DOS CAMPOS


	nome					=	Request.Form("nome")
	tipo					=	Request.Form("tipo")
	area					=	Request.Form("area")
	universidade			=	Request.Form("universidade")
	formaturaGraduacao		=	Request.Form("anoFormatura")
	CRM						=	Request.Form("CRM")
	estado					=	Request.Form("estado")
	titulo1					=	Request.Form("titulo1")
	anoTitulo1				=	Request.Form("anoTitulo1")
	titulo2					=	Request.Form("titulo2")
	anoTitulo2				=	Request.Form("anoTitulo2")
	titulo3					=	Request.Form("titulo3")
	anoTitulo3				=	Request.Form("anoTitulo3")
	titulo4					=	Request.Form("titulo4")
	anoTitulo4				=	Request.Form("anoTitulo4")
	titulo5					=	Request.Form("titulo5")
	anoTitulo5				=	Request.Form("anoTitulo5")
	titulo6					=	Request.Form("titulo6")
	outroTitulo				=	Request.Form("outroTituloEspecialista")
	anoOutroTitulo			=	Request.Form("anoTitulo")
	telefone				=	Request.Form("telefone")
	celular					=	Request.Form("celular")
	email					=	Request.Form("email")
	opcaoResposta			=	Request.Form("opcaoResposta")


IF tipoCadastro = "cadastrar" THEN
	
	sqlCadastro = "INSERT INTO corpoclinico"
	sqlCadastro = sqlCadastro &" (nome, tipo, area, universidade, formaturaGraduacao, CRM, estado, telefone, celular, email, opcaoResposta, categoria, dataCadastro,"
	sqlCadastro = sqlCadastro & " titulo1, anoTitulo1, titulo2, anoTitulo2, titulo3, anoTitulo3, titulo4, anoTitulo4, titulo5, anoTitulo5, outroTitulo, anoTitulo, foto)"
	sqlCadastro = sqlCadastro &" values ('" & nome & "', '" & tipo & "', '" & universidade & "', '" & formaturaGraduacao & "', '" & nome & "', '" & CRM & "', '" & estado & "',"
	sqlCadastro = sqlCadastro &" '" & telefone & "', '" & celular & "', '" & email & "', '" & opcaoResposta & "', 5, now(),"
	sqlCadastro = sqlCadastro & " '" & titulo1 & "', '" & anoTitulo1 & "', '" & titulo2 & "', '" & anoTitulo2 & "', '" & titulo3 & "', '" & anoTitulo3 & "', '" & titulo4 & "', '" & anoTitulo4 & "',"
	sqlCadastro = sqlCadastro & " '" & titulo5 & "', '" & anoTitulo5 & "', '" & outroTitulo & "', '" & anoOutroTitulo & "', '" & nome_arquivo & "')"

'	Response.Write(sqlCadastro)
'	response.End()
	ObjDb.execute sqlCadastro


assuntoEmail = "CONFIRMAÇÃO DE CADASTRO"

mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

ELSE

	sqlEdita = "UPDATE corpoclinico SET"
	sqlEdita = sqlEdita & " nome = '" & nome & "', tipo = '" & tipo & "', area = '" & area & "', universidade = '" & universidade & "', formaturaGraduacao = '" & formaturaGraduacao & "', CRM = '" & CRM & "',"
	sqlEdita = sqlEdita & " estado = '" & estado & "', telefone = '" & telefone & "', celular = '" & celular & "', email = '" & email & "', opcaoResposta = '" & opcaoResposta & "', categoria = 5," 
	sqlEdita = sqlEdita & " titulo1 = '"& titulo1 &"', titulo2 = '"& titulo2 &"', titulo3 = '"& titulo3 &"', titulo4 = '"& titulo4 &"', titulo5 = '"& titulo5 &"', outroTitulo = '" & outroTitulo & "'," 
	sqlEdita = sqlEdita & " anoTitulo1 = '"& anoTitulo1 &"', anoTitulo2 = '"& anoTitulo2 &"', anoTitulo3 = '"& anoTitulo3 &"', anoTitulo4 = '"& anoTitulo4 &"', anoTitulo5 = '"& anoTitulo5 &"',"
	sqlEdita = sqlEdita & " anoTitulo = '"& anoTitulo &"', foto = '" & nome_arquivo & "', aprovado = 0"
	sqlEdita = sqlEdita & " WHERE id = " & idEdita

'	Response.Write("<br /><br />" & sqlEdita & "<br /><br /><hr><br />")
	

	ObjDb.execute sqlEdita

assuntoEmail = "ATUALIZAÇÃO DE CADASTRO"


mensagem_final = "Foi modificado um cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

	
END IF


'Enviando e-mail de confirmação

%>
<!--# include file="emailCadastro.asp" --> <!-- ENVIO DE EMAIL DESATIVADO  -->

<!--#include file="conexaoOFF.asp" -->

<!--#include file="finalizaCadastro.asp" -->