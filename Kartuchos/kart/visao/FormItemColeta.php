<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlColeta.php");
     include("../controle/CtrlParametro.php");

     if($_GET['CRUD']){
        CRUDItemColeta();
     }
    $_GET['idOrdemServico'] = $_GET['id'];
    $_GET['acao'] = "dados";
     

?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados">Editar Itens Coleta</div>
                 <br><br>
                  <table>
                   <?php
                     if($_GET['idOrdemServico'])
                     {
                      $dados = obtemColeta($_GET['idOrdemServico']);
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idOrdemServico'];?></div>
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
                            <div class="form-rotulo">Motoboy Coleta:</div>
    		                <div class="form-campos">
                              <select name="motoboyColeta" id="motoboyColeta">
                              <option value="<?php echo $dados['idMotoboyColeta'];?>" selected="selected"><?php echo $dados['motoboyColeta'];?></option>
                              <?php comboMotoboy();?>
                             </select>
                            </div>
                           </td>
                           <td width="300px">
                            <div class="form-rotulo">Motoboy Entrega:</div>
    		                <div class="form-campos">
                              <select name="motoboyEntrega" id="motoboyEntrega">
                              <option value="<?php echo $dados['idMotoboyEntrega'];?>" selected="selected"><?php echo $dados['motoboyEntrega'];?></option>
                              <?php comboMotoboy();?>
                             </select>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Status:</div>
    		                <div class="form-campos">
                              <select name="status" id="status">
                              <option value="<?php echo $dados['idStatus'];?>" selected="selected"><?php echo $dados['nomeStatus'];?></option>
                              <option value="2">Em Produção</option>
		                      <option value="7">Cancelada</option>
                             </select>
                            </div>
                           </td>
                           <td>
                           <div class="form-botao-voltar">
                                <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=saveColeta');" alt="Salvar" src="images/salvar.gif" /></a>
                           </div>
                           </td>
                        </tr>
                     </table>
                     <hr>
                  <br>
                  <div class="form-rotulo">Incluir Novo Item: &#160;&#160;&#160;
                                           <input type="button" class="botao" value=" + " onclick="Oculta(this,'novoItem')" /></div>
                  <br>
                      <div id="novoItem" style="display: none;">
                        <table>
                          <tr>
                            <td width="150px">
                               <div class="form-rotulo">Descrição:</div>
        	                   <div class="form-campos">
                                <input style="width:350px;" maxlength="100" type="text" name="descricao" id="descricao"/>
                               </div>
                            </td>
                            <td width="150px">
                               <div class="form-rotulo">Acessórios:</div>
        	                   <div class="form-campos">
                                <input style="width:350px;" maxlength="100" type="text" name="acessorios" id="acessorios"/>
                               </div>
                            </td>
                          </tr>
                          <tr>
                              <td colspan="200">
                              <div class="form-rotulo">Defeito Relatado:</div>
		                      <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="defeitoRelatado" id="defeitoRelatado"></textarea>
                              </div>
                              </td>
                          </tr>
                          <tr>
                            <td>
                               <div class="form-rotulo">Código de Barras:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="codigoBarras" id="codigoBarras"/>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Número de Série:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="numeroSerie" id="numeroSerie" />
                               </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                               <div class="form-rotulo">Quantidade Recargas:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="qdeRecargas" id="qdeRecargas"/>
                               </div>
                            </td>
                          </tr>
                          <tr>
                              <td colspan="200">
                              <div class="form-rotulo">Observações:</div>
		                      <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"></textarea>
                              </div>
                              </td>
                          </tr>
                          </table>
                          <div class="form-botoes">
                          <div class="form-botao-voltar">
                          <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=novoItem');" alt="Salvar" src="images/salvar.gif" /></a>
                         </div>
                         </div>
                      </div>
                  <hr>
                  <br>
                  <br>
                  <div class="form-rotulo">Itens Cadastrados</div>
                  <br>
                      <?php $qtdItens = obtemItensColeta($_GET['idOrdemServico']);?>
                          <div class="form-botoes">
                          <div class="form-botao-voltar">
                          <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['idOrdemServico']; ?>&qtdItens=<?php echo $qtdItens; ?>&CRUD=saveItensColeta');" alt="Voltar" src="images/salvar.gif" /></a>
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



