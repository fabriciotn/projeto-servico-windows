<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.Charset = "UTF-8"%>
<!-- #include file="conexao.asp" -->
<%
usuario = Session("usuario")
Session("usuario") = usuario

caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))


'----------------------------------------ABRE A PROPIEDADE DE UPLOAD----------------------------------------------------------------------------------------------'
	dim upload
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


    if Upload.FileExists(caminho&"anexo/"& objNextFile.FileName) then%>
		
	<script type="text/javascript">
		alert('Erro! O sistema reconheceu outra imagem cadastrada que possui o mesmo nome. Altere o nome da imagem e tente novamente.');
		history.go(-1);
	</script>		
		
	<%
	Response.End()
	end if

		
'---------------------------------------------------SALVA NA PASTA------------------------------------------------------------------------------------------------'

    objNextFile.Save caminho&"anexo\"	 'Salva o arquivo


'---------------------------------REQUEST NA FOTO... MAS COM A PROPRIEDADE USADA DE UPLOAD------------------------------------------------------------------------'	

    foto = Upload.GetFileName(Upload.Files(0).Path)	'Pega o caminho atual do arquivo salvo

 '-----------------------------------------------------------------------------------------------------------------------------------------------------------------'  

cod = Request.QueryString("cod")
modelo = Request.QueryString("modelo")

sql = "update noticias set imagem1 = '"&objNextFile.FileName&"', modelo = "&modelo&" where cod = " &cod 
objdb.execute sql
%>

<html>
	<head>
		<script type="text/javascript">
			alert('Imagem inserida com sucesso!');
			window.close();
			window.opener.location = "editar_noticia2.asp?cod=<%=cod%>&modelo=<%=modelo%>";
			window.opener.focus();
		</script>
	<body>
	</body>
</html>
