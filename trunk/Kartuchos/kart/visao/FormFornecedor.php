<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     include("../controle/CtrlFornecedor.php");
     include("../controle/CtrlEstado.php");

     verificaAcesso(3, $_SESSION["cod"]);
     
     if($_GET['CRUD']){
        if(verificaAlteracao(3, $_SESSION["cod"]))
         CRUDFornecedor();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }

?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <!--<div class="menuCRUD">
                     <li><a href="#">Pesquisar</a></li>
                     <li><a href="#">Teste</a></li>
                     <li><a href="#">Teste</a></li>
            </div>-->
            <div class="tipo_dados">Cadastro de Fornecedores</div>
            <div class="form-linha2">
        		                <div class="form-rotulo2">Digite o Nome:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="fornecedor" id="fornecedor" value="<?php echo $_POST['fornecedor'];?>" />
                                <span style="border: 0px;padding: 0px; position: absolute;">
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=lista');" src="images/icons/seguir.png" style="border: 0px;padding: 0px;" alt="Pesquisar"/>
                                  &#160;&#160;&#160;&#160;
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados');" src="images/icons/+.jpg" style="border: 0px;padding: 0px;" alt="Pesquisar"/>
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
                     if($_GET['idFornecedor'])
                     {
                      $dadosFornecedor = obtemFornecedor($_GET['idFornecedor']);
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idFornecedor'];?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Nome Fantasia:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nomeFantasia" id="nomeFantasia" value="<?php echo $dadosFornecedor['nomeFantasia'];?>"/>
                            </div>
                        </td>
                         <td colspan="10">
                             <div class="form-rotulo">Razão Social:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="razaoSocial" id="razaoSocial" value="<?php echo $dadosFornecedor['razaoSocial'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <div class="form-rotulo">CNPJ (Somente Números):</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cnpj" id="cnpj" value="<?php echo $dadosFornecedor['cnpj'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Contato:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="contato" id="contato" value="<?php echo $dadosFornecedor['contato'];?>"/>
                            </div>
                         </td>
                         <td colspan="10">
                             <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="endereco" id="endereco" value="<?php echo $dadosFornecedor['endereco'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <div class="form-rotulo">Bairro:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="bairro" id="bairro" value="<?php echo $dadosFornecedor['bairro'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Cidade:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cidade" id="cidade" value="<?php echo $dadosFornecedor['cidade'];?>"/>
                            </div>
                         </td>
                          <td>
                           <div class="form-rotulo">Estado:</div>
    		                <div class="form-campos">
                              <select name="estado" id="estado">
                              <option value="<?php echo $dadosFornecedor['idEstado'];?>" selected="selected"><?php echo $dadosFornecedor['estado'];?></option>
                              <?php comboEstado();?>
                             </select>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">CEP:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cep" id="cep" value="<?php echo $dadosFornecedor['cep'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                          <td>
                           <div class="form-rotulo">Telefone 1:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="telefone1" id="telefone1" value="<?php echo $dadosFornecedor['telefone1'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Telefone 2:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="telefone2" id="telefone2" value="<?php echo $dadosFornecedor['telefone2'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Celular:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="celular" id="celular" value="<?php echo $dadosFornecedor['celular'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="2">
                             <div class="form-rotulo">E-Mail 1:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="email1" id="email1" value="<?php echo $dadosFornecedor['email1'];?>"/>
                            </div>
                         </td>
                         <td colspan="10">
                             <div class="form-rotulo">E-Mail 2:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="email2" id="email2" value="<?php echo $dadosFornecedor['email2'];?>"/>
                            </div>
                         </td>
                       </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observação:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dadosFornecedor['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idFornecedor=<?php echo $_GET['idFornecedor']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
          </div>
          </div>
      </form>
    <?php
	}else if($_GET['acao'] == "lista")
       {
        ?>
        <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>ID</th>
                  <th width="10" height="2" align="center"><br>Visualizar</th>
                  <th width="250" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nome Fantasia</th>
		          <th width="83" align="center"><input type="text" id="txtColuna3"/><br>Razão Social</th>
		          <th width="83" align="center"><input type="text" id="txtColuna3"/><br>CNPJ</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">';
               <?php TabelaFornecedores(); ?>
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



