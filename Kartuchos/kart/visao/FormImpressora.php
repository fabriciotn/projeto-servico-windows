<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
     include("../controle/CtrlImpressora.php");

     verificaAcesso(34, $_SESSION["cod"]);
     
     if($_GET['CRUD']){
        if(verificaAlteracao(34, $_SESSION["cod"]))
         CRUDImpressora();
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
            <div class="tipo_dados">Cadastro de Impressoras</div>
            <div class="form-linha2">
        		                <div class="form-rotulo2">Digite o descricao:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="Impressora" id="Impressora" value="<?php echo $_POST['Impressora'];?>" />
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
                     if($_GET['idImpressora'])
                     {
                      $dadosImpressora = obtemImpressora($_GET['idImpressora']);
                      $dadosClienteImpressora = obtemClienteImpressora($_GET['idImpressora']);
                      ($dadosImpressora["situacao"] == 1) ? $descricaoSituacao="Ativo" : $descricaoSituacao="Inativo";
                      if($dadosImpressora["situacao"] == "Alugada")
                      {
                       
                        $mensagemAlugada = "Impressora locada na empresa: (".$dadosClienteImpressora["idCliente"].") ".$dadosClienteImpressora["nome"]." ( ".$dadosClienteImpressora["tipoCliente"]." )";
                      }
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idImpressora'];?></div>
                        </td>
                       </tr>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo"><?php echo $mensagemAlugada;?></div>
                        </td>
                       </tr>
                    <?php

                      } ?>

                         <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Marca:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="marca" id="marca" value="<?php echo $dadosImpressora['marca'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Modelo:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="modelo" id="modelo" value="<?php echo $dadosImpressora['modelo'];?>"/>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Patrimônio:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="patrimonio" id="patrimonio" value="<?php echo $dadosImpressora['patrimonio'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Número de Série:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="numSerie" id="numSerie" value="<?php echo $dadosImpressora['numSerie'];?>"/>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Número de Cópias Inicial:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="num_copias_inicial" id="num_copias_inicial" value="<?php echo $dadosImpressora['num_copias_inicial'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Número de Digitalizações Inicial:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="num_digit_Inicial" id="num_digit_Inicial" value="<?php echo $dadosImpressora['num_digit_Inicial'];?>"/>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Tipo:</div>
    		                <div class="form-campos">
                                <select name="tipo" id="tipo">
                                <option  value="<?php echo $dadosImpressora['tipo'];?>"><?php echo $dadosImpressora['tipo'];?></option>
                                <option  value="Laser Monocromática">Laser Monocromática</option>
			                    <option  value="Laser Multifunção">Laser Multifunção</option>
			                    <option  value="Jato de Tinta">Jato de Tinta</option>
			                    <option  value="Jato de Tinta Multifunção">Jato de Tinta Multifunção</option>
			                    <option  value="Código de Barras">Código de Barras</option>
		                        </select>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Tipo de Impressão:</div>
    		                <div class="form-campos">
                                <select name="tipo_impressao" id="tipo_impressao">
                                <option  value="<?php echo $dadosImpressora['tipo_impressao'];?>"><?php echo $dadosImpressora['tipo_impressao'];?></option>
                                <option  value="Mono">Mono</option>
			                    <option  value="Colorida">Colorida</option>
		                        </select>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                                <select name="situacao" id="situacao">
                                <option  value="<?php echo $dadosImpressora['situacao'];?>"><?php echo $dadosImpressora['situacao'];?></option>
                                            <option  value="Alugada">Alugada</option>
                                            <option  value="Autorizada">Autorizada</option>
			                    <option  value="Em Manutenção">Em Manutenção</option>
			                    <option  value="À disposição">À disposição</option>
                                             <option  value="Desativada">Desativada</option>
		                </select>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="4">
                            <div class="form-rotulo">Setor:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="setor" id="setor" value="<?php echo $dadosImpressora['setor'];?>"/>
                            </div>
                           </td>                           
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observação:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dadosImpressora['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dados&idImpressora=<?php echo $_GET['idImpressora']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
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
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Patrimônio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nº Série</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo de Impressão</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Situação</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Setor</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaImpressoras(); ?>
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



