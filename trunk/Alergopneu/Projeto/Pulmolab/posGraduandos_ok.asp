<!--#include file="conexao.asp"-->
<!--#include file="salvaFoto.asp"-->
<%
	Response.Charset = "utf-8"
	

	tipoCadastro 					=	Lcase(SaFileUp.Form("tipoCadastro"))
	volta							=	SaFileUp.Form("volta")

'REQUEST DOS CAMPOS

	nome						=	SaFileUp.Form("nome")
	inicioTreinamento		=	SaFileUp.Form("inicioTreinamento")
	fimTreinamento			=	SaFileUp.Form("fimTreinamento")
	universidade			=	SaFileUp.Form("universidade")
	formaturaGraduacao	=	SaFileUp.Form("formaturaGraduacao")
	residenciaPediatria	=	SaFileUp.Form("residenciaPediatria")
	inicioPediatria		=	SaFileUp.Form("inicioPediatria")
	fimPediatria			=	SaFileUp.Form("fimPediatria")
	residencia				=	SaFileUp.Form("outraResidencia")
	inicioOutra				=	SaFileUp.Form("inicioOutra")
	fimOutra					=	SaFileUp.Form("fimOutra")
	endereco					=	SaFileUp.Form("endereco")
	cep						=	SaFileUp.Form("cep")
	estado					=	SaFileUp.Form("estado")
	cidade					=	SaFileUp.Form("cidade")
	telefone					=	SaFileUp.Form("telefone")
	celular					=	SaFileUp.Form("celular")
	email						=	SaFileUp.Form("email")
	opcaoResposta			=	SaFileUp.Form("opcaoResposta")


IF tipoCadastro = "cadastrar" THEN
	
	SQL = "INSERT INTO corpoclinico"
	SQL = SQL &" (nome, foto, universidade, formaturaGraduacao, residenciaPediatria, inicioPediatria, fimPediatria, outraResidencia, inicioOutra, fimOutra,"
	SQL = SQL &"  cep, cidade, estado, dataCadastro,"
	SQL = SQL &"  endereco, telefone, celular, email, opcaoResposta, inicioTreinamento, fimTreinamento, categoria)"
	SQL = SQL &" values ('" & nome & "', '" & nome_arquivo & "', '" & universidade & "', '" & formaturaGraduacao & "', '" & residenciaPediatria & "', '" & inicioPediatria & "',"
	SQL = SQL &" '" & fimPediatria & "', '" & residencia & "', '" & inicioOutra & "', '" & fimOutra & "',"
	SQL	= SQL &" '" & cep & "', '" & cidade & "', '" & estado & "', now(),"
	SQL = SQL &" '" & endereco & "', '" & telefone & "', '" & celular & "', '" & email & "', '" & opcaoResposta & "', '" & inicioTreinamento & "', '" & fimTreinamento & "', 3)"
	
'	Response.Write(SQL)
	
	ObjDb.execute SQL


	sqlUsuario = "INSERT INTO usuario"
	sqlUsuario = sqlUsuario & " (usuario, email, senha, trocaSenha, nivel)"
	sqlUsuario = sqlUsuario & " VALUES ("
	sqlUsuario = sqlUsuario & " '"&nome&"', '"&email&"', '123456', 0, 3)"
'	Response.Write(sqlUsuario)
	ObjDb.execute sqlUsuario

	
	sql = "SELECT id, nome, telefone, email FROM corpoclinico ORDER BY id DESC LIMIT 1"
	set rs = server.CreateObject("ADODB.RecordSet")
	rs.Open sql, ObjDB, 3, 1
	
		id = rs("id")
		nome = rs("nome")
		email = rs("email")
		telefone = rs("telefone")
		
	rs.Close


mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

ELSE

	sqlEdita = "UPDATE corpoclinico SET"
	sqlEdita = sqlEdita &" nome = '" & nome & "', universidade = '" & universidade & "', formaturaGraduacao = '" & formaturaGraduacao & "', residenciaPediatria = '" & residenciaPediatria & "',"
	sqlEdita = sqlEdita &" inicioPediatria = '" & inicioPediatria & "', fimPediatria = '" & fimPediatria & "', outraResidencia = '" & outraResidencia & "', inicioOutra = '" & inicioOutra & "',"
	sqlEdita = sqlEdita &" fimOutra = '" & fimOutra & "', telefone = '" & telefone & "', celular = '" & celular & "', email = '" & email & "',"
	sqlEdita = sqlEdita &" endereco = '" & endereco & "', cidade = '"& cidade &"', estado = '"& estado &"', cep = '"& cep &"',"
	sqlEdita = sqlEdita &" opcaoResposta = '" & opcaoResposta & "', foto = '" & nome_arquivo & "', aprovado = 0 WHERE id = " & idEdita
	

'	Response.Write("<br /><br />" & sqlEdita & "<br /><br /><hr><br />")
	

	ObjDb.execute sqlEdita
	
mensagem_final = "Foi modificado um cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."

END IF

'Enviando e-mail de confirmação

%>
<!--#include file="emailCadastro.asp" -->

<!--#include file="conexaoOFF.asp" -->

<!--#include file="finalizaCadastro.asp" -->