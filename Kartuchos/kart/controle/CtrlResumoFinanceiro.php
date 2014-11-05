<?php
  require_once('../modelo/ParcelaDAO.php');

  function TabelaResumoFinanceiro(){
      $dao = new ParcelaDAO();

      if(isset($_POST["mesInicio"]))
    	$mesInicio = $_POST["mesInicio"];
    else
    	$mesInicio = date("m");

    if(isset($_POST["anoInicio"]))
    	$anoInicio = $_POST["anoInicio"];
    else
    	$anoInicio = date("Y");

    if(isset($_POST["mesTermino"]))
    	$mesTermino = $_POST["mesTermino"];
    else
    	$mesTermino = date("m");

    if(isset($_POST["anoTermino"]))
    	$anoTermino = $_POST["anoTermino"];
    else
    	$anoTermino = date("Y");

      $numeroMeses = 12;
      $valorTotalReceber = 0;
      $valorTotalRecebido = 0;
      $valorTotalPagar = 0;
      $valorTotalPago = 0;
      
      
      for($i=$anoInicio; $i<$anoTermino+1; $i++){
      if($i == $anoTermino)
            $numeroMeses = $mesTermino;
      $numLinha=0;
      for($j=$mesInicio; $j<$numeroMeses+1; $j++)
      {
       $dados = $dao-> getResumoFinanceiro($i,$j);

       if($dados)
            {

             !($numLinha % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $numLinha++;
              echo '<tr '.$bgColor.'>
			  	     <td align="center">'.$numLinha.'</td>
			  	     <td align="center">'.$j.' / '.$i.'</td>
                     <td align="center">'.$dados["valorPrevistoReceber"].'</td>
                     <td align="center">'.$dados["valorRecebido"].'</td>
                     <td align="center">'.$dados["valorPrevistoPagar"].'</td>
                     <td align="center">'.$dados["valorPago"].'</td>
                    </tr>';

              $valorTotalReceber += $dados["valorPrevistoReceber"];
              $valorTotalRecebido += $dados["valorRecebido"];
              $valorTotalPagar += $dados["valorPrevistoPagar"];
              $valorTotalPago += $dados["valorPago"];

            }
        }
       }
       
       echo '<tr '.$bgColor.'>
                       <td></td>
                       <td align="right"><strong>Valores Totais:</strong></td>
                       <td align="center"><strong>'.number_format($valorTotalReceber, 2, ',', '.').'</strong></td>
                       <td align="center"><strong>'.number_format($valorTotalRecebido, 2, ',', '.').'</strong></td>
                       <td align="center"><strong>'.number_format($valorTotalPagar, 2, ',', '.').'</strong></td>
                       <td align="center"><strong>'.number_format($valorTotalPago, 2, ',', '.').'</strong></td>
                   </tr>';
     }

  

 ?>


