<!--#include file="conexao.asp"-->
<%
	Response.Charset = "iso-8859-1"

caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))

'----------------------------------------ABRE A PROPIEDADE DE UPLOAD----------------------------------------------------------------------------------------------'
	dim Upload
	Set Upload = Server.CreateObject("Dundas.Upload.2") 
	Upload.MaxFileSize = 4194304 
	Upload.UseUniqueNames = false

'----------------------------------CONDIÇÃO PARA POSSÍVEL EXISTÊNCIA DO ARQUIVO-----------------------------------------------------------------------------------'	
	Set objNextFile = Upload.GetNextFile()

fim =lcase(cstr(trim(mid(objNextFile.FileName,InstrRev(objNextFile.FileName,".")+1,len(objNextFile.FileName)))))

	if trim(fim) <> "bmp" and fim <> "jpg" and fim <> "jpeg" and fim <> "gif" and fim <> "png" and fim <> "tif" and fim <> "tiff" then
%>
		<script type="text/javascript">
			alert('Erro! O sistema não reconheceu o arquivo enviado como imagem. Altere o formato do arquivo e tente novamente.');
			history.go(-1);
		</script>				
	<%
	Response.End()
	end if	


    if Upload.FileExists(caminho&"img/"& objNextFile.FileName) then%>
		
	<script type="text/javascript">
		alert('Erro! O sistema reconheceu outra imagem cadastrada que possui o mesmo nome. Altere o nome da imagem e tente novamente.');
		history.go(-1);
	</script>		
		
	<%
	Response.End()
	end if

		
'---------------------------------------------------SALVA NA PASTA------------------------------------------------------------------------------------------------'

    objNextFile.Save caminho&"img\"	 'Salva o arquivo


'---------------------------------REQUEST NA FOTO... MAS COM A PROPRIEDADE USADA DE UPLOAD------------------------------------------------------------------------'	

    foto = Upload.GetFileName(Upload.Files(0).Path)	'Pega o caminho atual do arquivo salvo

 '-----------------------------------------------------------------------------------------------------------------------------------------------------------------'  


' PEGA VARIAVEIS


	nome					=	Upload.Form("nome")
	atividade				=	Upload.Form("atividade")
	universidade			=	Upload.Form("universidade")
	formaturaGraduacao		=	Upload.Form("formaturaGraduacao")
	residenciaPediatria		=	Upload.Form("residenciaPediatria")
	inicioPediatria			=	Upload.Form("inicioPediatria")
	fimPediatria			=	Upload.Form("fimPediatria")
	residencia				=	Upload.Form("residencia")
	localOutra				=	Upload.Form("localOutra")
	inicioOutra				=	Upload.Form("inicioOutra")
	fimOutra				=	Upload.Form("fimOutra")
	posGraduacao			=	Upload.Form("posGraduacao")
	localPOS				=	Upload.Form("localPOS")
	formaturaPOS			=	Upload.Form("formaturaPOS")
	mestrado				=	Upload.Form("mestrado")
	formaturaMestrado		=	Upload.Form("formaturaMestrado")
	doutorado				=	Upload.Form("doutorado")
	formaturaDoutorado		=	Upload.Form("formaturaDoutorado")
	tituloEspecialista		=	Upload.Form("tituloEspecialista")
	tituloEspecialista	 	=	tituloEspecialista & ", " & Upload.Form("outroTituloEspecialista")
	anoTitulo				=	Upload.Form("anoTitulo")
	areaInteresse			=	Upload.Form("areaInteresse")
	enderecoConsultorio		=	Upload.Form("enderecoConsultorio")
	telConsultorio			=	Upload.Form("telConsultorio")
	endereco				=	Upload.Form("endereco")
	telefone				=	Upload.Form("telefone")
	celular					=	Upload.Form("celular")
	email					=	Upload.Form("email")
	opcaoResposta			=	Upload.Form("opcaoResposta")

	
	sqlCadastro = "INSERT INTO ex_corpoclinico"
	sqlCadastro = sqlCadastro &" (nome, localOutra, atividade, universidade, formaturaGraduacao, residenciaPediatria, inicioPediatria, fimPediatria, outraResidencia, inicioOutra, fimOutra,"
	sqlCadastro = sqlCadastro &" posGraduacao, localPOS, formaturaPOS, mestrado, formaturaMestrado, doutorado, formaturaDoutorado, tituloEspecialista, areaInteresse, endereco, telefone, "
	sqlCadastro = sqlCadastro &" celular, email, opcaoResposta, enderecoConsultorio, telConsultorio, anoTitulo, foto) values"
	sqlCadastro = sqlCadastro &" ('" & nome & "', '" & localOutra & "', '" & atividade & "', '" & universidade & "', '" & formaturaGraduacao & "', '" & residenciaPediatria & "', '" & inicioPediatria & "',"
	sqlCadastro = sqlCadastro &" '" & fimPediatria & "', '" & residencia & "', '" & inicioOutra & "', '" & fimOutra & "', '" & posGraduacao & "', '" & localPOS & "', '" & formaturaPOS & "',"
	sqlCadastro = sqlCadastro &" '" & mestrado & "', '" & formaturaMestrado & "', '" & doutorado & "', '" & formaturaDoutorado & "', '" & tituloEspecialista & "', '" & areaInteresse & "', '" & endereco & "',"
	sqlCadastro = sqlCadastro &" '" & telefone & "', '" & celular & "', '" & email & "', '" & opcaoResposta & "', '" & enderecoConsultorio & "', '" & telConsultorio & "', '" & anoTitulo & "', '"&foto&"')"


