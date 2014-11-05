<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlClasse.php");
     include("../controle/CtrlSubClasse.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlBanco.php");
     include("../controle/CtrlContasPagarBKP.php");

     $_GET['idOrdemServico'] = $_GET['id'];

?>
</div></div></div>
<style>
#sgi-pagina{background: #FFC1C1;}
#sgi-tudo{background: #FFC1C1;}
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
<script type="text/javascript">

      $(document).ready(function(){
        // Evento change no campo tipo
         $("select[name=SClasse]").change(function(){
			$("select[name=SSubClasse]").html('<option value="">Carregando...</option>');
			var classe=document.getElementById('SClasse');
            $.post("../controle/CtrlAjax.php?ajax=classe&classe="+classe.value,
                  {tipo:$(this).val()},
				  function(valor){
                     $("select[name=SSubClasse]").html(valor);
                  }
                  )
         })

	  })

	  $(document).ready(function(){
        // Evento change no campo tipo
         $("select[name=classe]").change(function(){
			$("select[name=subClasse]").html('<option value="">Carregando...</option>');
			var classe=document.getElementById('classe');
            $.post("../controle/CtrlAjax.php?ajax=classe&classe="+classe.value,
                  {tipo:$(this).val()},
				  function(valor){
                     $("select[name=subClasse]").html(valor);
                  }
                  )
         })

	  })

</script>
<?php
     if($_GET['CRUD'])
        CRUDContasPagar();
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
                    <td width="150px">
                       <div class="form-rotulo">Data Início:</div>
	                   <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataInicio" id="dataInicio" value="<?php if($_POST['dataInicio']) echo $_POST['dataInicio']; else echo date("d/m/Y");?>"/>
                        <img class="alinhaImg" id="calendarioDataInicio" src="images/icons/calendario.png" />
                       </div>
                    </td>
                    <td width="180px" colspan="2">
                       <div class="form-rotulo">Data Término:</div>
	                   <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataTermino" id="dataTermino" value="<?php if($_POST['dataTermino']) echo $_POST['dataTermino']; else echo date("d/m/Y");?>"/>
                        <img class="alinhaImg" id="calendarioDataTermino" src="images/icons/calendario.png" />
                       </div>
                    </td>
                  </tr>
                  <tr>
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
                       <?php $dadosClasse = obtemClasse($_POST['SClasse']);?>
                       <div class="form-rotulo">Classe:</div>
	                   <div class="form-campos">
                       <select name="SClasse" id="SClasse">
                       <option value="<?php if($_POST['SClasse']) echo $_POST['SClasse'];?>" selected="selected"><?php if($_POST['SClasse']) echo $dadosClasse['descricao'];?></option>
                             <?php comboClasse();?>
                       </select>
                       </div>
                    </td>
                    <?php  $dadosSubClasse = obtemSubClasse($_POST['SSubClasse']);?>
                    <td style="width:200px;">
                       <div class="form-rotulo">Sub-Classe:</div>
	                   <div class="form-campos">
                       <select name="SSubClasse" id="SSubClasse">
                       <option value="<?php if($_POST['SSubClasse']) echo $_POST['SSubClasse'];?>" selected="selected"><?php if($_POST['SSubClasse']) echo $dadosSubClasse['descricao'];?></option>
                             <option value="">Escolha a Classe ...</option>
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
                  <div class="form-rotulo">Incluir Despesa Fixa: &#160;&#160;&#160;
                                           <input type="button" class="botao" value=" + " onclick="Oculta(this,'despesaFixa')" /></div>
                  <br>
                      <div id="despesaFixa" style="display: none;">
                      <script>    <!--
                                var bvalue = 0;
                                function checkAll() {
                                if(bvalue)
                                  bvalue = 0;
                                else
                                  bvalue = 1;
                                for (var i=0;i<document.form.elements.length;i++)
                                {
                                 if(document.form.elements[i].type == "checkbox")
                                 {
                                  document.form.elements[i].checked=bvalue;
                                 }
                                }
                               }
                     -->
                     </script>
                          <table class="sortable" width="95%">
                            <thead>
                             <tr class="header-list">
                                 <th width="100" height="2" align="center"><input type='checkbox' onclick='checkAll()' name='selecionaDFAll' id='selecionaDFAll'></th>
                                 <th width="10" height="2" align="center">ID</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Banco</th>
                                 <th width="150" style="vertical-align:text-bottom;" align="left">Forma Pagamento</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Vencimento</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Nº Boleto</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Nota Fiscal</th>
                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php TabelaDespesasFixas(); ?>
                            </tbody>
                          </table>
                          <div class="form-botoes">
                         <div class="form-botao-voltar">
                         <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?CRUD=incluiDespesaFixa');" alt="Voltar" src="images/incluir.gif" /></a>
                         </div>
                         </div>

                    </div>
                  <hr>
                  <br>
                  <div class="form-rotulo">Incluir Nova Conta a Pagar: &#160;&#160;&#160;
                                           <input type="button" class="botao" value=" + " onclick="Oculta(this,'contaPagar')" /></div>
                  <br>
                      <div id="contaPagar" style="display: none;">
                        <table>
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
                          </tr>
                          <tr>
                            <td colspan="10">
                                <div class="form-rotulo2">Despexa Fixa?</div>&nbsp;&nbsp;&nbsp;&nbsp;
    		                    <div class="form-campos2">
                                <input type="radio" name="flgDespesaFixa" id="flgDespesaFixa" value="1" value="Sim">Sim
                                &nbsp;&nbsp;
                                <input type="radio" name="flgDespesaFixa" id="flgDespesaFixa" value="0" checked value="Não">Não
                                </div>
                           </td>
                          </tr>
                          <tr>
                            <td>
                               <div class="form-rotulo">Classe:</div>
        	                   <div class="form-campos">
                               <select name="classe" id="classe">
                               <option value="" selected="selected"></option>
                                     <?php comboClasse();?>
                               </select>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Sub-Classe:</div>
        	                   <div class="form-campos">
                               <select name="subClasse" id="subClasse">
                                     <option value="">Escolha a Classe ...</option>
                               </select>
                               </div>
                            </td>
                          </tr>
                          <tr>
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
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"></textarea>
                              </div>
                              </td>
                          </tr>
                          </table>
                          <div class="form-botoes">
                          <div class="form-botao-voltar">
                          <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?CRUD=novaContaPagar');" alt="Voltar" src="images/salvar.gif" /></a>
                         </div>
                         </div>
                      </div>
                  <hr>
                  <br>
                          <!-- <table class="sortable" width="95%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Conta Bancária</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Forma Pagamento</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Vencimento</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Nº Boleto</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Nota Fiscal</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Cancelar</th>
                                 <th width="20" style="vertical-align:text-bottom;" align="center">Registrar Pagamento</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black"> -->
                                   <?php TabelaParcelasPagar(); ?>
                            </tbody>
                          </table>
                          <BR>
                          <div class="form-botoes">
                          <div class="form-botao-voltar">
        	              <a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
                          <div class="form-botao-voltar">
                          <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?CRUD=saveContasPagar');" alt="Voltar" src="images/salvar.gif" /></a>
                         </div>
                         </div>
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



