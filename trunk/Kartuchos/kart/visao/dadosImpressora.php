<?php
     include("../controle/CtrlImpressora.php");
     include("../controle/CtrlEstado.php");
     include("../controle/CtrlFuncionario.php");

     if($_GET['CRUD']){
        CRUDImpressora();
     }

?>
<script>
        function getID(){
                 return <?php echo $_GET['idImpressora'];?>
                 }
</script>
        <script language="JavaScript" src="js/jquery.js"></script>
        <script language="JavaScript" src="js/ordenarTitulo.js"></script>
        <script language="JavaScript" src="js/filtroGrid.js"></script>
        <script language="JavaScript" src="js/funcoes.js"></script>
        <link rel="stylesheet" type="text/css" href="css/itens.css" media="screen">
        <link rel="stylesheet" type="text/css" href="css/estrutura.css" media="screen">
        
        <style>
                html{
                     background: #ebebeb;
                     background:-moz-linear-gradient(left, #ebebeb, #b3b3b3);
                     background:-webkit-linear-gradient(left, #ebebeb, #b3b3b3);
                     background:-o-linear-gradient(left, #ebebeb, #b3b3b3);
                     background:-ms-linear-gradient(left, #ebebeb, #b3b3b3);
                     background:linear-gradient(left, #ebebeb, #b3b3b3);
                     filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b3b3b3', endColorstr='#ebebeb',GradientType=1);
                    }
        </style>
        
        <body>
        <div id="sgi-tudo">
        <div id="sgi-corpo">
        <div id="sgi-pagina">
        <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
        <div id="sgi-conteudo">
         <div id="sgi-texto">
            <div class="tipo_dados">Lista de Impressoras</div>
            <div class="form-linha2">
                          <div class="form-rotulo2">Digite a marca:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&acao=lista');" style="text-align:left;width:200px;" maxlength="255" type="text"
                                  name="Impressora" id="Impressora" value="<?php echo $_POST['Impressora'];?>" />
                      <div class="form-rotulo2">Patrimônio:</div>
        		                <div class="form-campos2">
        		                <div style="padding: 0px; display: inline;">
                                  <input onKeyPress="submitEnter(event,'<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&acao=lista');" style="text-align:left;width:100px;" maxlength="255" type="text"
                                  name="seachPatrimonio" id="seachPatrimonio" value="<?php echo $_POST['seachPatrimonio'];?>" />
                                <span style="border: 0px;padding: 0px; position: absolute;">
                                  <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&acao=lista');" src="images/icons/seguir.png" style="border: 0px;padding: 0px;" alt="Pesquisar"/></a>
                                </span>
                              </div>

        	</div>

                 <br><br>

          <?php
        if($_GET['acao'] == "lista"){
        ?>
        <script>
        <!--
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
        <div style="width: 100%;">
             <table  class="sortable">
               <thead>
                 <tr >
                  <th width="40" height="2" align="center"><br><input type='checkbox' onclick='checkAll()'></th>
                  <th width="40" height="2" align="center"><br>ID</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Patrimônio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Nº Série</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><br>Tipo de Impressão</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><br>Observação</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaSelecionarImpressoras(); ?>
               </tbody>               
             </table>
           </div>
           <br>
           <div class="form-botoes">
           <div class="form-botao-voltar">
        	 <a href="javascript:window.close()"><img alt="Voltar" src="images/cancelar.gif" /></a>		</div>
           <div class="form-botao-voltar">
             <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&CRUD=vincular');" alt="Voltar" src="images/salvar.gif" /></a>
           </div>
          </div>
        </form>
    <?php
       
       }
	?>
</form>            <!-- end corpo //-->
