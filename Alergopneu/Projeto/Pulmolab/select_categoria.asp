<!--#include file="conexao.asp" -->  <!-- CONEXAO BASICA COM BANCO DE DADOS -->
<select id="categoria" name="categoria" class="campos_esconde">
<option value=""></option>
<%	SQL = "SELECT cod, nome FROM categoria_informacoes ORDER BY nome"
	Set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open SQL, ObjDb, 3, 1
	while rs.eof = false %>
		<option value="<%=rs("cod")%>"><%=UCASE(rs("nome"))%></option>
	<% rs.movenext
	wend %>
</select>
