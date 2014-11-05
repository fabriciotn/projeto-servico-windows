<?php
  require_once('../modelo/OrdemServicoDAO.php');
  require_once('../modelo/ExpedicaoDAO.php');

  function obtemDadosExpedicao($idOrdemServico){
      $dao = new ExpedicaoDAO();
      return $dados = $dao-> getOrdemServicoExpedicao($idOrdemServico);
  }
  
  function TabelaItensExpedicao(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getItensOS($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      if($lista)
            {
             $i=0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             echo '<tr '.$bgColor.'>
                       <td align="center">'.$i.'</td>
                       <td align="center">'.$item["idOrdemServico"].'</td>
                       <td align="center">'.$item["codigoBarras"].'</td>
                       <td align="center">'.$item["descricao"].'</td>
                       <td align="center">'.$item["servicoExecutado"].'</td>
                       <td align="center">'.$item["qdeRecargas"].'</td>
                       <td align="center">'.$item["dataProducao"].'</td>
                       <td align="center">'.$item["nomeStatus"].'</td>
                   </tr>';


             }
            }

  }
  
  function TabelaParcelasExpedicao(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getParcelasOS($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      if($lista)
            {
             $i=0;
             $valorTotal = 0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $valorTotal += $item["valorBase"];
             echo '<tr '.$bgColor.'>
                       <td align="center">'.$i.'</td>
                       <td align="center">'.$item["descricao"].'</td>
                       <td align="center">'.number_format($item["valorBase"], 2, ',', '.').'</td>
                       <td align="center">'.$item["dataPrevistaPagamento"].'</td>
                       <td align="center">'.$item["dataPagamento"].'</td>
                       <td align="center">'.$item["notaFiscal"].'</td>
                       <td align="center">'.$item["nomeSituacaoParcela"].'</td>
                   </tr>';


             }
             echo '<tr '.$bgColor.'>
                      <td colspan="2" align="right"><strong>Valor Total: </strong></td>
                      <td align="center">'.number_format($valorTotal, 2, ',', '.').'</td>
                      <td colspan="5"></td>
                   </tr>';
            }

  }
  
  function TabelaMateriaisExpedicao(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getMateriaisOS($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      if($lista)
            {
             $valorTotal = 0;
             $i=0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             echo '<tr style="border-bottom: 1px dashed black;">
                       <td><div class="form-rotulo">Código: </td>
                       <td width="30px"><div> '.$item["idMaterial"].'</div></td>
                       <td><div class="form-rotulo">Material: </td>
                       <td width="300px"><div>'.$item["descricao"].'</div></td>
                       <td><div class="form-rotulo">Qde: </td>
                       <td width="50px"><div>'.$item["qde"].'</div></td>
                       <td><div class="form-rotulo">Valor Unit.: </td>
                       <td width="50px"><div>'.number_format($item["preco"], 2, ',', '.').'</div></td>
                       <td><div class="form-rotulo">Sub-Total: </td>
                       <td width="50px"><div>'.number_format(($item["qde"]*$item["preco"]), 2, ',', '.').'</div></td>
                       <td><div class="form-rotulo">Cód. Barras: </td>
                       <td width="100px">
                           <div class="form-campos">
                              <input style="width:80px;" maxlength="80" type="text" id="codigoBarras'.$i.'"
                           name="codigoBarras'.$i.'"
                           value="'.$item["codigoBarras"].'"/>
                           <input type="hidden" name="idMaterialOrdemServico'.$i.'" id="idMaterialOrdemServico'.$i.'" value="'.$item["idMaterialOrdemServico"].'"/>
                           </div>
                       </td>
                   </tr>';
              $valorTotal += ($item["qde"]*$item["preco"]);
             }
             echo '<tr>
                       <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                       <td><div class="form-rotulo">Valor Total: </td>
                       <td><div style="color: red; font-size: 18px;font-weight: bold;">'.number_format($valorTotal, 2, ',', '.').'</div></td></tr>';
             echo '<input type="hidden" name="contCodBarras" id="contCodBarras" value="'.$i.'"/>';
            return $valorTotal;
            }

  }
  
  function TabelaServicosExpedicao(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getServicosOS($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      if($lista)
            {
             $valorTotal = 0;
             $i=0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             echo '<tr style="border-bottom: 1px dashed black;">
                       <td><div class="form-rotulo">Código: </td>
                       <td><div> '.$item["idServico"].'</div></td>
                       <td><div class="form-rotulo">Serviço: </td>
                       <td><div>'.$item["nome"].'</div></td>
                       <td><div class="form-rotulo">Qde: </td>
                       <td><div>'.$item["qde"].'</div></td>
                       <td><div class="form-rotulo">Valor Unit.: </td>
                       <td><div>'.number_format($item["preco"], 2, ',', '.').'</div></td>
                       <td><div class="form-rotulo">Sub-Total: </td>
                       <td><div>'.number_format(($item["qde"]*$item["preco"]), 2, ',', '.').'</div></td>
                   </tr>';
              $valorTotal += ($item["qde"]*$item["preco"]);
             }
             echo '<tr>
                       <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                       <td><div class="form-rotulo">Valor Total: </td>
                       <td><div style="color: red; font-size: 18px;font-weight: bold;">'.number_format($valorTotal, 2, ',', '.').'</div></td></tr>';
            return $valorTotal;
            }

  }

  function CRUDExpedicao(){

               $dao = new OrdemServicoDAO();

               if($_GET['CRUD'] == "saveExpedicao")
               {
                 $flgCodBarras = true;
                 for($i=1;$i<=$_POST['contCodBarras'];$i++)
                 {
                  $codigoBarras = $_POST["codigoBarras$i"];
	              $idMaterialOrdemServico = $_POST["idMaterialOrdemServico$i"];

                  if($codigoBarras)
                        $dao -> atualizarCodigoBarras($idMaterialOrdemServico,$codigoBarras);
                  else
                    $flgCodBarras = false;
                 }

                 if($flgCodBarras || $_GET["tipoVenda"])
                 {
                  $idOrdemServico = $_GET['idOrdemServico'];
                  $motoboyEntrega = $_POST["motoboyEntrega"];
	              $status = $_POST["status"];
                  $dao -> atualizarExpedicao($idOrdemServico,$motoboyEntrega,$status);
                  echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                 }else{
                       echo '<span class="msg_crud_erro">É necessário preencher todos os códigos de barras!</span>';
                      }
                 
                }else if($_GET['CRUD'] == "voltaStatusFaturamento"){

                 $idOrdemServico = $_GET['id'];

                 $dao = new ExpedicaoDAO();
                 $dao -> voltaStatusFaturamento($idOrdemServico);

                 echo '<span class="msg_crud">Status atualizado com sucesso!</span>';
                 ?><script>
                           alert("Status atualizado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Faturamento";
                   </script>
                 <?php
               }
               $_GET['CRUD']= null;

          }
  
?>
             

