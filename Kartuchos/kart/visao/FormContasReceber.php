<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlBanco.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlContasReceber.php");

     verificaAcesso(18, $_SESSION["cod"]);
     
     $_GET['idOrdemServico'] = $_GET['id'];

?>
</div></div></div>
<style>
#sgi-pagina{background: #8FBC8F;}
#sgi-tudo{background: #8FBC8F;}
</style>
<script>
var qtdPagamento = 0;
var qtdCancelado = 0;
var totalPagamento = 0;
var totalCancelado = 0;

function enviaContas(qtdContasReceber){
    

    for (var i=1;i<qtdContasReceber;i++)
    {
     if(document.getElementById("cancelarParcela"+i).checked)
     {
      qtdCancelado++;
      totalCancelado += parseFloat(document.getElementById("valorBase"+i).value);
     }
     else if(document.getElementById("efetuarPagamento"+i).checked)
     {
      qtdPagamento++;
      totalPagamento += parseFloat(document.getElementById("valorBase"+i).value);
     }
    }    

    confirmacao("Quantidade Contas Canceladas: "+qtdCancelado+" Valor Total: R$ "+totalCancelado+
                "\n\nQuantidade Contas Pagas: "+qtdPagamento+" Valor Total: R$ "+totalPagamento+
                "\n\n\nDeseja confirmar estes itens?",'<?php echo $PHP_SELF; ?>?CRUD=saveContasReceber');
    qtdPagamento= 0;qtdCancelado = 0;
    totalPagamento = 0;totalCancelado = 0;
}

$(document).ready(function() {

    $('#tabelaGrid').fixedHeaderTable({ footer: true, altClass: 'odd' });

});
    $(document).ready(function(){
     $('#calendarioDataInicio').click(function(){
		$(this).calendario({
			target:'#dataInicio',
			top:-150,
			left:0
		});
	});

	$('#calendarioDataTermino').click(function(){
		$(this).calendario({
			target:'#dataTermino',
			top:-150,
			left:0
		});
	});
	
	$('#calendarioDataPrevistaPagamento').click(function(){
		$(this).calendario({
			target:'#dataPrevistaPagamento',
			top:-150,
			left:0
		});
	});
});
</script>
<script>
      function refreshPagina(id,tipo){
         location.href="formContasReceber.php?idCliente="+id+"&tipoCliente="+tipo;
      }
