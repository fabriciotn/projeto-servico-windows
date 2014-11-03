<!--#include file="conexao.asp"-->
<!-- #include file="freeaspupload.asp" -->
<%
usuario = Session("usuario")
Session("usuario") = usuario

Dim uploadsDirVar
  uploadsDirVar = "c:\pulmolab\aulas" 


function SaveFiles
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

    ' If something fails inside the script, but the exception is handled
    If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys
    
     if (UBound(ks) <> -1) then
        SaveFiles = "<B>Files uploaded:</B> "
        for each fileKey in Upload.UploadedFiles.keys
            SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName & " (" & Upload.UploadedFiles(fileKey).Length & "B) "
        next
    else
        SaveFiles = "No file selected for upload or the file name specified in the upload form does not correspond to a valid file in the system."
    end if
    
end function

response.write SaveFiles()

nome = Upload.Form("nome")
obs.Form("obs")
	
'SQL = "INSERT INTO aulas (nome, arquivo, obs, data) VALUES ('"&nome&"', '"&nome_arquivo&"', '"&obs&"', '"&data&"')"
'RESPONSE.Write(SQL)
'response.End()
'ObjDb.execute SQL


	

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Aula cadastrada com sucesso!');
			window.close();
			window.opener.location = "ferramenta_aulas.asp";
			window.opener.focus();
		</script>