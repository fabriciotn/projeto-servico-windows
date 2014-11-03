<!--#include file="conexao.asp"-->
<!--# include file="salvaFoto.asp"--> <!-- FOTO DESATIVADA PARA ESTE CADASTRO -->
<%
'	Response.Charset = "utf-8"
	idEdita					=	Request.Form("idRegistro")


	tipoCadastro 			=	Lcase(Request.Form("tipoCadastro"))
	volta					=	Request.Form("volta")
'REQUEST DOS CAMPOS

	nome					=	Request.Form("nome")
	email					=	Request.Form("email")
	cliente					=	Request.Form("cliente")
	localAtendimento		=	Request.Form("localAtendimento")

	IF localAtendimento = "JoaoPauloII" THEN
		localAtendimento = "Hosp. Infantil João Paulo II"
	ELSEIF localAtendimento = "FelicioRocho" THEN
		localAtendimento = "Hospital Felício Rocho"
	ELSEIF localAtendimento = "Consultorio" THEN
		localAtendimento = "Consultório"
	END IF 
	
	opcaoResposta			=	Request.Form("opcaoResposta")


IF tipoCadastro = "cadastrar" THEN

	sqlCadastro = "INSERT INTO corpoclinico"
	sqlCadastro = sqlCadastro &" (nome, email, opcaoResposta, cliente, localAtendimento, categoria, dataCadastro)"
	sqlCadastro = sqlCadastro &" values ('" & nome & "', '"& email & "', '" & opcaoResposta & "', "
	sqlCadastro = sqlCadastro &" '" & cliente & "', '" & localAtendimento & "', 6, now())"
	
	'Response.Write(sqlCadastro)
	'response.End()
	ObjDb.execute sqlCadastro

assuntoEmail = "CONFIRMAÇÃO DE CADASTRO"

mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

	
ELSE

	sqlEdita = "UPDATE corpoclinico SET"
	sqlEdita = sqlEdita &" nome = '" & nome & "', email = '" & email & "', opcaoResposta = '" & opcaoResposta & "', cliente = '" & cliente & "', localAtendimento = '" & localAtendimento & "' WHERE id = " & idEdita

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