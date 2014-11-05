<?php
  require_once('../modelo/ParcelaDAO.php');
  require_once('../modelo/OrdemServicoDAO.php');
  
  function TabelaParcelasPagas(){
      $dao = new ParcelaDAO();

      if($_POST["dataInicio"] != ""){
      $dataInicio = split("/",$_POST["dataInicio"]);
      $dataInicio = $dataInicio["2"]."-".$dataInicio["1"]."-".$dataInicio["0"];
      }else{
        	$dataInicio = date("Y-m-d");
           }
      if($_POST["dataTermino"] != ""){
      $dataTermino = split("/",$_POST["dataTermino"]);
      $dataTermino = $dataTermino["2"]."-".$dataTermino["1"]."-".$dataTermino["0"];
      }else{
        	$dataTermino = date("Y-m-d");
           }

      $contaBancaria = $_POST["SContaBancaria"];
      $cliente = $_POST["SCliente"];

      $lista = $dao-> getParcelasPagas($dataInicio,$dataTermino,$cliente);

      if($lista)
            {
             $i=0;
             $valorTotal = 0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
              echo '<tr '.$bgColor.'>
			  	     <td align="center">'.$i.'</td>
                     <td align="center">'.$item["nome"].'</td>
                     <td align="center">'.$item["descricao"].'</td>
                     <td align="center">'.$item["valorBase"].'</td>
                     <td align="center">'.$item["dataPrevistaPagamento"].'</td>
                     <td align="center">'.$item["dataPagamento"].'</td>
                     <td align="center">'.$item["notaFiscal"].'</td>
                     <td align="center">'.$item["nomeSituacaoParcela"].'</td>
                    </tr>';
              $valorTotal += $item["valorBase"];

             }
             echo '<tr '.$bgColor.'>
                       <td></td><td></td>
                       <td align="right"><strong>Valor Total:</strong></td>
                       <td align="center"><strong>'.number_format($valorTotal, 2, ',', '.').'</strong></td>
                   </tr>';
            }
  }
  

 ?>


