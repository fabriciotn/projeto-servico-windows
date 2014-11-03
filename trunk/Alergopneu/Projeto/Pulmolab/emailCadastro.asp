<%
Response.Charset = "iso-8859-1"
Function nomeUsuario

	SQL = "SELECT GROUP_CONCAT(usuario) AS usuarios FROM usuario WHERE nivel = 1"
		
	Set rsUsuario = Server.CreateObject("ADODB.RecordSet")
	
	rsUsuario.Open SQL, ObjDb, 3, 1
	
	IF rsUsuario.EOF = FALSE THEN
		nomeUsuario = rsUsuario("usuarios")
		nomeUsuario = Replace(Replace(Replace(nomeUsuario, ",", ""), "Wesley Cruz", ""), "Tainara", "")
	END IF
	
	Set rsUsuario = Nothing
	
End Function

mensagem_final = "Foi modificado um cadastro no sistema.<br /><br /><b>Nome:</b><br />"&nome&"<br /><br /><b>E-mail:</b><br />"&email&"<br /><br /><b>Telefone residencial:</b><br />"&telefone&"<br /><br />Para acessar a área administrativa e aprovar o cadastro de "&nome&", acesse o portal <a href='http://alergopneumoped.com.br/area_admin.asp' style='color: #2F4A75; text-decoration: underline; cursor: pointer;' >PULMOLAB</a> ."


html = "<html><body style=""font-size:8pt; font-family:tahoma; font-wight:bold;"">"

html =	html & "<div style=""background-color:#FBFBFB; width:400px; margin:auto; border:#CCCCCC 1px solid; padding:10px 10px 10px 10px"">"

html =	html & "<h3>Prezado(a) Administrador(a): "

html =	html & "<i>Wilson Rocha Filho</i></h3>"

html = html & "<div style=""padding-left: 120px;""><img src=""http://alergopneumoped.com.br/img/logos_topo.png"" /></div>"

html =	html & "<hr noshade=""noshade"">"

html =	html & "<br><div style=""background-color:#FBFBFB; color: #2F4A75; border:#CCCCCC 1px solid; padding:5px 5px 5px 5px; font-size:9pt; width:380px;"">"

html =	html & "<div align=""left""><br />"

html =	html & "<span style=""font-size: 9pt;"">"&mensagem_final&"</span><br />"

html =	html & "<br />"

html =	html & "</div>"

html =	html & "</div>"

html =	html & "<p>Não responda este e-mail, ele foi enviado automaticamente pelo sistema. </p>"

html =	html & "</div></body></html>"



assunto = "Área Administrativa - Confirmação de cadastro"





'======================== INFORMACOES ======================='

    

      caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")),InstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

'======================== ENVIA O EMAIL ====================='



            sch = "http://schemas.microsoft.com/cdo/configuration/"
	
	

    

            Set cdoConfig = CreateObject("CDO.Configuration") 

            

            With cdoConfig.Fields 

		.Item(sch & "smtpserver") = "smtp.gmail.com" 
                .Item(sch & "sendusername") = "alergopneu@gmail.com"
		.Item(sch & "sendpassword") = "constru21"
		.Item(sch & "sendusing") = 2
		                

                .Item(sch & "smtpserverport") = 25

                .Item(sch & "connectiontimeout") = 60
	
		.Item(sch & "smtpusessl") = 1

		.Item(sch & "smtpauthenticate") = 1

                .update 

            End With 

            

            Set cdoMessage = CreateObject("CDO.Message")                     



            With cdoMessage

            

            Set .Configuration = cdoConfig 

                .From     = "Portal PULMOLAB <alergopneu@gmail.com>"

                .To       = "wrocha55@terra.com.br"

		.Bcc	  = "ecaptein@gmail.com"
				
                .Subject  = "CONFIRMAÇÃO DE CADASTRO"

                .HtmlBody = HTML 

                

                .Send 

            End With 


'	RESPONSE.Write(html)
'	Response.End()
	
	
%>
