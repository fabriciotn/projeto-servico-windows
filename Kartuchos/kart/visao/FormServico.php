<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     include("../controle/CtrlServico.php");

     verificaAcesso(5, $_SESSION["cod"]);
  
 
     if($_GET['CRUD']){
        if(verificaAlteracao(5, $_SESSION["cod"]))
         CRUDServico();
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
            <div class="tipo_dados">Cadastro de Serviços</div>
            <div class="form-linha2">
                                <div class="form-rotulo2">ID:</div>
        		                <div class="form-campos2">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:50px;" maxlength="255" type="text"
                                  name="idServico" id="idServico" value="<?php echo $_POST['idServico'];?>" />
                                </div>
                                <div class="form-rotulo2">Nome:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="servico" id="servico" value="<?php echo $_POST['servico'];?>" />
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
                     if($_GET['idServico'])
                     {
                      $dadosServico = obtemServico($_GET['idServico']);
                      ($dadosServico["situacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idServico'];?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nome:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nome" id="nome" value="<?php echo $dadosServico['nome'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Preço de Venda:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="preco" id="preco" value="<?php echo $dadosServico['preco'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                              <select name="situacao" id="situacao">
                              <option value="<?php echo $dadosServico['situacao'];?>" selected="selected"><?php echo $nomeSituacao;?></option>
                              <option value="1">Ativo</option>
                              <option value="2">Inativo</option>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Descrição detalhada:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="descricao" id="descricao"><?php echo $dadosServico['descricao'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idServico=<?php echo $_GET['idServico']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
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
                  <th width="600" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nome do Serviço</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaServicos(); ?>
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



