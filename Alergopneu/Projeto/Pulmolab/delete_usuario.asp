<!--#include file="conexao.asp"-->
<%
	id = Request.QueryString("cod")
	
	dim fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")

	set rs = Server.CreateObject("ADODB.RecordSet")
	

	SQL = "SELECT c.email, c.foto"
	SQL = SQL & " FROM corpoclinico c"
	SQL = SQL & " 	INNER JOIN usuario u ON u.email = c.email"
	SQL = SQL & " WHERE u.id = " & id
	
'	Response.Write(SQL)
	
	rs.Open sql, ObjDb, 3, 1

	IF rs.EOF = FALSE THEN

		if fs.FileExists(caminho&"\foto\"&rs("email")&rs("foto")) then
			fs.DeleteFile caminho&"\foto\"&rs("email")&rs("foto")
		end if
		
	END IF
	
	rs.Close
	
	SQL = "DELETE FROM usuario WHERE id = " & id
'	Response.Write(SQL)
	ObjDb.execute SQL
	
	Set fs = Nothing

%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Usuário excluído com sucesso!');
			window.location = "ferramenta_usuario.asp";
		</script>