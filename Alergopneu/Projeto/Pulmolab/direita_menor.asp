<div id="direita_menor">
       <div id="titulo_agenda_mini"><img src="img/titulo_agenda.png" width="82" height="19" border="0" /></div>
       <div id="calendario_menor">
	   	
        <!-- *************************			CALENDARIO ********************** -->
			<!-- #include file="calendario_wesley.asp" -->      
		
			<div id="boxes">
			
				<div id="verEvento" class="window">
					<div id="quadradoEvento">					
						<a href="#" class="close">Fechar [X]</a><br />
						<!--#include file="verEvento.asp"-->
					</div>
				</div>
		
			</div>
			<div id="mask"></div>
		<!-- *************************			CALENDARIO ********************** -->
        
        <!-- *************************			CALENDARIO ********************** 
			< ! - - # i n c l u d e file="MiniCalendario.asp" -- >
			<div id="boxes">
			
				<div id="verEvento" class="window">
					<div id="quadradoEvento">					
						<a href="#" class="close">Fechar [X]</a><br />
							< ! - - # i n c l u d e file="verEvento.asp"-- >
					</div>
				</div>
		
			</div>
			<div id="mask"></div>
		<!-- *************************			CALENDARIO ********************** -->
		

	   </div>
       <div id="titulo_linksinteressantes"><img src="img/titulo_linksinteressantes.png" width="188" height="16" border="0" /></div>
       
       <div id="textolinksesquerda">

<%
	
	sqlLink = "SELECT titulo, texto, pagina FROM link ORDER BY cod DESC LIMIT 3"

	Set rsLink = server.CreateObject("ADODB.RecordSet")

	rsLink.Open sqlLink, ObjDB,3,1

	WHILE rsLink.EOF = FALSE
	
	titulo = rsLink("titulo")
	texto = rsLink("texto")
	pagina = rsLink("pagina")

	texto = Replace(Replace(texto, "<b>", ""), "</b>", "")
	IF Len(texto) > 70 THEN
		texto = mid(texto,1,65)&"..."	
	END IF

%>

  <span class="destaque_vermelho">.  </span>
  <span class="link_links" style="font-weight:normal"><a href="<%=pagina%>" target="_blank"><%=Server.HTMLEncode(texto)%></a></span> 
  <p>&nbsp;</p>

<%
	rsLink.MOVENEXT
	WEND
%>

</div>


<!-- *************************			NOTICIA		 ********************** -->


<%
'	Response.Charset = "iso-8859-1"
	
	SQL = "SELECT cod, titulo, noticia FROM noticias ORDER BY data DESC LIMIT 6"

	Set rsNoticiaDireita = server.CreateObject("ADODB.RecordSet")

	rsNoticiaDireita.Open SQL, ObjDB,3,1

%>
<div id="titulo_noticiadireita"><img src="img/titulo_noticia.png" width="90" height="17" border="0" /></div>

<%
	WHILE rsNoticiaDireita.EOF = FALSE
	
	cod = rsNoticiaDireita("cod")
	titulo = rsNoticiaDireita("titulo")
	noticia = rsNoticiaDireita("noticia")

	noticia = Replace(Replace(noticia, "<b>", ""), "</b>", "")
	IF Len(noticia) > 80 THEN
		noticia = mid(noticia,1,70)&"..."	
	END IF

%>



<div id="bloco_noticiaesquerda">
	<div id="titulo_esquerda"><%=titulo%></div>
	<div id="texto_esquerda"><%=noticia%></div>
	<div class="vejamaisesquerda">
		<a href="verNoticia.asp?cod=<%=cod%>">
			<img src="img/mais.png" width="18" height="17" border="0" style="cursor:pointer" />
		</a>
	</div>
</div>

<%
	rsNoticiaDireita.MOVENEXT
	WEND
	
%>


<!--<div id="pesquisa_protocolo_menor"><img src="img/pesquisa_protocolomenor.jpg" width="292" height="68" border="0" /></div>-->
       
</div>