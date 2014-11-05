<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlSaldoContas.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlBanco.php");

?>
<script>
$(document).ready(function(){
     $('#calendarioData').click(function(){
		$(this).calendario({
			target:'#data',
			top:-150,
			left:0
		});
	});	
});
</script>
</div></div></div>
<?php
     if($_GET['CRUD']){
        if(verificaAlteracao(14, $_SESSION["cod"]))
         CRUDSaldoContas();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Saldo Contas Bancárias</div>
                 <br>
                 <hr>
                 <br>
                  <table>
                  <tr>
                    <td>
                        <div class="form-rotulo">Empresa:</div>
                        <div class="form-campos">
                        <select name="empresa" id="empresa">
                        <option value="" selected="selected"></option>
                            <?php comboEmpresa();?>
                        </select>
                        </div>
                    </td>
                    <td width="200px">
                       <div class="form-rotulo">Banco:</div>
	                   <div class="form-campos">
                        <select name="idBanco" id="idBanco">
                         <option value="" selected="selected"></option>
                            <?php comboBanco();?>
                        </select>
                       </div>
                    </td>
                    <td>
                    <?php $dadosContaBancaria = obtemContaBancaria($_POST['SContaBancaria']);?>
                       <div class="form-rotulo">Conta Bancária:</div>
	                   <div class="form-campos">
                       <select name="idContaBancaria" id="idContaBancaria">
                       <option value="" selected="selected"></option>
                             <?php comboContaBancaria();?>
                       </select>
                       </div>
                    </td>
                    <td align="right">
                     <div class="form-botoes">
                      <div class="form-botao-voltar">
                        <br>
                        <img style="cursor: pointer;" onClick="Envia('<?php echo $PHP_SELF; ?>?CRUD=null');" alt="Salvar" src="images/botao_pesquisar.gif" />
                      </div>
                      </div>
                    </td>
                  </tr>
                  </table>                 
                  <br>
                  <hr>
                  <br>
                          <table class="sortable" align="center" width="100%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Banco</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Conta</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Total Recebido</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Total Pago</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Saldo</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php TabelaSaldoContas(); ?>
                            </tbody>
                          </table>
                  <br>
                      <hr>
                 <div class="tipo_dados" style="text-align:left;">DOC - Transferência entre Contas</div>
                 <table>
                  <tr>                    
                    <td style="width:80px;">
                       <div class="form-rotulo">Data:</div>
	                   <div class="form-campos">
                        <input style="width:80px;" maxlength="100" type="text" name="data" id="data" value="<?php echo date("d/m/Y");?>"/>
                       </div>
                    </td>
                    <td><img id="calendarioData" src="images/icons/calendario.png" /></td>
                    <td>
                    <?php $dadosContaBancaria = obtemContaBancaria($_POST['SContaBancaria']);?>
                       <div class="form-rotulo">Conta de Saque:</div>
	                   <div class="form-campos">
                       <select name="idContaBancariaSaque" id="idContaBancariaSaque">
                       <option value="" selected="selected"></option>
                             <?php comboContaBancaria();?>
                       </select>
                       </div>
                    </td>
                    <td>
                    <?php $dadosContaBancaria = obtemContaBancaria($_POST['SContaBancaria']);?>
                       <div class="form-rotulo">Conta de Depósito:</div>
	                   <div class="form-campos">
                       <select name="idContaBancariaDeposito" id="idContaBancariaDeposito">
                       <option value="" selected="selected"></option>
                             <?php comboContaBancaria();?>
                       </select>
                       </div>
                    </td>
                    <td width="150px">
                               <div class="form-rotulo">Valor:</div>
        	                   <div class="form-campos">
                                <input style="width:100px;" maxlength="100" type="text" name="valorBase" id="valorBase"/>
                               </div>
                    </td>
                    <td align="right">
                     <div class="form-botoes">
                      <div class="form-botao-voltar">
                            <a href="#"><img 
                                    onClick="confirmacao('Deseja confirmar a transferência bancária?','<?php echo $PHP_SELF; ?>?CRUD=transferencia');"                                     
                                    alt="Voltar" src="images/salvar.gif" /></a>
                      </div>
                      </div>
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



