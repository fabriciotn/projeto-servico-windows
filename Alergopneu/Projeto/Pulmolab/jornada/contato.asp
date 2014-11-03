<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>V Jornada de Pneumologia e Alergia em Pediatria</title>
<link href="css/estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>
<script type="text/javascript" src="js/jquery-1.5.min.js"></script>
<script src="js/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="js/jquery.alerts.js" type="text/javascript"></script>
<script src="js/jquery.maskedinput-1.1.2.pack.js" type="text/javascript"></script>
<link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
$(document).ready(function(){
	$('#telefone').mask("(99)9999-9999");
		$('#button').click(function(){
			if( $('#nome').val() == '' ){
				jAlert('Erro! O campo nome é obrigatório.', 'Alert Dialog');
				return false;
			}
			if( $('#email').val() == '' ){
				jAlert('Erro! O campo e-mail é obrigatório', 'Alert Dialog');
				return false;
			}
			if( $('#telefone').val() == '' ){
				jAlert('Erro! O campo telefone é obrigatório.', 'Alert Dialog');
				return false;
			}
			if( $('#assunto').val() == '' ){
				jAlert('Erro! O campo assunto é obrigatório.', 'Alert Dialog');
				return false;
			}
			if( $('#mensagem').val() == '' ){
				jAlert('Erro! O campo mensagem é obrigatório', 'Alert Dialog');
				return false;
			}
/*			$('#button').click(function(){
					var obj = $(this).val(); // eval("document.forms[0].email");
					var txt = $('#email').val();//obj.value;
				if ((txt.length != 0) && ((txt.indexOf("@") < 1) || (txt.lastIndexOf('.') < 7))){
					jAlert('Por favor, informe o e-mail corretamente.');
					$('#email').val('');
					return false;
				}
			});
*/			
		});
});
</script>


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
    <p><img src="img/titulo_contato.jpg" width="85" height="21" /></p>
    <p>Entre em contato conosco através do formulário abaixo ou ligue para  31-2535-9691 ou 31-9956-0234.</p>
<form id="form1" name="form1" method="post" action="contato_ok.asp">
      <p>
        <label for="textfield">Nome:</label>
        <input type="text" name="nome" id="nome" />
      </p>
      <p>
        <label for="textfield2">E-mail:</label>
        <input type="text" name="email" id="email" />
      </p>
      <p>
        <label for="textfield3">Telefone:</label>
        <input type="text" name="telefone" id="telefone" />
      </p>
      
      <p>
        <label for="textfield4">Assunto:</label>
        <input type="text" name="assunto" id="assunto" />
      </p>
      <p>
        <label for="textarea2">Mensagem:</label>
        <textarea name="mensagem" id="mensagem" cols="45" rows="5"></textarea>
      </p>
      <p>
        <input type="submit" name="button" id="button" value="Enviar" />
      </p>
    </form>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
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
