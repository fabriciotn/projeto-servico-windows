<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- #include file="conexao.asp" -->
<%
	email = Trim(Replace(Request("email"),"'",""))
'	login = Request("usuario")
	'cpf = 
	cpf = Request("cpf")
	cpf = Replace(Replace(cpf,".",""),"-","")
	
	cod_evento = 154
	pago = 1
'	Response.Write(cpf)
'	Response.End()

SQL = "SELECT c.cod, c.cod_evento, c.nome, c.email, Replace(Replace(c.cpf,'.',''),'-','') as cpf, f.pago, f.cod_cliente, "
SQL = SQL &"Replace(Replace(c.cpf,'.',''),'-','') "
SQL = SQL &"FROM cliente c "
SQL = SQL &"INNER JOIN financeiro f ON c.cod = f.cod_cliente "
SQL = SQL &"WHERE c.cod_evento = '"& cod_evento &"' AND Replace(Replace(c.cpf,'.',''),'-','') = '"& cpf &"' AND c.email = '" &email& "' AND f.pago = '"& pago &"' "
	
' 	Response.Write(SQL)
'	Response.End()

	Set RS = Server.CreateObject("ADODB.RecordSet")

	RS.Open SQL, ObjDB, 3, 1
'Response.Write("<br>CPF BANCO: "&cpf_banco&"<br> PAGO: "&pago)
'Response.End()

		If RS.EOF = True Then 'Login incorreto
			'Response.Redirect("login.asp?erro=1")
			redireciona = "entrar_certificado.asp"
			msg_erro = "CPF ou e-mail inválidos"
		Elseif rs("cpf") <> cpf OR rs("pago") <> 1 Then 'Senha incorreta
			redireciona = "entrar_certificado.asp"
			msg_erro = "CPF ou e-mail inválidos"
		Else 'Login e senha corretos
			Session("cod") = rs("cod")
			session("nome") = rs("nome")
			redireciona_pop = "certificado.asp?cod="&Session("cod")
		ObjDb.execute SQL
			msg_erro = ""
		END If
	RS.Close

	Set RS = Nothing

%>	
<script type="text/javascript">
	<% if msg_erro <> "" then %>
		alert('<%=msg_erro%>');
	window.location = '<%=redireciona%>';
	<% else %>
	var esquerda = (screen.width - 900)/2;
	var topo = (screen.height - 670)/2;
	window.open('<%=redireciona_pop%>', "Pulmolab" , "height=900,width=1080,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	<% end if %>
</script>