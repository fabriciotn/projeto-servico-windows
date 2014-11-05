<script>
var qtdColeta = 0;
function adicionarLinha()
          {
           var item = document.getElementById('item');
           var defeito=document.getElementById('defeito');
           
           qtdColeta++;

           var local=document.getElementById('coleta');
           var tblBody = local.tBodies[0];
           var newRow = tblBody.insertRow(1);


           var newCell0 = newRow.insertCell(0);
           newCell0.innerHTML= '<tr>'+
                                '<td colspan="2">'+
                                   '<div class="form-rotulo">Item '+qtdColeta+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:350px;" maxlength="100" type="text" name="item'+qtdColeta+'" id="item'+qtdColeta+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td>';


           var newCell1 = newRow.insertCell(1);
           newCell1.innerHTML='<tr>'+
                                '<td colspan="2">'+
                                   '<div class="form-rotulo">Defeito Relatado '+qtdColeta+':</div>'+
    		                       '<div class="form-campos">'+
   		                            '<input style="width:350px;" maxlength="100" type="text" name="defeito'+qtdColeta+'" id="defeito'+qtdColeta+'"'+
                                    'value=""/>'+
                                    '</div>'+
                                '</td></tr>';
           

           var newItem=document.getElementById('item'+qtdColeta);
           
           newItem.focus();

         }
function removerLinha()
          {
           if(qtdColeta > 0)
           {
            var local=document.getElementById('coleta');
            var tblBody = local.tBodies[0];
            var newRow = tblBody.deleteRow(1);
            qtdColeta --;
           }
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
            <table id="coleta">
                   <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Cadastrar Coleta</div>
                        </td>
                        <td>
                            <a href="#">
                            <img onClick="adicionarLinha();" src="images/icons/+.png"
                                 style="border: 0px;padding: 0px;" alt="Adicionar"/>
                            </a>
                        </td>
                        <td>
                            <a href="#">
                            <img onClick="removerLinha();" src="images/icons/-.png"
                                 style="border: 0px;padding: 0px;" alt="Remover"/>
                            </a>
                        </td>
                        </tr>
                        </table>
                        <script> adicionarLinha();</script>
                        <table>
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
            <a href="#"><img
            onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente'];?>&tipoCliente=<?php echo $_GET['tipoCliente'];?>&CRUD=saveColeta&cont='+qtdColeta);"
            alt="Salvar" src="images/salvar.gif" /></a>
          </div>
         </div>
        </div>
      </div>
     </div>
    </div>
   </div>
</form>            <!-- end corpo //-->
