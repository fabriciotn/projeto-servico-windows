<!--#include file="conexao.asp" -->
<%

Response.ContentType="text/xml"

	'codProcura = Request("codProcura")
	
	dataInicio = Request("codProcura")
	dataInicio = year(dataInicio) & "-" & month(dataInicio) & "-" & day(dataInicio)
	
	SQL = "SELECT * FROM eventos WHERE dataInicio = '" & dataInicio & "' "
	'Response.Write(SQL)
	Set RS = Server.CreateObject("ADODB.RecordSet")
	'Response.Write(SQL)
	RS.Open SQL, ObjDB, 3, 1
	Response.Write("<?xml version=""1.0"" encoding=""ISO-8859-1""?>" & vbcrlf)
	Response.Write("<hba>" & vbcrlf)
	
	while rs.eof = false

		dataInicio = day(rs("dataInicio")) & "/" & month(rs("dataInicio")) & "/" & year(rs("dataInicio"))

		mostraData = dataInicio

		dataFinal = day(rs("dataFinal")) & "/" & month(rs("dataFinal")) & "/" & year(rs("dataFinal"))
		

		IF dataFinal <> "//" THEN
			mostraDataFim = "à: " & dataFinal 
		END IF
		
		
		IF dataFinal = dataInicio THEN
			mostraDataFim = ""
		END IF
		
		tipo = Replace(rs("tipo"),"&","&amp;")
		horario = Replace(rs("horario"),"&","&amp;")
		apresentacao = Replace(rs("apresentacao"),"&","&amp;")
		conteudo = Replace(rs("conteudo"),"&","&amp;")
		evento = Replace(rs("evento"),"&","&amp;")
		local = Replace(rs("local"),"&","&amp;")

	
		Response.Write("<tabela_evento>" & vbcrlf)
		
			Response.Write("<tipoEvento><p>"&tipo&"</p></tipoEvento>" & vbcrlf)
			Response.Write("<eventoVer><p>"&evento&"</p></eventoVer>" & vbcrlf)
			Response.Write("<horarioEventoVer><p>"&horario&"</p></horarioEventoVer>" & vbcrlf)
			Response.Write("<coluna1><p>"&mostraData&"</p></coluna1>" & vbcrlf)
			Response.Write("<coluna2><p>"&mostraDataFim&"</p></coluna2>" & vbcrlf)
			Response.Write("<linha><p>"&conteudo&"</p></linha>" & vbcrlf)
			Response.Write("<localEvento><p>"&local&"</p></localEvento>" & vbcrlf)
			Response.Write("<apresentacao><p>"&apresentacao&"</p></apresentacao>" & vbcrlf)
		
		Response.Write("</tabela_evento>")


	rs.movenext
	wend
	
	Response.Write("</hba>")
	
	
	Set rs = nothing
	Set ObjDB = nothing
%>