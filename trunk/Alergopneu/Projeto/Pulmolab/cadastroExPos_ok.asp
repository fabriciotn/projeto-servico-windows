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

'REQUEST DOS CAMPOS

	nome					=	Upload.Form("nome")
	inicioTreinamento		=	Upload.Form("inicioTreinamento")
	fimTreinamento			=	Upload.Form("fimTreinamento")
	cargoAtual				=	Upload.Form("cargoAtual")
	atividade				=	Upload.Form("atividade")
	universidade			=	Upload.Form("universidade")
	formaturaGraduacao		=	Upload.Form("formaturaGraduacao")
	residenciaPediatria		=	Upload.Form("residenciaPediatria")
	inicioPediatria			=	Upload.Form("inicioPediatria")
	fimPediatria			=	Upload.Form("fimPediatria")
	residencia				=	Upload.Form("residencia")
	inicioOutra				=	Upload.Form("inicioOutra")
	fimOutra				=	Upload.Form("fimOutra")
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
	posGraduacao			=	Upload.Form("posGraduacao")
	formaturaPOS			=	Upload.Form("formaturaPOS")
	mestrado				=	Upload.Form("mestrado")
	formaturaMestrado		=	Upload.Form("formaturaMestrado")
	doutorado				=	Upload.Form("doutorado")
	formaturaDoutorado		=	Upload.Form("formaturaDoutorado")
	enderecoConsultorio		=	Upload.Form("enderecoConsultorio")
	complementoConsultorio	=	Upload.Form("complementoConsultorio")
	numConsultorio			=	Upload.Form("numConsultorio")
	bairroConsultorio		=	Upload.Form("bairroConsultorio")
	cidadeConsultorio		=	Upload.Form("cidadeConsultorio")
	ufConsultorio			=	Upload.Form("ufConsultorio")
	cepConsultorio			=	Upload.Form("cepConsultorio")
	telConsultorio			=	Upload.Form("telConsultorio")
	areaInteresse			=	Upload.Form("areaInteresse")
	endereco				=	Upload.Form("endereco")
	cidade					=	Upload.Form("cidade")
	estado					=	Upload.Form("estado")
	cep						=	Upload.Form("cep")
	telefone				=	Upload.Form("telefone")
	celular					=	Upload.Form("celular")
	email					=	Upload.Form("email")
	opcaoResposta			=	Upload.Form("opcaoResposta")

	
IF tipoCadastro = "cadastrar" THEN
	
	sqlCadastro = "INSERT INTO corpoClinico"
	sqlCadastro = sqlCadastro &" (nome, cargoAtual, atividade, universidade, formaturaGraduacao, residenciaPediatria, inicioPediatria, fimPediatria, outraResidencia, inicioOutra, fimOutra,"
	sqlCadastro = sqlCadastro &" posGraduacao, formaturaPOS, mestrado, formaturaMestrado, doutorado, formaturaDoutorado, areaInteresse, telefone, celular,email, opcaoResposta,"
	sqlCadastro = sqlCadastro &" inicioTreinamento, fimTreinamento, categoria, dataCadastro, endereco, cidade, estado, cep,"
	sqlCadastro = sqlCadastro &" titulo1, anoTitulo1, titulo2, anoTitulo2, titulo3, anoTitulo3, titulo4, anoTitulo4, titulo5, anoTitulo5, outroTitulo, anoTitulo,"
	sqlCadastro = sqlCadastro &" enderecoConsultorio, complementoConsultorio, numConsultorio, bairroConsultorio, cidadeConsultorio, ufConsultorio, cepConsultorio, telConsultorio, foto)"
	sqlCadastro = sqlCadastro &" values ('" & nome & "', '" & cargoAtual & "', '" & atividade & "', '" & universidade & "', '" & formaturaGraduacao & "', '" & residenciaPediatria & "', '" & inicioPediatria & "',"
	sqlCadastro = sqlCadastro &" '" & fimPediatria & "', '" & residencia & "', '" & inicioOutra & "', '" & fimOutra & "', '" & posGraduacao & "', '" & formaturaPOS & "',"
	sqlCadastro = sqlCadastro &" '" & mestrado & "', '" & formaturaMestrado & "', '" & doutorado & "', '" & formaturaDoutorado & "', '" & areaInteresse & "',"
	sqlCadastro = sqlCadastro &" '" & telefone & "', '" & celular & "', '" & email & "', '" & opcaoResposta & "', '" & inicioTreinamento & "', '" & fimTreinamento & "', 4, now(),"
	sqlCadastro = sqlCadastro &" '" & endereco & "', '" & cidade & "', '" & estado & "', '" & cep & "',"
	sqlCadastro = sqlCadastro & " '" & titulo1 & "', '" & anoTitulo1 & "', '" & titulo2 & "', '" & anoTitulo2 & "', '" & titulo3 & "', '" & anoTitulo3 & "', '" & titulo4 & "', '" & anoTitulo4 & "',"
	sqlCadastro = sqlCadastro & " '" & titulo5 & "', '" & anoTitulo5 & "', '" & outroTitulo & "', '" & anoOutroTitulo & "',"
	sqlCadastro = sqlCadastro & " '" & enderecoConsultorio & "', '" & complementoConsultorio & "', '" & numConsultorio & "', '" & bairroConsultorio & "', '" & cidadeConsultorio & "', '" & ufConsultorio & "',"
	sqlCadastro = sqlCadastro & " '" & cepConsultorio & "', '" & telConsultorio & "', '" & nome_arquivo & "')"
	
