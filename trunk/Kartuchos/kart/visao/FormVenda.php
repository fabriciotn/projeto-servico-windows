<?php
     include("_templates/_templateCabecalho.php");
     //include("_templates/_templateCadastros.php");
     include("../controle/CtrlParcela.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlMaterial.php");
     include("../controle/CtrlServico.php");
     include("../controle/CtrlOrdemServico.php");
     
     verificaAcesso(9, $_SESSION["cod"]);
?>
<script>
      function refreshPagina(id,tipo){
         location.href="formVenda.php?idCliente="+id+"&tipoCliente="+tipo;
      }
</script>
</div></div></div>
<?php

     if($_GET['CRUD']){
        if(verificaAlteracao(9, $_SESSION["cod"]))
         CRUDOrdemServico();
        else
         echo '<span class="msg_crud_erro">Você não tem acesso para alteração!</span>';
     }
?>
<div id="sgi-conteudo">
       <div id="sgi-texto">
<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
<div class="tipo_dados" style="text-align:center;">Ordens de Serviço</div>
<hr>
<div id="cliente" style="width: 100%;">
   Código do Cliente:
   <input type="text" value="<?php echo $_GET['idCliente'];?>" id="codCliente" />
   <input type="button" class="botao"  value="  ...  " onclick="abrir('dadosCliente.php');" />
   <?php
        if($_GET['idCliente'])
         {
          if($_GET['tipoCliente'] == "PF")
          {
           $dadosCliente = obtemClientePF($_GET['idCliente']);
           ?>
            <table>
                   <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Pessoa Física</div>
                   </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Nome:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['nome'];?></div>
                        </td>
                           <td>
                            <div class="form-rotulo">CPF:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['cpf'];?></div>
                        </td>
                         <td>
                             <div class="form-rotulo">Endereço Completo:</div>
    		                <div class="form-campos">
                            <?php echo $dadosCliente['endereco'].", ".$dadosCliente['bairro']." - ".$dadosCliente['cidade'].", ".$dadosCliente['estado'];?></div>
                         </td>
                         <td>
                             <div class="form-rotulo">Email:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['email'];?></div>
                         </td>
                         </tr>
                     </table>
           <?php
          }else
           {
             $dadosCliente = obtemClientePJ($_GET['idCliente']);
            ?>
             <table>
                   <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Pessoa Jurídica</div>
                   </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Nome Fantasia:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['nomeFantasia'];?></div>
                        </td>
                           <td>
                            <div class="form-rotulo">Razão Social:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['razaoSocial'];?></div>
                        </td>
                           <td>
                            <div class="form-rotulo">CNPJ:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['cnpj'];?></div>
                        </td>
                       </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Inscrição Estadual:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['inscricaoEstadual'];?></div>
                        </td>
                        <td>
                            <div class="form-rotulo">Responsável:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['responsavel'];?></div>
                        </td>
                       </tr>
                       <tr>
                         <td>
                            <div class="form-rotulo">Retenção ISS:</div>
    		                <div class="form-campos"><?php echo ( $dadosCliente['retencaoISS'] == 1 ? 'Sim' : 'Não' );?></div>
                         </td>
                         <td>
                             <div class="form-rotulo">Endereço Completo:</div>
    		                <div class="form-campos">
                            <?php echo $dadosCliente['endereco'].", ".$dadosCliente['bairro']." - ".$dadosCliente['cidade'].", ".$dadosCliente['estado'];?></div>
                         </td>
                        </tr>
                        <tr>
                          <td>
                           <div class="form-rotulo">Telefone:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['telefone'];?></div>
                         </td>
                         <td>
                             <div class="form-rotulo">E-Mail:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['email'];?></div>
                         </td>
                        <td>
                           <div class="form-rotulo">Limite de crédito:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['limiteCredito'];?></div>
                         </td>
                        </tr>
                     </table>

            <?php
           }
          echo $PHP_SELF;
          ?>
          <br><div class="tipo_dados" style="text-align:center;">Novo Atendimento</div>
          <input class="botao" type="button" value="  Nova Coleta  "
          onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente'];?>&tipoCliente=<?php echo $_GET['tipoCliente'];?>&acao=coleta');" />&#160;&#160;&#160;
          <input class="botao" type="button" value="  Novo Pedido  "
          onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente'];?>&tipoCliente=<?php echo $_GET['tipoCliente'];?>&acao=pedido');" />
          <hr>
          <?php
               if($_GET['acao']=="coleta")
                 include("formColeta.php");
               else if($_GET['acao']=="pedido")
                 include("formPedido.php");
         }
          ?>
          
   <!--<iframe name="cliente" src="dadosCliente.php" frameborder=1 id="frameDados" scrolling=auto></iframe>-->
   <?php
   if($_GET['idCliente'])
   {
    ?>
   <br><div class="tipo_dados" style="text-align:center;">Histórico do Cliente</div>
   <hr>
   <div class="form-rotulo" align="center">Pagamentos</div>
   <div style="width: 100%;">
     <table align="center" id="tabela" class="sortable">
       <thead>
          <tr class="header-list">
            <th width='27' height='2' align='center'><input type="text" id="txtColuna3"/><br>N°</th>
			<th width='20' align='center'><input type="text" id="txtColuna3"/><br>Tipo</th>
			<th width='20' align='center'><input type="text" id="txtColuna3"/><br>Pedido</th>
			<th width='150' align='center'><input type="text" id="txtColuna3"/><br>Descrição</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Valor Base</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Multa</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Juros</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Valor Total</th>
			<th width='83' align='center'><input type="text" id="txtColuna3"/><br>Data Prev. Pagam.</th>
			<th width='120' align='center'><input type="text" id="txtColuna3"/><br>Data Pagam.</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Nota Fiscal</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Status</th>
          </tr>
       </thead>
       <tbody style="border-bottom: 1px solid black">
         <?php TabelaHistoricoPagamentos(); ?>
       </tbody>
     </table>
    </div>
    <hr>
   <div class="form-rotulo" align="center">Coletas</div>
   <div style="width: 100%;">
     <table align="center" id="tabela" class="sortable">
       <thead>
          <tr class="header-list">
            <th width='20' height='2' align='center'><input type="text" id="txtColuna3"/><br>N°</th>
			<th width='20' align='center'><input type="text" id="txtColuna3"/><br>Tipo</th>
            <th width='80'><input type="text" id="txtColuna3"/><br>Data</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Código Barras</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Descrição</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Defeito Relatado</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Serviço Executado</th>
			<th width='50' align='center'><input type="text" id="txtColuna3"/><br>Status</th>
          </tr>
       </thead>
       <tbody style="border-bottom: 1px solid black">
         <?php TabelaHistoricoColetas(); ?>
       </tbody>
     </table>
    </div>
   <hr>
   <div class="form-rotulo" align="center">Serviços</div>
   <div style="width: 100%;">
     <table align="center" id="tabela" class="sortable">
       <thead>
          <tr class="header-list">
             <th width='27' height='2' align='center'><input type="text" id="txtColuna3"/><br>N°</th>
		     <th width='95' align='center'><input type="text" id="txtColuna3"/><br>Tipo</th>
		     <th width='120' align='center'><input type="text" id="txtColuna3"/><br>Data</th>
		     <th width='320' align='center'><input type="text" id="txtColuna3"/><br>Serviço</th>
		     <th width='50' align='center'><input type="text" id="txtColuna3"/><br>Preço</th>
		     <th width='50' align='center'><input type="text" id="txtColuna3"/><br>Qde</th>
		     <th width='150' align='center'><input type="text" id="txtColuna3"/><br>Status</th>
          </tr>
       </thead>
       <tbody style="border-bottom: 1px solid black">
         <?php TabelaHistoricoServicos(); ?>
       </tbody>
     </table>
    </div>
   <hr>
   <div class="form-rotulo" align="center">Materiais</div>
   <div style="width: 100%;">
     <table align="center" id="tabela" class="sortable">
       <thead>
          <tr class="header-list">
             <th width='27' height='2' align='center'><input type="text" id="txtColuna3"/><br>N°</th>
		     <th width='95' align='center'><input type="text" id="txtColuna3"/><br>Tipo</th>
		     <th width='120' align='center'><input type="text" id="txtColuna3"/><br>Data</th>
		     <th width='320' align='center'><input type="text" id="txtColuna3"/><br>Material</th>
		     <th width='50' align='center'><input type="text" id="txtColuna3"/><br>Preço</th>
		     <th width='50' align='center'><input type="text" id="txtColuna3"/><br>Qde</th>
		     <th width='50' align='center'><input type="text" id="txtColuna3"/><br>Status</th>
          </tr>
       </thead>
       <tbody style="border-bottom: 1px solid black">
         <?php TabelaHistoricoMateriais(); ?>
       </tbody>
     </table>
    </div>
    <?php
    }
    ?>
   
</div>
<br>
<?php
     include("_templates/_templateRodape.php");
?>



