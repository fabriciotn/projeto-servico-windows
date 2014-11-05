<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
     include("../controle/CtrlClasse.php");
     include("../controle/CtrlSubClasse.php");

     if($_GET['CRUD']){
        CRUDSubClasse();
     }

?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <div class="tipo_dados">Cadastro de SubClasses</div>
            <div class="form-linha2">
        		                <div class="form-rotulo2">Digite o descricao:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="SubClasse" id="SubClasse" value="<?php echo $_POST['SubClasse'];?>" />
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
                     if($_GET['idSubClasse'])
                     {
                      $dadosSubClasse = obtemSubClasse($_GET['idSubClasse']);
                      ($dadosSubClasse["situacao"] == 1) ? $descricaoSituacao="Ativo" : $descricaoSituacao="Inativo";
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idSubClasse'];?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>
                         <tr>
                           <td>
                            <div class="form-rotulo">Classe:</div>
    		                <div class="form-campos">
                              <select name="classe" id="classe">
                              <option value="<?php if($dadosSubClasse['idClasse']) echo $dadosSubClasse['idClasse']; else echo $_POST['classe'];?>" selected="selected">
                                    <?php if($dadosSubClasse['descricaoClasse']) echo $dadosSubClasse['descricaoClasse']; else echo $_POST['descricaoClasse'];?></option>
                              <?php comboClasse();?>
                             </select>
                            </div>
                           </td>
                         </tr>
                         <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Descrição Sub-Classe:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="descricao" id="descricao" value="<?php echo $dadosSubClasse['descricao'];?>"/>
                            </div>
                           </td>
                       </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idSubClasse=<?php echo $_GET['idSubClasse']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
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
                  <th width="200" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Classe</th>
                  <th width="600" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>SubClasse</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaSubClasses(); ?>
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



