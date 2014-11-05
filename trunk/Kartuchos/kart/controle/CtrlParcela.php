<?php
  require_once('../modelo/ParcelaDAO.php');

  function TabelaHistoricoPagamentos(){
      $dao = new ParcelaDAO();
      $lista = $dao-> getPagamentosCliente($_GET['idCliente']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

              echo '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
                     <td>'.$item["tipo"].'</td>
                     <td>'.$item["idOrdemServico"].'</td>
                     <td>'.$item["descricao"].'</td>
                     <td>'.$item["valorBase"].'</td>
                     <td>'.$item["multa"].'</td>
                     <td>'.$item["juros"].'</td>
                     <td>'.$item["valorTotal"].'</td>
                     <td>'.$item["dataPrevistaPagamento"].'</td>
                     <td>'.$item["dataPagamento"].'</td>
                     <td>'.$item["notaFiscal"].'</td>
                     <td>'.$item["nomeStatus"].'</td>
					</tr>';


             }
            }
  }
?>
             

