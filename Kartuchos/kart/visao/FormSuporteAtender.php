<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlSuporte.php");
     include("../controle/CtrlImpressora.php");
?>
<script>
      function refreshPagina(id,tipo){
         location.href="formSuporte.php?idCliente="+id+"&tipoCliente="+tipo;
      }
      function refreshImpressora(){
               document.location.reload();
      }
     
    $(document).ready(function(){
     $('#calendarioData').click(function(){
		$(this).calendario({
			target:'#data',
			top:-100,
			left:-100
		});
	});
});
</script>
</div></div></div>
<?php
     if($_GET['CRUD'])
        CRUDSuporte();
?>
<div id="sgi-conteudo">
       <div id="sgi-texto">
<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">

<div class="tipo_dados" style="text-align:center;">Cadastrar Chamado</div>
<hr>
<div id="cliente" style="width: 100%;">
   Código do Cliente:
   <input type="text" value="<?php echo $_GET['idCliente'];?>" id="codCliente" />
   <input type="button" class="botao"  value="  ...  " onclick="abrir('dadosCliente.php');" />
   <?php
        if($_GET['idCliente'])
         {
          /*
          $dadosLocacao = obtemLocacao($_GET['idCliente']);
          if($dadosLocacao)
            $_GET['idLocacao'] = $dadosLocacao['idLocacao'];          
           */
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
           if(!$_GET['status'])
            {
  
          ?>
          <br><div class="tipo_dados" style="text-align:center;">Dados do Chamado</div>
          <hr>
          <table>
                   <?php
                     if($_GET['idChamado'])
                     {
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idChamado'];?></div>
                        </td>
                        <td colspan="10">
                            <div class="form-rotulo">(Atualizar Chamado)</div>
                        </td>
                       </tr>
                    <?php

                      }else{
                            ?>
                            <tr>
                            <td colspan="10">
                                <div class="form-rotulo">(Novo Chamado)</div>
                            </td>
                            </tr>
                            <?php
                            }
                     ?>     
                         <tr>                           
                             <td colspan="2">
                            <div class="form-rotulo">Responsável:</div>
    		                <div class="form-campos">
                               <input style="width:300px;" maxlength="300" type="text" name="responsavel" id="responsavel"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Caso houver, selecione a Impressora:</div>
                            <div class="form-campos">
                            <select name='idImpressora' id='idImpressora'>
                                <option> -- Selecione a Impressora -- </option>
                            <?php comboImpressora();?>                                
                            </select>                
                            </div>
                           </td>                           
                      </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Defeito Alegado:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="defeito_alegado" id="defeito_alegado"></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&tipoCliente=<?php echo $_GET['tipoCliente']; ?>&CRUD=save');" alt="Salvar" src="images/salvar.gif" /></a>
          </div>
          </div>
      </form>
      <br>
      <div class="tipo_dados" style="text-align:center;">Histórico de Chamados</div>
      <hr>
      <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>ID</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Patrimônio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nº Série</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo de Impressão</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Remover</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php //TabelaImpressorasLocacao(); ?>
               </tbody>
             </table>
       </div>
       <hr>
       <br>
     <?php
         }
}else{ 
          ?>              
       <hr>
       <br>
       <?php
}
?>

</div>
<br>
<?php
     include("_templates/_templateRodape.php");
?>



