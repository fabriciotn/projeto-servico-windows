<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>V Jornada de Pneumologia e Alergia em Pediatria</title>
<link href="css/estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>

<script type="text/javascript">

function mostravoto () {

document.getElementById("opiniao").style.display = 'inline-block' ;
document.getElementById("vota").style.display = 'none' ;
	
}

function computado () {

document.getElementById("opiniao").style.display = 'none' ;
document.getElementById("computado").style.display = 'inline-block' ;
	
}

</script>

<div class="centraliza">

<!--#include file="topo.asp"-->
        
        
<div id="interna">
      
        <p><img src="img/titulo_palestras.jpg" /></p>
        

        
        <iframe src="http://www.hbatools.com.br/congresso/pulmolab/pulmolab2011/jaInscrito.asp" width="600" height="800" frameborder="0" allowtransparency="true"></iframe>
        
 
  </div>
      
      
      <div id="lateral">
      
        <p>&nbsp;</p>
        <div id="opiniao">
        <p><img src="img/voto_computado.jpg" height="67" /></p>
        <p>Opcional: Deixe uma observação nos dizendo o por quê de sua resposta.</p>
        <form id="form2" name="form2" method="post" action="" onsubmit="return false">
          <p>
            <label for="textarea"></label>
            <textarea name="textarea" id="textarea" cols="20" rows="5"></textarea>
          </p>
          <p align="right">
            <input type="submit" name="button2" id="envia" value="Enviar" onclick="computado()" />
          </p>
        </form>
        </div>
        
        <div id="computado">
        <p><img src="img/comentario_computado.jpg" width="187" height="67" /></p>
        </div>
        
      </div>
      
      
</div>
      
</div>



<!--#include file="rodape.asp" -->


</body>
</html>
