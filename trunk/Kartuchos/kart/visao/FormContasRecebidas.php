<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlContasRecebidas.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlBanco.php");

     verificaAcesso(20, $_SESSION["cod"]);
     
?>
</div></div></div>
<style>
#sgi-pagina{background: #8FBC8F;}
#sgi-tudo{background: #8FBC8F;}
</style>
<script>
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
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Contas Recebidas</div>
                 <br>
                 <hr>
                 <br>
                  <table>
                  <tr>
                    <td width="200px">
                       <div class="form-rotulo">Data Início:</div>
	                   <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataInicio" id="dataInicio" value="<?php if($_POST['dataInicio']) echo $_POST['dataInicio']; else echo date("d/m/Y");?>"/>
                        <img class="alinhaImg" id="calendarioDataInicio" src="images/icons/calendario.png" />
                       </div>
                    </td>
                    <td width="200px">
                       <div class="form-rotulo">Data Término:</div>
	                   <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataTermino" id="dataTermino" value="<?php if($_POST['dataTermino']) echo $_POST['dataTermino']; else echo date("d/m/Y");?>"/>
                        <img class="alinhaImg" id="calendarioDataTermino" src="images/icons/calendario.png" />
                       </div>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="2">
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
                          <table class="sortable" width="95%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="500" style="vertical-align:text-bottom;" align="left">Cliente</th>
                                 <th width="350" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Vencimento</th>
                                 <th width="200" style="vertical-align:text-bottom;" align="center">Data Pagamento</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Nota Fiscal</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Situação</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php TabelaParcelasRecebidas(); ?>
                            </tbody>
                          </table>
                      <BR>
      </form>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