'	Response.Write(sqlCadastro)
'	Response.End()
		
	ObjDb.execute sqlCadastro



mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

ELSE

	sqlEdita = "UPDATE corpoClinico SET"
	sqlEdita = sqlEdita &" nome = '" & nome &"', localOutra = '" & localOutra &"', atividade = '" & atividade &"', universidade = '" & universidade &"', formaturaGraduacao = '" & formaturaGraduacao &"'," 
	sqlEdita = sqlEdita &" residenciaPediatria = '" & residenciaPediatria &"', inicioPediatria = '" & inicioPediatria &"', fimPediatria = '" & fimPediatria &"', outraResidencia = '" & residencia &"',"
	sqlEdita = sqlEdita &" inicioOutra = '" & inicioOutra &"', fimOutra = '" & fimOutra & "', inicioTreinamento = '" & inicioTreinamento &"', fimTreinamento = '" & fimTreinamento &"', posGraduacao = '" & posGraduacao &"', localPOS = '" & localPOS &"', formaturaPOS = '" & formaturaPOS &"',"
	sqlEdita = sqlEdita &" mestrado = '" & mestrado &"', formaturaMestrado = '" & formaturaMestrado &"', doutorado = '" & doutorado &"', formaturaDoutorado = '" & formaturaDoutorado &"',"
	sqlEdita = sqlEdita &" titulo1 = '"& titulo1 &"', titulo2 = '"& titulo2 &"', titulo3 = '"& titulo3 &"', titulo4 = '"& titulo4 &"', titulo5 = '"& titulo5 &"',"
	sqlEdita = sqlEdita &" anoTitulo = '"& anoOutroTitulo &"', outroTitulo = '"& outroTitulo &"',"
	sqlEdita = sqlEdita &" anoTitulo1 = '"& anoTitulo1 &"', anoTitulo2 = '"& anoTitulo2 &"', anoTitulo3 = '"& anoTitulo3 &"', anoTitulo4 = '"& anoTitulo4 &"', anoTitulo5 = '"& anoTitulo5 &"',"
	sqlEdita = sqlEdita &" celular = '" & celular &"', email = '" & email &"', opcaoResposta = '" & opcaoResposta &"', enderecoConsultorio = '" & enderecoConsultorio &"',"
	sqlEdita = sqlEdita &" complementoConsultorio = '"& complementoConsultorio &"', numConsultorio = '"& numConsultorio &"', bairroConsultorio = '"& bairroConsultorio &"',"
	sqlEdita = sqlEdita &" cidadeConsultorio = '"& cidadeConsultorio &"', ufConsultorio = '"& ufConsultorio &"', cepConsultorio = '"& cepConsultorio &"', telConsultorio = '"& telConsultorio &"',"
	sqlEdita = sqlEdita &" foto = '"& nome_arquivo &"', aprovado = 0,"
	sqlEdita = sqlEdita &" endereco = '"& endereco &"', cidade = '"& cidade &"', estado = '"& estado &"', cep = '"& cep &"',"
	sqlEdita = sqlEdita &" opcaoResposta  = '" & opcaoResposta & "' WHERE id = " & idEdita
	
	'Response.Write(sqlEdita)

	ObjDb.execute sqlEdita
	'response.End()	



mensagem_final = "Foi modificado um cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

END IF


'Enviando e-mail de confirmação

%>
<!--#include file="emailCadastro.asp" -->

<!--#include file="conexaoOFF.asp" -->

<!--#include file="finalizaCadastro.asp" -->