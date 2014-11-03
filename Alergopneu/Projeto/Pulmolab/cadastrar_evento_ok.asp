<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

semanal = 0
quinzenal = 0
mensal = 0
anual = 0

repeticao		=		Request.Form("repeticao")

' SE FOR 1 = SEMANAL
IF	repeticao = 1 THEN
	data_diferenca = 7
	dias_salva = 52
	semanal = 1
' SE FOR 2 = QUINZENAL
ELSEIF repeticao = 2 THEN
	data_diferenca = 15
	dias_salva = 24
	quinzenal = 1
' SE FOR 3 = MENSAL
ELSEIF repeticao = 3 THEN
	data_diferenca = 30
	dias_salva = 12
	mensal = 1
' SE FOR 4 = ANUAL
ELSEIF repeticao = 4 THEN
	data_diferenca = 365
	dias_salva = 1
	anual = 1
END IF

tipo			=		Request.Form("tipo")
local			=		Request.Form("local")
evento			=		Request.Form("evento")
horario			=		Request.Form("horario")
conteudo		=		Request.Form("assunto")
dataFinal		=		Request.Form("dataFinal")
dataInicio		=		Request.Form("dataInicio")
feriado			=		Request.Form("feriado")	
apresentacao	=		Request.Form("apresentacao")

conteudo		=		Replace(conteudo,"'","")
conteudo		=		Replace(conteudo,chr(13),"<br />")



	IF dataInicio <> "" THEN
		dataInicio = year(dataInicio) & "-" & month(dataInicio) & "-" & day(dataInicio)
	END IF

	IF dataFinal <> "" THEN
		dataFinal = year(dataFinal) & "-" & month(dataFinal) & "-" & day(dataFinal)
	END IF
	
	IF feriado <> "" THEN
		feriado = year(feriado) & "-" & month(feriado) & "-" & day(feriado)
	END IF

IF dias_salva <> 1 THEN

	dias_salva = dias_salva -1

	sql = "INSERT INTO eventos (dataInicio, dataFinal, feriado, horario, evento, local, conteudo, apresentacao, semanal, quinzenal, mensal, anual, tipo)"
	sql = sql & " values (ADDDATE('"&dataInicio&"','"&(data_diferenca * i)&"'),'"&dataFinal&"','"&feriado&"', '"&horario&"', '"&evento&"', '"&local&"',"
	sql = sql &" '"&conteudo&"', '"&apresentacao&"', '"&semanal&"', '"&quinzenal&"', '"&mensal&"', '"&anual&"', '"&tipo&"')"
		'	Response.Write(SQL&"<br/>")

	ObjDb.execute SQL

	FOR i=1 to dias_salva

	'	SELECT ADDDATE(NOW(),data_diferenca * i)
	
		sql = "INSERT INTO eventos (dataInicio, dataFinal, feriado, horario, evento, local, conteudo, apresentacao, semanal, quinzenal, mensal, anual, tipo)"
		sql = sql &" values (ADDDATE('"&dataInicio&"','"&(data_diferenca * i)&"'),'"&dataFinal&"','"&feriado&"', '"&horario&"', '"&evento&"', '"&local&"',"
		sql = sql &" '"&conteudo&"', '"&apresentacao&"', '"&semanal&"', '"&quinzenal&"', '"&mensal&"', '"&anual&"', '"&tipo&"')"
		'	Response.Write(SQL&"<br/>")
	
		
		ObjDb.execute SQL
		
	next

ELSE

		sql = "INSERT INTO eventos (dataInicio, dataFinal, feriado, horario, evento, local, conteudo, apresentacao, semanal, quinzenal, mensal, anual, tipo)"
		sql = sql &" values ('"&dataInicio&"','"&dataFinal&"', '"&feriado&"','"&horario&"', '"&evento&"', '"&local&"', '"&conteudo&"', '"&apresentacao&"', '"&semanal&"',"
		sql = sql &" '"&quinzenal&"', '"&mensal&"', '"&anual&"', '"&tipo&"')"
	'	Response.Write(SQL&"<br/>")
		ObjDb.execute SQL

END IF
	
		'Response.End()

Set ObjDb = Nothing
%>
<html>
	<head>
		<script type="text/javascript">
			alert('Evento cadastrado com sucesso!');
			window.close();
			window.opener.location = "eventos.asp";
			window.opener.focus();
		</script>
	<body>
	</body>
</html>
