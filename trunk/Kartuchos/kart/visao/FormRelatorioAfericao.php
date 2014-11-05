<?php session_start();
include("../controle/CtrlParametro.php");?>
<?php include("../controle/CtrlPedido.php");
include("../controle/CtrlCliente.php");
     include("../controle/CtrlLocacao.php");
     include("../controle/CtrlDadosMensaisLocacao.php");
?>
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
            <img style="float:left;width: 130px;" src="../visao/images/logo-kartuchos.png" />
        <div id="sgi-tudo">
        <div id="sgi-corpo">
        <div id="sgi-pagina">
        <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
        <div id="sgi-conteudo">
         <div id="sgi-texto">
             
          <div class="tipo_dados" style="text-align:center;">Relatório de aferição mensal</div>
<hr>
<div id="cliente" style="width: 100%;">
   Código do Cliente:
   <?php echo $_GET['idCliente'];?>
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
                             <div class="form-rotulo">Data Início do Contrato:</div>
		                   <div class="form-campos">
                               <?php echo $dadosLocacao["data"];?>
                           </div>
                             </td>
                             <td colspan="2">
                             <div class="form-rotulo">Data Aferição:</div>
		                   <div class="form-campos">
                               <?php echo $dadosLocacao["data_afericao"];?>
                           </div>
                             </td>
                             <td colspan="2">
                             <div class="form-rotulo">Data Final do Contrato:</div>
		                   <div class="form-campos">
                               <?php echo $dadosLocacao["data_final_contrato"];?>
                           </div>
                             </td>
                      </tr>       
                         <tr>                           
                           <td colspan="2">
                            <div class="form-rotulo">Franquia Compartilhada Preta:</div>
    		                <div class="form-campos">
                               <?php echo $dadosLocacao['franquia_compartilhada'];?>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Franquia Impressão Colorida:</div>
    		                <div class="form-campos">
                               <?php echo $dadosLocacao['franquia_colorida'];?>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Franquia:</div>
    		                <div class="form-campos">
                                <?php echo $dadosLocacao['valor'];?>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Cópia Excedente Preta:</div>
    		                <div class="form-campos">
                               <?php echo $dadosLocacao['valor_copia_excedente'];?>
                            </div>
                           </td>
                      </tr>
                      <tr>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Digitalização Excedente:</div>
    		                <div class="form-campos">
                               <?php echo $dadosLocacao['valor_digit_excedente'];?>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Valor da Cópia Colorida:</div>
    		                <div class="form-campos">
                              <?php echo $dadosLocacao['valor_colorida'];?>
                            </div>
                           </td>
                           <td colspan="2">
                            <div class="form-rotulo">Bônus:</div>
    		                <div class="form-campos">
    		                        <?php echo $dadosLocacao['bonus'];?>
                            </div>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="4">
                            <div class="form-rotulo">E-mail faturamento:</div>
    		                <div class="form-campos">
    		                       <?php echo $dadosLocacao['emailFaturamento'];?>
                            </div>
                           </td>       
                       </tr>
                       <tr>
                         <td colspan="10">
                           <div class="form-rotulo">Observação:</div>
		                   <div class="form-campos">
                               <?php echo $dadosLocacao['observacoes'];?>
                           </div>
                         </td>
                        </tr>
                     </table>
                        <div class="tipo_dados" style="text-align:center;">Histórico de Locações</div>
      <div style="width: 100%;">
             <table id="tabela" class="sortable">
               <thead>
                 <tr class="header-list">
                  <th width="40" height="2" align="center"><br>ID</th>
                  <th width="40" height="2" align="center"><br>Id Impressora</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Marca</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Modelo</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Patrimônio</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Setor</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Nº Série</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Tipo</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><br>Tipo de Impressão</th>
                  <th width="150" style="vertical-align:text-bottom;" align="center"><br>Mês / Ano</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Total Cópias Absoluto Anterior</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Total Cópias Absoluto</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Total Cópias Pretas</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Total Cópias Coloridas</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Total Digitalização</th>
                  <th width="100" style="vertical-align:text-bottom;" align="center"><br>Valor Total</th>
	             </tr>
               </thead>
               <tbody style="border-bottom: 1px solid black">
               <?php TabelaHistoricoLocacaoAfericao(); ?>
               </tbody>
             </table>
       </div>
                        
       <hr>
           <?php
         }
          ?>
          
         </div>
       </div>
      </div>
     </div>
    </div>
   </div>         <!-- end corpo //-->
