<style>
ul.menu li#mnPrincipal a{
	background:url(images/mn-principal.png) 0 -28px no-repeat;
}
</style>
<?php //include("../controle/verificaAcesso.php");?>
<ul>
                                                <?php
                                                     if($_SESSION['cod']) {
                                                       print '<br />';
                                                       print '<li><strong>Cadastros</strong></li>';
                                                       print '<li><a href="relatorio.php">Materiais</a></li>';
                                                       print '<li><a href="relatorio.php">Servi�os</a></li>';
                                                       print '<li><a href="relatorio.php">Clientes</a></li>';
                                                       print '<br />';
                                                       print '<li><strong>Visualizar Solicita��es</strong></li>';
                                                       print '<li><a href="formVenda.php">Vendas</a></li>';
                                                       print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Produ��o">Em Produ��o</a></li>';
                                                       print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Avalia��o">Em Avalia��o</a></li>';
                                                       print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Aprova��o"">Em Aprova��o</a></li>';
                                                       print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Faturamento"">Em Faturamento</a></li>';
                                                       print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Expedi��o"">Em Expedi��o</a></li>';
                                                       print '<br />';
                                                       print '<br />';
                                                       print '<li><strong>Financeiro</strong></li>';
                                                       print '<li><a href="formContasPagar.php">Contas a Pagar</a></li>';
                                                       print '<li><a href="formContasReceber.php">Contas a Receber</a></li>';
                                                       print '<li><a href="formContasPagas.php">Contas Pagas</a></li>';
                                                       print '<li><a href="formContasRecebidas.php">Contas Recebidas</a></li>';
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
