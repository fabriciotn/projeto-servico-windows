<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlSaldoContas.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlBanco.php");
     include("../controle/CtrlContasPagar.php");
     include("../controle/CtrlContasReceber.php");
?>
<script>
$(document).ready(function() {

    $('#tabelaGrid1').fixedHeaderTable({ footer: true, altClass: 'odd' });
    $('#tabelaGrid2').fixedHeaderTable({ footer: true, altClass: 'odd' });

});
</script>
<div id="sgi-conteudo">
<div id="sgi-texto">
            <div class="tipo_dados">Financeiro</div>
            <span class="area_campo">
                        <br><br><br>
			            Você está acessando o módulo Financeiro:
                           <br><br />
                           <table align="center" border="0px">
                           <tr>
                           <td valign="top" width="150px;">
                           <div class="tipo_dados">Saldo de Contas</div>
                           <table align="center" width="100%">
                            <thead>
                             <tr>
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Banco</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Conta</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Total Recebido</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Total Pago</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Saldo</th>
                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php TabelaSaldoContasPrincipal(); ?>
                            </tbody>
                          </table>
                          </td>

                          <td valign="top"  rowspan="2" width="380px;">
                           <div class="tipo_dados">Contas a Receber Hoje</div>
                           <div class="grid" style="height: 450px;" >
                           <table id="tabelaGrid1" align="center" width="100%">
                            <thead>
                             <tr>
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="250" style="vertical-align:text-bottom;" align="center">Descrição a Receber</th>
                                 <th width="80" style="vertical-align:text-bottom;" align="center">Vencimento</th>
                                 <th width="50" style="vertical-align:text-bottom;" align="center">Valor</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $totaisReceber = TabelaParcelasReceberHoje(); ?>
                            </tbody>
                            <tfoot>
        		            <tr>
        		                <td colspan="4" align="right" style="background-color: #008900;font-size:10px;">
                                            Atrasadas: <?php echo "R$ ".$totaisReceber["atrasadas"];?> &#160;&#160;
                                            Hoje: <?php echo "R$ ".$totaisReceber["valorTotalHoje"];?>&#160;&#160;
                                        Geral: <?php echo "R$ ".$totaisReceber["valorTotal"];?>
                                        </td>
                                    </tr>
        		    </tfoot>
                          </table>
                          </div>
                          </td>
                          <td valign="top" rowspan="2" width="380px;">
                          <div class="tipo_dados">Contas a Pagar Hoje</div>
                          <div class="grid" style="height: 450px;">
        		          <table id="tabelaGrid2" align="center" width="100%">
                            <thead>
                             <tr>
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="250" style="vertical-align:text-bottom;" align="center">Descrição a Pagar</th>
                                 <th width="80" style="vertical-align:text-bottom;" align="center">Vencimento</th>
                                 <th width="50" style="vertical-align:text-bottom;" align="center">Valor</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $totaisPagar = TabelaParcelasPagarHoje(); ?>
                            </tbody>
                            <tfoot >
        		            <tr>
        		                <td colspan="4" align="right" style="background-color: #ff4d4d;font-size:10px;">
                                  Vencidas: <?php echo "R$ ".$totaisPagar["vencidas"];?> &#160;&#160;
                                  Hoje: <?php echo "R$ ".$totaisPagar["valorTotalHoje"];?>&#160;&#160;
                                  Geral: <?php echo "R$ ".$totaisPagar["valorTotal"];?>
                                </td>
    		                </tr>
        		            </tfoot>
                          </table>
                          </div>


                          </td>
                          </tr>
                          <tr>
                          <td valign="top" width="150px;">
                           <div class="tipo_dados">Informativo da Empresa</div>
                           <table align="center" width="100%">
                            <tr>
                                <td style="color:red">Pagar Hoje:</td><td style="color:red">R$ <?php echo $totalParcelasPagarHoje;?></td>
                            </tr>
                            <tr>
                                <td style="color:green">Receber Hoje:</td><td style="color:green">R$ <?php echo $totalParcelasReceberHoje;?></td>
                            </tr>
                            <tr>
                                <td>
                                <strong>Resultado Final:</strong>
                                </td>
                                <td>
                                R$ <?php echo $totalParcelasReceberHoje-$totalParcelasPagarHoje;?>
                                </td>
                            </tr>
                          </table>
                          </td>
                          </tr>
                         <!--  <tr>
                          <td>
                           <div class="tipo_dados">Cadastros</div>
                                     <a href="formBanco.php">Banco</a><br /><br>
                                     <a href="formContaBancaria.php">Contas Bancárias</a><br /><br>
                                     <a href="formClasse.php">Classe</a><br /><br>
                                     <a href="formSubClasse.php">Sub-Classe</a><br /><br>
                           </td>
                           </tr>
                           <tr>
                           <td valign="top" width="200px;">
                           <div class="tipo_dados">Fluxo de Caixa</div>
                                     <a href="formContasPagar.php">Contas a Pagar</a><br /><br>
                                     <a href="formContasReceber.php">Contas a Receber</a><br /><br>
                                     <a href="formContasPagas.php">Contas Pagas</a><br /><br>
                                     <a href="formContasRecebidas.php">Contas Recebidas</a><br /><br>
                           </td>
                           <td valign="top" width="200px;">
                           <div class="tipo_dados">Relatórios</div>
                                     <a href="formResumoFinanceiro.php">Resumo Financeiro</a><br /><br>
                                     <a href="formDespesasFixa.php">Despesas Fixas</a><br /><br>
                                     <a href="#">Patrimônio</a><br /><br>
                                     <a href="formSaldoContas.php">Saldo de Contas
                           </td>
                           </tr> -->
                           </table>

        </form>
            <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



