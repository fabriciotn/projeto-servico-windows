<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     include("../controle/CtrlMaterial.php");
     include("../controle/CtrlFornecedor.php");

     verificaAcesso(4, $_SESSION["cod"]);
     
    
     if($_GET['CRUD']){
        if(verificaAlteracao(4, $_SESSION["cod"]))
         CRUDMaterial();
        else
         echo '<span class="msg_crud_erro">Voc� n�o tem acesso para altera��o!</span>';
     }

?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <!--<div class="menuCRUD">
                     <li><a href="#">Pesquisar</a></li>
                     <li><a href="#">Teste</a></li>
                     <li><a href="#">Teste</a></li>
            </div>-->
            <div class="tipo_dados">Cadastro de Materiais</div>
            <div class="form-linha2">
                                <div class="form-rotulo2">ID:</div>
        		                <div class="form-campos2">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:50px;" maxlength="255" type="text"
                                  name="idMaterial" id="idMaterial" value="<?php echo $_POST['idMaterial'];?>" />
                                </div>
                                <div class="form-rotulo2">Descri��o:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:350px;" maxlength="255" type="text"
                                  name="material" id="material" value="<?php echo $_POST['material'];?>" />
                                <span style="border: 0px;padding: 0px; position: absolute;">
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=lista');" src="images/icons/seguir.png" style="border: 0px;padding: 0px;" alt="Pesquisar"/></a>
                                  &#160;&#160;&#160;&#160;
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados');" src="images/icons/+.jpg" style="border: 0px;padding: 0px;" alt="Pesquisar"/></a>
                                </span>
                              </div>

        	</div>

                 <br><br>

          <?php
          //$_GET['acao'] = "lista";
          if($_GET['acao'] == "dados")
          {
            ?>
            <table>
                   <?php
                     if($_GET['idMaterial'])
                     {
                      $dadosMaterial = obtemMaterial($_GET['idMaterial']);
                      ($dadosMaterial["situacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                      //!($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";

                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idMaterial'];?><BR>
                            <div class="form-rotulo">Material: <?php echo $dadosMaterial['descricao'];?>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Entradas" onClick="Envia('<?php echo $PHP_SELF; ?>?acao=entradaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>');"/>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Sa�das" onClick="Envia('<?php echo $PHP_SELF; ?>?acao=saidaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>');"/>
                            </div>
                          </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Material:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="descricao" id="descricao" value="<?php echo $dadosMaterial['descricao'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td>
                           <div class="form-rotulo">Qde M�nima:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="qdeMinima" id="qdeMinima" value="<?php echo $dadosMaterial['qdeMinima'];?>"/>
                            </div>
                         </td>
                        <!--  <td>
                           <div class="form-rotulo">Pre�o Venda:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="precoVenda" id="precoVenda" value="<?php// echo $dadosMaterial['precoVenda'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Pre�o Revenda:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="precoRevenda" id="precoRevenda" value="<?php// echo $dadosMaterial['precoRevenda'];?>"/>
                            </div>
                         </td>
                        </tr>                        
                        <tr> 
                        -->
                          <td>
                           <div class="form-rotulo">% de Lucro:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="lucro" id="lucro" value="<?php echo $dadosMaterial['lucro'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">% de Lucro M�nimo:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="lucro_minimo" id="lucro_minimo" value="<?php echo $dadosMaterial['lucro_minimo'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                            <div class="form-rotulo">Situa��o:</div>
    		                <div class="form-campos">
                              <select name="situacao" id="situacao">
                              <option value="<?php echo $dadosMaterial['situacao'];?>" selected="selected"><?php echo $nomeSituacao;?></option>
                              <option value="1">Ativo</option>
                              <option value="2">Inativo</option>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                            <div class="form-rotulo2">�tem Consumo?</div>&nbsp;&nbsp;&nbsp;&nbsp;
    		                <div class="form-campos2">
                              <input type="radio" name="flgConsumo" id="flgConsumo" value="1" <?php echo ( $dadosMaterial['flgConsumo'] == 1 ? 'checked' : '' ) ?> value="Sim">Sim
                              &nbsp;&nbsp;
                              <input type="radio" name="flgConsumo" id="flgConsumo" value="0" <?php echo ( $dadosMaterial['flgConsumo'] == 0 ? 'checked' : '' ) ?> value="N�o">N�o
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="200">
                           <div class="form-rotulo">Descri��o Detalhada:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="descricaoDetalhada" id="descricaoDetalhada"><?php echo $dadosMaterial['descricaoDetalhada'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idMaterial=<?php echo $_GET['idMaterial']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
          </div>
          </div>
    <?php
    }else if($_GET['acao'] == "entradaMaterial"){
     ?>
     <table>
     <?php
                     if($_GET['idMaterial'])
                     {
                      $dadosMaterial = obtemMaterial($_GET['idMaterial']);
                      ($dadosMaterial["situacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                      //!($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                   ?>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idMaterial'];?><BR>
                            <div class="form-rotulo">Material: <?php echo $dadosMaterial['descricao'];?>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Entradas" onClick="Envia('<?php echo $PHP_SELF; ?>?acao=entradaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>');"/>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Sa�das" onClick="Envia('<?php echo $PHP_SELF; ?>?acao=saidaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>');"/>
                            </div>
                          </td>
                       </tr>
                       <tr>
                            <td><div class="tipo_dados">Entrada de Materiais</div></td>
                       </tr>
                     <?php
                      if($_GET["idEntradaMaterial"])
                      {
                       $dadosEntradaMaterial = obtemEntradaMaterial($_GET['idEntradaMaterial']);
                       ?>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID Entrada Material: <?php echo $_GET['idEntradaMaterial'];?>
                            </div>
                          </td>
                       </tr>
                    <?php
                      }
                } ?>
                     <tr>
                         <td colspan="10">
                             <div class="form-rotulo">Fornecedor:</div>
                             <div class="form-campos">
                                  <select name="fornecedor" id="fornecedor">
                                    <option value="<?php echo $dadosEntradaMaterial['idFornecedor'];?>" selected="selected"><?php echo $dadosEntradaMaterial['nomeFantasia'];?></option>
                                    <?php comboFornecedor();?>
                                  </select>
                             </div>
                         </td>
                     </tr>
                     <tr>
                         <td>
                           <div class="form-rotulo">Qde Comprada:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="qdeComprada" id="qdeComprada" value="<?php echo $dadosEntradaMaterial['qdeComprada'];?>"/>
                            </div>
                         </td>
                          <td>
                           <div class="form-rotulo">Valor Unit�rio:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="valorUnitarioPago" id="valorUnitarioPago" value="<?php echo $dadosEntradaMaterial['valorUnitarioPago'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nota Fiscal:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="notaFiscalEntrada" id="notaFiscalEntrada" value="<?php echo $dadosEntradaMaterial['notaFiscalEntrada'];?>"/>
                            </div>
                        </td>
                       </tr>
     </table>
     <BR>
     <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=entradaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>&idEntradaMaterial=<?php echo $_GET['idEntradaMaterial']; ?>&CRUD=saveEntradaMaterial');" alt="Voltar" src="images/salvar.gif" /></a>
          </div>
          </div>
    <?php
         if(!$_GET['idEntradaMaterial'])
         {
         ?>
          <div style="width: 95%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="10" height="2" align="center"><br>Editar</th>
                  <th width="10" height="2" align="center"><br>Excluir</th>
                  <th width="500" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Material</th>
                  <th width="300" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Fornecedor</th>
                  <th width="80" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Data Entrada</th>
                  <th width="80" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Qde Comprada</th>
                  <th width="80" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Valor Unit�rio</th>
                  <th width="80" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Valor Total</th>
                  <th width="80" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nota Fiscal</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">';
               <?php TabelaEntradasMaterial($_GET['idMaterial']); ?>
               </tbody>
             </table>
           </div>
         <?php
         }

	}else if($_GET['acao'] == "saidaMaterial"){
     ?>
     <table>
     <?php
                     if($_GET['idMaterial'])
                     {
                      $dadosMaterial = obtemMaterial($_GET['idMaterial']);
                      ($dadosMaterial["situacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                      //!($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idMaterial'];?><BR>
                            <div class="form-rotulo">Material: <?php echo $dadosMaterial['descricao'];?>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Entradas" onClick="Envia('<?php echo $PHP_SELF; ?>?acao=entradaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>');"/>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Sa�das" onClick="Envia('<?php echo $PHP_SELF; ?>?acao=saidaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>');"/>
                            </div>
                          </td>
                       </tr>
                       <tr>
                            <td><div class="tipo_dados">Sa�da de Materiais</div></td>
                       </tr>
                     <?php
                      if($_GET["idSaidaMaterial"])
                      {
                       $dadosEntradaMaterial = obtemEntradaMaterial($_GET['idSaidaMaterial']);
                       ?>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID Sa�da Material: <?php echo $_GET['idSaidaMaterial'];?>
                            </div>
                          </td>
                       </tr>
                    <?php
                      }
                } ?>
                     <tr>
                         <td>
                           <div class="form-rotulo">Qde Baixa:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="qdeBaixa" id="qdeBaixa" value="<?php echo $dadosEntradaMaterial['qdeComprada'];?>"/>
                            </div>
                         </td>
                        </tr>
     </table>
     <BR>
     <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=saidaMaterial&idMaterial=<?php echo $_GET['idMaterial']; ?>&CRUD=saveSaidaMaterial');" alt="Voltar" src="images/salvar.gif" /></a>
          </div>
          </div>
    <?php
         if(!$_GET['idSaidaMaterial'])
         {
         ?>
          <div style="width: 95%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="500" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Material</th>
                  <th width="200" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Ordem de Servi�o</th>
                  <th width="120" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Data Sa�da</th>
                  <th width="40" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Qde</th>
                  <th width="120" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Pre�o Sa�da</th>
                  <th width="120" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Valor Total</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaSaidasMaterial($_GET['idMaterial']); ?>
               </tbody>
             </table>
           </div>
         <?php
         }

	}else if($_GET['acao'] == "lista"){
        ?>
        <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>ID</th>
                  <th width="10" height="2" align="center"><br>Visualizar</th>
                  <th width="600" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Descri��o</th>
                  <th width="40" style="vertical-align:text-bottom;" align="center"><br>Entradas</th>
                  <th width="40" style="vertical-align:text-bottom;" align="center"><br>Sa�das</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaMateriais(); ?>
               </tbody>
             </table>
           </div>
        </form>
    <?php
       
       }
	?>
</form>            <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



