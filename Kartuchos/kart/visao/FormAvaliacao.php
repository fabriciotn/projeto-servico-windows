<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlMaterial.php");
     include("../controle/CtrlServico.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlAvaliacao.php");

     verificaAcesso(12, $_SESSION["cod"]);
     
    $_GET['idOrdemServico'] = $_GET['id'];

?>

<?php
     if($_GET['CRUD'])
     {
      if(verificaAlteracao(12, $_SESSION["cod"]))
         CRUDAvaliacao();
      else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }    
?>
<script>
var qtdMaterial = 0;
var qtdServico = 0;
$(document).ready(function(){
     $('#calendarioDataVencimento').click(function(){
		$(this).calendario({
			target:'#dataVencimento',
			top:-100,
			left:-100
		});
	});
});
function adicionarMaterial()
          {

           qtdMaterial++;

           var local=document.getElementById('tabelaMaterial');
           var tblBody = local.tBodies[0];
           var newRow = tblBody.insertRow(1);

           var newCell0 = newRow.insertCell(0);
           newCell0.innerHTML= '<tr>'+
                                '<td colspan="4">'+
                                   '<div class="form-rotulo">Material:</div>'+
    		                         '<div class="form-campos">'+
                                     '<select style="width:600px;" name="material'+qtdMaterial+'" id="material'+qtdMaterial+'"><?php comboMaterial();?>'+
                                     '</select>'+
                                    '</div>'+
                                '</td>';


           var newCell1 = newRow.insertCell(1);
           newCell1.innerHTML='<td>'+
                                   '<div class="form-rotulo">Quantidade '+qtdMaterial+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:150px;" maxlength="100" value="0" onChange="somaTotalMaterial()" type="text" name="qdeMaterial'+qtdMaterial+'" id="qdeMaterial'+qtdMaterial+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell2 = newRow.insertCell(2);
           newCell2.innerHTML='<td>'+
                                   '<div class="form-rotulo">Preço '+qtdMaterial+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:150px;" maxlength="100" value="0.00" type="text" onChange="somaTotalMaterial()" name="precoMaterial'+qtdMaterial+'" id="precoMaterial'+qtdMaterial+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td></tr>';

           var newMaterial=document.getElementById('material'+qtdMaterial);
           newMaterial.focus();

         }
function removerMaterial()
          {
           if(qtdMaterial > 0)
           {
            var valor = parseFloat(document.getElementById('precoMaterial'+qtdMaterial).value) * parseFloat(document.getElementById('qdeMaterial'+qtdMaterial).value);
            document.getElementById('valorTotalMaterial').value = parseFloat(document.getElementById('valorTotalMaterial').value) - valor;
            var local=document.getElementById('tabelaMaterial');
            var tblBody = local.tBodies[0];
            var newRow = tblBody.deleteRow(1);
            qtdMaterial --;
           }
          }
function atualizaQtdMaterial(valor)
          {
           qtdMaterial=valor;          
          }
          
function atualizaQtdServico(valor)
          {
           qtdServico=valor;           
          }
          
function somaTotalMaterial(){
  var valor = 0;
  for(var i=1;i<=qtdMaterial ;i++)
   valor += parseFloat(document.getElementById('precoMaterial'+i).value) * parseFloat(document.getElementById('qdeMaterial'+i).value);
  document.getElementById('valorTotalMaterial').value = valor;
}

function adicionarServico()
          {

           qtdServico++;

           var local=document.getElementById('tabelaServico');
           var tblBody = local.tBodies[0];
           var newRow = tblBody.insertRow(1);

           var newCell0 = newRow.insertCell(0);
           newCell0.innerHTML= '<tr>'+
                                '<td colspan="4">'+
                                   '<div class="form-rotulo">Serviço:</div>'+
    		                         '<div class="form-campos">'+
                                     '<select style="width:600px;" name="servico'+qtdServico+'" id="servico'+qtdServico+'"><?php comboServico();?>'+
                                     '</select>'+
                                    '</div>'+
                                '</td>';


           var newCell1 = newRow.insertCell(1);
           newCell1.innerHTML='<td>'+
                                   '<div class="form-rotulo">Quantidade '+qtdServico+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:150px;" maxlength="100" value="0" onChange="somaTotalServico()" type="text" name="qdeServico'+qtdServico+'" id="qdeServico'+qtdServico+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';

           var newCell2 = newRow.insertCell(2);
           newCell2.innerHTML='<td>'+
                                   '<div class="form-rotulo">Preço '+qtdServico+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:150px;" maxlength="100" value="0.00" type="text" onChange="somaTotalServico()" name="precoServico'+qtdServico+'" id="precoServico'+qtdServico+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td></tr>';

           var newServico=document.getElementById('servico'+qtdServico);

           newServico.focus();

         }
function removerServico()
          {
           if(qtdServico > 0)
           {
            var valor = parseFloat(document.getElementById('precoServico'+qtdServico).value) * parseFloat(document.getElementById('qdeServico'+qtdServico).value);
            document.getElementById('valorTotalServico').value = parseFloat(document.getElementById('valorTotalServico').value) - valor;
            var local=document.getElementById('tabelaServico');
            var tblBody = local.tBodies[0];
            var newRow = tblBody.deleteRow(1);
            qtdServico --;
           }
          }
