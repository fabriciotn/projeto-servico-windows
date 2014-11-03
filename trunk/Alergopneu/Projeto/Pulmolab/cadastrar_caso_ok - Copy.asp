<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))

	pasta = "casoclinico"

'Instancia o componente
    SET SaFileUp = Server.CreateObject("SoftArtisans.FileUp") 

    'Configura o caminho onde arquivo será salvo
    SaFileUp.Path = Server.MapPath(pasta)

    'Caso o usuário não indique um arquivo para upload, informa erro.
    If SaFileUp.IsEmpty = false Then
        'Salva o arquivo no servidor
		nome = SaFileUp.Form("arquivo").ShortFileName
		extensao = mid( SaFileUp.Form("arquivo").ShortFileName, instr(SaFileUp.Form("arquivo").ShortFileName, "."), 4 )
		nome_arquivo = nome & "_" & year(now) & "_" & month(now) & "_" & day(now) & extensao
		
        if SaFileUp.Form("arquivo").ShortFileName <> "" then
			SaFileUp.Form("arquivo").SaveAs Server.MapPath(pasta) & "\" & nome_arquivo
        end if
    End if


	titulo = SaFileUp.Form("titulo")
	texto = SaFileUp.Form("texto")
	autor = SaFileUp.Form("autor")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	data = SaFileUp.Form("data")
	data = year(data) & "-" & month(data) & "-" & day(data)


sql = "INSERT INTO casoclinico (autor, data, data_cadastro, titulo, texto, arquivo) values ('"&autor&"', '"&data&"', now(), '"&titulo&"', '"&texto&"', '"&nome_arquivo&"')"
'RESPONSE.Write(sql)
'response.End()
objdb.execute sql


'sql = "select cod from noticias where data = '"&dataFinal&"'"
'set rs = Server.CreateObject("ADODB.RecordSet")
'response.Write(sql)
'response.End()
'rs.Open sql, objdb, 3, 1

'IF rs.eof = false THEN
'cod = rs("cod")

'END IF
'rs.Close

'Response.Redirect("cadastrar_noticia2.asp?cod="&cod)
%>

		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_casoClinico.asp";
			window.opener.focus();
		</script>