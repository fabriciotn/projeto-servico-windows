<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlAprovacao.php");

     verificaAcesso(13, $_SESSION["cod"]);
     
     if($_GET['CRUD']){
        if(verificaAlteracao(13, $_SESSION["cod"]))
         CRUDAprovacao();
        else
         echo '<span class="msg_crud_erro">Voc� n�o tem acesso para altera��o!</span>';
     }
    $_GET['idItemColeta'] = $_GET['id'];


?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados">Editar Aprova��o</div>
                 <br><br>
                  <table>
                   <?php
                     if($_GET['idItemColeta'])
                     {
                      $dados = obtemItemColeta($_GET['idItemColeta']);
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idItemColeta'];?></div>
                            </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Cliente:</div>
    		                <div class="form-campos">
                                <?php echo $dados['nomeCliente'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td width="300px">
                            <div class="form-rotulo">Data Cadastro:</div>
    		                <div class="form-campos">
                                <?php echo $dados['dataCadastro'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Usu�rio:</div>
    		                <div class="form-campos">
                               <?php echo $dados['nomeFuncionario'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Data Altera��o:</div>
    		                <div class="form-campos">
                               <?php echo $dados['dataAlteracao'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Usu�rio:</div>
    		                <div class="form-campos">
                               <?php echo $dados['nomeFuncionarioAlteracao'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Descri��o:</div>
    		                <div class="form-campos">
                               <?php echo $dados['descricao'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Acess�rios:</div>
    		                <div class="form-campos">
                               <?php echo $dados['acessorios'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">C�digo de Barras:</div>
    		                <div class="form-campos">
                               <?php echo $dados['codigoBarras'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">N�mero de S�rie:</div>
    		                <div class="form-campos">
                               <?php echo $dados['numeroSerie'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Defeito Relatado:</div>
    		                <div class="form-campos">
                               <?php echo $dados['defeitoRelatado'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Servi�o Executado:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="servicoExecutado" id="servicoExecutado"><?php echo $dados['servicoExecutado'];?></textarea>
                           </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Descri��o detalhada:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dados['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>
          </div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=saveAprovacao');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="confirmacao('Deseja aprovar este Item?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&idSetor=9&CRUD=encerraAprovacao');" alt="Aprova��o" src="images/aprovar.gif" /></a>
          </div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="confirmacao('Deseja reprovar este Item?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&idSetor=10&CRUD=encerraAprovacao');" alt="Avalia��o" src="images/reprovar.gif" /></a>
          </div>
          </div>
      </form>
      <?php
      }
      ?>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



