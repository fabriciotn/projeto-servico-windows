<?php session_start();
include("../controle/CtrlParametro.php");?>
<?php include("../controle/CtrlPedido.php");?>
<script language="JavaScript" src="js/funcoes.js"></script>
<?php
     if($_GET['CRUD']){        
         CRUDPedido();
     }
?>

<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/ordenarTitulo.js"></script>
<script language="JavaScript" src="js/filtroGrid.js"></script>
<script language="JavaScript" src="js/funcoes.js"></script>
<link rel="stylesheet" type="text/css" href="css/itens.css" media="screen">
        <link rel="stylesheet" type="text/css" href="css/estrutura.css" media="screen">
        <script type="text/javascript" src="js/calendario.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="css/calendario.css" />
<style>
    

    
.optionzerado
{
    color: red;
    font-size: 20px;
}
</style>
<script>
$(document).ready(function(){
     $('#calendarioDataVencimento').click(function(){
		$(this).calendario({
			target:'#dataVencimento',
			top:-150,
			left:0
		});
	});
});
</script>
        <body>
        <div id="sgi-tudo">
        <div id="sgi-corpo">
        <div id="sgi-pagina">
        <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
        <div id="sgi-conteudo">
         <div id="sgi-texto">
          <br><br><br><br><br><br><br><br>
            <table id="tabelaMaterial">
                   <tr>
                           <td colspan="4">
                            <div class="form-rotulo">Cadastrar Pedido</div>
                        </td>
                        </tr>
                        <tr>
                            <td>
                               <div class="form-rotulo">Material:</div>
    		                   <div class="form-campos">
                                   [693] PAGAMENTO LOCAÇÃO
                                   <input type="hidden" id="material" name ="material" value="693"/>
                               </div>
                             </td>
                            <td>
                               <div class="form-rotulo">Valor Total:</div>
    		                   <div class="form-campos">
                                   <?php echo "R$ " . number_format($_GET['valor'], 2, ',', '.');?>
                                       <input type="hidden" id="preco" name ="preco" value="<?php echo $_GET['valor'];?>"/>
                                       <input type="hidden" id="qde" name ="qde" value="1"/>
                               </div>
                             </td>
                         </tr>
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
              <a href="#"><img onClick="confirmacao('Deseja realmente enviar aferição para faturamento?','<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente'];?>&tipoCliente=<?php echo $_GET['tipoCliente'];?>&mes=<?php echo $_GET['mes'];?>&ano=<?php echo $_GET['ano'];?>&CRUD=savePedidoLocacao');" alt="Salvar" src="images/salvar.gif" /></a>
            </div>
         </div>
       </div>
      </div>
     </div>
    </div>
   </div>
</form>            <!-- end corpo //-->
