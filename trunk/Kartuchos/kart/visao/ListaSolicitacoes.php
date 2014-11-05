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
            <div class="tipo_dados">
            <?php
                 echo $_GET['statusSolicitacao'];
            ?>
            </div>
            <br><br><br><br>
<span class="area_campo">
           <div style="width: 100%;">
             <table id='tabela' class='sortable'>
               <thead>
                 <tr class='header-list'>
                  <th width='40' height='2' align='center'><input type='text' id='txtColuna3'/><br>N°</th>
                  <th width='10' height='2' align='center'><br>Editar</th>
                  <th width='250' style='vertical-align:text-bottom;' align='center'><input type='text' id='txtColuna3'/><br>Cliente</th>
                  <th width='60' align='center'><input type='text' id='txtColuna3'/><br>Ordem<br>Servico</th>
                  <th width='80' align='center'><input type='text' id='txtColuna3'/><br>Código Barras</th>
                  <th width='200' align='center'><input type='text' id='txtColuna3'/><br>Descrição</th>
                  <th width='130' align='center'><input type='text' id='txtColuna3'/><br>Data</th>
		          <th width='83' align='center'><input type='text' id='txtColuna3'/><br>Status</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
                 <?php TabelaSolicitacoes();?>
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