</script>
<?php
     if($_GET['CRUD']){
        if(verificaAlteracao(18, $_SESSION["cod"]))
         CRUDContasReceber();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
?>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Contas a Pagar</div>
                 <br>
                 <hr>
                 <br>
                  <table>
                  <tr>
                    <td style="width:80px;">
                       <div class="form-rotulo">Data Início:</div>
	                   <div class="form-campos">
                        <input style="width:80px;" maxlength="100" type="text" name="dataInicio" id="dataInicio" value="<?php echo $_POST['dataInicio'];?>"/>
                       </div>
                    </td>
                    <td><img id="calendarioDataInicio" src="images/icons/calendario.png" /></td>
                    <td style="width:80px;">
                       <div class="form-rotulo">Data Término:</div>
	                   <div class="form-campos">
                        <input style="width:80px;" maxlength="100" type="text" name="dataTermino" id="dataTermino" value="<?php echo $_POST['dataTermino']; ?>"/>
                       </div>
                    </td>
                    <td><img id="calendarioDataTermino" src="images/icons/calendario.png" /></td>
                    <td>
                    <?php $dadosContaBancaria = obtemContaBancaria($_POST['SContaBancaria']);?>
                       <div class="form-rotulo">Conta Bancária:</div>
	                   <div class="form-campos">
                       <select name="SContaBancaria" id="SContaBancaria">
                       <option value="<?php if($_POST['SContaBancaria']) echo $_POST['SContaBancaria'];?>" selected="selected"><?php if($_POST['SContaBancaria']) echo $dadosContaBancaria['nome'];?></option>
                             <?php comboContaBancaria();?>
                       </select>
                       </div>
                    </td>
                    <td>
                       <div class="form-rotulo">Cliente:</div>
	                   <div class="form-campos">
                        <input style="width:300px;" maxlength="100" type="text" name="SCliente" id="SCliente" value="<?php if($_POST['SCliente']) echo $_POST['SCliente'];?>"/>
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
                  <div class="form-rotulo">Incluir Nova Conta a Receber: &#160;&#160;&#160;
                                           <input type="button" class="botao" value=" + " onclick="Oculta(this,'contaReceber')" /></div>
                  <br>
                      <div id="contaReceber" style="display: none;">
                        <table>
                          <tr>
                          <td>
                               <div class="form-rotulo">Código do Cliente:</div>
        	                   <div class="form-campos">
                               <input type="text" value="<?php echo $_GET['idCliente'];?>" id="codCliente" name="codCliente"/>
                               <input type="button" class="botao"  value="  ...  " onclick="abrir('dadosCliente.php');" />
                               </div>
                         </td>
                         <td colspan="4">
                               <div class="form-campos">
                               <?php
                               if($_GET['idCliente'])
                               {
                                if($_GET['tipoCliente'] == "PF")
                                {
                                 $dadosCliente = obtemClientePF($_GET['idCliente']);
                                 echo $dadosCliente['nome'];
                                }else if($_GET['tipoCliente'] == "PJ")
                                      {
                                       $dadosCliente = obtemClientePJ($_GET['idCliente']);
                                       echo $dadosCliente['nomeFantasia'];
                                      }
                               }
                               ?>
                               </div>
                            </td>
                          </tr>
                          <tr>
                            <td width="150px">
                               <div class="form-rotulo">Descrição:</div>
        	                   <div class="form-campos">
                                <input style="width:350px;" maxlength="100" type="text" name="descricao" id="descricao"/>
                               </div>
                            </td>
                            <td width="150px">
                               <div class="form-rotulo">Valor:</div>
        	                   <div class="form-campos">
                                <input style="width:100px;" maxlength="100" type="text" name="valorBase" id="valorBase"/>
                               </div>
                            </td>
                            <td width="180px">
                               <div class="form-rotulo">Vencimento:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="dataPrevistaPagamento" id="dataPrevistaPagamento"/>
                                  <img class="alinhaImg" id="calendarioDataPrevistaPagamento" src="images/icons/calendario.png" />
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Nº Boleto:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="numBoleto" id="numBoleto"/>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Nota Fiscal:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="notaFiscal" id="notaFiscal" />
                               </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                               <div class="form-rotulo">Empresa:</div>
        	                   <div class="form-campos">
                               <select name="empresa" id="empresa">
                                     <?php comboEmpresa();?>
                               </select>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Conta:</div>
        	                   <div class="form-campos">
                               <select name="idContaBancaria" id="idContaBancaria">
                                     <?php comboContaBancaria();?>
                               </select>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Forma Pagamento:</div>
        	                   <div class="form-campos">
                               <select name="idFormaPagamento" id="idFormaPagamento">
                                     <?php comboFormaPagamento();?>
                               </select>
                               </div>
                            </td>
                          </tr>
                          <tr>
                              <td colspan="200">
                              <div class="form-rotulo">Observações:</div>
		                      <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"><?php echo $dadosMaterial['descricaoDetalhada'];?></textarea>
                              </div>
                              </td>
                          </tr>
                          </table>
                          <div class="form-botoes">
                          <div class="form-botao-voltar">
                          <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?CRUD=novaContaReceber');" alt="Voltar" src="images/salvar.gif" /></a>
                         </div>
                         </div>
                      </div>
                  <hr>
                  <br>
                  <div class="grid" style="width: 98%; height: 400px;">
                  <table id="tabelaGrid" width="100%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10px" height="2" align="center"><span style="background:yellow;color: green;"></span></th>
                                 <th width="10px" height="2" align="center">Nº</th>
                                 <th width="300px" style="vertical-align:text-bottom;" align="left">Cliente</th>
                                 <th width="100px" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="120px" style="vertical-align:text-bottom;" align="center">Vencimento</th>
                                 <th width="120px" style="vertical-align:text-bottom;" align="center">Nº Boleto</th>
                                 <th width="120px" style="vertical-align:text-bottom;" align="center">Nota Fiscal</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Cancelar</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Pagamento</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Atualizar</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $totaisReceber = TabelaParcelasReceber(); ?>
                            </tbody>
                            <tfoot >
        		            <tr>
        		                <td colspan="10" align="right" style="background-color: green;color:white;">
                                  Atrasadas: <?php echo "R$ ".$totaisReceber["atrasadas"];?> &#160;&#160;
                                  Receber Hoje: <?php echo "R$ ".$totaisReceber["valorTotalHoje"];?>&#160;&#160;
                                  Total Geral: <?php echo "R$ ".$totaisReceber["valorTotal"];?>
                                       </td>
                                    </tr>
        		   </tfoot>
                          </table>
                  </div>
                          <BR>
                          <div class="form-botoes">
                          <div class="form-botao-voltar">
        	              <a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
                          <div class="form-botao-voltar">
                          <a href="#"><img onClick="enviaContas(<?php echo $totaisReceber["qtd"];?>);" alt="Voltar" src="images/salvar.gif" /></a>
                         </div>
                         </div>
                      <BR>
       </form>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
    <?php
    if($_GET['idCliente'])
     {
       ?><script>document.getElementById("contaReceber").style.display = "table";</script>
       <?php
     }
     include("_templates/_templateRodape.php");
    ?>



