<!--#include file="conexao.asp"-->

<%




email = Request("email")



SQL = "SELECT email, usuario, id FROM usuario WHERE email LIKE '"&email&"' "

set rs = server.CreateObject("ADODB.Recordset")

rs.Open SQL, objdb,3,1



if rs.eof = true then

msg = "O e-mail informado n&atilde;o consta no sistema."

			

	Response.Write("{""failure"":true, ""msg"":""" & msg & """}")



else





cod = rs("id")

usuario = rs("usuario")

email = rs("email")





'Gerando nova senha



RANDOMIZE

menor = 100000

maior = 999999

senha = Int((maior-menor+1)*Rnd+menor)



	

'Alterarando senha	

	

	SQL = "UPDATE usuario SET senha = '"&senha&"', trocaSenha = '0' WHERE id = '"&cod&"' "



	Set rs3 = Server.CreateObject("ADODB.RecordSet")

	rs3.Open SQL, ObjDB, 3, 1



'Enviando e-mail de confirmação





mensagem_final = "Você requisitou uma nova senha de acesso à Área Administrativa.<br /><br /><b>Data da requisição:</b><br />"&now&"<br /><br /><b>Seu e-mail de validação é:</b><br />"&email&"<br /><br /><b>Sua nova senha é:</b><br />"&senha&"<br /><br />Para acessar a sua conta e alterar os seus dados, acesse o portal <a href=""http://testes.hbatools.com.br/pulmolab2010/area_admin.asp"" style=""cursor: pointer; color: #2F4A75; text-decoration: underline;"">PULMOLAB</a> ."



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



assunto = "Área Administrativa - Requisição de Senha"



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

                .From     = "Portal PULMOLAB<hbatools@hbatools.com.br>"

                .To       = email

                .Subject  = assunto

                .HtmlBody = HTML 

                

                .Send 

            End With 



	msg = "Prezado(a) " & usuario & ",<br />A sua senha foi alterada e enviada para o e-mail cadastrado: " & email & "."

			

		

			Response.Write("{""success"":true, ""msg"":""" & msg & """}")



end if

%>
<!--#include file="conexaoOFF.asp" -->
