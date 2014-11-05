<?php
  require_once('../modelo/ParcelaDAO.php');
  require_once('../modelo/OrdemServicoDAO.php');
  
  function TabelaParcelasReceberHoje(){
      $dao = new ParcelaDAO();
      $dataInicio = date("Y-m-d");;
      $dataTermino = date("Y-m-d");;
      $contaBancaria = null;
      $cliente = null;
      $lista = $dao-> getParcelasReceber($dataInicio,$dataTermino,$contaBancaria,$cliente);

      $valorTotal = 0;
      $atrasadas = 0;
      $valorTotalHoje = 0;
      
      if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#8FBC8F'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;         
              $id = $item["idParcela"];
              $valorTotal += $item['valorBase'];
              if($item['dataPrevistaPagamentoS'] == date("Ymd"))
                  $valorTotalHoje += $item['valorBase'];
              else if ($item['dataPrevistaPagamentoS'] < date("Ymd"))
                  $atrasadas += $item['valorBase']; 
              echo '<tr '.$bgColor.'>
                       <td>'.$i.'</td>
                       <td>'.$item['descricao'].'</td>
                       <td align="center">'.$item['dataPrevistaPagamento'].'</td>
                       <td>'.$item['valorBase'].'</td>
                    </tr>';
            }
           }          
     $totais = array("valorTotal" => $valorTotal, "atrasadas" => $atrasadas, "valorTotalHoje" => $valorTotalHoje);
           
     return $totais;

  }

  function TabelaParcelasReceber(){
      $dao = new ParcelaDAO();
      if($_POST["dataInicio"] != ""){
      $dataInicio = split("/",$_POST["dataInicio"]);
      $dataInicio = $dataInicio["2"]."-".$dataInicio["1"]."-".$dataInicio["0"];
      }else{
            $dataInicio = null;
      }
      if($_POST["dataTermino"] != ""){
      $dataTermino = split("/",$_POST["dataTermino"]);
      $dataTermino = $dataTermino["2"]."-".$dataTermino["1"]."-".$dataTermino["0"];
      }else{
          $dataTermino = null;
      }
      
      

      $contaBancaria = $_POST["SContaBancaria"];
      $cliente = $_POST["SCliente"];

      $lista = $dao-> getParcelasReceber($dataInicio,$dataTermino,$contaBancaria,$cliente);
      
      $valorTotal = 0;
      $vencidas = 0;
      $valorTotalHoje = 0;
      
      if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#58a758'" : $bgColor="bgColor='#4eb14e'";
                 $i++;
              $id = $item["idParcela"];
              $valorTotal += $item['valorBase'];
              if($item['dataPrevistaPagamentoS'] == date("Ymd"))
                  $valorTotalHoje += $item['valorBase'];
              else if ($item['dataPrevistaPagamentoS'] < date("Ymd"))
                  $atrasadas += $item['valorBase']; 
              echo "<input type='hidden' name='idParcela$i' id='idParcela$i' value='$id' />";
              
              echo '<tr class="linhaParcelaReceber" style="border-bottom: 1px solid silver" '.$bgColor.'>
		     <td  width="30px" align="center"><input type="button" id="botao'.$i.'" class="botao" value=" + " onclick="Oculta(this,\'detalhes'.$i.'\')" /></td>
                     <td  width="10px" align="center"><div class="form-campos2">'.$i.'</div></td>
                     <td  width="300px" align="center"><div class="form-campos2">
                        <span class="exibeInformacao">'.$item["nomeCliente"].'                        
                    <div id="detalhes'.$i.'" style="display:none;" >
                        
                    <table width="700px"> 
                    <tr '.$bgColor.'>
                        <td colspan="3" align="right"><input type="button" class="botao" value=" FECHAR " onclick="Oculta(botao'.$i.',\'detalhes'.$i.'\')" /></td>
                    </tr>
                    <tr '.$bgColor.'>
                     <td>Conta Bancária</td>
                     <td>Empresa</td>
                     <td>Forma de Pagamento</td>
                    </tr>
                    <tr '.$bgColor.'>
                     <td>
                       <select name="idContaBancaria'.$i.'" id="idContaBancaria'.$i.'">
                        <option value="'.$item["idContaBancaria"].'" selected="selected">'.$item["nomeContaBancaria"].'</option>';
                            comboContaBancaria();
                        echo ' </select>
                     </td>
                     <td>
                       <select name="empresa'.$i.'" id="empresa'.$i.'">
                        <option value="'.$item["empresa"].'" selected="selected">'.$item["nomeEmpresa"].'</option>';
                            comboEmpresa();
                        echo ' </select>
                     </td>
                     <td>
                       <select name="idFormaPagamento'.$i.'" id="idFormaPagamento'.$i.'">
                        <option value="'.$item["idFormaPagamento"].'" selected="selected">'.$item["formaPagamento"].'</option>';
                            comboFormaPagamento();
                        echo '</select>
                     </td>
                    </tr>                        
                    <tr '.$bgColor.'>
                        <td>>Descrição</td>
                        <td>'.$item["descricao"].'</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr '.$bgColor.'>
                        <td>Observação:</td>
                        <td colspan="2">
                          <textarea style="width:700px;height:50px;" name="observacoes'.$i.'" id="observacoes'.$i.'">'.$item['observacoes'].'</textarea>
                        </td>
                    </tr>
                    <tr '.$bgColor.'>
                         <td colspan="3" align="right" >
                            <a href="#"><input type="button" class="botao" value=" SALVAR " onClick="Envia(\''.$PHP_SELF.'?CRUD=updateContasReceber&linha='.$i.'\');" alt="SALVAR"/>
                         </td>    
                    </tr>
                    </table>



                        </div></span>
                    </td>
                     <td width="100px"  align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="valorBase'.$i.'" id="valorBase'.$i.'" value="'.$item["valorBase"].'"/
                        </div>
                     </td>
                     <td  width="120px" align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataPrevistaPagamento'.$i.'" id="dataPrevistaPagamento'.$i.'" value="'.$item["dataPrevistaPagamento"].'"/>
                        </div>
                     </td>
                     <td  width="120px" align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="numBoleto'.$i.'" id="numBoleto'.$i.'" value="'.$item["numBoleto"].'"/>
                        </div>
                     </td>
                     <td  width="120px" align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="notaFiscal'.$i.'" id="notaFiscal'.$i.'" value="'.$item["notaFiscal"].'"/>
                        </div>
                     </td>
                     <td width="20px" ><input type="checkbox" name="cancelarParcela'.$i.'" id="cancelarParcela'.$i.'" value="'.$i.'"></td>
                     <td width="20px" ><input type="checkbox" name="efetuarPagamento'.$i.'" id="efetuarPagamento'.$i.'" value="'.$i.'"></td>
                     <td align="center" width="20px" ><a href="#"><img onClick="Envia(\''.$PHP_SELF.'?CRUD=updateContasReceber&linha='.$i.'\');" alt="Atualizar" src="images/atualizar.gif" /></td>    
		   </tr>';
             }
             echo '<input type="hidden" name="qtdParcelas" id="qtdParcelas" value="'.$i.'" />';
            }            
            $totais = array("qtd" => $i,"valorTotal" => $valorTotal, "atrasadas" => $atrasadas, "valorTotalHoje" => $valorTotalHoje);
           
       return $totais;
  }
  

  function CRUDContasReceber(){

               $dao = new ParcelaDAO();


               if($_GET['CRUD'] == "novaContaReceber"){

                    $idStatus = 6;
                    $idCliente = $_POST["codCliente"];
                    $idUsuarioAbertura = $_SESSION['cod'];
                    $idMotoboyColeta = null;
                    $idMotoboyEntrega = null;
                    $dataCriacao = 1;
                    $dataColeta = null;
                    $dataOrcamento = null;
                    $dataAprovacao = null;
                    $dataEntrega = null;
                    $observacoes = null;
                    $formaPagamento = null;
                    $dataVencimento = null;
                    $tipoVenda = null;

                    $daoOS = new OrdemServicoDAO();
                    $idOrdemServico = $daoOS -> inserirOrdemServico($idStatus, $idCliente, $idUsuarioAbertura, $idMotoboyColeta, $idMotoboyEntrega,
                                                                  $dataCriacao,$dataColeta, $dataOrcamento, $dataAprovacao, $dataEntrega,
                                                                  $observacoes, $formaPagamento,$dataVencimento, $tipoVenda);

                    $idFornecedor = null;
                    $usuario = $_SESSION['cod'];
                	$idFormaPagamento = $_POST["idFormaPagamento"];
                	$descricao = $_POST["descricao"];
                    $valorBase = $_POST["valorBase"];

                	$dataPrevistaPagamento = $_POST["dataPrevistaPagamento"];
                	$dataPP = $dataPrevistaPagamento;
                	if($dataPrevistaPagamento != ""){
                		$array = split("/",$dataPrevistaPagamento);
                		$dataPrevistaPagamento = $array["2"]."-".$array["1"]."-".$array["0"];
                	}
                	else{
                		$dataPrevistaPagamento = NULL;
                	}
                    $numBoleto = $_POST["numBoleto"];
                    $notaFiscal = $_POST["notaFiscal"];
                	$idSituacaoParcela = 1;
                	$observacoes = $_POST["observacoes"];
                    $idContaBancaria = $_POST["idContaBancaria"];
                    $empresa = $_POST["empresa"];
                    $flgReceber = 1;
                    
                    $dao -> inserirParcela($idOrdemServico,$idFornecedor, $usuario, $idFormaPagamento, $dataCriacao, $descricao, $valorBase,
                                               $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $observacoes,
                                               $idContaBancaria,$flgReceber, $empresa, $classe, $subclasse, $flgDespesaFixa);
                 echo '<span class="msg_crud">Inserido nova conta com sucesso!</span>';

               }else if($_GET['CRUD'] == "saveContasReceber"){

                   //echo $_POST["qtdParcelas"]."passou";
                   for($i = 1; $i <= $_POST["qtdParcelas"]; $i++) {
                         $idParcela = $_POST["idParcela$i"];
                  
                         $usuario = $_SESSION['cod'];
                         $flgDespesaFixa = null;
                         if(isset($_POST["cancelarParcela$i"])){
                			$idSituacaoParcela = "3";
                			$dataPagamento = "null";
                                        $dao -> atualizarStatusParcela($idParcela,$dataPagamento,$idSituacaoParcela);
                         }else if(isset($_POST["efetuarPagamento$i"])){
                			$idSituacaoParcela = "2";
                			$dataPagamento = date("Y-m-d");
                                        $dao -> atualizarStatusParcela($idParcela,$dataPagamento,$idSituacaoParcela);
                         }
                        }
                 echo '<span class="msg_crud">Atualizado com sucesso!</span>';

               }else if($_GET['CRUD'] == "updateContasReceber"){

                   //echo $_POST["qtdParcelas"]."passou";
                   $linha = $_GET['linha'];
                   $idParcela = $_POST["idParcela$linha"];
                         $descricao = $_POST["descricao$linha"];
                         $valorBase = $_POST["valorBase$linha"];
                         $idContaBancaria = $_POST["idContaBancaria$linha"];
                         $idFormaPagamento = $_POST["idFormaPagamento$linha"];
                         $dataPrevistaPagamento = $_POST["dataPrevistaPagamento$linha"];
                         $dataPP = $dataPrevistaPagamento;
        	             if($dataPrevistaPagamento != ""){
                                $array = split("/",$dataPrevistaPagamento);
        		                $dataPrevistaPagamento = $array["2"]."-".$array["1"]."-".$array["0"];
                         }
        	             else{
        		              $dataPrevistaPagamento = NULL;
        	                 }
                        $numBoleto = $_POST["numBoleto$linha"];
                        $notaFiscal = $_POST["notaFiscal$linha"];
                        $empresa = $_POST["empresa$linha"];
                        $classe = null;
        	            $subclasse = null;
        	            $observacoes = $_POST["observacoes$linha"];

                            
                        if(isset($_POST["cancelarParcela$linha"])){
                			$idSituacaoParcela = "3";
                			$dataPagamento = "null";
                	}else if(isset($_POST["efetuarPagamento$linha"])){
                			$idSituacaoParcela = "2";
                			$dataPagamento = date("Y-m-d");
                	}else{
                			$idSituacaoParcela = "1";
                			$dataPagamento = "NULL";
                	     }

                        

                        $dao -> atualizarParcela($idParcela,$descricao,$valorBase,$multa,$juros,$idContaBancaria, $idFormaPagamento,
                                                 $empresa,$dataPagamento,$dataPrevistaPagamento,$numBoleto,$notaFiscal,$idSituacaoParcela,$flgPatrimonio,$flgDespesaFixa,
                                                 $observacoes);                        
                        echo '<span class="msg_crud">Parcela '.$idParcela.' atualizada com sucesso!</span>';

               }else if($_GET['CRUD'] == "delete") {
                     deleteFuncionario($_GET['idServico']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }
  
?>
             

