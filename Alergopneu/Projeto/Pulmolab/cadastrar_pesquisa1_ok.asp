<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario


	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	autor = Request.Form("autor")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	

	

	
	
sql = "insert into pesquisa (autor, data, titulo, texto, imagem1, imagem2, modelo) values ('"&autor&"', now(), '"&titulo&"', '"&texto&"', '', '', 1)"
'RESPONSE.Write(sql)
'response.End()
objdb.execute sql


'sql = "select cod from noticias where data = '"&dataFinal&"'"
'set rs = Server.CreateObject("ADODB.RecordSet")
'response.Write(sql)
'response.End()
'rs.Open sql, objdb, 3, 1

'IF rs.eof = false THEN
'cod = rs("cod")

'END IF
'rs.Close

'Response.Redirect("cadastrar_noticia2.asp?cod="&cod)
%>

		<script type="text/javascript">
			alert('Pesquisa cadastrada com sucesso!');
			window.close();
			window.opener.location = "ferramenta_pesquisa.asp";
			window.opener.focus();
		</script>