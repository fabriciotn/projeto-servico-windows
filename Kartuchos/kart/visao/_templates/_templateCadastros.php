<style>
ul.menu li#mnCadastros a{
	background:url(images/mn-cadastros.png) 0 -28px no-repeat;
}
</style>
<?php //include("../controle/verificaAcesso.php");?>
<ul>
                                                <?php
                                                echo '<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">';
                                                     if($_SESSION['cod']) {
                                                      print '<br />';
                                                      print '<li><strong>Cadastros</strong></li>';
                                                      print '<li><a href="formFuncionario.php">Funcionários</a></li>';
                                                      print '<li><a href="formCliente.php">Clientes</a></li>';
                                                      print '<li><a href="formFornecedor.php">Fornecedores</a></li>';
                                                      print '<li><a href="formMaterial.php">Materiais</a></li>';
                                                      print '<li><a href="formServico.php">Serviços</a></li>';
                                                      print '<li><a href="formMotoboy.php">Motoboys</a></li>';
                                                      print '<li><a href="formLoja.php">Lojas</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php">Funções</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php">Acesso Externo</a></li>';
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
