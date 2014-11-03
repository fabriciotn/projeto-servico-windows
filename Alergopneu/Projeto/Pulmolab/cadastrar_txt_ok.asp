<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario


	titulo = Request.Form("titulo")
	texto = Request.Form("texto")
	
	texto = replace(texto,"'","")
	texto = replace(texto,chr(13),"<br />")
	

	
	data = now
	dia = day(data)
	mes = month(data)
	ano = year(data)
	hora = hour(data)
	min = minute(data)
	seg = second(data)
	
	if len(dia) = 1 then
	dia = 0&dia
	end if
	
	if len(mes) = 1 then
	mes = 0&mes
	end if
	
	if len(hora) = 1 then
	hora = 0&hora
	end if
	
	if len(min) = 1 then
	min = 0&min
	end if
	
	if len(seg) = 1 then
	seg = 0&seg
	end if
	
	dataFinal = ano &"-"& mes &"-"& dia &" "& hora &":"& min &":"& seg
	
	
sql = "insert into textohome (data, titulo, texto) values ('"&dataFinal&"', '"&titulo&"', '"&texto&"')"
'RESPONSE.Write(sql)
'response.End()
objdb.execute sql


%>
		<script type="text/javascript">
			alert('Texto cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_txt.asp";
			window.opener.focus();
		</script>