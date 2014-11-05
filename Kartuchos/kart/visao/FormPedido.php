<?php include("../controle/CtrlParametro.php");?>
<style>
    
.optionzerado
{
    color: red;
    font-size: 20px;
}
</style>
<script>
var qtdPedido = 0;
$(document).ready(function(){
     $('#calendarioDataVencimento').click(function(){
		$(this).calendario({
			target:'#dataVencimento',
			top:-150,
			left:0
		});
	});
});
function verificaLucro(id) {
      var material = document.getElementById('material'+id);
      var preco = document.getElementById('preco'+id);
      $.ajax(
      {
       type: "GET",
       url: "../controle/CtrlAjax.php",
       data: "ajax=getMaterial&idMaterial="+material.value+"&preco="+preco.value,
       success: function(valor) {
                preco.style.backgroundColor=valor;
                },
       }
      );
     }    

function adicionarLinha()
          {
           var material = document.getElementById('material');
           var qde=document.getElementById('qde');
           var preco=document.getElementById('preco');

           qtdPedido++;

           var local=document.getElementById('tabelaMaterial');
           var tblBody = local.tBodies[0];
           var newRow = tblBody.insertRow(1);


           var newCell0 = newRow.insertCell(0);
           newCell0.innerHTML= '<tr>'+
                                '<td colspan="4">'+
                                   '<div class="form-rotulo">Material:</div>'+
    		                         '<div class="form-campos">'+
                                     '<select name="material'+qtdPedido+'" id="material'+qtdPedido+'">'+
                                      '<option disabled="disabled" selected="selected">-- Seleciona o Material --</option>'+
                                      '<?php comboMaterial();?>'+
                                     '</select>'+
                                    '</div>'+
                                '</td>';


           var newCell1 = newRow.insertCell(1);
           newCell1.innerHTML='<td>'+
                                   '<div class="form-rotulo">Quantidade '+qtdPedido+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:150px;" maxlength="100" value="0" onChange="somaTotal('+qtdPedido+')" type="text" name="qde'+qtdPedido+'" id="qde'+qtdPedido+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';
                                
           var newCell2 = newRow.insertCell(2);
           newCell2.innerHTML='<td>'+
                                   '<div class="form-rotulo">Preço '+qtdPedido+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:150px;" maxlength="100" value="0.00" type="text" onChange="somaTotal('+qtdPedido+')" name="preco'+qtdPedido+'" id="preco'+qtdPedido+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td></tr>';


           var newMaterial=document.getElementById('material'+qtdPedido);
           
           newMaterial.focus();

         }
function removerLinha()
          {
           if(qtdPedido > 0)
           {
            var valor = parseFloat(document.getElementById('preco'+qtdPedido).value) * parseFloat(document.getElementById('qde'+qtdPedido).value);
            document.getElementById('valorTotal').value = parseFloat(document.getElementById('valorTotal').value) - valor;
            var local=document.getElementById('tabelaMaterial');
            var tblBody = local.tBodies[0];
            var newRow = tblBody.deleteRow(1);
            qtdPedido --;
           }
          }
function somaTotal(id){
  verificaLucro(id);
  var valor = 0;
  for(var i=1;i<=qtdPedido ;i++)
   valor += parseFloat(document.getElementById('preco'+i).value) * parseFloat(document.getElementById('qde'+i).value);
  document.getElementById('valorTotal').value = valor;
}
</script>
        <body>
        <div id="sgi-tudo">
        <div id="sgi-corpo">
        <div id="sgi-pagina">
        <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
        <div id="sgi-conteudo">
         <div id="sgi-texto">
          <br><br>
            <table id="tabelaMaterial">
                   <tr>
                           <td colspan="4">
                            <div class="form-rotulo">Cadastrar Pedido
                            &#160;&#160;&#160;&#160;&#160;&#160;
                            <a href="#">
                            <img onClick="adicionarLinha();" src="images/icons/+.png"
                                 style="border: 0px;padding: 0px;" alt="Adicionar"/>
                            </a>
                            &#160;&#160;&#160;&#160;&#160;&#160;
                            <a href="#">
                            <img onClick="removerLinha();" src="images/icons/-.png"
                                 style="border: 0px;padding: 0px;" alt="Remover"/>
                            </a>
                            </div>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="right">
                               <div class="form-rotulo">Valor Total:</div>
    		                   <div class="form-campos">
                                   <input style="width:150px;" maxlength="100" type="text" value="0.00" name="valorTotal" id="valorTotal" value=""/>
                               </div>
                             </td>
                         </tr>
                        </table>
                        <script> adicionarLinha();</script>
                        <table>
                        <tr>
                         <td>
                           <div class="form-rotulo">Forma de Pagamento:</div>
		                   <div class="form-campos">
                             <select name="formaPagamento" id="formaPagamento">
                             <?php comboFormaPagamento();?>
                             </select>
                           </div>
                         </td>
                         <td >
                           <div class="form-rotulo">Data de Vencimento:</div>
		                   <div class="form-campos">
                               <input style="width:150px;" maxlength="100" type="text" name="dataVencimento" id="dataVencimento" value=""/>
                               <img class="alinhaImg" id="calendarioDataVencimento" src="images/icons/calendario.png" />
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
                        <BR>
          <div class="form-botoes">
            <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente'];?>&tipoCliente=<?php echo $_GET['tipoCliente'];?>');"
                        alt="voltar" src="images/voltar.gif" /></a>
             </div>
            <div class="form-botao-voltar">
              <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente'];?>&tipoCliente=<?php echo $_GET['tipoCliente'];?>&CRUD=savePedido&cont='+qtdPedido);" alt="Salvar" src="images/salvar.gif" /></a>
            </div>
         </div>
       </div>
      </div>
     </div>
    </div>
   </div>
</form>            <!-- end corpo //-->
