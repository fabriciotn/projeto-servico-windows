<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlProducao.php");

     verificaAcesso(11, $_SESSION["cod"]);
          
     if($_GET['CRUD']){
        if(verificaAlteracao(11, $_SESSION["cod"]))
         CRUDProducao();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
     
    $_GET['idItemColeta'] = $_GET['id'];
    $_GET['acao'] = "dados";
     

?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados">Editar Produção</div>
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
                            <div class="form-rotulo">Usuário:</div>
    		                <div class="form-campos">
                               <?php echo $dados['nomeFuncionario'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Data Alteração:</div>
    		                <div class="form-campos">
                               <?php echo $dados['dataAlteracao'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Usuário:</div>
    		                <div class="form-campos">
                               <?php echo $dados['nomeFuncionarioAlteracao'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Descrição:</div>
    		                <div class="form-campos">
                               <?php echo $dados['descricao'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Acessórios:</div>
    		                <div class="form-campos">
                               <?php echo $dados['acessorios'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Código de Barras:</div>
    		                <div class="form-campos">
                               <?php echo $dados['codigoBarras'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Número de Série:</div>
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
                           <td>
                            <div class="form-rotulo">Qde Recargas:</div>
    		                <div class="form-campos">
                             <input style="width:150px;" maxlength="100" type="text" name="qdeRecargas" id="qdeRecargas" value="<?php echo $dados['qdeRecargas'];?>"/>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Tipo:</div>
    		                <div class="form-campos">
                              <select name="idTipoProducao" id="idTipoProducao">
                              <option value="<?php echo $dados['idTipoProducao'];?>" selected="selected"><?php echo $dados['nomeProducao'];?></option>
                                <?php comboTipoProducao();?>
                              </select>
                            </div>
                           </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Serviço Executado:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="servicoExecutado" id="servicoExecutado"><?php echo $dados['servicoExecutado'];?></textarea>
                           </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Descrição detalhada:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dados['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
                        <div class="form-botoes">
          <?php if($dados['idSetor'] != 10)
           {
           ?>
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>
          </div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=saveProducao');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          <br><br><br><br>
          <div class="form-botao-grande">
               <a href="#"><img
                onClick="confirmacao('Deseja retornar este item para coleta?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&idSetor=<?php echo $dados['idSetor']; ?>&idOrdemServico=<?php echo $dados['idOrdemServico']; ?>&CRUD=voltaStatus');"
               alt="Voltar Item para Coleta" src="images/voltar_item_coleta.gif" /></a>
           </div>
          <?php if($dados['idSetor'] != 9)
           {
           ?>
          <div class="form-botao-grande">
            <a href="#"><img onClick="confirmacao('Deseja enviar este item para aprovação?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&idSetor=8&CRUD=encerraProducao');" alt="Aprovação" src="images/enviar_aprovacao.gif" /></a>
          </div>
          <?php
           }
           ?>
          <div class="form-botao-grande">
            <a href="#"><img onClick="confirmacao('Deseja enviar este item para avaliação?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&idSetor=3&CRUD=encerraProducao');" alt="Avaliação" src="images/enviar_avaliacao.gif" /></a>
          </div>
           <?php
           }else{
                 ?>
                   <div class="form-botao-voltar">
                   <a href="#"><img
                   onClick="confirmacao('Deseja cancelar este item?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&idSetor=<?php echo $dados['idSetor']; ?>&CRUD=cancelarItem');"
                   alt="Voltar Item para Coleta" src="images/cancelar.gif" /></a>
                   </div>
                   <br>
                   <br>
                   <br><font color='red' size='+1'><strong>Orçamento Reprovado.</strong></font>
                <?php
				}
           
           ?>
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



