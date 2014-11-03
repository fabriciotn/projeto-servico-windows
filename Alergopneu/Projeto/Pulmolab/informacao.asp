<!--#include file="conexao.asp"-->
<%
	Response.Charset = "iso-8859-1"

	caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))

	pasta = "informacao"

'Instancia o componente
    SET SaFileUp = Server.CreateObject("SoftArtisans.FileUp") 

    'Configura o caminho onde arquivo será salvo
    SaFileUp.Path = Server.MapPath(pasta)

    'Caso o usuário não indique um arquivo para upload, informa erro.
    If SaFileUp.IsEmpty Then
		Response.Redirect("cadastrar_informacao.asp")
		Response.End()
    Else
        'Salva o arquivo no servidor
		nome = SaFileUp.Form("nome")
		extensao = mid( SaFileUp.Form("arquivo").ShortFileName, instr(SaFileUp.Form("arquivo").ShortFileName, "."), 4 )
		nome_arquivo = nome & "_" & year(now) & "_" & month(now) & "_" & day(now) & "_" & hour(now) & "_" & minute(now) & "_" & second(now) & extensao
		
        if SaFileUp.Form("arquivo").ShortFileName <> "" then
			SaFileUp.Form("arquivo").SaveAs Server.MapPath(pasta) & "\" & nome_arquivo
        end if
    End if


' PEGA VARIAVEIS


	
	obs = SaFileUp.Form("obs")
	
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")
	

	
SQL = "INSERT INTO informacao (nome, arquivo, obs, data) VALUES ('"&nome&"', '"&nome_arquivo&"', '"&obs&"', curDate())"
'Response.Write(sql)
'Response.End()
ObjDb.execute SQL


%>
<!--#include file="conexaoOFF.asp" -->

		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_protocolos.asp";
			window.opener.focus();
		</script>