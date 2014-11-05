<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlEstado.php");

     verificaAcesso(7, $_SESSION["cod"]);
     
     if($_GET['CRUD'])
     {
      if(verificaAlteracao(7, $_SESSION["cod"]))
         CRUDEmpresa();
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
            <div class="tipo_dados">Cadastro de Empresas</div>
            <div class="form-linha2">
        		                <div class="form-rotulo2">Digite o Nome:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="empresa" id="empresa" value="<?php echo $_POST['empresa'];?>" />
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
                     if($_GET['idEmpresa'])
                     {
                      $dadosEmpresa = obtemEmpresa($_GET['idEmpresa']);
                      ($dadosEmpresa["situacao"] == 1) ? $nomeSituacao="Ativo" : $nomeSituacao="Inativo";
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idEmpresa'];?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nome:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nome" id="nome" value="<?php echo $dadosEmpresa['nome'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                             <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="endereco" id="endereco" value="<?php echo $dadosEmpresa['endereco'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <div class="form-rotulo">Bairro:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="bairro" id="bairro" value="<?php echo $dadosEmpresa['bairro'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Cidade:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cidade" id="cidade" value="<?php echo $dadosEmpresa['cidade'];?>"/>
                            </div>
                         </td>
                          <td>
                           <div class="form-rotulo">Estado:</div>
    		                <div class="form-campos">
                              <select name="estado" id="estado">
                              <option value="<?php echo $dadosEmpresa['idEstado'];?>" selected="selected"><?php echo $dadosEmpresa['nomeEstado'];?></option>
                              <?php comboEstado();?>
                             </select>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">CEP:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cep" id="cep" value="<?php echo $dadosEmpresa['cep'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                          <td>
                           <div class="form-rotulo">Telefone:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="telefone" id="telefone" value="<?php echo $dadosEmpresa['telefone'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Celular:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="celular" id="celular" value="<?php echo $dadosEmpresa['celular'];?>"/>
                            </div>
                         </td>
                        </tr>
                         <td colspan="10">
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                              <select name="situacao" id="situacao">
                              <option value="<?php echo $dadosEmpresa['situacao'];?>" selected="selected"><?php echo $nomeSituacao;?></option>
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
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dadosEmpresa['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idEmpresa=<?php echo $_GET['idEmpresa']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
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
                  <th width="600" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nome da Empresa</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaEmpresas(); ?>
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



