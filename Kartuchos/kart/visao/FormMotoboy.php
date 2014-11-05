<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     include("../controle/CtrlMotoboy.php");

     verificaAcesso(6, $_SESSION["cod"]);

     if($_GET['CRUD']){
        if(verificaAlteracao(6, $_SESSION["cod"]))
         CRUDMotoboy();
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
            <div class="tipo_dados">Cadastro de Motoboys</div>
            <div class="form-linha2">
        		                <div class="form-rotulo2">Digite o Nome:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="motoboy" id="motoboy" value="<?php echo $_POST['motoboy'];?>" />
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
                     if($_GET['idMotoboy'])
                     {
                      $dadosMotoboy = obtemMotoboy($_GET['idMotoboy']);
                      ($dadosMotoboy["situacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idMotoboy'];?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nome:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nome" id="nome" value="<?php echo $dadosMotoboy['nome'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                             <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="endereco" id="endereco" value="<?php echo $dadosMotoboy['endereco'];?>"/>
                            </div>
                         </td>
                       </tr>
                        <tr>
                          <td>
                           <div class="form-rotulo">Telefone:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="telefone" id="telefone" value="<?php echo $dadosMotoboy['telefone'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Celular:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="celular" id="celular" value="<?php echo $dadosMotoboy['celular'];?>"/>
                            </div>
                         </td>
                        </tr>
                         <td colspan="10">
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                              <select name="situacao" id="situacao">
                              <option value="<?php echo $dadosMotoboy['situacao'];?>" selected="selected"><?php echo $nomeSituacao;?></option>
                              <option value="1">Ativo</option>
                              <option value="2">Inativo</option>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observações:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dadosMotoboy['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idMotoboy=<?php echo $_GET['idMotoboy']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
          </div>
          <?php
          if($_GET['idMotoboy'])
          {
          ?>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="confirmacao('Deseja realmente remover o Motoboy?','<?php echo $PHP_SELF; ?>?acao=dados&idMotoboy=<?php echo $_GET['idMotoboy']; ?>&CRUD=delete');" alt="Voltar" src="images/remover.gif" /></a>
          </div>
          <?php
          }
          ?>
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
                  <th width="600" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nome do Motoboy</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaMotoboys(); ?>
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



