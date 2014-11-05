<style>
ul.menu li#mnFinanceiro a{
	background:url(images/mn-financeiro.png) 0 -28px no-repeat;
}
</style>

<ul>
                                                <?php
                                                echo '<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">';
                                                     if($_SESSION['cod']) {
                                                      print '<br />';
                                                      print '<li><strong>Cadastros</strong></li>';
                                                      print '<li><a href="formBanco.php">Banco</a></li>';
                                                      print '<li><a href="formContaBancaria.php">Contas Bancárias</a></li>';
                                                      print '<li><a href="formClasse.php">Classe</a></li>';
                                                      print '<li><a href="formSubClasse.php">Sub-Classe</a></li>';
                                                      print '<br />';
                                                      print '<li><strong>Fluxo de Caixa</strong></li>';
                                                      print '<li><a href="formContasPagar.php">Contas a Pagar</a></li>';
                                                      print '<li><a href="formContasReceber.php">Contas a Receber</a></li>';
                                                      print '<li><a href="formContasPagas.php">Contas Pagas</a></li>';
                                                      print '<li><a href="formContasRecebidas.php">Contas Recebidas</a></li>';
                                                      print '<li><a href="formSaldoContas.php">Transferência entre contas</a></li>';
                                                      print '<br />';
                                                      print '<li><strong>Relatórios</strong></li>';
                                                      print '<li><a href="formResumoFinanceiro.php">Resumo Financeiro</a></li>';
                                                      print '<li><a href="formDespesasFixa.php">Despesas Fixas</a></li>';
                                                      print '<li><a href="#">Patrimônio</a></li>';
                                                      print '<li><a href="formSaldoContas.php">Saldo de Contas</a></li>';
                                                      print '<br />';
                                                     }else {
                                                              print '<br />';
                                                              print '<li><strong>Acesso</strong></li>';
                                                              print '<li><a href="index.php">Acessar sua Conta</a></li>';
                                                              print '<br />';
                                                            }
                                                ?>
    									                </ul>

                                                                        </div>
                                                </div>
                                    </div>
