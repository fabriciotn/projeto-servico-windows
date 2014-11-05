<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
?>
<div id="sgi-conteudo">
<div id="sgi-texto">
            <div class="tipo_dados">Financeiro</div>
            <span class="area_campo">
                        <br><br><br>
			   Você está acessando o módulo Financeiro:
                           <br><br />
                           <table align="center" border="0px">
                           <tr>
                           <td valign="top" width="200px;">
                           <div class="tipo_dados">Cadastros</div>
                                     <a href="formBanco.php">Banco</a><br /><br>
                                     <a href="formContaBancaria.php">Contas Bancárias</a><br /><br>
                                     <a href="formClasse.php">Classe</a><br /><br>
                                     <a href="formSubClasse.php">Sub-Classe</a><br /><br>
                           </td>
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
                           </tr>
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



