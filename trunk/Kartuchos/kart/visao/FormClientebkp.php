<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlEstado.php");
     include("../controle/CtrlFuncionario.php");


     if($_GET['CRUD']){
        CRUDCliente();
     }

?>
  <link rel="stylesheet" type="text/css" href="css/itens.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/estrutura.css" media="screen">
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <div class="tipo_dados">Cadastro de Clientes</div>
            <div class="form-linha2">
                          <div class="form-rotulo2">Digite a nome:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?acao=lista');" style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="cliente" id="cliente" value="<?php echo $_POST['cliente'];?>" />
                                <span style="border: 0px;padding: 0px; position: absolute;">
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=lista');" src="images/icons/seguir.png" style="border: 0px;padding: 0px;" alt="Pesquisar"/></a>
                                  &#160;&#160;&#160;&#160;
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dadosPF');" src="images/icons/PF.png" style="border: 0px;padding: 0px;" alt="Pessoa Física"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dadosPJ');" src="images/icons/PJ.png" style="border: 0px;padding: 0px;" alt="Pessoa Jurídica"/></a>
                                </span>
                              </div>

        	</div>

                 <br><br>

          <?php
          //$_GET['acao'] = "lista";
          if($_GET['acao'] == "dadosPF")
          {
            ?>
            <table>
                   <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Pessoa Física</div>
                   </tr>
                   <?php
                     if($_GET['idCliente'])
                     {
                      $dadosCliente = obtemClientePF($_GET['idCliente']);

                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idCliente'];?><BR></div>
                          </td>
                       </tr>
                    <?php

                      } ?>

                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nome:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nome" id="nome" value="<?php echo $dadosCliente['nome'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">CPF (somente números):</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="cpf" id="cpf" value="<?php echo $dadosCliente['cpf'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                             <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="endereco" id="endereco" value="<?php echo $dadosCliente['endereco'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <div class="form-rotulo">Bairro:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="bairro" id="bairro" value="<?php echo $dadosCliente['bairro'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Cidade:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cidade" id="cidade" value="<?php echo $dadosCliente['cidade'];?>"/>
                            </div>
                         </td>
                          <td>
                           <div class="form-rotulo">Estado:</div>
    		                <div class="form-campos">
                              <select name="estado" id="estado">
                              <option value="<?php echo $dadosCliente['idEstado'];?>" selected="selected"><?php echo $dadosCliente['estado'];?></option>
                              <?php comboEstado();?>
                             </select>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">CEP:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cep" id="cep" value="<?php echo $dadosCliente['cep'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                          <td>
                           <div class="form-rotulo">Telefone:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="telefone" id="telefone" value="<?php echo $dadosCliente['telefone'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Celular:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="celular" id="celular" value="<?php echo $dadosCliente['celular'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                             <div class="form-rotulo">E-Mail:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="email" id="email" value="<?php echo $dadosCliente['email'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                       <td>
                           <div class="form-rotulo">Vendedor:</div>
    		                <div class="form-campos">
                              <select name="vendedor" id="vendedor">
                              <option value="<?php echo $dadosCliente['idVendedor'];?>" selected="selected"><?php echo $dadosCliente['vendedor'];?></option>
                              <?php comboFuncionario();?>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                              <select name="situacao" id="situacao">
                              <option value="<?php echo $dadosCliente['situacao'];?>" selected="selected"><?php echo $dadosCliente['nomeSituacao'];?></option>
                              <option value="1">Positivo</option>
                              <option value="2">Negativado</option>
                              <option value="3">Excluído</option>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="200">
                           <div class="form-rotulo">Observações:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"><?php echo $dadosCliente['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dadosPF&idCliente=<?php echo $_GET['idCliente']; ?>&CRUD=savePF');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          </div>
    <?php
    }else if($_GET['acao'] == "dadosPJ"){
     ?>
     <table>
                   <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Pessoa Jurídica</div>
                   </tr>
                   <?php
                     if($_GET['idCliente'])
                     {
                      $dadosCliente = obtemClientePJ($_GET['idCliente']);

                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idCliente'];?><BR></div>
                          </td>
                       </tr>
                    <?php

                      } ?>

                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Nome Fantasia:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="nomeFantasia" id="nomeFantasia" value="<?php echo $dadosCliente['nomeFantasia'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Razão Social:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="razaoSocial" id="razaoSocial" value="<?php echo $dadosCliente['razaoSocial'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">CNPJ (somente números):</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="cnpj" id="cnpj" value="<?php echo $dadosCliente['cnpj'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Inscrição Estadual:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="inscricaoEstadual" id="inscricaoEstadual" value="<?php echo $dadosCliente['inscricaoEstadual'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                            <div class="form-rotulo2">Retenção ISS:</div>&nbsp;&nbsp;&nbsp;&nbsp;
    		                <div class="form-campos2">
                              <input type="radio" name="retencaoISS" id="retencaoISS" value="1" <?php echo ( $dadosCliente['retencaoISS'] == 1 ? 'checked' : '' ) ?> value="Sim">Sim
                              &nbsp;&nbsp;
                              <input type="radio" name="retencaoISS" id="retencaoISS" value="0" <?php echo ( $dadosCliente['retencaoISS'] == 0 ? 'checked' : '' ) ?> value="Não">Não
                            </div>
                         </td>
                        </tr>
                       <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Responsável:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="responsavel" id="responsavel" value="<?php echo $dadosCliente['responsavel'];?>"/>
                            </div>
                        </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                             <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="endereco" id="endereco" value="<?php echo $dadosCliente['endereco'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                         <td>
                           <div class="form-rotulo">Bairro:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="bairro" id="bairro" value="<?php echo $dadosCliente['bairro'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Cidade:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cidade" id="cidade" value="<?php echo $dadosCliente['cidade'];?>"/>
                            </div>
                         </td>
                          <td>
                           <div class="form-rotulo">Estado:</div>
    		                <div class="form-campos">
                              <select name="estado" id="estado">
                              <option value="<?php echo $dadosCliente['idEstado'];?>" selected="selected"><?php echo $dadosCliente['estado'];?></option>
                              <?php comboEstado();?>
                             </select>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">CEP:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="cep" id="cep" value="<?php echo $dadosCliente['cep'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                          <td>
                           <div class="form-rotulo">Telefone:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="telefone" id="telefone" value="<?php echo $dadosCliente['telefone'];?>"/>
                            </div>
                         </td>
                         <td>
                           <div class="form-rotulo">Celular:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="celular" id="celular" value="<?php echo $dadosCliente['celular'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                             <div class="form-rotulo">E-Mail:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="email" id="email" value="<?php echo $dadosCliente['email'];?>"/>
                            </div>
                         </td>
                       </tr>
                       <tr>
                       <td>
                           <div class="form-rotulo">Vendedor:</div>
    		                <div class="form-campos">
                              <select name="vendedor" id="vendedor">
                              <option value="<?php echo $dadosCliente['idVendedor'];?>" selected="selected"><?php echo $dadosCliente['vendedor'];?></option>
                              <?php comboFuncionario();?>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                        <td>
                           <div class="form-rotulo">Limite de crédito:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="limiteCredito" id="limiteCredito" value="<?php echo $dadosCliente['limiteCredito'];?>"/>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="10">
                            <div class="form-rotulo">Situação:</div>
    		                <div class="form-campos">
                              <select name="situacao" id="situacao">
                              <option value="<?php echo $dadosCliente['situacao'];?>" selected="selected"><?php echo $dadosCliente['nomeSituacao'];?></option>
                              <option value="1">Positivo</option>
                              <option value="2">Negativado</option>
                              <option value="3">Excluído</option>
                             </select>
                            </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="200">
                           <div class="form-rotulo">Observações:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"><?php echo $dadosCliente['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?acao=dadosPJ&idCliente=<?php echo $_GET['idCliente']; ?>&CRUD=savePJ');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          </div>
    <?php
	}else if($_GET['acao'] == "lista"){
        ?>
        <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>ID</th>
                  <th width="10" height="2" align="center"><br>Visualizar</th>
                  <th width="600" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nome do Cliente</th>
                  <th width="120" height="2" align="center"><input type="text" id="txtColuna3"/><br>Tipo</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaClientes(); ?>
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



