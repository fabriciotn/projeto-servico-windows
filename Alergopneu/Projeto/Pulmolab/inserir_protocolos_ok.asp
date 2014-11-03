<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.Charset = "UTF-8"%>
<!-- #include file="conexao.asp" -->
<%
caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))


'----------------------------------------ABRE A PROPIEDADE DE UPLOAD----------------------------------------------------------------------------------------------'
	dim upload
	Set Upload = Server.CreateObject("Dundas.Upload.2") 
	Upload.MaxFileSize = 4194304 
	Upload.UseUniqueNames = false

'----------------------------------CONDIÇÃO PARA POSSÍVEL EXISTÊNCIA DO ARQUIVO-----------------------------------------------------------------------------------'	
	Set objNextFile = Upload.GetNextFile()

fim =lcase(cstr(trim(mid(objNextFile.FileName,InstrRev(objNextFile.FileName,".")+1,len(objNextFile.FileName)))))

if trim(fim) <> "pdf" and fim <> "doc" and fim <> "docx" and fim <> "pdf" and fim <> "xls" and fim <> "xlsx" then
%>
		<script type="text/javascript">
			alert('Erro! O sistema não reconheceu o arquivo enviado. Altere o formato do arquivo e tente novamente.');
			history.go(-1);
		</script>				
	<%
	Response.End()
	end if	


    if Upload.FileExists(caminho&"protocolos/"& objNextFile.FileName) then
		Upload.DeleteFile(caminho&"protocolos/"& objNextFile.FileName)
	end if

		
'---------------------------------------------------SALVA NA PASTA------------------------------------------------------------------------------------------------'

    objNextFile.Save caminho&"protocolos\"	 'Salva o arquivo


'---------------------------------REQUEST NA FOTO... MAS COM A PROPRIEDADE USADA DE UPLOAD------------------------------------------------------------------------'	

    foto = Upload.GetFileName(Upload.Files(0).Path)	'Pega o caminho atual do arquivo salvo

 '-----------------------------------------------------------------------------------------------------------------------------------------------------------------'  

cod = Request.QueryString("cod")

SQL  = "UPDATE protocolos SET arquivo = '"&objNextFile.FileName&"' WHERE cod = " & cod
ObjDb.execute SQL

%>

<html>
	<head>
		<script type="text/javascript">
			alert('Aula inserida com sucesso!');
			window.close();
			window.opener.location = "editar_aula2.asp?cod=<%=cod%>";
			window.opener.focus();
		</script>
	<body>
	</body>
</html>
