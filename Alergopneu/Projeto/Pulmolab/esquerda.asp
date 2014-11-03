<div id="esquerda">
        
        <div id="fundo_corpoclinico">
        <div id="titulo_corpoclinico"><img src="img/titulo_corpoclinico.png" width="138" height="20" border="0" /></div>
        
<%
	SQL = "SELECT nome, email, atividade, foto FROM corpoclinico WHERE categoria = 1 ORDER BY RAND() LIMIT 1"
	Set rsMedico = Server.CreateObject("ADODB.RecordSet")
	rsMedico.Open SQL, ObjDB, 3, 1
	
	IF rsMedico.EOF = FALSE THEN
		
		nome = rsMedico("nome")
		email = rsMedico("email")
		atividade = rsMedico("atividade")
		foto = rsMedico("foto")
		
	END IF
	
	
	IF foto = "" THEN
		foto = "img/foto_breve.jpg"
	ELSE
		foto = "foto\" & email & "\" & foto
	END IF
%>
        
        <div id="fundo_fotocorpoclinico"><img src="<%=foto%>" width="73" height="78" /></div>
        
        <div id="englobatexto_corpoclinico">
        <div id="titulo_corpoclinico_1"><%=Server.HTMLEncode(nome)%></div>
        <div id="texto_corpoclinico_1"><%=Server.HTMLEncode(atividade)%></div>        
        </div>
        <div id="mais_corpoclinico"><a href="corpo_clinico.asp"><img src="img/mais.png" width="18" height="17" border="0" /></a></div>
        
        </div>
        
        <div id="pesquisa_protocolo"><a href="#"><img src="img/protocolo_pesquisa.jpg" width="465" height="51" border="0" /></a></div>
        <div id="engloba_noticia">
        <div id="titulo_noticia"><img src="img/titulo_noticia.png" width="90" height="17" border="0" /></div>
<%
	SQL = "SELECT titulo, noticia, cod FROM noticias ORDER BY cod DESC LIMIT 1"
	Set rsNoticia = Server.CreateObject("ADODB.RecordSet")
'	Response.Write(SQL)
	rsNoticia.Open SQL, ObjDb, 3, 1
	
	IF rsNoticia.EOF = FALSE THEN
		
		titulo = rsNoticia("titulo")
		texto = rsNoticia("noticia")
		cod = rsNoticia("cod")

		IF LEN(texto) > 130 THEN
			texto = MID(texto, 1, 130) & "..."
		END IF 
	
	ELSE

		titulo = "Adrenalina auto-injetável no Brasil"
		texto = "Está para ser lançado no Brasil em 2007 a adrenalina auto-injetável nacional, ainda sem nome, que certamente terá um custo mais acessível quando comparado com o produto importado. O processo está..."
		
	END IF

%>		
        <div id="titulo_noticia1"><%=titulo%></div>
        <div id="texto_noticia"><%=texto%></div>
        <div id="mais_noticia"><img src="img/mais.png" width="18" height="17" border="0" /></div>
        <div id="leia_todasnoticias">leia todas as notícias</div>
        
        </div>
        
        </div>