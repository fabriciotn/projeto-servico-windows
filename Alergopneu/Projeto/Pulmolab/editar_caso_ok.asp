<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	titulo = Request.Form("titulo")
	autor = Request.Form("autor")
	cod = Request.Form("cod")
	data = Request.Form("data")

		dia = day(data)
		if len(dia) = 1 then
			dia = "0" & dia
		end if
		
		mes = month(data)
		if len(mes) = 1 then
			mes = "0" & mes
		end if
		
		ano = year(data)
		
		data = ano & "-" & mes & "-" & dia

	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	
	
sql = "update casoclinico set titulo = '"&titulo&"', autor = '"&autor&"', data = '"&data&"' WHERE cod = "&cod&""
'Response.Write(SQL)
'Response.End()
objdb.execute sql


'Response.Redirect("editar_noticia2.asp?cod="&cod)
%>
<!--#include file="conexaoOFF.asp" -->
		<script type="text/javascript">
			alert('Editado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_casoClinico.asp";
			window.opener.focus();
		</script>