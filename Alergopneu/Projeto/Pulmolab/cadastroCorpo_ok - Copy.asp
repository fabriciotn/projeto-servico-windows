<!--#include file="conexao.asp"-->
<!--#include file="salvaFoto.asp"-->
<%
	Response.Charset = "iso-8859-1"
	

	tipoCadastro 					=	Lcase(SaFileUp.Form("tipoCadastro"))
	volta							=	SaFileUp.Form("volta")
	
'REQUEST DOS CAMPOS

	setor					=	SaFileUp.Form("setor")
	nome					=	SaFileUp.Form("nome")
	atividade				=	SaFileUp.Form("atividade")
	universidade			=	SaFileUp.Form("universidade")
	formaturaGraduacao		=	SaFileUp.Form("formaturaGraduacao")
	residenciaPediatria		=	SaFileUp.Form("residenciaPediatria")
	inicioPediatria			=	SaFileUp.Form("inicioPediatria")
	fimPediatria			=	SaFileUp.Form("fimPediatria")
	residencia				=	SaFileUp.Form("residencia")
	localOutra				=	SaFileUp.Form("localResidencia")
	inicioOutra				=	SaFileUp.Form("inicioOutra")
	fimOutra				=	SaFileUp.Form("fimOutra")
	posGraduacao			=	SaFileUp.Form("posGraduacao")
	localPOS				=	SaFileUp.Form("localPOS")
	formaturaPOS			=	SaFileUp.Form("formaturaPOS")
	mestrado				=	SaFileUp.Form("mestrado")
	formaturaMestrado		=	SaFileUp.Form("formaturaMestrado")
	doutorado				=	SaFileUp.Form("doutorado")
	formaturaDoutorado		=	SaFileUp.Form("formaturaDoutorado")
	titulo1					=	SaFileUp.Form("titulo1")
	anoTitulo1				=	SaFileUp.Form("anoTitulo1")
	titulo2					=	SaFileUp.Form("titulo2")
	anoTitulo2				=	SaFileUp.Form("anoTitulo2")
	titulo3					=	SaFileUp.Form("titulo3")
	anoTitulo3				=	SaFileUp.Form("anoTitulo3")
	titulo4					=	SaFileUp.Form("titulo4")
	anoTitulo4				=	SaFileUp.Form("anoTitulo4")
	titulo5					=	SaFileUp.Form("titulo5")
	anoTitulo5				=	SaFileUp.Form("anoTitulo5")
	titulo6					=	SaFileUp.Form("titulo6")
	outroTitulo				=	SaFileUp.Form("outroTituloEspecialista")
	anoOutroTitulo			=	SaFileUp.Form("anoTitulo")
	areaInteresse			=	SaFileUp.Form("areaInteresse")
	enderecoConsultorio		=	SaFileUp.Form("enderecoConsultorio")
	complementoConsultorio	=	SaFileUp.Form("complementoConsultorio")
	numConsultorio			=	SaFileUp.Form("numConsultorio")
	bairroConsultorio		=	SaFileUp.Form("bairroConsultorio")
	cidadeConsultorio		=	SaFileUp.Form("cidadeConsultorio")
	ufConsultorio			=	SaFileUp.Form("ufConsultorio")
	cepConsultorio			=	SaFileUp.Form("cepConsultorio")
	telConsultorio			=	SaFileUp.Form("telConsultorio")
	cep						=	SaFileUp.Form("cep")
	endereco				=	SaFileUp.Form("endereco")
	cidade					=	SaFileUp.Form("cidade")
	estado					=	SaFileUp.Form("estado")
	telefone				=	SaFileUp.Form("telefone")
	celular					=	SaFileUp.Form("celular")
	opcaoResposta			=	SaFileUp.Form("opcaoResposta")

IF tipoCadastro = "cadastrar" THEN

	sqlCadastro = "INSERT INTO corpoclinico"
	sqlCadastro = sqlCadastro & " (nome, atividade, universidade, formaturaGraduacao, residenciaPediatria, inicioPediatria, fimPediatria, outraResidencia, localOutra, inicioOutra, fimOutra,"
	sqlCadastro = sqlCadastro & " posGraduacao, localPOS, formaturaPOS, mestrado, formaturaMestrado, doutorado, formaturaDoutorado, areaInteresse,"
	sqlCadastro = sqlCadastro & " titulo1, anoTitulo1, titulo2, anoTitulo2, titulo3, anoTitulo3, titulo4, anoTitulo4, titulo5, anoTitulo5, outroTitulo, anoTitulo,"
	sqlCadastro = sqlCadastro & " endereco, cidade, estado, cep, telefone, celular, email, opcaoResposta, setor, categoria, foto, dataCadastro,"
	sqlCadastro = sqlCadastro & " enderecoConsultorio, complementoConsultorio, numConsultorio, bairroConsultorio, cidadeConsultorio, ufConsultorio, cepConsultorio, telConsultorio"
	sqlCadastro = sqlCadastro & " ) values"
	sqlCadastro = sqlCadastro & " ('" & nome & "', '" & atividade & "', '" & universidade & "', '" & formaturaGraduacao & "', '" & residenciaPediatria & "', '" & inicioPediatria & "',"
	sqlCadastro = sqlCadastro & " '" & fimPediatria & "', '" & residencia & "', '" & localOutra & "', '" & inicioOutra & "', '" & fimOutra & "', '" & posGraduacao & "', '" & localPOS & "', '" & formaturaPOS & "',"
	sqlCadastro = sqlCadastro & " '" & mestrado & "', '" & formaturaMestrado & "', '" & doutorado & "', '" & formaturaDoutorado & "', '" & areaInteresse & "',"
	sqlCadastro = sqlCadastro & " '" & titulo1 & "', '" & anoTitulo1 & "', '" & titulo2 & "', '" & anoTitulo2 & "', '" & titulo3 & "', '" & anoTitulo3 & "', '" & titulo4 & "', '" & anoTitulo4 & "',"
	sqlCadastro = sqlCadastro & " '" & titulo5 & "', '" & anoTitulo5 & "', '" & outroTitulo & "', '" & anoOutroTitulo & "', '" & endereco & "', '" & cidade & "', '" & estado & "', '"& cep &"',"
	sqlCadastro = sqlCadastro & " '" & telefone & "', '" & celular & "', '" & email & "', '" & opcaoResposta & "', '" & setor & "', 1, '" & nome_arquivo & "', now(),"
	sqlCadastro = sqlCadastro & " '" & enderecoConsultorio & "', '" & complementoConsultorio & "', '" & numConsultorio & "', '" & bairroConsultorio & "', '" & cidadeConsultorio & "', '" & ufConsultorio & "',"
	sqlCadastro = sqlCadastro & " '" & cepConsultorio & "', '" & telConsultorio & "')"