function somaTotalServico(){
  var valor = 0;
  for(var i=1;i<=qtdServico ;i++)
   valor += parseFloat(document.getElementById('precoServico'+i).value) * parseFloat(document.getElementById('qdeServico'+i).value);
  document.getElementById('valorTotalServico').value = valor;
}
</script>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados">Editar Avaliação</div>
                 <br>
                 <input class="botao" type="button" value="  Voltar Item para Produção  "
                 onClick="confirmacao('Deseja voltar este item para Produção?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['idOrdemServico'];?>&CRUD=voltaStatusProducao');"
                 <hr>
                 <br>
                  <table>
                   <?php
                     if($_GET['idOrdemServico'])
                     {
                      $dados = obtemAvaliacao($_GET['idOrdemServico']);
                   ?>
                        <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Cliente:</div>
    		                <div class="form-campos">
                                <?php echo $dados["nomeCliente"];?>
                            </div>
                           </td>
                        </tr>
                        <tr>
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
                                 <th width="10" height="2" align="center"><br>Entregar</th>
                                 <th width="10" height="2" align="center"><br>Nº</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center"><br>Ordem Serviço</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center"><br>Código Barras</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left"><br>Descrição</th>
                                 <th width="300" style="vertical-align:text-bottom;" align="left"><br>Serviço Executado</th>
                                 <th width="120" style="vertical-align:text-bottom;" align="center"><br>Data Produção</th>
                                 <th width="100" style="vertical-align:text-bottom;" align="center"><br>Status</th>
                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $statusBlock = TabelaServicosAvaliacao(); ?>
                            </tbody>
                          </table>
                      <BR>
                      <table>
                        <tr>
                         <td>
                           <div class="form-rotulo">Forma de Pagamento:</div>
		                   <div class="form-campos">
                             <select name="formaPagamento" id="formaPagamento">
                             <option value="<?php echo $dados["idFormaPagamento"]; ?>"><?php echo $dados["formaPagamento"]; ?></option>
                             <?php comboFormaPagamento();?>
                             </select>
                           </div>
                         </td>
                         <td >
                           <div class="form-rotulo">Data de Vencimento:</div>
		                   <div class="form-campos">
                               <input style="width:150px;" maxlength="100" type="text" name="dataVencimento" id="dataVencimento"
                               value="<?php echo $dados["dataVencimento"]; ?>" />
                               <img class="alinhaImg" id="calendarioDataVencimento" src="images/icons/calendario.png" />
                           </div>
                         </td>
                        </tr>
                        <tr>
                         <td colspan="200">
                           <div class="form-rotulo">Observações:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"><?php echo $dados["observacoes"]; ?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                      <BR>
                      <table id="tabelaMaterial">
                      <tr>
                           <td colspan="4">
                            <div class="form-rotulo">Materiais
                            &#160;&#160;&#160;&#160;&#160;&#160;
                            <img onClick="adicionarMaterial();" src="images/icons/+.png"
                                 style="border: 0px;padding: 0px;cursor: pointer;" alt="AdicionarMaterial"/>
                            &#160;&#160;&#160;&#160;&#160;&#160;
                            <img onClick="removerMaterial();" src="images/icons/-.png"
                                 style="border: 0px;padding: 0px;cursor: pointer;" alt="RemoverMaterial"/>
                            </div>
                        </td>
                        </tr>
                        <?php $qtdMaterial=TabelaInserirMateriaisAvaliacao();?>
                        <tr>
                            <td colspan="4" align="right">
                               <div class="form-rotulo">Valor Total Material:</div>
    		                   <div class="form-campos">
                                   <input style="width:150px;" maxlength="100" type="text" value="0.00" name="valorTotalMaterial" id="valorTotalMaterial" value=""/>
                               </div>
                             </td>
                         </tr>                         
                       </table>                       
                             <script> atualizaQtdMaterial("<?php echo $qtdMaterial;?>");somaTotalMaterial();</script>                           
                       <BR>
                      <table id="tabelaServico">
                      <tr>
                           <td colspan="4">
                            <div class="form-rotulo">Serviços
                            &#160;&#160;&#160;&#160;&#160;&#160;
                            <a href="#">
                            <img onClick="adicionarServico();" src="images/icons/+.png"
                                 style="border: 0px;padding: 0px;cursor: pointer;" alt="AdicionarServico"/>
                            </a>
                            &#160;&#160;&#160;&#160;&#160;&#160;
                            <a href="#">
                            <img onClick="removerServico();" src="images/icons/-.png"
                                 style="border: 0px;padding: 0px;cursor: pointer;" alt="RemoverServico"/>
                            </a>
                            </div>
                        </td>
                        </tr>
                        <?php $qtdServico=TabelaInserirServicosAvaliacao();?>
                        <tr>
                            <td colspan="4" align="right">
                               <div class="form-rotulo">Valor Total Serviço:</div>
    		                   <div class="form-campos">
                                   <input style="width:150px;" maxlength="100" type="text" value="0.00" name="valorTotalServico" id="valorTotalServico" value=""/>
                               </div>
                             </td>
                         </tr>
                       </table>
                       <script> atualizaQtdServico("<?php echo $qtdServico;?>");somaTotalServico();</script>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>
          </div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&contMaterial='+qtdMaterial+'&contServico='+qtdServico+'&CRUD=saveAvaliacao');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          <div class="form-botao-grande">
            <a href="#"><img onClick="if('<?php echo $statusBlock; ?>'){alert('Não é possível faturar, pois há ítens que ainda não estão em avaliação.');}else{confirmacao('Deseja encerrar os itens?','<?php echo $PHP_SELF; ?>?id=<?php echo $_GET['id']; ?>&CRUD=encerraAvaliacao');}" alt="Avaliação" src="images/encerrar.gif" /></a>
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



