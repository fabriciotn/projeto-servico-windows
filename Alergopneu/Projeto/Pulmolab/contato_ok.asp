<!--'#include file="conexao.asp"-->
<%
caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")), INstrRev(server.MapPath(Request.ServerVariables("PATH_INFO")),"\"))
'Response.Charset = "iso-8859-1"

nome = Request.Form("nome")
email = Request.Form("email")
tel = Request.Form("tel")
local = Request.Form("local")
uf = Request.Form("uf")
mensagem = Request.Form("mensagem")

mensagem_final = "<b>Nome do Remetente: </b>"&nome&"<br><br>"
mensagem_final = mensagem_final & "<b>E-mail:</b> "&email&"<br><br>"
mensagem_final = mensagem_final & "<b>UF: </b>"&uf&"<br><br>"
mensagem_final = mensagem_final & "<b>CIDADE: </b>"&local&"<br><br>"
mensagem_final = mensagem_final & "<b>Mensagem:</b> "&mensagem&"<br><br>"


'  ********************** TESTE


'**********************	FIM TESTE


html = "<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN""" & vbcrlf
html = html & """http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbcrlf
html = html & "<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbcrlf
html = html & "<head>" & vbcrlf
html = html & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"" />" & vbcrlf
html = html & "</head>" & vbcrlf
html = html & "<body>" & vbcrlf
html =	html & "<table align=""center"" style=""font-size:8pt; font-family:tahoma; font-weight:bold; border:#CCCCCC 2px solid "">"  & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style=""text-align:center""> " & vbcrlf
html =	html & "<img src=""img/logo.png""/>" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td> " & vbcrlf
html =	html & "<h3>Mensagem enviada pelo site. </h3>" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style="" color:#000000; font-size:9pt; font-family:tahoma; font-weight:bold;""> " & vbcrlf
html =	html & "O(a) usu&aacute;rio(a) "&nome&" acaba de enviar uma mensagem para o portal" & vbcrlf
html =	html & "	</td> " & vbcrlf
html =	html & "</tr>" & vbcrlf
html =	html & "<tr>" & vbcrlf
html =	html & "	<td style="" color:#000000; font-size:9pt; font-family:tahoma; font-weight:bold;""> " & vbcrlf
html =  html & "PULMOLAB." & vbcrlf
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
html =	html & "<p>N&atilde;o responda este e-mail, ele foi enviado automaticamente pelo sistema. </p>" & vbcrlf
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

          'IF nome <> "Desenvolvimento HBA Tecnologia" THEN
'	email_destinatario = "iot@iotbh.com.br; financeiro@iotbh.com.br; flay2007@gmail.com; "
'ELSE
	email_destinatario = email 
'END IF
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
				.From = "PULMOLAB" & "<hbatools@hbatools.com.br>"
				.To = email_destinatario	'"wesley.cruz@hbatecnologia.com.br"
'				.Bcc = "eduardo.torquato@hbatecnologia.com.br"
'				.ReplyTo = "HBA Tools<eduardo.torquato@hbatecnologia.com.br>"
				.Subject = "Contato PULMOLAB"
				.HtmlBody = html

				cdoMessage.AddRelatedBodyPart caminho&"img/logo.png", "logo.png", 1

				.Send

IF nome = "Desenvolvimento HBA Tecnologia" THEN
	Response.Write(html)
	Response.End()
END IF
	
			End With
			


'Sql = "INSERT INTO contato (nome, email, tel, nome_medico, setor, tipo_contato, mensagem, data) values ('" & nome & "', '" & email & "', '" & tel & "', '" & nome_medico & "', '" & setor & "',"
'Sql = Sql &" '" & tipo_contato & "', '" & mensagem & "', curDate())"

'Response.Write(Sql)
'Response.End()

'ObjDb.execute Sql
%>
<!----------------------------------------------FINAL ENVIA E-MAIL -->
<!--#include file="conexaoOFF.asp" -->

		<script type="text/javascript">
			alert('Mensagem enviada com sucesso!');
			window.parent.location = "contato.asp";
		</script>
