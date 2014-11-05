<!--
<ul>
<br />
    <li><strong>Acesso</strong></li>
    <li><a href="index.php">Acessar sua Conta</a></li>
    <br>
    </ul>
-->
<br>
</div>
</div>
</div>
<div id="sgi-conteudo">
       <div id="sgi-texto">
            <div class="tipo_dados">Acesse sua Conta</div>
                 <br>
                 <br>
                 <br>
            <span class="area_campo">

            Para acessar sua conta, informe seu Login e a senha de cadastro no Sistema Kartuchos.
            </span>
            <br>
            <br>
            <form name="form" action="../controle/logar.php" method="post" >
            <div class="formulario" id="formulario">

	        <div class="form-linha">
		         <div class="form-rotulo"><label for="cpf">Login:</label></div>

	  	         <div class="form-campos">
		  	      <input maxlength="14" type="text" name="login" id="login" />
                 </div>
           </div>


	       <div class="form-linha">
		        <div class="form-rotulo"><label for="credenciamento_usuario_password">Digite sua senha de acesso:</label></div>

	  	        <div class="form-campos">
		  	     <input type="password" name="senha" id="senha" />
                </div>
          </div>
          <br />
          <br />
		  <div class="form-botao-voltar">
		     	<a href="index.php"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
		  <div class="form-botao-enviar">
			<input type="image" name="commit" src="images/continuar.gif" style="border: 0px;" alt="Continuar" />		</div>
	</form>

