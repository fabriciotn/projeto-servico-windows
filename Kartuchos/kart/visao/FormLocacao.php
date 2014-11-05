<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlLocacao.php");
?>
<script>
      function refreshPagina(id,tipo){
         location.href="formLocacao.php?idCliente="+id+"&tipoCliente="+tipo;
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
        $('#calendarioDataAfericao').click(function(){
		$(this).calendario({
			target:'#data_afericao',
			top:-150,
			left:0
		});
	});
        $('#calendarioDataFinalContrato').click(function(){
		$(this).calendario({
			target:'#data_final_contrato',
			top:-150,
			left:0
		});
	});
});
</script>
</div></div></div>
<?php
     if($_GET['CRUD'])
        CRUDLocacao();
?>
<div id="sgi-conteudo">
       <div id="sgi-texto">
<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
<div class="tipo_dados" style="text-align:center;">Cadastrar Locação</div>
<hr>
<div id="cliente" style="width: 100%;">
   Código do Cliente:
   <input type="text" value="<?php echo $_GET['idCliente'];?>" id="codCliente" />
   <input type="button" class="botao"  value="  ...  " onclick="abrir('dadosCliente.php');" />
   <?php
        if($_GET['idCliente'])
         {
          $dadosLocacao = obtemLocacao($_GET['idCliente']);
          if($dadosLocacao)
            $_GET['idLocacao'] = $dadosLocacao['idLocacao'];
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
          ?>
          <br><div class="tipo_dados" style="text-align:center;">Dados da Locação</div>
          <hr>
          <table>
                   <?php
                     if($_GET['idLocacao'])
                     {
                   ?>
                        <tr>
                           <td colspan="10">
                            <div class="form-rotulo">ID: <?php echo $_GET['idLocacao'];?></div>
                        </td>
                        <td colspan="10">
                            <div class="form-rotulo">(Atualizar Locação)</div>
                        </td>
                       </tr>
                    <?php

                      }else{
                            ?>
                            <tr>
                            <td colspan="10">
                                <div class="form-rotulo">(Nova Locação)</div>
                            </td>
                            </tr>
                            <?php
                            }
                     ?>
                         <tr> 
                             <td colspan="2">
                             <div class="form-rotulo">Data Início do Contrato:</div>
		                   <div class="form-campos">
                               <input style="width:90px;" maxlength="100" type="text" name="data" id="data"
                               value="<?php if($dadosLocacao["data"])echo $dadosLocacao["data"]; else echo date("d/m/Y"); ?>" />
                               <img class="alinhaImg" id="calendarioData" src="images/icons/calendario.png" />
                           </div>
                             </td>
                             <td colspan="2">
                             <div class="form-rotulo">Data Aferição:</div>
		                   <div class="form-campos">
                               <input style="width:90px;" maxlength="100" type="text" name="data_afericao" id="data_afericao" value="<?php if($dadosLocacao['data_afericao']) echo $dadosLocacao['data_afericao']."/".date('m/Y');?>"/>
                           </div>
                             </td>
                             <td colspan="2">
                             <div class="form-rotulo">Data Final do Contrato:</div>
		                   <div class="form-campos">
                               <input style="width:90px;" maxlength="100" type="text" name="data_final_contrato" id="data_final_contrato"
                               value="<?php if($dadosLocacao["data_final_contrato"])echo $dadosLocacao["data_final_contrato"]; else echo date("d/m/Y"); ?>" />
                               <img class="alinhaImg" id="calendarioDataFinalContrato" src="images/icons/calendario.png" />
                           </div>
                             </td>
                             <td colspan="2">
                             <div class="form-rotulo">Empresa:</div>
		                   <div class="form-campos">
                              <select name="empresa" id="empresa">
                              <option value="<?php echo $dadosLocacao['empresa'];?>" selected="selected"><?php echo $dadosLocacao['empresa'];?></option>
                              <option value="KSC">KSC</option>
                              <option value="KASF">KASF</option>
                              <option value="CSK">CSK</option>
                             </select>
                           </div>
                             </td>
                      </tr>       
                         <tr>                           
                           <td colspan="2">
                            <div class="form-rotulo">Franquia Compartilhada Preta:</div>
    		                <div class="form-campos">
                               <input style="width:150px;" maxlength="100" type="text" name="franquia_compartilhada" id="franquia_compartilhada" value="<?php echo $dadosLocacao['franquia_compartilhada'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Franquia Impressão Colorida:</div>
    		                <div class="form-campos">
                               <input style="width:150px;" maxlength="100" type="text" name="franquia_colorida" id="franquia_colorida" value="<?php echo $dadosLocacao['franquia_colorida'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Franquia:</div>
    		                <div class="form-campos">
                                <input style="width:150px;" maxlength="100" type="text" name="valor" id="valor" value="<?php echo $dadosLocacao['valor'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Cópia Excedente Preta:</div>
    		                <div class="form-campos">
                               <input style="width:150px;" maxlength="100" type="text" name="valor_copia_excedente" id="valor_copia_excedente" value="<?php echo $dadosLocacao['valor_copia_excedente'];?>"/>
                            </div>
                           </td>
                      </tr>
                      <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Digitalização Excedente:</div>
    		                <div class="form-campos">
                               <input style="width:150px;" maxlength="100" type="text" name="valor_digit_excedente" id="valor_digit_excedente" value="<?php echo $dadosLocacao['valor_digit_excedente'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Cópia Colorida:</div>
    		                <div class="form-campos">
                              <input style="width:150px;" maxlength="100" type="text" name="valor_colorida" id="valor_colorida" value="<?php echo $dadosLocacao['valor_colorida'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Bônus:</div>
    		                <div class="form-campos">
    		                        <input style="width:150px;" maxlength="100" type="text" name="bonus" id="bonus" value="<?php echo $dadosLocacao['bonus'];?>"/>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Prazo para pagamento em dias:</div>
    		                <div class="form-campos">
    		                        <input style="width:90px;" maxlength="100" type="text" name="prazo_pagamento_dias" id="prazo_pagamento_dias" value="<?php echo $dadosLocacao['prazo_pagamento_dias'];?>"/>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="4">
                            <div class="form-rotulo">E-mail faturamento:</div>
    		                <div class="form-campos">
    		                        <input style="width:350px;" maxlength="100" type="text" name="emailFaturamento" id="emailFaturamento" value="<?php echo $dadosLocacao['emailFaturamento'];?>"/>
                            </div>
                           </td>       
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observação:</div>
		                   <div class="form-campos">
                               <textarea style="width:700px;height:30px;" name="observacoes" id="observacoes"><?php echo $dadosLocacao['observacoes'];?></textarea>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <BR>
          <div class="form-botoes">
          <div class="form-botao-voltar">
        	<a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
          <div class="form-botao-voltar">
            <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idLocacao=<?php echo $_GET['idLocacao']; ?>&idCliente=<?php echo $_GET['idCliente']; ?>&tipoCliente=<?php echo $_GET['tipoCliente']; ?>&CRUD=save');" alt="Voltar" src="images/salvar.gif" /></a>
          </div>
          </div>
      </form>
      <br>
      <input class="botao" type="button" value="  Inserir Impressora  "
          onClick="abrir('dadosImpressora.php?idCliente=<?php echo $_GET['idCliente']; ?>');" />&#160;&#160;&#160;
      <br>
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
               <?php TabelaImpressorasLocacao(); ?>
               </tbody>
             </table>
       </div>
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



