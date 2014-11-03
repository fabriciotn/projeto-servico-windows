<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<%
	Response.Charset = "iso-8859-1"

	caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))

	pasta = "informacoes"

'Instancia o componente
    SET SaFileUp = Server.CreateObject("SoftArtisans.FileUp") 

    'Configura o caminho onde arquivo será salvo
    SaFileUp.Path = Server.MapPath(pasta)

        'Salva o arquivo no servidor
		titulo = SaFileUp.Form("titulo")
		categoria = SaFileUp.Form("categoria")

		if SaFileUp.Form("arquivo").ShortFileName <> "" then
			extensao = mid( SaFileUp.Form("arquivo").ShortFileName, instr(SaFileUp.Form("arquivo").ShortFileName, "."), 4 )
			titulo_arquivo = titulo & "_" & year(now) & "_" & month(now) & "_" & day(now) & "_" & hour(now) & "_" & minute(now) & "_" & second(now) & extensao
			titulo_arquivo = REPLACE(titulo_arquivo, ":", "_")
			titulo_arquivo = REPLACE(titulo_arquivo, " ", "_")
		
			if SaFileUp.Form("arquivo").ShortFileName <> "" then
				SaFileUp.Form("arquivo").SaveAs Server.MapPath(pasta) & "\" & titulo_arquivo
			end if
		end if
   

' PEGA VARIAVEIS


	
	obs = SaFileUp.Form("obs")
	
	obs = replace(obs,"'","")
	obs = replace(obs,chr(13),"<br />")
	

	
SQL = "INSERT INTO informacoes (titulo, arquivo, texto, cod_categoria_informacoes, data) VALUES ('"&titulo&"', '"&titulo_arquivo&"','"&obs&"', '"&categoria&"', curDate())"
'Response.Write(sql)
'Response.End()
ObjDb.execute SQL

%>
<!--#include file="conexaoOFF.asp" -->

		<script type="text/javascript">
			alert('Informação cadastrada com sucesso!');
			window.close();
			window.opener.location = "ferramenta_informacoes.asp";
			window.opener.focus();
		</script>