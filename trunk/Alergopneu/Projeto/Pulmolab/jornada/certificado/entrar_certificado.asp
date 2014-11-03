<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
</head>
<link rel="stylesheet" href="estiloForm.css" />
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script src="js/jquery.maskedinput-1.1.2.pack.js" type="text/javascript"></script>
<script src="js/jquery.alerts.js" type="text/javascript"></script>
<link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
$(document).ready(function(){
		$('#button').click(function(){
			if( $('#cpf').val() == '' ){
				jAlert('Erro! preencha o campo cpf.', 'Alert Dialog');
				return false;
			}
			if( $('#email').val() == '' ){
				jAlert('Erro! preencha o campo e-mail.', 'Alert Dialog');
				return false;
			}
			//var obj = $(this).val(); // eval("document.forms[0].email");
		   var txt = $('#email').val();//obj.value;
		   if ((txt.length != 0) && ((txt.indexOf("@") < 1) || (txt.lastIndexOf('.') < 7))){
			  jAlert('Digite um e-mail válido.', 'Alert Dialog');
			  $('#email').val('');
			  return false;
			}
		});
	// mascara para campos especificos
	$('#cpf').mask("999.999.999-99");
});
</script>	
</head>
<body>
<div id="stylized" style="border:#FFF;" class="myform" align="center">
	<img src="img/logo.jpg" />
<br />


	<form id="form" name="form" method="post" action="confere_login.asp">

		<!--<h1>Certificado Online </h1>-->

	  <p>Para imprimir o certificado da participação no V jornada de Pneumologia e Alergia Padiátrica, preencha seu e-mail e CPF nos campos abaixo.<br />
	  </p>

		<label style="width:105px">CPF</label>
		<input type="text" name="cpf" id="cpf" style="width:120px;" />
		
		<label style="width:105px">E-mail
		<span class="small" style="width:105px">Utilizado na inscrição</span>
		</label>
		<input type="text" name="email" id="email" style="width:260px; text-transform:lowercase" />
		
<br />
<br />

	<div class="botao" style="width:240px;" align="center">
		<button type="submit" id="button" name="button" class="button" style="clear:both;" >Entrar</button>
	</div>
        <div class="spacer"></div>
	</form>
</div>
</body>
</html>
