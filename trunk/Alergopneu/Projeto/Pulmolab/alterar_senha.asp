<!--#include file="conexao.asp"-->

		<%

			cod = Session("id")			

			usuario = Session("usuario")
			
			email = Session("email")

			senhaantiga = Request.Form("senhaantiga")

			senhanova = Request.Form("senhanova")

			confirmasenha = Request.Form("confirmasenha")

		
'response.Write("cod: "&cod &"_"&"email:"&email)


		SQL2 = "SELECT * FROM usuario WHERE id = '"&cod&"'"

		Set rs2 = Server.CreateObject("ADODB.RecordSet")


		rs2.Open SQL2, ObjDB, 3, 1

		if rs2.eof = false then
			
			if TRIM(senhaantiga) <> TRIM(rs2("senha")) then
	
			msg_erro = "Senha antiga incorreta."
	
			Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")
	
			Response.End()
	
	
	
			elseif len(senhanova) <= 5 then
	
			msg_erro = "A nova senha de acesso deve conter pelo menos 6 caracteres."
	
			Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")
	
			Response.End()
	
			
	
			elseif isNumeric(senhanova) = false then
	
			msg_erro = "A nova senha de acesso deve conter apenas caracteres num&eacute;ricos."
	
			Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")
	
			Response.End()
	
	
	
			elseif TRIM(senhanova) <> TRIM(confirmasenha) then
	
			msg_erro = "A nova senha de acesso deve ser igual a confirma&ccedil;&atilde;o desta."
	
			Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")
	
			Response.End()
	
			
	
			elseif TRIM(senhaantiga) = TRIM(confirmasenha) then
	
			msg_erro = "Escolha uma senha diferente da senha anterior registrada."
	
			Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")
	
			Response.End()
	
			end if
	
	

	
	end if





		





'Enviando e-mail de confirmação



mensagem_final = "Sua senha foi alterada no sistema.<br /><br /><b>Data da alteração:</b><br />"&now&"<br /><br /><b>Seu e-mail de validação é:</b><br />"&email&"<br /><br /><b>Sua nova senha é:</b><br />"&confirmasenha&"<br /><br />Para acessar a sua conta e alterar os seus dados, acesse o portal <a href=""http://www.alergopneumoped.com.br/area_admin.asp"" style=""color: #2F4A75; text-decoration: underline; cursor: pointer;"" >PULMOLAB</a> ."



html = "<html><body style=""font-size:8pt; font-family:tahoma; font-wight:bold;"">"

html =	html & "<div style=""background-color:#FBFBFB; width:400px; margin:auto; border:#CCCCCC 1px solid; padding:10px 10px 10px 10px"">"

html =	html & "<h3>Prezado(a) Administrador(a):</h3>"

html =	html & "<h5>"&usuario&"</h5>"

html = html & "<div style=""padding-left: 120px;""><img src=""http://testes.hbatools.com.br/pulmolab2010/img/logo.png"" /></div>"

html =	html & "<hr noshade=""noshade"">"

html =	html & "<br><div style=""background-color:#FBFBFB; color: #2F4A75; border:#CCCCCC 1px solid; padding:5px 5px 5px 5px; font-size:9pt; width:380px;"">"

html =	html & "<div align=""left""><br />"

html =	html & "<span style=""font-size: 9pt;"">"&mensagem_final&"</span><br />"

html =	html & "<br />"

html =	html & "</div>"

html =	html & "</div>"

html =	html & "<p>Não responda este e-mail, ele foi enviado automaticamente pelo sistema. </p>"

html =	html & "</div></body></html>"



assunto = "Área Administrativa - Alteração de Senha"





'======================== INFORMACOES ======================='

    

      caminho=left(Server.mappath(Request.ServerVariables("PATH_INFO")),InstrRev(Server.mappath(Request.ServerVariables("PATH_INFO")),"\"))

'======================== ENVIA O EMAIL ====================='



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

                .From     = "Portal PULMOLAB <hbatools@hbatools.com.br>"

                .To       = email

                .Subject  = assunto

                .HtmlBody = HTML 

                

                .Send 

            End With 









			var = "Senha alterada com sucesso!"

			SQL = "UPDATE usuario SET senha = '"&senhanova&"', trocaSenha = '1' WHERE id = '"&cod&"' "
			ObjDb.execute SQL

			Response.Write("{""success"":true, ""msg"":""" & var & """}")

%>
<!--#include file="conexaoOFF.asp" -->
