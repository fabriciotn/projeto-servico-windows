<%

assuntoEmail = "CONFIRMAÇÃO DE CADASTRO"

'Instancia o componente
    SET SaFileUp = Server.CreateObject("SoftArtisans.FileUp") 

	idEdita					=	SaFileUp.Form("idRegistro")
	email					=	SaFileUp.Form("email")
'	Response.Write("email: "&email&"<br />")
'idRegistro						=		Session("idRegistro")
'id								=		idRegistro

IF idEdita <> "" THEN

assuntoEmail = "ATUALIZAÇÃO DE CADASTRO"

	sqlSELECT = "SELECT email, id, foto FROM corpoclinico WHERE id = " & idEdita
	
'	Response.Write(sqlSelect)
'	Response.End()
	
	set rs = server.CreateObject("ADODB.RecordSet")
	
	rs.open sqlSELECT, objdb,3,1
	
	if not rs.EOF then
	
		emailRegistro = rs("email")
		fotoAntiga = rs("foto")

	end if
	
	Set rs = Nothing

END IF
'		Response.Write("EMAIL <br /><br />:"& email &"<br /><br />")
'		Response.End()


'******************			UPLOAD DE FOTO E CURRICULO *****************************



	pastaNova = "foto\" 


	caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))
	
	set fs=createobject("scripting.filesystemobject") 

IF emailRegistro <> "" THEN

	pastaAntiga = "foto\" 'E-mail puxado do banco
'	Response.Write(pastaAntiga&"||||")

'	Response.Write("emailBanco: "&emailRegistro)
'	Response.Write("<br />E-mail novo: "&email)
'	Response.Write("<br />Pasta Antiga: "&pastaAntiga)
'	Response.Write("<br />Pasta Nova: "&pastaNova)
	
'	If fs.folderexists(caminho&pastaAntiga) then 

'	Response.Write("<br />Transferencia de pasta")
'		fs.MoveFolder caminho&pastaAntiga, caminho&pastaNova
		
'	END IF

ELSE

'	Response.Write("sem email do banco<br />")
	
		IF NOT fs.folderexists(caminho&pastaNova) THEN
	
'	Response.Write("Criada nova pasta ")
			fs.createfolder(caminho&pastaNova) 
	
		END IF
	
END IF

'Response.Write(pastaNova)

'Configura o caminho onde arquivo será salvo
SaFileUp.Path = Server.MapPath(pastaNova)


'Caso o usuário não indique um arquivo para upload, informa erro.
If SaFileUp.IsEmpty Then
	textoQualquer = "nenhuma foto enviada"
	nome_arquivo = fotoAntiga
'	Response.End()
ELSE
		'Salva o arquivo no servidor
		
'			Response.Write("<br /><br />ITEM:___"&item)
'			Response.End()


			nome_arquivo = SaFileUp.Form("imagem").ShortFileName

				pos = instr(nome_arquivo, ".")

'					Response.Write("*Posicao do ponto: " & pos & "*<br />")

				extensao = mid( nome_arquivo, pos, len(nome_arquivo) )

'					Response.Write("*Extencao: " & extensao & "*<br />")
'					Response.Write("*Nome inicial do arquivo: " & nome_arquivo & "*<br />")

				nome = Replace( nome_arquivo, extensao, "")
				nome_arquivo = nome & "_" & day(now) & "_" & month(now) & "_" & year(now) & extensao
				
'					Response.Write("<br />*NOME= " & nome_arquivo & "*<br />")

'					Response.Write("<br />teste<br />:"&caminho&"PASTA:______"&pasta&"\ARQUIVO___"&curriculo)

'					Response.End()						

				If fs.FileExists(caminho&pastaNova&"\"&fotoAntiga) then 		' SE JA EXISTE UM CURRICULO NA PASTA DESTE USUARIO ESTE SERÁ DELETADO PARA INSERIR O + RECENTE
				
					
'					Response.Write("<br />teste<br 	/>:"&caminho&"PASTA:______"&pasta&"\"&curriculo)
				
					fs.DeleteFile(caminho&pastaNova&"\"&fotoAntiga) 
				
'					Response.End()						
				
				End If
				SaFileUp.Form("imagem").SaveAs 	nome_arquivo				


'				Response.Write("<br />SQL :"&SQL)

'		Response.End()
End if

'*****************			FIM DO UPLOADO PROXIMO PASSO PEGAR VARIAVEIS \/			******************
%>