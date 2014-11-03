<!--#include file="conexao.asp"-->

<%

	email = Trim(Replace(Request("email"),"'",""))

'	login = Request("usuario")

	senha = Trim(Request("senha"))



	

	

	SQL = "SELECT * FROM usuario WHERE email LIKE '%" & email & "%'"




'	Response.Write(SQL)

'	Response.End()



	

	Set RS = Server.CreateObject("ADODB.RecordSet")

	RS.Open SQL, ObjDB, 3, 1


		If RS.EOF = True Then 'Login incorreto

			'Response.Redirect("login.asp?erro=1")

			msg_erro = "Login ou senha incorretos"

		Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")

		Elseif RS("senha") <> senha Then 'Senha incorreta

			msg_erro = "Login ou senha incorretos"

		Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")


		Else 'Login e senha corretos


			
			Session.Timeout = 60	
			
			usuario					= RS("usuario")
			nivelUsuario			= RS("nivel")
			idUsuario				= RS("id")
			Session("nivelUsuario") = nivelUsuario
			Session("usuario") 		= usuario
			Session("id") 			= idUsuario


			SQL_login = "UPDATE usuario SET dataUltimoLogin = now() WHERE id = '"&idUsuario&"'"

			ObjDb.execute SQL_login

			

'			Response.Write(SQL_login)

'			Response.End()


			RANDOMIZE

			menor = 1

			maior = 67

			sorteado = Int((maior-menor+1)*Rnd+menor)
			

			



			

			If rs("trocaSenha") = 0 then

				var = "trocasenha"
				
				Session("email") = rs("email")
				email = Session("email")

				'Response.Write("{""trocaSenha"":true}")								

				'Response.Redirect("index2.asp?p=9&cod="&id_usuario)

			ELSEIF rs("acesso") = 0 THEN
			
				msg_erro = "Acesso negado! Aguardando autoriza&ccedil;&atilde;o do administrador."
	
				Response.Write("{""failure"":true, ""msg_erro"":""" & msg_erro & """}")
				
				Response.End()

			else

				var = "Bem-Vindo(a): "& usuario &"!"

			

			End if

			

			data = now()

'			Response.Write(data)	'	19/5/2009 14:02:17

'			Response.End()

			
				
				Response.Write("{""success"":true, ""msg"":""" & var & """}")



			End if

%>	
<!--#include file="conexaoOFF.asp" -->
