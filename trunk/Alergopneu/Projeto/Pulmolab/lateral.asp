<link href="estilo.css" rel="stylesheet" type="text/css" />
<div class="direita">
	<div class="bloco_noticia_lateral">
		<div class="bloco_noticia_lateral_titulo"><img src="img/tit_noticia.png" width="60" height="14" border="0" /></div>
<!--'# i n c l u de file="conexao.asp" -->
<%
SQL = "SELECT cod, titulo, texto FROM noticias ORDER BY cod LIMIT 2"
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.Open SQL, ObjDB, 3, 1
'Response.Write(SQL)
'Response.End()
while rs.eof = false
		cod = rs("cod")
		texto = rs("texto")
		if len (texto) > 120 then
			texto =  mid(texto, 1, 120) & "..."
		end if
		texto = Replace(texto,"<br />","")
		texto = Replace(texto,":","")
		titulo = rs("titulo")
		if len (titulo) > 36 then
			titulo = mid(titulo, 1, 36) & "..."
		end if
		titulo = Replace(titulo,"<br />","")
		titulo = Replace(titulo,":","")
'Response.Write(titulo&"<br>"&texto)
'Response.End()
%>
		<div class="bloco_noticia_lateral_titulo2"><%=titulo%></div>
		<div class="bloco_noticia_lateral_texto"><%=texto%></div>
		<div class="leia_noticias2"><span class="link_laranjado"><a href="noticias.asp?cod=<%=cod%>">leia mais</a></span></div>
		<div class="divisoria"><img src="img/divisoria.png" width="203" height="10" border="0" /></div>
<% 
rs.movenext
wend
%>
	</div>
	<div class="bloco_duvida"><a href="contato.asp"><img src="img/duvida..jpg" width="276" height="64" border="0" /></a></div>
	<div class="bloco_hospedagem"><a href="#"><img src="img/bt_hospedagem.jpg" width="276" height="66" border="0" /></a></div>
</div>