'	Response.Write(sqlCadastro)
'	response.End()
	ObjDb.execute sqlCadastro

	
	sql = "SELECT id, nome, telefone, email FROM ex_corpoclinico ORDER BY id DESC LIMIT 1"
	set rs = server.CreateObject("ADODB.RecordSet")
	rs.Open sql, ObjDB, 3, 1
	
		id = rs("id")
		nome = rs("nome")
		email = rs("email")
		telefone = rs("telefone")
		
	rs.Close

'Enviando e-mail de confirmação



mensagem_final = "Foi efetuado um novo cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href=""http://testes.hbatecnologia.com/pulmolab2010/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."



html = "<html><body style=""font-size:8pt; font-family:tahoma; font-wight:bold;"">"

html =	html & "<div style=""background-color:#FBFBFB; width:400px; margin:auto; border:#CCCCCC 1px solid; padding:10px 10px 10px 10px"">"

html =	html & "<h3>Prezado(a) Administrador(a):</h3>"

html =	html & "<h5>"&usuario&"</h5>"

html = html & "<div style=""padding-left: 120px;""><img src=""http://testes.hbatecnologia.com/pulmolab2010/img/logo.png"" /></div>"

html =	html & "<hr noshade=""noshade"">"

html =	html & "<br><div style=""background-color:#FBFBFB; color: #2F4A75; border:#CCCCCC 1px solid; padding:5px 5px 5px 5px; font-size:9pt; width:380px;"">"

html =	html & "<div align=""left""><br />"

html =	html & "<span style=""font-size: 9pt;"">"&mensagem_final&"</span><br />"

html =	html & "<br />"

html =	html & "</div>"

html =	html & "</div>"

html =	html & "<p>Não responda este e-mail, ele foi enviado automaticamente pelo sistema. </p>"

html =	html & "</div></body></html>"



assunto = "Área Administrativa - Confirmação de cadastro"





'======================== INFORMACOES ======================='

    

      caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")),InstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

'======================== ENVIA O EMAIL ====================='



            sch = "http://schemas.microsoft.com/cdo/configuration/"

    

            Set cdoConfig = CreateObject("CDO.Configuration") 

            

            With cdoConfig.Fields 

                .Item(sch & "sendusing") = 2

                .Item(sch & "smtpserver") = "localhost" 

                .Item(sch & "smtpserverport") = 25

                .Item(sch & "connectiontimeout") = 50

                .update 

            End With 

            

            Set cdoMessage = CreateObject("CDO.Message")                     



            With cdoMessage

            

            Set .Configuration = cdoConfig 

                .From     = "Portal PULMOLAB <hbatools@hbatools.com.br>"

                .To       = "wesley.cruz@hbatecnologia.com.br"

                .Subject  = "CONFIRMAÇÃO DE CADASTRO"

                .HtmlBody = HTML 

                

                .Send 

            End With 


'	RESPONSE.Write(html)
'	Response.End()
	
	
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_exCorpo.asp";
			window.opener.focus();
		</script>