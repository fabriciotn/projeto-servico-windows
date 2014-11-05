<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateSolicitacoes.php");
     include("../controle/CtrlSolicitacoes.php")
?>
<script>
function Envia(idCliente)
{
        document.getElementById("form").action = "solicitacoes.php?idCliente="+idCliente;
        document.getElementById("form").submit();

}
</script>
<div id="sgi-conteudo">
<div id="sgi-texto">
            <div class="tipo_dados">Solicitações Pendentes</div>
<span class="area_campo">
                        <div class="form-linha2">
        		                <div class="form-rotulo2"><label for="cliente">Cliente:</label></div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input style="text-align:left;width:500px;" maxlength="255" type="text"
                                  name="cliente" id="cliente" value='<?php echo $_POST['cliente'];?>' />
                                  <input type="IMAGE" style="border: 0px;padding: 0px; position: absolute;" src="images/icons/seguir.png">
                              </div>
                              </div>
        		        </div>
        		        <div style="float:left;width: 300px;padding: 1px;">
                           <table class="tabelaSolicitacoes" id="tabela">
                           <thead>
        	               <tr class="header-list">
                               <th style="text-align: left;width: 300px;">Nome do Cliente</th>
        	                </tr>
        	                
                           </thead>
                           <tbody style="border-bottom: 1px solid black">
                           <?php TabelaClientesSolicitacoes($complemento);?>
                           </tbody>
                            </table>
                          </div>
                          <div style="float:left;width: 500px;padding:1px;">
                          <table class="tabelaDetalhes" <?php if(!$_GET['idCliente']) echo 'style="visibility:hidden;';?> >
                           <thead>
        	               <tr class="header-list">
        		               <th style="text-align: left; font-size: 12px;">Nº</th>
                               <th style="text-align: left; font-size: 12px;">Editar</th>
        		               <th style="text-align: left; font-size: 12px;">Serviço</th>
        		               <th style="text-align: left; font-size: 12px;">Tipo</th>
        		               <th style="text-align: left; font-size: 12px;">Descrição</th>
        		               <th style="text-align: left; font-size: 12px;">Qde</th>
        		               <th style="text-align: left; font-size: 12px;">Data</th>
        		               <th style="text-align: left; font-size: 12px;">Status</th>
                                       <th style="text-align: left; font-size: 12px;">Observações</th>
        	                </tr>

                           </thead>
                           <tbody style="border-bottom: 1px solid black">
                           <?php TabelaItensSolicitacoes($complemento);?>
                           </tbody>
                            </table>
                           </div>

        </form>
            <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



