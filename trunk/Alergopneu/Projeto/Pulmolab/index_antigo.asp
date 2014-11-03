<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css_menu/style.css" type="text/css" media="screen"/>

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

</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<!-- #include file="superior.asp" -->
    
<div id="geral">
        <div id="centro"> 
        
         <!-- #include file="esquerda.asp" -->
        
       <!-- #include file="direita.asp" -->
        
</div>
     </div>

<!-- #include file="rodape.asp" -->



</body>
</html>
