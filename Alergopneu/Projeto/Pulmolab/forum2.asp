<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css_menu/style.css" type="text/css" media="screen"/>

<style type="text/css">
<!--


.clica3 {
cursor:pointer;
}



.style2 {font-size: 11px
}
.tabela {border-color:#000000; border-width:5px;
}
.table_cadastra{
	margin:0 auto;
	margin-top:60px;
	border:#006699 1px solid;
	background:#EFF4FA;
}
-->
</style>
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
			
	<div id="texto">
		<div class="titulo"><img src="img/titulo_forum.png" width="77" height="17" border="0" /></div>
		 
		<div id="texto_centro">
		  <div id="fundo_forum">
			  
			  <div id="engloba_forum">
				  <div id="titulo_forum_nao_cadastrado"><img src="img/nao.png" width="13" height="15" border="0" /> Não sou cadastrado (a)</div>
				  <div id="fundo_forum_cadastro"><img src="img/forum_nao.png" width="253" height="155" border="0" /></div> 
			  </div>
			  
			  <div id="engloba_forum2">
				  <div id="titulo_forum_cadastrado"><img src="img/sim.png" width="19" height="16" border="0" /> Já estou cadastrado (a)</div>      
				  <div id="fundo_forum_cadastro2">
					  <div id="nome_forum">Nome: </div>
					  <div id="email_forum">E-mail:</div>
					  <div id="ok_forum">ok</div>
					  <div id="senha_nova">Esqueceu sua senha ? Clique aqui </div>
				  </div>
			  </div>
			  
			  
		  </div>
		</div>
		
	</div>
		   
        
</div>
<!-- #include file="direita_menor.asp" -->   
</div>

<!-- #include file="rodape.asp" -->



</body>
</html>
<script type="text/javascript">

	$(document).ready(function(){

			$('#forumLogin').submit(function(){

				if( $('#nome').val() != 'Desenvolvimento HBA Tecnologia' )
				{
					if ( $('#nome').val() == '' )
					{
							alert("Erro! O campo nome é obrigatório.");
							return false;
					}
				 
					if ($('#email').val() == '')
					{
						alert("Erro! O campo email é obrigatório.");
						return false;                                 
					}
				}                           
				
			});

	});		

</script>
