<%
caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))
Response.Charset = "iso-8859-1"

nome = Request.Form("nome")
email = Request.Form("email")
assunto = Request.Form("assunto")
telefone = Request.Form("telefone")
mensagem = Request.Form("mensagem")

mensagem_final = ""
'mensagem_final = mensagem_final & "<div align=""right""><img src=""img/logo_email.png""></div><br />"
mensagem_final = mensagem_final & "<b>Nome do Remetente: </b>"&nome&"<br><br>"
mensagem_final = mensagem_final & "<b>E-mail:</b> "&email&"<br><br>"
mensagem_final = mensagem_final & "<b>Assunto:</b> "&assunto&"<br><br>"
mensagem_final = mensagem_final & "<b>Telefone:</b> "&telefone&"<br><br>"
mensagem_final = mensagem_final & "<b>Mensagem:</b> "&mensagem&"<br><br>"


html = "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN""" & vbcrlf
html =	html & """http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbcrlf
html =	html & "<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbcrlf
html =	html & "<head>" & vbcrlf
html =	html & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"" />" & vbcrlf
html =	html & "</head>" & vbcrlf
html =	html & "<body>" & vbcrlf
html =	html & "<table align=""center"" style=""font-size:8pt; font-family:Trebuchet MS; border:#CCCCCC 2px solid "">"  & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style=""text-align:center""> " & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td> " & vbcrlf
html =	html & "		<table> " & vbcrlf
html =	html & "			<tr> " & vbcrlf
html =	html & "				<td width=300 style="" font-family:Trebuchet MS;""<h2>Mensagem enviada por "&nome&".</h2></td> " & vbcrlf
html =	html & "				<td width=100 align=""right""><img src=""img/logo_email.png""></td> " & vbcrlf
html =	html & "			</tr> " & vbcrlf
html =	html & "		</table> " & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style="" color:#000000; font-size:9pt; font-family:Trebuchet MS;""> " & vbcrlf
html =	html & "O(a) usu&aacute;rio(a) <b>"&nome&"</b> acaba de enviar uma mensagem para o portal" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style="" color:#000000; font-size:9pt; font-family:Trebuchet MS;""> " & vbcrlf
html =  html & "Jornada 2011.<br>" & vbcrlf
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

Function EmailValido(email)
Set objRegExp = New RegExp
objRegExp.Pattern = "^[a-z0-9._-]+\@[a-z0-9._-]+\.[a-z]{2,4}$"
objRegExp.IgnoreCase = True
EmailValido = objRegExp.Test(email)
End Function

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
    		.From		= "Jornada 2011" & "<mail@encontrodrivea.com.br>"
    		.To 	  	=  "jornadapneumo@gmail.com"'"jhonatan.galdino@hbatecnologia.com.br"  
    		.Subject  	= "Contato Usuário"
    		.HtmlBody 	= HTML

      cdoMessage.AddRelatedBodyPart caminho&"img/logo_email.png", "img/logo_email.png", 1
	If EmailValido(email) = true then
    .Send
	End If
   End With
%>
	<script type="text/javascript">
   	alert('E-mail enviado com sucesso!');
   	window.location = 'contato.asp?msg=1';
	</script>
   
