<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.galleryview-1.1.js"></script>
<script type="text/javascript" src="js/jquery.galleryview-1.1-pack.js"></script>
<script type="text/javascript" src="js/jquery.timers-1.2.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#photos').galleryView({
			panel_width: 539,
			panel_height: 240,
			frame_width: 80,
			frame_height: 46
		});
	});
</script>

<div id="engloba_superior">
   		 <div id="superior">
         
         	 <!-- #include file="banner.asp" -->  
<%

	SQL = "SELECT texto, titulo FROM textohome ORDER BY cod DESC"
	Set rsTxt = Server.CreateObject("ADODB.RecordSet")
	rsTxt.Open SQL, ObjDB, 3, 1
	
	IF rsTxt.EOF = FALSE THEN
		
		titulo = rsTxt("titulo")
		texto = rsTxt("texto")
		
		maxTam = 305
		IF Len(texto) > maxTam THEN
			texto = Mid(texto, 1, maxTam) & "..."
		END IF
				
	END IF
	

%>
            
           <div id="apresentacao">
			<div id="titulo_apresentacao"><img src="img/tituloHome.png" /> <%=titulo%></div>
            <div id="texto_apresentacao"><%=texto%></div>
            <div id="leia_mais"><a href="bemvindo.asp">leia mais</a></div>
            
            <div id="duvidas_forum"><a href="cadastro_forum.asp"><img src="img/chamada.jpg" width="357" height="95" border="0" /></a></div>
            
           </div> 
            
         </div>
    </div>