<%
caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))
Response.Charset = "utf-8"

'nome			= Request.Form("nome")
'email			= Request.Form("email")
'assunto		= Request.Form("assunto")
'instituicao	= Request.Form("instituicao")
'mensagem 	= Request.Form("mensagem")

mensagem_final = ""
'mensagem_final = mensagem_final & "<div align=""right""><img src=""img/logo_email.png""></div><br />"
mensagem_final = mensagem_final & "<b>Há uma nova pergunta no site.</b>"
mensagem_final = mensagem_final & "<b>Para responde-la <a href=""http://www.alergopneumoped.com.br/ferramenta_forum.asp"">Clique aqui</a>"
'mensagem_final = mensagem_final & "<b>E-mail:</b> "&email&"<br><br>"
'mensagem_final = mensagem_final & "<b>Assunto:</b> "&assunto&"<br><br>"
'mensagem_final = mensagem_final & "<b>Mensagem:</b> "&mensagem&"<br><br>"


html = "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN""" & vbcrlf
html =	html & """http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbcrlf
html =	html & "<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbcrlf
html =	html & "<head>" & vbcrlf
html =	html & "<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"" />" & vbcrlf
html =	html & "</head>" & vbcrlf
html =	html & "<body>" & vbcrlf
html =	html & "<table align=""center"" style=""font-size:8pt; font-family:tahoma; border:#CCCCCC 2px solid "">"  & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style=""text-align:center""> " & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td> " & vbcrlf
html =	html & "		<table> " & vbcrlf
html =	html & "			<tr> " & vbcrlf
'html =	html & "				<td width=100 align=""right""><img src=""img/topo_email.jpg""></td> " & vbcrlf
html =	html & "			</tr> " & vbcrlf
html =	html & "		</table> " & vbcrlf
html =	html & "<h2>Mensagem enviada pelo sistema.</h2>" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style="" color:#000000; font-size:9pt; font-family:tahoma;""> " & vbcrlf
html =	html & "Acaba de ser enviada uma nova pergunta para o portal" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style="" color:#000000; font-size:9pt; font-family:tahoma;""> " & vbcrlf
html =	html & "PULMOLAB.<br>" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style=""text-align:center""> " & vbcrlf
html =	html & "________________________________________" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style=""font-size: 9pt;""> " & vbcrlf
html =	html & ""&mensagem_final&"" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style=""font-size: 9pt;""> " & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "</table>" & vbcrlf
html =	html & "</body></html>" & vbcrlf

'Response.Write(html)
'Response.End()
'	if email = "jhonatan.galdino@hbatecnologia.com.br" then
'		email_destinatario = email
'	elseif email = "tainara.roberta@hbatecnologia.com.br" then
'		email_destinatario = "jhonatan.galdino@hbatecbologia.com.br"
'		email_destinatario = email&"jhonatan.galdino@hbatecnologia.com.br"
'		assunto = assunto&"- Teste tainara"
'	else
		email_destinatario = "wrocha55@terra.com.br"
'		email_destinatario = "alexandre@aecmecatronica.com.br"
'	end if
	sch = "http://schemas.microsoft.com/cdo/configuration/"
 
   	Set cdoConfig = CreateObject("CDO.Configuration") 
   
		With cdoConfig.Fields 
    	.Item(sch & "sendusing") = 2
    	.Item(sch & "smtpserver") = "localhost" 
    	.Item(sch & "smtpserverport") = 25
    	.Item(sch & "connectiontimeout") = 50
    	.update
   	End With 
   
   		Set cdoMessage = CreateObject("CDO.Message")      

   	With cdoMessage
   
			Set .Configuration = cdoConfig 
    		.From			= "PULMOLAB" & "<tools@hbatools.com.br>"
    		.To 	  		= email_destinatario 
    		.Bcc			= "jhonatan.galdino@hbatecnologia.com.br"
			.Subject  	= "Perguntas do forum"
    		.HtmlBody 	= HTML

'      cdoMessage.AddRelatedBodyPart caminho&"img/topo_email.jpg", "img/topo_email.jpg", 1

    .Send
   End With
%>