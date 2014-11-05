<?php
     include("_templates/_templateCabecalho.php");
     //include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlExpedicao.php");

     verificaAcesso(15, $_SESSION["cod"]);
     
     $_GET['idOrdemServico'] = $_GET['id'];

?>
</div></div></div>
<?php
     if($_GET['CRUD']){
        if(verificaAlteracao(15, $_SESSION["cod"]))
         CRUDExpedicao();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Editar Entrega</div>
                 <br>
                 <input class="botao" type="button" value="  Voltar Item para Faturamento  "
                 onClick="confirmacao('Deseja voltar este item para Faturamento?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['idOrdemServico'];?>&CRUD=voltaStatusFaturamento');"
                 <hr>
                 <br>
                  <table>
                   <?php
                     if($_GET['idOrdemServico'])
                     {
                      $dados = obtemDadosExpedicao($_GET['idOrdemServico']);
                   ?>
                        <tr>
                           <td>
                            <div class="form-rotulo">Ordem de Serviço:</div>
    		                <div class="form-campos">
                                <?php echo $dados['idOrdemServico'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Cliente:</div>
    		                <div class="form-campos">
                                <?php echo $dados['nomeCliente'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo"><?php echo $dados['tipoDocumento'];?>:</div>
    		                <div class="form-campos">
                                <?php echo $dados['documento'];?>
                            </div>
                           </td>
                           <?php
                                if($dados['tipoDocumento'] == "CNPJ")
                                {
                                ($dados["retencaoISS"] == 1) ? $retencaoISS="Sim" : $retencaoISS="Não";
                                ?>
                                <td>
                                    <div class="form-rotulo">Retenção ISS:</div>
    		                        <div class="form-campos"><?php echo $retencaoISS;?></div>
                                </td>
                                <?php
                                }
                           ?>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
                                <?php echo $dados['endereco'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Telefones:</div>
    		                <div class="form-campos">
                                <?php echo $dados['telefone'].", ".$dados['celular'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">E-Mail:</div>
    		                <div class="form-campos">
                                <?php echo $dados['email'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Responsável:</div>
    		                <div class="form-campos">
                                <?php echo $dados['responsavel'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Data Cadastro:</div>
    		                <div class="form-campos">
                                <?php echo $dados['dataCriacao'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Usuário:</div>
    		                <div class="form-campos">
                                <?php echo $dados['usuarioAbertura'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Motoboy:</div>
    		                <div class="form-campos">
                                <?php echo $dados['motoboyColeta'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Motoboy Entrega:</div>
    		                <div class="form-campos">
                              <select name="motoboyEntrega" id="motoboyEntrega">
                              <option value="<?php echo $dados['idMotoboyEntrega'];?>" selected="selected"><?php echo $dados['motoboyEntrega'];?></option>
                              <?php comboMotoboy();?>
                             </select>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Status:</div>
    		                <div class="form-campos">
                              <select name="status" id="status">
                              <option value="<?php echo $dados['idStatus'];?>" selected="selected"><?php echo $dados['nomeStatus'];?></option>
                              <option value="6">Encerrada</option>
		                      <option value="12">Entregando</option>
		                      <option value="13">Devolvido</option>
                             </select>
                            </div>
                           </td>
                        </tr>
                      </table>
                      <div class="form-botoes">
                      <div class="form-botao-voltar">
                    	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>
                      </div>
                      <div class="form-botao-voltar">
                        <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=saveExpedicao&tipoVenda=<?php echo $dados["tipoVenda"];?>');" alt="Salvar" src="images/salvar.gif" /></a>
                      </div>
                      </div>
                           <table id="tabela" class="sortable" width="95%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Ordem Serviço</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Código Barras</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Serviço Executado</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Qde Rec</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Data Produção</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="center">Status</th>
                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $statusBlock = TabelaItensExpedicao(); ?>
                            </tbody>
                          </table>
                      <BR>
                      <table>
                        <tr>
                         <td colspan="200">
                           <div class="form-rotulo">Observações:</div>
		                   <div class="form-campos">
                               <?php echo $dados['observacoes'];?>
                           </div>
                         </td>
                        </tr>
                     </table>
                     <hr>
                     <BR>
                     <table width="100%">
                        <tr>
                          <td colspan="10" align="center"><div class="tipo_dados">MATERIAIS</div></td>
                        </tr>
                        <?php $valorTotalMateriais = TabelaMateriaisExpedicao(); ?>
                        <tr>
                          <td colspan="10" align="center"><div class="tipo_dados">SERVIÇOS</div></td>
                        </tr>
                        <?php $valorTotalServicos = TabelaServicosExpedicao(); ?>
                     </table>
                     <br>
                     <table width="100%">
                        <tr>
                          <td colspan="10" align="center"><div class="tipo_dados">PAGAMENTO</div></td>
                        </tr>
                        <tr>
                          <td>
                            <div class="form-rotulo">Forma de Pagamento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['formaPagamento'];?>
                            <input type="hidden" id="idFormaPagamento" name="idFormaPagamento" value="<?php echo $dados["idFormaPagamento"]; ?>"/>
                          </div>
                           </td>
                         <td>
                            <div class="form-rotulo">Valor Total:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo "R$ ".number_format(($valorTotalMateriais + $valorTotalServicos), 2, ',', '.'); ?>
                            </div>
                          </td>
                        </tr>
                     </table>
                     <br>
                     <hr>
                     <br>
                     <table width="100%">
                        <tr>
                          <td colspan="10" align="center"><div class="tipo_dados">PARCELAS</div></td>
                        </tr>
                     </table>
                     <table width="100%">
                        <thead>
                             <tr class="header-list">
                                 <th width="10" style="vertical-align:text-bottom;" align="center">Nº</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Data Prevista</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Data Pagamento</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Nota Fiscal</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="center">Situação</th>
                             </tr>
                        </thead>
                        <tbody style="border-bottom: 1px solid black">
                           <?php TabelaParcelasExpedicao(); ?>
                        </tbody>
                     </table>
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



