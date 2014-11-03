<!--#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))


'----------------------------------------ABRE A PROPIEDADE DE UPLOAD----------------------------------------------------------------------------------------------'
	dim Upload
	Set Upload = Server.CreateObject("Dundas.Upload.2") 
	Upload.MaxFileSize = 4194304 
	Upload.UseUniqueNames = false

'----------------------------------CONDIÇÃO PARA POSSÍVEL EXISTÊNCIA DO ARQUIVO-----------------------------------------------------------------------------------'	

	Set objNextFile = Upload.GetNextFile()

fim =lcase(cstr(trim(mid(objNextFile.FileName,InstrRev(objNextFile.FileName,".")+1,len(objNextFile.FileName)))))

if trim(fim) <> "bmp" and fim <> "jpg" and fim <> "jpeg" and fim <> "gif" and fim <> "png" and fim <> "tif" and fim <> "tiff" and fim <> "doc" and fim <> "docx" and fim <> "pdf" then
%>
		<script type="text/javascript">
			alert('Erro! O sistema não reconheceu o arquivo enviado. Altere o formato do arquivo e tente novamente.');
			history.go(-1);
		</script>				
	<%
	Response.End()
	end if	


    if Upload.FileExists(caminho&"anexo/"& objNextFile.FileName) then%>
		
	<script type="text/javascript">
		alert('Erro! O sistema reconheceu outro arquivo cadastrada que possui o mesmo nome. Altere o nome do arquivo e tente novamente.');
		history.go(-1);
	</script>		
		
	<%
	Response.End()
	end if

'---------------------------------------------------SALVA NA PASTA------------------------------------------------------------------------------------------------'

    objNextFile.Save caminho&"anexo\"	 'Salva o arquivo


'---------------------------------REQUEST NO ANEXO... MAS COM A PROPRIEDADE USADA DE UPLOAD------------------------------------------------------------------------'	

    anexo = Upload.GetFileName(Upload.Files(0).Path)	'Pega o caminho atual do arquivo salvo

 '-----------------------------------------------------------------------------------------------------------------------------------------------------------------'  
	usuario = Session("usuario")
	Session("usuario") = usuario


titulo = Upload.form("titulo")
autor = Upload.form("autor")
data = Upload.form("data")

noticia = Upload.form("texto")



titulo = replace(titulo,"'","")
titulo = replace(titulo,"<","")
titulo = replace(titulo,">","")
titulo = replace(titulo,chr(13),"<br>")


noticia = replace(noticia,"'","")
noticia = replace(noticia,"<","")
noticia = replace(noticia,">","")
noticia = replace(noticia,chr(13),"<br>")




SQL = "INSERT INTO noticias (titulo, data, noticia, anexo, autor) values ('"&titulo&"', curDate(), '"&noticia&"', '"&anexo&"', '"&autor&"')"



ObjDb.execute SQL


Set ObjDb = Nothing
response.redirect("http://testes.hbatools.com.br/iot/ferramenta_noticias.asp")

%>
