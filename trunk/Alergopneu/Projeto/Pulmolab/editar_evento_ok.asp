<!--#include file="conexao.asp"-->
<%


	apresentacao = Request.Form("apresentacao")
	conteudo = Request.Form("conteudo")
	dataInicio = Request.Form("dataInicio")
	dataFinal = Request.Form("dataFinal")
	horario = Request.Form("horario")
	evento = Request.Form("evento")
	local = Request.Form("local")
	cod = Request.Form("cod")
	
	conteudo = replace(conteudo,"'","")
	conteudo = replace(conteudo,chr(13),"<br />")
	
	IF dataInicio <> "" THEN
		dataInicio = year(dataInicio) & "-" & month(dataInicio) & "-" & day(dataInicio)
	END IF

	IF dataFinal <> "" THEN
		dataFinal = year(dataFinal) & "-" & month(dataFinal) & "-" & day(dataFinal)
	END IF

SQL = "UPDATE eventos SET"
SQL = SQL &" evento = '"&evento&"', local = '"&local&"', conteudo = '"&conteudo&"', dataInicio = '"&dataInicio&"', dataFinal = '"&dataFinal&"', horario = '"&horario&"', apresentacao = '"&apresentacao&"'"
SQL = SQL &" WHERE cod = "&cod&""

ObjDb.execute SQL


%>
<!--#include file="conexaoOFF.asp" -->
<html>
	<head>
		<script type="text/javascript">
			alert('Editado com sucesso!');
			window.close();
			window.opener.location = "eventos.asp";
			window.opener.focus();
		</script>
	<body>
	</body>
</html>
