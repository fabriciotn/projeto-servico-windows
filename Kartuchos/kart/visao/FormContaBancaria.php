<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlBanco.php");
     include("../controle/CtrlEmpresa.php");

     verificaAcesso(17, $_SESSION["cod"]);     
     
     if($_GET['CRUD'])
     {
      if(verificaAlteracao(17, $_SESSION["cod"]))
         CRUDContaBancaria();
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
            <div class="tipo_dados">Cadastro de ContaBancarias</div>
            <div class="form-linha2">
        		                <div class="form-rotulo2">Digite o Nome:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="ContaBancaria" id="ContaBancaria" value="<?php echo $_POST['ContaBancaria'];?>" />
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
                     if($_GET['idContaBancaria'])
                     {
                      $dadosContaBancaria = obtemContaBancaria($_GET['idContaBancaria']);
                      ($dadosContaBancaria["idSituacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idContaBancaria'];?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nome:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nome" id="nome" value="<?php echo $dadosContaBancaria['nome'];?>"/>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Banco:</div>
    		                <div class="form-campos">
                              <select name="banco" id="banco">
                              <option value="<?php echo $dadosContaBancaria['idBanco'];?>" selected="selected"><?php echo $dadosContaBancaria['nomeBanco'];?></option>
                              <?php comboBanco();?>
                             </select>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Agência:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="agencia" id="agencia" value="<?php echo $dadosContaBancaria['agencia'];?>"/>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Conta:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="conta" id="conta" value="<?php echo $dadosContaBancaria['conta'];?>"/>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Empresa:</div>
    		                <div class="form-campos">
                             <select name="empresa" id="empresa">
                              <option value="<?php echo $dadosContaBancaria['idEmpresa'];?>" selected="selected"><?php echo $dadosContaBancaria['nomeEmpresa'];?></option>
                              <?php comboEmpresa();?>
                             </select>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                              <select name="idSituacao" id="idSituacao">
                              <option value="<?php echo $dadosContaBancaria['idSituacao'];?>" selected="selected"><?php echo $nomeSituacao;?></option>
                              <option value="1">Ativo</option>
                              <option value="2">Inativo</option>
                             </select>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observação:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dadosContaBancaria['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idContaBancaria=<?php echo $_GET['idContaBancaria']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
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
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nome</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Agência</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Conta</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Empresa</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Banco</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaContaBancarias(); ?>
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



