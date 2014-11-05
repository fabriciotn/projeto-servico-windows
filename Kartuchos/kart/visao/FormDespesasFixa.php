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
         echo '<span class="msg_crud_erro">Voc� n�o tem acesso para altera��o!</span>';
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
                                 <th width="10px" align="center">N�</th>
                                 <th width="10px" align="center">C�d Parcela Inicial</th>
                                 <th width="300px" align="center">Descri��o</th>
                                 <th width="100px" style="vertical-align:text-bottom;" align="center">Valor</th>
                                 <th width="120px" style="vertical-align:text-bottom;" align="center">Dia Vencimento</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Ult. M�s</th>
                                 <th width="20px" style="vertical-align:text-bottom;" align="center">Ano In�cio</th>
                                 <th width="100px" style="vertical-align:text-bottom;" align="center">Conta Banc�ria</th>
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