'	Response.Write(sqlCadastro)
'	Response.End()
	ObjDb.execute sqlCadastro
	
	
	sqlUsuario = "INSERT INTO usuario"
	sqlUsuario = sqlUsuario & " (usuario, email, senha, trocaSenha, nivel)"
	sqlUsuario = sqlUsuario & " VALUES ("
	sqlUsuario = sqlUsuario & " '"&nome&"', '"&email&"', '123456', 0, 2)"
'	Response.Write(sqlUsuario)
	ObjDb.execute sqlUsuario
	



mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a �rea administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

ELSE

	
	sqlEdita = "UPDATE corpoclinico SET"
	sqlEdita = sqlEdita &" nome = '" & nome &"', atividade = '" & atividade &"', universidade = '" & universidade &"', formaturaGraduacao = '" & formaturaGraduacao &"'," 
	sqlEdita = sqlEdita &" residenciaPediatria = '" & residenciaPediatria &"', inicioPediatria = '" & inicioPediatria &"', fimPediatria = '" & fimPediatria &"', outraResidencia = '" & residencia &"',"
	sqlEdita = sqlEdita &" inicioOutra = '" & inicioOutra &"', fimOutra = '" & fimOutra &"', localOutra = '"&localOutra&"',"
	sqlEdita = sqlEdita &" posGraduacao = '" & posGraduacao &"', localPOS = '" & localPOS &"', formaturaPOS = '" & formaturaPOS &"',"
	sqlEdita = sqlEdita &" mestrado = '" & mestrado &"', formaturaMestrado = '" & formaturaMestrado &"', doutorado = '" & doutorado &"', formaturaDoutorado = '" & formaturaDoutorado &"',"
	sqlEdita = sqlEdita &" setor = "& setor &", areaInteresse = '" & areaInteresse &"', endereco = '" & endereco &"', telefone = '" & telefone &"', outroTitulo = '"& outroTitulo &"',"
	sqlEdita = sqlEdita &" anoTitulo = '"& anoTitulo &"', titulo1 = '"& titulo1 &"', titulo2 = '"& titulo2 &"', titulo3 = '"& titulo3 &"', titulo4 = '"& titulo4 &"', titulo5 = '"& titulo5 &"',"
	sqlEdita = sqlEdita &" anoTitulo1 = '"& anoTitulo1 &"', anoTitulo2 = '"& anoTitulo2 &"', anoTitulo3 = '"& anoTitulo3 &"', anoTitulo4 = '"& anoTitulo4 &"', anoTitulo5 = '"& anoTitulo5 &"',"
	sqlEdita = sqlEdita &" celular = '" & celular &"', email = '" & email &"', opcaoResposta = '" & opcaoResposta &"', enderecoConsultorio = '" & enderecoConsultorio &"',"
	sqlEdita = sqlEdita &" complementoConsultorio = '"& complementoConsultorio &"', numConsultorio = '"& numConsultorio &"', bairroConsultorio = '"& bairroConsultorio &"',"
	sqlEdita = sqlEdita &" cidadeConsultorio = '"& cidadeConsultorio &"', ufConsultorio = '"& ufConsultorio &"', cepConsultorio = '"& cepConsultorio &"', telConsultorio = '"& telConsultorio &"',"
	sqlEdita = sqlEdita &" cidade = '"& cidade &"', estado = '"& estado &"', cep = '"& cep &"', foto = '"& nome_arquivo &"', aprovado = 0"
	sqlEdita = sqlEdita &" WHERE id = "& idEdita


'	Response.Write("<br /><br />" & sqlEdita & "<br /><br /><hr><br />")
	

	ObjDb.execute sqlEdita
'	Response.End()



mensagem_final = "Foi modificado um cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a �rea administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

END IF


'Enviando e-mail de confirma��o

%>
<!--#include file="emailCadastro.asp" -->
<!--#include file="finalizaCadastro.asp" -->
<!--#include file="conexaoOFF.asp" -->