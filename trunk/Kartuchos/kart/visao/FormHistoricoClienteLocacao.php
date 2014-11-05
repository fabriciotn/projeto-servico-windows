<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlDadosMensaisLocacao.php");
     include("../controle/CtrlCliente.php");
     include("../controle/CtrlLocacao.php");
?>
<script>
      function refreshPagina(id,tipo){
         location.href="formHistoricoClienteLocacao.php?idCliente="+id+"&tipoCliente="+tipo;
      }
      function refreshImpressora(){
               document.location.reload();
      }
      function InsereDadosMensaisLocacao(idLocacao,idImpressora,flagSubstituir){

        mes = document.getElementById("mes").value;
        ano = document.getElementById("ano").value;
        if(mes && ano)
            abrir("dadosMensaisLocacao.php?idLocacao="+idLocacao+"&idImpressora="+idImpressora+"&mes="+mes+"&ano="+ano+"&flagSubstituir="+flagSubstituir);
        else
        alert("Favor preencher o M�s e o Ano correspondente!");
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
<div class="tipo_dados" style="text-align:center;">Dados do Cliente</div>
<hr>
<div id="cliente" style="width: 100%;">
   C�digo do Cliente:
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
                            <div class="form-rotulo">Pessoa F�sica</div>
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
                             <div class="form-rotulo">Endere�o Completo:</div>
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
             <table >
                   <tr>
                           <td colspan="10">
                            <div class="form-rotulo">Pessoa Jur�dica</div>
                   </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Nome Fantasia:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['nomeFantasia'];?></div>
                        </td>
                           <td>
                            <div class="form-rotulo">Raz�o Social:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['razaoSocial'];?></div>
                        </td>
                           <td>
                            <div class="form-rotulo">CNPJ:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['cnpj'];?></div>
                        </td>
                       </tr>
                       <tr>
                           <td>
                            <div class="form-rotulo">Inscri��o Estadual:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['inscricaoEstadual'];?></div>
                        </td>
                        <td>
                            <div class="form-rotulo">Respons�vel:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['responsavel'];?></div>
                        </td>
                       </tr>
                       <tr>
                         <td>
                            <div class="form-rotulo">Reten��o ISS:</div>
    		                <div class="form-campos"><?php echo ( $dadosCliente['retencaoISS'] == 1 ? 'Sim' : 'N�o' );?></div>
                         </td>
                         <td>
                             <div class="form-rotulo">Endere�o Completo:</div>
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
                           <div class="form-rotulo">Limite de cr�dito:</div>
    		                <div class="form-campos"><?php echo $dadosCliente['limiteCredito'];?></div>
                         </td>
                        </tr>
                     </table>

            <?php
           }
          ?>
          <br><div class="tipo_dados" style="text-align:center;">Dados da Loca��o</div>
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
                                <div class="form-rotulo">(Nova Loca��o)</div>
                            </td>
                            </tr>
                            <?php
                            }
                     ?>

                         <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Franquia Compartilhada:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['franquia_compartilhada'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Franquia:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da C�pia Excedente:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor_copia_excedente'];?></div>
                           </td>
                      </tr>
                      <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Digitaliza��o Excedente:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor_digit_excedente'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da C�pia Colorida:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['valor_colorida'];?></div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">B�nus:</div>
                            <div class="form-campos"><?php echo $dadosLocacao['bonus'];?></div>
                           </td>
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observa��o:</div>
                           <div class="form-campos"><?php echo $dadosLocacao['observacoes'];?></div>
                         </td>
                        </tr>
                     </table>
      <br>
      <table>
      <tr>
            <td colspan='10' width='50'>
                <div class="form-rotulo">Filtrar:</div>
            </td>
      </tr>
      <tr>
          <td colspan='10' width='50'>                
                <div class="form-rotulo">M�s:</div>
            <div class="form-campos">
            <select name='mes' class='style15' id='mes'>
            <option value='<?php echo date("m");?>' selected='selected'>Selecione o M�s></option>
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
            <select name='ano' class='style15' id='ano'>
                                <option selected='selected'>Selecione o Ano</option>                                
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
       <hr>
       <br>
      <div class="tipo_dados" style="text-align:center;">Hist�rico de Loca��es</div>
      <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>ID</th>
                  <th width="40" height="2" align="center"><input type="text" id="txtColuna3"/><br>Id Impressora</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Patrim�nio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>N� S�rie</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Tipo de Impress�o</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>M�s / Ano</th>
                  <th width="350" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total C�pias Absoluto Anterior</th>
                  <th width="350" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total C�pias Absoluto</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total C�pias</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Total Digitaliza��o</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/><br>Valor Total</th>
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