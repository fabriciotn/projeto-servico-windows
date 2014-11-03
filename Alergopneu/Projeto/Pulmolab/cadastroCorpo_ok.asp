<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<!-- #include file="freeaspupload.asp" -->
<%
	Response.Charset = "iso-8859-1"
	
Dim uploadsDirVar
  uploadsDirVar = "c:\pulmolab\foto" 
  

%>
<!-- #include file="funcaoUpload.asp" -->
<%


	tipoCadastro 					=	Lcase(Upload.Form("tipoCadastro"))
	volta							=	Upload.Form("volta")

	idEdita					=	Upload.Form("idRegistro")
	email					=	Upload.Form("email")
	
'REQUEST DOS CAMPOS

	setor					=	Upload.Form("setor")
	nome					=	Upload.Form("nome")
	atividade				=	Upload.Form("atividade")
	universidade			=	Upload.Form("universidade")
	formaturaGraduacao		=	Upload.Form("formaturaGraduacao")
	residenciaPediatria		=	Upload.Form("residenciaPediatria")
	inicioPediatria			=	Upload.Form("inicioPediatria")
	fimPediatria			=	Upload.Form("fimPediatria")
	residencia				=	Upload.Form("residencia")
	localOutra				=	Upload.Form("localResidencia")
	inicioOutra				=	Upload.Form("inicioOutra")
	fimOutra				=	Upload.Form("fimOutra")
	posGraduacao			=	Upload.Form("posGraduacao")
	localPOS				=	Upload.Form("localPOS")
	formaturaPOS			=	Upload.Form("formaturaPOS")
	mestrado				=	Upload.Form("mestrado")
	formaturaMestrado		=	Upload.Form("formaturaMestrado")
	doutorado				=	Upload.Form("doutorado")
	formaturaDoutorado		=	Upload.Form("formaturaDoutorado")
	titulo1					=	Upload.Form("titulo1")
	anoTitulo1				=	Upload.Form("anoTitulo1")
	titulo2					=	Upload.Form("titulo2")
	anoTitulo2				=	Upload.Form("anoTitulo2")
	titulo3					=	Upload.Form("titulo3")
	anoTitulo3				=	Upload.Form("anoTitulo3")
	titulo4					=	Upload.Form("titulo4")
	anoTitulo4				=	Upload.Form("anoTitulo4")
	titulo5					=	Upload.Form("titulo5")
	anoTitulo5				=	Upload.Form("anoTitulo5")
	titulo6					=	Upload.Form("titulo6")
	outroTitulo				=	Upload.Form("outroTituloEspecialista")
	anoOutroTitulo			=	Upload.Form("anoTitulo")
	areaInteresse			=	Upload.Form("areaInteresse")
	enderecoConsultorio		=	Upload.Form("enderecoConsultorio")
	complementoConsultorio	=	Upload.Form("complementoConsultorio")
	numConsultorio			=	Upload.Form("numConsultorio")
	bairroConsultorio		=	Upload.Form("bairroConsultorio")
	cidadeConsultorio		=	Upload.Form("cidadeConsultorio")
	ufConsultorio			=	Upload.Form("ufConsultorio")
	cepConsultorio			=	Upload.Form("cepConsultorio")
	telConsultorio			=	Upload.Form("telConsultorio")
	cep						=	Upload.Form("cep")
	endereco				=	Upload.Form("endereco")
	cidade					=	Upload.Form("cidade")
	estado					=	Upload.Form("estado")
	telefone				=	Upload.Form("telefone")
	celular					=	Upload.Form("celular")
	opcaoResposta			=	Upload.Form("opcaoResposta")

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
	

mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

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
	

'	ObjDb.execute sqlEdita
'	Response.End()


END IF


'Enviando e-mail de confirmação

%>
<!--#include file="emailCadastro.asp" -->
<!--#include file="finalizaCadastro.asp" -->
<!--#include file="conexaoOFF.asp" -->
