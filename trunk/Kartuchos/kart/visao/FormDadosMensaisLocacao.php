<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlDadosMensaisLocacao.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlLocacao.php");
?>
<script>
      function refreshPagina(id,tipo){         
         location.href="formDadosMensaisLocacao.php?idCliente="+id+"&tipoCliente="+tipo;
      }
      
      function refreshPaginaMesAno(id,tipo){
         mes = document.getElementById("mes").value;
         ano = document.getElementById("ano").value; 
         location.href="formDadosMensaisLocacao.php?idCliente="+id+"&tipoCliente="+tipo+"&mes="+mes+"&ano="+ano;
      }
      function refreshImpressora(){
               document.location.reload();
      }
      function InsereDadosMensaisLocacao(idLocacao,tipoCliente,idImpressora,flagSubstituir){

        mes = document.getElementById("mes").value;
        ano = document.getElementById("ano").value;
        if(mes && ano)
            abrir("dadosMensaisLocacao.php?idLocacao="+idLocacao+"&tipoCliente="+tipoCliente+"&idImpressora="+idImpressora+"&mes="+mes+"&ano="+ano+"&flagSubstituir="+flagSubstituir);
        else
        alert("Favor preencher o Mês e o Ano correspondente!");
}
</script>
</div></div></div>
<?php
     if($_GET['CRUD'])
        CRUDLocacao();
?>
<div id="sgi-conteudo">
       <div id="sgi-texto">
<form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
<div class="tipo_dados" style="text-align:center;">Cadastrar Dados Mensais da Locação</div>
<hr>
<div id="cliente" style="width: 100%;">
   Código do Cliente:
   <input type="text" value="<?php echo $_GET['idCliente'];?>" id="codCliente" />
   <input type="button" class="botao"  value="  ...  " onclick="abrir('dadosCliente.php?locacao=1');" />
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
                            <div class="form-rotulo">Franquia Compartilhada Preta:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['franquia_compartilhada'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Franquia Impressão Colorida:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['franquia_colorida'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Franquia:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Cópia Excedente Preta:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor_copia_excedente'];?></div>
                           </td>
                      </tr>
                      <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Digitalização Excedente:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor_digit_excedente'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Cópia Colorida:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor_colorida'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Bônus:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['bonus'];?></div>
                           </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observação:</div>
                           <div class="form-campos"><?php echo $dadosLocacao['observacoes'];?></div>
                         </td>
                        </tr>
                     </table>
      <br>
      <table>
      <tr>
          <?php
          $mes = $_GET['mes'];
          $ano = $_GET['ano'];
          if(!$mes) $mes = date("m");
          if(!$ano) $ano = date("Y");
          ?>
            <td colspan='10' width='50'><div class="form-rotulo">Mês:</div>
            <div class="form-campos">
                <select name='mes' class='style15' id='mes' onchange="refreshPaginaMesAno('<?php echo $_GET["idCliente"]; ?>','<?php echo $_GET["tipoCliente"]; ?>');">
                    <option value='<?php echo $mes?>' selected='selected'><?php echo $mes;?></option>
                                <option value='01'>01</option>
                                <option value='02'>02</option>
                                <option value='03'>03</option>
                                <option value='04'>04</option>
                                <option value='05'>05</option>
                                <option value='06'>06</option>
                                <option value='07'>07</option>
                                <option value='08'>08</option>
                                <option value='09'>09</option>
                                <option value='10'>10</option>
                                <option value='11'>11</option>
                                <option value='12'>12</option>
            </select>
            </div>
            </td><td>
            <div class="form-rotulo">Ano:</div>
            <div class="form-campos">
            <select name='ano' class='style15' id='ano' onchange="refreshPagina('<?php echo $_GET["idCliente"]; ?>','<?php echo $_GET["tipoCliente"]; ?>');">
                                <option value='<?php echo $ano;?>' selected='selected'><?php echo $ano;?></option>
                                <option value='2011'>2011</option>
                                <option value='2012'>2012</option>
                                <option value='2013'>2013</option>
                                <option value='2014'>2014</option>
                                <option value='2015'>2015</option>
                                </select>
            </div>
            </td>
		  </tr>
      </table>
      <div class="tipo_dados" style="text-align:center;">Impressora(s) Associada(s)</div>
      <div style="width: 100%;">
             <table class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><br>Substituição</th>
                  <th width="80" height="2" align="center"><br>Id Impressora</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Patrimônio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Setor</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nº Série</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo de Impressão</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Inserir Dados Mensais</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Chamado</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaDadosMensaisImpressorasLocacao(); ?>
               </tbody>
             </table>
       </div>
       <hr>
       <br>
      <div class="tipo_dados" style="text-align:center;">Histórico de Locações</div>
      <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>ID</th>
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>Id Impressora</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Patrimônio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Setor</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Nº Série</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo de Impressão</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Mês / Ano</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total Cópias Absoluto Anterior</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total Cópias Absoluto</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total Cópias Pretas</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total Cópias Coloridas</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total Digitalização</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Valor Total</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Remover</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaHistoricoLocacao(); ?>
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



