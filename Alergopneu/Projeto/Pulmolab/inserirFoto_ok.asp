<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%'Response.Charset = "UTF-8"%>
<!-- #include file="conexao.asp" -->
<%
	ultima_pagina = Session("ultima_pagina")
	Session ("ultima_pagina") = ultima_pagina

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

id = Session("id")
'categoria = Session("categoria")

sql = "update corpoclinico set foto = '"&foto&"' where id = " &id '&" and categoria = "&categoria
Response.Write(sql)
objdb.execute sql

IF ultima_pagina = "http://testes.hbatools.com.br/pulmolab2010/ferramenta_corpo.asp" THEN
	url = "ferramenta_corpo.asp"

%>

<html>
	<head>
		<script type="text/javascript">
			alert('Imagem inserida com sucesso!');
			window.close();
			window.opener.location = "ferramenta_corpo.asp";
			window.opener.focus();
		</script>
	<body>
	</body>
</html>
<%
ELSE
%>
<html>
	<head>
		<script type="text/javascript">
			alert('Imagem inserida com sucesso!');
			window.close();
			window.location = "corpo_clinico.asp";
		</script>
	<body>
	</body>
</html>
<%END IF%>