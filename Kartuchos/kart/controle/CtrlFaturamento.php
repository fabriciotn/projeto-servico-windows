<?php
  require_once('../modelo/OrdemServicoDAO.php');
  require_once('../modelo/FaturamentoDAO.php');

  function obtemDadosFaturamento($idOrdemServico){
      $dao = new FaturamentoDAO();
      return $dados = $dao-> getOrdemServicoFaturamento($idOrdemServico);
  }
  
  function TabelaItensFaturamento(){
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
  function TabelaParcelasFaturamento(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getParcelasOS($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      $id = $_GET['id'];
      if($lista)
            {
             $i=0;
             $valorTotal = 0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
                 
             $valorTotal += $item["valorBase"];
             $idParcela = $item["idParcela"];
             echo '<tr '.$bgColor.'>
                       <td align="center">'.$i.'</td>
                       <td align="center">'.$item["descricao"].'</td>
                       <td align="center">'.number_format($item["valorBase"], 2, ',', '.').'</td>
                       <td align="center">'.$item["dataPrevistaPagamento"].'</td>
                       <td align="center">'.$item["dataPagamento"].'</td>
                       <td align="center">'.$item["notaFiscal"].'</td>
                       <td align="center">'.$item["nomeSituacaoParcela"].'</td>
                       <td align="center">
                        <img
                          onClick="confirmacao(\'Deseja realmente remover a parcela '.$idParcela.'?\',\''.$PHP_SELF.'?id='.$id.'&idParcela='.$idParcela.'&CRUD=removerParcela\')"
                        src="images/icons/excluir.png" alt="Editar"/></td>
                   </tr>';


             }
             echo '<tr '.$bgColor.'>
                      <td colspan="2" align="right"><strong>Valor Total: </strong></td>
                      <td align="center">'.number_format($valorTotal, 2, ',', '.').'</td>
                      <td colspan="5"></td>
                   </tr>';
            }
            return $valorTotal;

  }
  function TabelaMateriaisFaturamento(){
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
                       <td width="100px"><div> '.$item["idMaterial"].'</div></td>
                       <td><div class="form-rotulo">Material: </td>
                       <td width="350px"><div>'.$item["descricao"].'</div></td>
                       <td><div class="form-rotulo">Qde: </td>
                       <td width="50px"><div>'.$item["qde"].'</div></td>
                       <td><div class="form-rotulo">Valor Unit.: </td>
                       <td width="100px"><div>'.number_format($item["preco"], 2, ',', '.').'</div></td>
                       <td><div class="form-rotulo">Sub-Total: </td>
                       <td width="100px"><div>'.number_format(($item["qde"]*$item["preco"]), 2, ',', '.').'</div></td>
                   </tr>';
                  $valorTotal += ($item["qde"]*$item["preco"]);
             }
             return $valorTotal;
            }

  }
  
  function TabelaServicosFaturamento(){
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
                       <td width="100px"><div> '.$item["idServico"].'</div></td>
                       <td><div class="form-rotulo">Serviço: </td>
                       <td width="350px"><div>'.$item["nome"].'</div></td>
                       <td><div class="form-rotulo">Qde: </td>
                       <td width="50px"><div>'.$item["qde"].'</div></td>
                       <td><div class="form-rotulo">Valor Unit.: </td>
                       <td width="100px"><div>'.number_format($item["preco"], 2, ',', '.').'</div></td>
                       <td><div class="form-rotulo">Sub-Total: </td>
                       <td width="100px"><div>'.number_format(($item["qde"]*$item["preco"]), 2, ',', '.').'</div></td>
                   </tr>';
              $valorTotal += ($item["qde"]*$item["preco"]);
             }
            return $valorTotal;
            }

  }
  
  function TabelaImprimirParcelasFaturamento(){
      $dao = new FaturamentoDAO();
      $lista = $dao-> getParcelasFaturamento($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      if($lista)
            {
             $valorTotal = 0;
             $i=0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             echo '<tr '.$bgColor.'>
                       <td>'.$i.'</td>
                       <td>'.$item["descricao"].'</td>
                       <td>'.number_format($item["valorBase"], 2, ',', '.').'</td>
                       <td>'.$item["dataPrevistaPagamento"].'</td>
                       <td>'.$item["dataPagamento"].'</td>
                       <td>'.$item["notaFiscal"].'</td>
                       <td>'.$item["nomeSituacaoParcela"].'</td>
                   </tr>';
              $valorTotal += $item["valorBase"];
             }
             echo '<tr>
                       <td></td>
                       <td align="right"><div class="form-rotulo">Valor Total: </td>
                       <td><div style="color: red; font-size: 18px;font-weight: bold;">'.number_format($valorTotal, 2, ',', '.').'</div></td></tr>';
            return $valorTotal;
            }

  }

  function CRUDFaturamento(){

               $dao = new OrdemServicoDAO();

               if($_GET['CRUD'] == "saveFaturamento")
               {
                 $idOrdemServico = $_GET['idOrdemServico'];
                 $idFormaPagamento = $_POST['idFormaPagamento'];
                 $observacoes = $_POST['observacoes'];

                 $dao -> atualizarOrdemServicoFaturamento($idOrdemServico,$observacoes,$idFormaPagamento);
                 //$dao -> removerParcelaOrdemServico($idOrdemServico);

                 for($i=1;$i<=$_GET['cont'];$i++)
                 {
                  $usuario = $_SESSION['cod'];
                  $descricao = $_POST["descricao$i"];
	              $valorBase = $_POST["valorBase$i"];
	              $multa = $_POST["multa$i"];
	              $juros = $_POST["juros$i"];
	              
	              $dataPrevistaPagamento = split("/",$_POST["dataPrevistaPagamento$i"]);
	              $dataPrevistaPagamento = $dataPrevistaPagamento["2"]."-".$dataPrevistaPagamento["1"]."-".$dataPrevistaPagamento["0"];
	              
                  $dataPagamento = split("/",$_POST["dataPagamento$i"]);
	              $dataPagamento = $dataPagamento["2"]."-".$dataPagamento["1"]."-".$dataPagamento["0"];

                  $numBoleto = $_POST["numBoleto$i"];
	              $notaFiscal = $_POST["notaFiscal$i"];
	              $empresa = $_POST["empresa$i"];
	              $idContaBancaria = $_POST["idContaBancaria$i"];
	              $idSituacaoParcela = $_POST["idSituacaoParcela$i"];

                  $dao -> inserirParcelaOrdemServico($idOrdemServico,$usuario,$idFormaPagamento,$descricao,$valorBase,
                                                      $dataPrevistaPagamento,$numBoleto,$notaFiscal,$idSituacaoParcela,
                                                      $observacoes,$idContaBancaria,$empresa);
                 }
                 echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                 
                 if($_GET['flagEncerrar'])
                 {
                  $dao -> encerrarFaturamento($idOrdemServico,$usuario);
                  echo '<span class="msg_crud">Faturamento encerrado com sucesso!</span>';
                  ?>
                    <script>
                           alert("Faturamento encerrado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Faturamento";
                    </script>
                  <?php
                 }
                }else if($_GET['CRUD'] == "removerParcela") {
                     $idOrdemServico = $_GET['idOrdemServico'];
                     $idParcela = $_GET['idParcela'];
                     $dao ->  removerParcela($idParcela);
                     echo '<span class="msg_crud">Parcela removida com sucesso!</span>';                     

                    }else if($_GET['CRUD'] == "excluirPedido") {
                     $idOrdemServico = $_GET['idOrdemServico'];
                     $dao -> excluirPedidoFaturamento($idOrdemServico);
                     echo '<span class="msg_crud">Pedido removido com sucesso!</span>';
                     ?><script>
                           alert("Pedido removido com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Faturamento";
                   </script>
                   <?php
                    }else if($_GET['CRUD'] == "voltaStatusAvaliacao"){

                    $idOrdemServico = $_GET['id'];
                    $dao = new FaturamentoDAO();
                    $dao -> voltaStatusAvaliacao($idOrdemServico);

                    echo '<span class="msg_crud">Status atualizado com sucesso!</span>';
                    ?><script>
                              alert("Status atualizado com sucesso!");
                              location.href="listaSolicitacoes.php?statusSolicitacao=Em Avaliação";
                      </script>
                    <?php
               }

               $_GET['CRUD']= null;

          }
  
?>
             

