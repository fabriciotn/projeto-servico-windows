<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
     include("../controle/CtrlParametro.php");
     include("../controle/CtrlContaBancaria.php");
     include("../controle/CtrlClasse.php");
     include("../controle/CtrlSubClasse.php");
     include("../controle/CtrlEmpresa.php");
     include("../controle/CtrlBanco.php");
     include("../controle/CtrlDespesasFixa.php");
     
     verificaAcesso(23, $_SESSION["cod"]);
     
     if($_GET['CRUD']){
        if(verificaAlteracao(23, $_SESSION["cod"]))
         CRUDDespesaFixa();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
?>
<script>
    $(document).ready(function() {

    $('#tabelaGrid').fixedHeaderTable({ footer: true, altClass: 'odd' });

    });
</script>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Despesas Fixas</div>
                 <br>
                 <hr>
                  <br>
                  <table id="tabelaGrid" width="100%">
                            <thead>
                             <tr class="header-list">                                 
                                 <th width="10px" align="center">Nº</th>
                                 <th width="10px" align="center">Cód Parcela Inicial</th>
                                 <th width="300px" align="center">Descrição</th>
                                 <th width="100px" style="vertical-align:text-bottom;" align="center">Valor</th>
                                 <th width="120px" style="vertical-align:text-bottom;" align="center">Dia Vencimento</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Ult. Mês</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Ano Início</th>
                                 <th width="100px" style="vertical-align:text-bottom;" align="center">Conta Bancária</th>
                                 <th width="100px" align="center">Empresa</th>
                                 <th width="100px" style="vertical-align:text-bottom;" align="center">Classe</th>
                                 <th width="100px" align="center">Sub Classe</th>
                                 <th align="center">Excluir</th>
                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php $valorTotal = TabelaDespesasFixa(); ?>
                            </tbody>    
                            <tfoot>
        		            <tr>
        		                <td colspan="12" align="right" style="background-color: red;color:white;">                                  
                                            Total: <?php echo "R$ ".$valorTotal;?>
                                       </td>
                                    </tr>
        		   </tfoot>
                 </table>
                      <BR>
      </form>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
<?php
     include("_templates/_templateRodape.php");
?>



