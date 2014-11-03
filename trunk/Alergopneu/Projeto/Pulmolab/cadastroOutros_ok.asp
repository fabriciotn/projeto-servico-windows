<!--#include file="conexao.asp"-->
<!--# include file="salvaFoto.asp"--> <!-- FOTO DESATIVADA PARA ESTE CADASTRO -->
<%
'	Response.Charset = "utf-8"
	idEdita					=	Request.Form("idRegistro")
	email					=	Request.Form("email")
	

	tipoCadastro 			=	Lcase(Request.Form("tipoCadastro"))
	volta					=	Request.Form("volta")
	
'REQUEST DOS CAMPOS

	nome					=	Request.Form("nome")
	profissao				=	Request.Form("profissao")
	IF profissao 			= "Outro" THEN
		profissao 			= Request.Form("outraProfissao")
	END IF
	cargoAtual				=	Request.Form("cargoAtual")
	atividade				=	Request.Form("atividade")
	IF atividade 			= "sim" THEN
		atividade			=	Request.Form("outraAtividade")
	END IF
	universidade			=	Request.Form("universidade")
	formaturaGraduacao		=	Request.Form("formaturaGraduacao")
	especializacao			=	Request.Form("especializacao")
	mestrado				=	Request.Form("mestrado")
	formaturaMestrado		=	Request.Form("formaturaMestrado")
	doutorado				=	Request.Form("doutorado")
	formaturaDoutorado		=	Request.Form("formaturaDoutorado")
	areaInteresse			=	Request.Form("areaInteresse")
	endereco				=	Request.Form("endereco")
	cep						=	Request.Form("cep")
	cidade					=	Request.Form("cidade")
	estado					=	Request.Form("estado")
	telefone				=	Request.Form("telefone")
	celular					=	Request.Form("celular")
	email					=	Request.Form("email")
	opcaoResposta			=	Request.Form("opcaoResposta")
	enderecoConsultorio		=	Request.Form("enderecoConsultorio")
	complementoConsultorio	=	Request.Form("complementoConsultorio")
	numConsultorio			=	Request.Form("numConsultorio")
	bairroConsultorio		=	Request.Form("bairroConsultorio")
	cidadeConsultorio		=	Request.Form("cidadeConsultorio")
	ufConsultorio			=	Request.Form("ufConsultorio")
	cepConsultorio			=	Request.Form("cepConsultorio")
	telConsultorio			=	Request.Form("telConsultorio")
	


'Response.Write(opcaoResposta)
'Response.End()

IF tipoCadastro = "cadastrar" THEN

	sqlCadastro = "INSERT INTO corpoClinico"
	sqlCadastro = sqlCadastro &" (nome, profissao, cargoAtual, atividade, universidade, formaturaGraduacao, especializacao,"
	sqlCadastro = sqlCadastro &" cep, cidade, estado, dataCadastro,"
	sqlCadastro = sqlCadastro &" mestrado, formaturaMestrado, doutorado, formaturaDoutorado, areaInteresse, endereco, telefone, celular, email, opcaoResposta, categoria,"
	sqlCadastro = sqlCadastro &" enderecoConsultorio, complementoConsultorio, numConsultorio, bairroConsultorio, cidadeConsultorio, ufConsultorio, cepConsultorio, telConsultorio)"
	sqlCadastro = sqlCadastro &" values ('" & nome & "', '" & profissao & "', '" & cargoAtual & "', '" & atividade & "', '" & universidade & "', '" & formaturaGraduacao & "', '" & especializacao & "',"
	sqlCadastro	= sqlCadastro &" '" & cep & "', '" & cidade & "', '" & estado & "', now(),"
	sqlCadastro = sqlCadastro &" '" & mestrado & "', '" & formaturaMestrado & "', '" & doutorado & "', '" & formaturaDoutorado & "', '" & areaInteresse & "', '" & endereco & "',"
	sqlCadastro = sqlCadastro &" '" & telefone & "', '" & celular & "', '" & email & "', '" & opcaoResposta & "', 2,"
	sqlCadastro = sqlCadastro & " '" & enderecoConsultorio & "', '" & complementoConsultorio & "', '" & numConsultorio & "', '" & bairroConsultorio & "', '" & cidadeConsultorio & "', '" & ufConsultorio & "',"
	sqlCadastro = sqlCadastro & " '" & cepConsultorio & "', '" & telConsultorio & "')"

'	Response.Write(sqlCadastro)
'	Response.End()
	ObjDb.execute sqlCadastro
	
assuntoEmail = "CONFIRMAÇÃO DE CADASTRO"

mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."


ELSE



	sqlEdita = "UPDATE corpoClinico SET"
	sqlEdita = sqlEdita &" nome = '"& nome &"', profissao = '"& profissao &"', enderecoConsultorio = '"& enderecoConsultorio &"', telConsultorio = '"& telConsultorio &"', atividade = '"& profissao &"',"
	sqlEdita = sqlEdita &" universidade = '"& universidade &"', formaturaGraduacao = '"& formaturaGraduacao &"', especializacao = '"& especializacao &"',"
	sqlEdita = sqlEdita &" mestrado = '"& mestrado &"', formaturaMestrado = '"& formaturaMestrado &"', doutorado = '"& profissao &"', formaturaDoutorado = '"& formaturaDoutorado &"',"
	sqlEdita = sqlEdita &" areaInteresse = '"& areaInteresse &"', endereco = '"& endereco &"', telefone = '"& telefone &"', celular = '"& celular &"', email = '"& email &"',"
	sqlEdita = sqlEdita &" cidade = '"& cidade &"', estado = '"& estado &"', cep = '"& cep &"',"
	sqlEdita = sqlEdita &" opcaoResposta = '" & opcaoResposta & "', foto = '" & nome_arquivo & "', aprovado = 0 WHERE id = " & idEdita

'	Response.Write("<br /><br />" & sqlEdita & "<br /><br /><hr><br />")
'	response.End()	

	ObjDb.execute sqlEdita

assuntoEmail = "ATUALIZAÇÃO DE CADASTRO"

mensagem_final = "Foi modificado um cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."


END IF

'Enviando e-mail de confirmação

%>
<!--# include file="emailCadastro.asp" --> <!-- ENVIO DE EMAIL DESATIVADO  -->

<!--#include file="conexaoOFF.asp" -->

<!--#include file="finalizaCadastro.asp" -->