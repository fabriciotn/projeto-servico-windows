<style>
ul.menu li#mnSolicitacoes a{
	background:url(images/mn-Solicitacoes.png) 0 -28px no-repeat;
}
</style>
<?php //include("../controle/verificaAcesso.php");?>
<ul>
                                                <?php
                                                     if($_SESSION['cod']) {
                                                      if(!$_GET['statusSolicitacao'] and !$_GET['id'])
                                                      {
                                                       print '<li><strong>Filtro Solicitações</strong></li>';
                                                       $complemento = "";
                                                        if($_POST["coleta"])
                                                    		$complemento.= ",1,14";
                                                    	if($_POST["producao"])
                                                    		$complemento.= ",2";
                                                    	if($_POST["avaliacao"])
                                                    		$complemento.= ",3";
                                                    	if($_POST["faturamento"])
                                                    		$complemento.= ",4";
                                                    	if($_POST["expedicao"])
                                                    		$complemento.= ",5,12,13";
                                                    	if($_POST["aprovacao"])
                                                    		$complemento.= ",8";
                                                    	if($_POST["aprovado"])
                                                    		$complemento.= ",9";
                                                    	if($_POST["reprovado"])
                                                    		$complemento.= ",10";
                                                       echo '<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">';
                                                       print '<li><a href="#" onClick="Envia(\'\')" >Coleta&nbsp;&nbsp;<input type="checkbox" id="coleta" name="coleta" value="true" ';
                                                       if($_POST["coleta"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Produção&nbsp;&nbsp;<input type="checkbox" id="producao" name="producao" value="true" ';
                                                       if($_POST["producao"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Avaliação&nbsp;&nbsp;<input type="checkbox" id="avaliacao" name="avaliacao" value="true" ';
                                                       if($_POST["avaliacao"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Faturamento&nbsp;&nbsp;<input type="checkbox" id="faturamento" name="faturamento" value="true" ';
                                                       if($_POST["faturamento"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Expedição&nbsp;&nbsp;<input type="checkbox" id="expedicao" name="expedicao" value="true" ';
                                                       if($_POST["expedicao"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Aprovação&nbsp;&nbsp;<input type="checkbox" id="aprovacao" name="aprovacao" value="true" ';
                                                       if($_POST["aprovacao"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Aprovado&nbsp;&nbsp;<input type="checkbox" id="aprovado" name="aprovado" value="true" ';
                                                       if($_POST["aprovado"])echo "checked";
                                                       print ' ></a></li>';
                                                       print '<li><a href="#" onClick="Envia(\'\')">Reprovado&nbsp;&nbsp;<input type="checkbox" id="reprovado" name="reprovado" value="true" ';
                                                       if($_POST["reprovado"])echo "checked";
                                                       print ' ></a></li>';
                                                      }else if($_GET['statusSolicitacao']) {

                                                           print '<li><strong>Filtrar '.$_GET['statusSolicitacao'].'</strong></li>
                                                                 <li>
                                                                  <div class="form-linha">
            		                                                   <div >
                                                                       <input maxlength="255" type="text" onFocus="this.value= \'\';"
                                                                         onBlur="if(this.value== \'\'){this.value= \'Insira o Cliente ...\';}"
                                                                         value="Insira o Cliente ..."
                                                                       name="cliente" id="cliente"
                                                                 </div>
            		                                             </div>
                                                                 </li>';
                                                           if($_GET['statusSolicitacao'] == "Em Produção")
                                                           {
                                                               print '<li><a href="#" onClick="Envia(\'\')" >Coleta&nbsp;&nbsp;<input type="checkbox" id="coleta" name="coleta" value="true" ';
                                                               if($_POST["coleta"])echo "checked";
                                                               print ' ></a></li>';
                                                               print '<li><a href="#" onClick="Envia(\'\')">Produção&nbsp;&nbsp;<input type="checkbox" id="producao" name="producao" value="true" ';
                                                               if($_POST["producao"])echo "checked";
                                                               print ' ></a></li>';
                                                               print '<li><a href="#" onClick="Envia(\'\')">Avaliação&nbsp;&nbsp;<input type="checkbox" id="avaliacao" name="avaliacao" value="true" ';
                                                               if($_POST["avaliacao"])echo "checked";
                                                               print ' ></a></li>';
                                                           }
                                                           print '<li>
                                                                   <br>
                                                                   <div>
                                                                       <input type="IMAGE" style="border: 0px;padding: 0px;" src="images/icons/seguir.png">
                                                                   </div>
                                                                   </li>';
                                                      }
                                                      print '<br />';
                                                      print '<li><strong>Visualizar Solicitações</strong></li>';
                                                      print '<li><a href="formVenda.php">Vendas</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Produção">Em Produção</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Avaliação">Em Avaliação</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Aprovação"">Em Aprovação</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Faturamento"">Em Faturamento</a></li>';
                                                      print '<li><a href="listaSolicitacoes.php?statusSolicitacao=Em Expedição"">Em Expedição</a></li>';
                                                      print '<br />';
                                                     }else {
                                                              print '<br />';
                                                              print '<li><strong>Acesso</strong></li>';
                                                              print '<li><a href="index.php">Acessar sua Conta</a></li>';
                                                              print '<br />';
                                                            }
                                                     echo '</form>';
                                                ?>
    									                </ul>

                                                                        </div>
                                                </div>
                                    </div>
