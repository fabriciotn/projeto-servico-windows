<?php
     include("_templates/_templateCabecalho.php");
     //include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlFaturamento.php");

     verificaAcesso(14, $_SESSION["cod"]);
     
    $_GET['idOrdemServico'] = $_GET['id'];

?>
</div></div></div>
<?php
     if($_GET['CRUD']){
        if(verificaAlteracao(14, $_SESSION["cod"]))
         CRUDFaturamento();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
?>
<script>
var qtdParcela = 0;

function chamaCalendario(valor){
$('#dataPrevistaPagamento'+valor).click(function(){
		$(this).calendario({
			target: '#dataPrevistaPagamento'+valor,
			top:-150,
			left:0
		});
	});
}

function adicionar()
          {

           qtdParcela++;

           var local=document.getElementById('tabelaParcela');
           var tblBody = local.tBodies[0];
           var newRow = tblBody.insertRow(1);

           var newCell0 = newRow.insertCell(0);
           newCell0.innerHTML= '<tr>'+
                                '<td colspan="4">'+
                                   '<div class="form-rotulo">Nº:</div>'+
    		                         '<div class="form-campos">'+
                                     +qtdParcela+
                                     '</select>'+
                                    '</div>'+
                                '</td>';

           var newCell1 = newRow.insertCell(1);
           newCell1.innerHTML='<td>'+
                                   '<div class="form-rotulo">Descrição '+qtdParcela+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:350px;" maxlength="100" type="text" name="descricao'+qtdParcela+'" id="descricao'+qtdParcela+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell2 = newRow.insertCell(2);
           newCell2.innerHTML='<td>'+
                                   '<div class="form-rotulo">Valor '+qtdParcela+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:80px;" maxlength="100" value="0" onChange="somaTotal()" type="text" name="valorBase'+qtdParcela+'" id="valorBase'+qtdParcela+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell3 = newRow.insertCell(3);
           newCell3.innerHTML='<td>'+
                                   '<div class="form-rotulo">Data Vencimento '+qtdParcela+':</div>'+
    		                       '<div class="form-campos">'+
                                   '<input style="width:150px;" maxlength="100" onfocus="chamaCalendario(qtdParcela);" type="text" name="dataPrevistaPagamento'+qtdParcela+'" id="dataPrevistaPagamento'+qtdParcela+'" value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell4 = newRow.insertCell(4);
           newCell4.innerHTML='<td>'+
                                   '<div class="form-rotulo">Nº Boleto '+qtdParcela+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:100px;" maxlength="100" type="text" name="numBoleto'+qtdParcela+'" id="numBoleto'+qtdParcela+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell5 = newRow.insertCell(5);
           newCell5.innerHTML='<td>'+
                                   '<div class="form-rotulo">Nota Fiscal '+qtdParcela+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:100px;" maxlength="100" type="text" name="notaFiscal'+qtdParcela+'" id="notaFiscal'+qtdParcela+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell6 = newRow.insertCell(6);
           newCell6.innerHTML= '<tr>'+
                                '<td colspan="4">'+
                                   '<div class="form-rotulo">Empresa:</div>'+
    		                         '<div class="form-campos">'+
                                     '<select style="width:70px;" name="empresa'+qtdParcela+'" id="empresa'+qtdParcela+'"><?php comboEmpresa();?>'+
                                     '</select>'+
                                    '</div>'+
                                '</td>';

           var newCell7 = newRow.insertCell(7);
           newCell7.innerHTML='<td>'+
                                   '<div class="form-rotulo">Conta Bancária '+qtdParcela+':</div>'+
    		                       '<div class="form-campos">'+
                                   '<div class="form-campos">'+
                                     '<select style="width:100px;" name="idContaBancaria'+qtdParcela+'" id="idContaBancaria'+qtdParcela+'"><?php comboContaBancaria();?>'+
                                     '</select>'+
                                    '</div>'+
                                '</td>';

           var newCell8 = newRow.insertCell(8);
           newCell8.innerHTML='<td>'+
                                   '<div class="form-rotulo">Situação '+qtdParcela+':</div>'+
                                   '<div class="form-campos">'+
                                     '<select style="width:100px;" name="idSituacaoParcela'+qtdParcela+'" id="idSituacaoParcela'+qtdParcela+'"><?php comboSituacaoParcela();?>'+
                                     '</select>'+
                                    '</div>'+
                                '</td></tr>';

           var newParcela=document.getElementById('descricao'+qtdParcela);
           newParcela.focus();
         }
function remover()
          {
           if(qtdParcela > 0)
           {
            var valor = parseFloat(document.getElementById('valorBase'+qtdParcela).value);
            document.getElementById('valorTotal').value = parseFloat(document.getElementById('valorTotal').value) - valor;
            var local=document.getElementById('tabelaParcela');
            var tblBody = local.tBodies[0];
            var newRow = tblBody.deleteRow(1);
            qtdParcela --;
           }
          }
function somaTotal(){
  var valor = parseFloat(document.getElementById('valorTotalInicial').value);
  for(var i=1;i<=qtdParcela ;i++)
   valor += parseFloat(document.getElementById('valorBase'+i).value);;
  document.getElementById('valorTotal').value = valor;
}

</script>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Editar Faturamento</div>
                 <br>
                 <input class="botao" type="button" value="  Voltar Item para Avalição  "
                        onClick="confirmacao('Deseja voltar este item para Avaliação?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['idOrdemServico'];?>&CRUD=voltaStatusAvaliacao');"
                 <hr>
                 <br>
                 <br>
                 <input class="botao" type="button" value="  Imprimir  "
                 onClick="abrir('imprimirFaturamento.php?id=<?php echo $_GET['id'];?>&semMenuCabecalho=1');" />&#160;&#160;&#160;
                 <input class="botao" type="button" value="  Imprimir Notinha "
                 onClick="abrir('imprimirFaturamento.php?id=<?php echo $_GET['id'];?>&semMenuCabecalho=1&notinha=1');" />
                 <hr>
                 <br>
                  <table>
                   <?php
                     if($_GET['idOrdemServico'])
                     {
                      $dados = obtemDadosFaturamento($_GET['idOrdemServico']);
                   ?>
                        <tr>
                           <td>
                            <div class="form-rotulo">Ordem de Serviço:</div>
    		                <div class="form-campos">
                                <?php echo $dados['idOrdemServico'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Cliente:</div>
    		                <div class="form-campos">
                                <?php echo $dados['nomeCliente'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo"><?php echo $dados['tipoDocumento'];?>:</div>
    		                <div class="form-campos">
                                <?php echo $dados['documento'];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Endereço:</div>
    		                <div class="form-campos">
                                <?php echo $dados['endereco'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Telefones:</div>
    		                <div class="form-campos">
                                <?php echo $dados['telefone'].", ".$dados['celular'];?>
                            </div>
                           </td>
                           <?php
                                if($dados['tipoDocumento'] == "CNPJ")
                                {
                                ($dados["retencaoISS"] == 1) ? $retencaoISS="Sim" : $retencaoISS="Não";
                                ?>
                                <td>
                                    <div class="form-rotulo">Retenção ISS:</div>
    		                        <div class="form-campos"><?php echo $retencaoISS;?></div>
                                </td>
                                <?php
                                }
                           ?>
                        </tr>
                        <tr>
                           <td>
                            <div class="form-rotulo">Responsável:</div>
    		                <div class="form-campos">
                                <?php echo $dados['responsavel'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Data Cadastro:</div>
    		                <div class="form-campos">
                                <?php echo $dados['dataCriacao'];?>
                            </div>
                           </td>
                           <td>
                            <div class="form-rotulo">Usuário:</div>
    		                <div class="form-campos">
                                <?php echo $dados['usuarioAbertura'];?>
                            </div>
                           </td>
                        </tr>
                      </table>
                           <table id="tabela" class="sortable" width="95%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Ordem Serviço</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Código Barras</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Serviço Executado</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Qde Rec</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Data Produção</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="center">Status</th>
                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $statusBlock = TabelaItensFaturamento(); ?>
                            </tbody>
                          </table>
                      <BR>
                      <table>
                        <tr>
                         <td colspan="200">
                           <div class="form-rotulo">Observações:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"><?php echo $dados['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                     <hr>
                     <BR>
                     <table width="100%">
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="15" align="center"><div class="tipo_dados">MATERIAIS</div></td>
                        </tr>
                        <?php $valorTotalMateriais = TabelaMateriaisFaturamento(); ?>
                        <tr>
                           <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                           <td>
                           <div class="form-rotulo">Valor Total: </td>
                           <td><div style="color: red; font-size: 18px;font-weight: bold;"><?php echo number_format($valorTotalMateriais, 2, ',', '.');?>
                           </div></td>
                        </tr>
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">SERVIÇOS</div></td>
                        </tr>
                        <?php $valorTotalServicos = TabelaServicosFaturamento(); ?>
                        <tr>
                           <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                           <td>
                           <div class="form-rotulo">Valor Total: </td>
                           <td><div style="color: red; font-size: 18px;font-weight: bold;"><?php echo number_format($valorTotalServicos, 2, ',', '.');?>
                           </div></td>
                        </tr>
                        <tr style="border-bottom: 1px dashed black;">
                          <td colspan="10" align="center"><div class="tipo_dados">PAGAMENTO</div></td>
                        </tr>
                        <tr>
                          <td colspan="4">
                            <div class="form-rotulo">Forma de Pagamento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['formaPagamento'];?>
                            <input type="hidden" id="idFormaPagamento" name="idFormaPagamento" value="<?php echo $dados["idFormaPagamento"]; ?>"/>
                          </div>
                           </td>
                         <td colspan="5">
                            <div class="form-rotulo">Data de Vencimento:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo $dados['dataVencimento'];?>
                            </div>
                         </td>
                         <td>
                            <div class="form-rotulo">Valor Total:</div>
    		                <div class="form-campos" style="color: red; font-size: 18px;font-weight: bold;">
                                <?php echo "R$ ".number_format(($valorTotalMateriais + $valorTotalServicos), 2, ',', '.'); ?>
                            </div>
                          </td>
                        </tr>
                     </table>
                     <br>
                     <hr>
                     <br>
                     <table width="100%">
                        <tr>
                          <td colspan="10" align="center"><div class="tipo_dados">PARCELAS</div></td>
                        </tr>
                     </table>
                     <table width="100%">
                        <thead>
                             <tr class="header-list">
                                 <th width="10" style="vertical-align:text-bottom;" align="center">Nº</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left">Descrição</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="left">Valor</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Data Prevista</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center">Data Pagamento</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="left">Nota Fiscal</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="center">Situação</th>
                                 <th width="50" style="vertical-align:text-bottom;" align="center">Remover</th>
                             </tr>
                        </thead>
                        <tbody style="border-bottom: 1px solid black">
                           <?php $valorTotalParecelas = TabelaParcelasFaturamento(); ?>
                            
                        </tbody>
                     </table> 
                     <table id="tabelaParcela">
                      <tr>
                           <td colspan="4">
                            <div class="form-rotulo">Adicionar Parcelas
                            &#160;&#160;&#160;&#160;&#160;&#160;

                            <img onClick="adicionar();" src="images/icons/+.png"
                                 style="border: 0px;padding: 0px;cursor: pointer;" alt="Adicionar"/>

                            &#160;&#160;&#160;&#160;&#160;&#160;

                            <img onClick="remover();" src="images/icons/-.png"
                                 style="border: 0px;padding: 0px;cursor: pointer;" alt="Remover"/>

                            </div>
                        </td>
                        </tr>
                        <tr>
                            <td></td><td></td>
                            <td>
                               <div class="form-rotulo">Valor Total:</div>
    		                   <div class="form-campos">
                                   <input style="width:80px;" maxlength="100" type="text" name="valorTotal" id="valorTotal" value="<?php if($valorTotalParecelas) echo $valorTotalParecelas; else echo "0.00";?>"/>
                                   <input type="hidden" name="valorTotalInicial" id="valorTotalInicial" value="<?php if($valorTotalParecelas) echo $valorTotalParecelas; else echo "0.00";?>"/>
                               </div>
                             </td>
                         </tr>
                       </table>
                       <script> adicionar();</script>
                       <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>
          </div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&cont='+qtdParcela+'&CRUD=saveFaturamento');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          <div class="form-botao-grande">
            <a href="#"><img onClick="confirmacao('Deseja encerrar o Pedido?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&cont='+qtdParcela+'&CRUD=saveFaturamento&flagEncerrar=1');" alt="Faturamento" src="images/salvar_encerrar.gif" /></a>
          </div>
          <div class="form-botao-grande">
            <a href="#"><img onClick="confirmacao('Deseja excluir o Pedido?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=excluirPedido');" alt="Faturamento" src="images/excluir_pedido.gif" /></a>
          </div>
          </div>
      </form>
      <?php
      }
      ?>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



