<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateConfiguracoes.php");
?>
<div id="sgi-conteudo">
       <div id="sgi-texto">
            <div class="tipo_dados">Alteração de Senha</div>
                 <br>
                     <form action="../controle/alterarSenha.php" method="post" >

<span class="area_campo">
      Preencha corretamente os campos abaixo para alterar sua senha:

<br /><br />
<br>

</span>
<div class="formulario">
    <div class="form-linha">
		<div class="form-rotulo"><label for="senhaAtual">Digite sua senha ATUAL:</label></div>

	  	<div class="form-campos">
		  	<input type="password" name="senhaAtual" id="senhaAtual" />
       </div>
	</div>
   <br>
   <div class="form-linha">
		<div class="form-rotulo"><label for="senhaRH">Digite sua NOVA senha de acesso:</label></div>

	  	<div class="form-campos">
		  	<input type="password" name="senhaNova" id="senhaNova" />
       </div>
	</div>
	<br>
	<div class="form-linha">
		<div class="form-rotulo"><label for="SenhaNova">Digite sua NOVA senha de acesso NOVAMENTE:</label></div>

	  	<div class="form-campos">
		  	<input type="password" name="senhaNovaAgain" id="senhaNovaAgain" />
       </div>
	</div>
	<br><br>
	<div class="form-botoes">
		<div class="form-botao-voltar">
			<a href="configuracoes.php"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
		<div class="form-botao-enviar">
			<input type="image" name="commit" src="images/salvar.gif" style="border: 0px;" alt="Salvar" />		</div>
	</div>
	</form>

</div>
                                                </div>
                                        </div>
                           </div>

        <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
<?php
     include("_templates/_templateRodape.php");
?>


