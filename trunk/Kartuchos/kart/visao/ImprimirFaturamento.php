<?php
     include("_templates/_templateCabecalho.php");
     //include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlFaturamento.php");

    $_GET['idOrdemServico'] = $_GET['id'];

?>
</div></div></div>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
            <div class="tipo_dados" align="center">
            <?php
            if($_GET["notinha"])
               echo "NOTINHA - 1ª VIA";
            else
               echo "Imprimir Faturamento";
            ?>
               </div>
                 <br>
                  <table>
                   <?php
                      $dados = obtemDadosFaturamento($_GET['idOrdemServico']);
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
                      </table>
                           <table id="tabela" class="sortable" width="100%">
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
                                   <?php $statusBlock = TabelaItensFaturamento(); ?>
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
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">MATERIAIS</div></td>
                        </tr>
                        <?php $valorTotalMateriais = TabelaMateriaisFaturamento(); ?>
                        <tr>
                           <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                           <td>
                           <div class="form-rotulo">Valor Total: </td>
                           <td><div style="color: red; font-size: 18px;font-weight: bold;"><?php echo number_format($valorTotalMateriais, 2, ',', '.');?>
                           </div></td>
                        </tr>
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">SERVIÇOS</div></td>
                        </tr>
                        <?php $valorTotalServicos = TabelaServicosFaturamento(); ?>
                        <tr>
                           <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                           <td>
                           <div class="form-rotulo">Valor Total: </td>
                           <td><div style="color: red; font-size: 18px;font-weight: bold;"><?php echo number_format($valorTotalServicos, 2, ',', '.');?>
                           </div></td>
                        </tr>
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">PAGAMENTO</div></td>
                        </tr>
                        <tr>
                          <td colspan="4">
                            <div class="form-rotulo">Forma de Pagamento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['formaPagamento'];?>
                            <input type="hidden" id="idFormaPagamento" name="idFormaPagamento" value="<?php echo $dados["idFormaPagamento"]; ?>"/>
                          </div>
                           </td>
                         <td colspan="5">
                            <div class="form-rotulo">Data de Vencimento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['dataVencimento'];?>
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
                     <?php
                     if($_GET["notinha"])
                     {
                      ?>
                       <div class="tipo_dados" align="center">NOTINHA - 2ª VIA</div>
                 <br>
                  <table>
                   <?php
                      $dados = obtemDadosFaturamento($_GET['idOrdemServico']);
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
                      </table>
                           <table id="tabela" class="sortable" width="100%">
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
                                   <?php $statusBlock = TabelaItensFaturamento(); ?>
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
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">MATERIAIS</div></td>
                        </tr>
                        <?php $valorTotalMateriais = TabelaMateriaisFaturamento(); ?>
                        <tr>
                           <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                           <td>
                           <div class="form-rotulo">Valor Total: </td>
                           <td><div style="color: red; font-size: 18px;font-weight: bold;"><?php echo number_format($valorTotalMateriais, 2, ',', '.');?>
                           </div></td>
                        </tr>
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">SERVIÇOS</div></td>
                        </tr>
                        <?php $valorTotalServicos = TabelaServicosFaturamento(); ?>
                        <tr>
                           <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                           <td>
                           <div class="form-rotulo">Valor Total: </td>
                           <td><div style="color: red; font-size: 18px;font-weight: bold;"><?php echo number_format($valorTotalServicos, 2, ',', '.');?>
                           </div></td>
                        </tr>
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">PAGAMENTO</div></td>
                        </tr>
                        <tr>
                          <td colspan="4">
                            <div class="form-rotulo">Forma de Pagamento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['formaPagamento'];?>
                            <input type="hidden" id="idFormaPagamento" name="idFormaPagamento" value="<?php echo $dados["idFormaPagamento"]; ?>"/>
                          </div>
                           </td>
                         <td colspan="5">
                            <div class="form-rotulo">Data de Vencimento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['dataVencimento'];?>
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
                     <?php
                     }else{
                     ?>
                     <table width="100%">
                      <thead>
                             <tr>
                                 <td colspan="10" align="center"><div class="tipo_dados">PARCELAS</div></td>
                             </tr>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Data Prevista</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Data Pagamento</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Nota Fiscal</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Situação</th>

                             </tr>
                            </thead>
                            <?php TabelaImprimirParcelasFaturamento(); ?>
                       </table>
                       <br>
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



