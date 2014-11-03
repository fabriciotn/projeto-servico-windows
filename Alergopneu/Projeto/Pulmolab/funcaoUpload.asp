<%
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	' If something fails inside the script, but the exception is handled
	'If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys
    if (UBound(ks) <> -1) then
        SaveFiles = "<B>Files uploaded:</B> "
        for each fileKey in Upload.UploadedFiles.keys            
	    nome_arquivo = Upload.UploadedFiles(fileKey).FileName
	    set fs=createobject("scripting.filesystemobject") 
	    Set fileName = fs.GetFile(uploadsDirVar & "\" & nome_arquivo)
	    pos = instr(nome_arquivo, ".")
	    extensao = mid( nome_arquivo, pos, len(nome_arquivo) )
	    nome = Replace( nome_arquivo, extensao, "")
	    nome_arquivo = nome & "_" & day(now) & "_" & month(now) & "_" & year(now) & extensao
	    If fs.FileExists(uploadsDirVar & "\" & nome_arquivo) then
		fs.DeleteFile(uploadsDirVar & "\" & nome_arquivo)
	    End If
	    fileName.Name = nome_arquivo		
        next
    else
        SaveFiles = "No file selected for upload or the file name specified in the upload form does not correspond to a valid file in the system."
    end if	

	response.write(nome_arquivo)
%>