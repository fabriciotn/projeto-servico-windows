<?php
  require_once('../modelo/OrdemServicoDAO.php');
  require_once('../modelo/AvaliacaoDAO.php');

  function TabelaServicosAvaliacao(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getServicosAvaliacao($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      if($lista)
            {
             $i=0;
             $statusBlock = 0;
             foreach($lista as $item){

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>';
                 if($item["idStatus"] == "3")
					echo '<td align="center"><img onClick="Envia(\''.$PHP_SELF.'?id='.$idOrdemServico.'&idItemColeta='.$item["idItemColeta"].'&CRUD=enviarEntrega\')"
                               src="images/icons/motoboy.jpg" alt="Editar"/></td>';
			     else
			     {
                    echo '<td align="center">NA</td>';
                    $statusBlock = 1;

                 }

                 echo '<td align="center">'.$i.'</td>
                       <td align="center">'.$item["idOrdemServico"].'</td>
                       <td align="center">'.$item["codigoBarras"].'</td>
                       <td align="center">'.$item["descricao"].'</td>
                       <td align="center">'.$item["servicoExecutado"].'</td>
                       <td align="center">'.$item["dataProducao"].'</td>
                       <td align="center">'.$item["nomeStatus"].'</td>                       
                   </tr>';


             }
            }

            return $statusBlock;
  }
  
  
  function TabelaInserirMateriaisAvaliacao(){
      $dao = new AvaliacaoDAO();
      $lista = $dao-> getMateriaisAvaliacao($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      $i=count($lista);
      if($lista)
            {
                         
             foreach($lista as $item){
                
                 echo '<tr><td><div class="form-rotulo">Material:</div>
    		          <div class="form-campos">
                            <select style="width:600px;" name="material'.$i.'" id="material'.$i.'">
                            <option value="'.$item["idMaterial"].'"> ['.$item["idMaterial"].'] '.$item["descricao"].' - Saldo: '.$item["qde"].'</option>';
                            comboMaterial();
                  echo ' </select></div>
                          </td>
                          <td>
                           <div class="form-rotulo">Quantidade '.$i.':</div>
    		           <div class="form-campos">
   		              <input style="width:150px;" maxlength="100" value="'.$item["qde"].'" onChange="somaTotalMaterial()" type="text" name="qdeMaterial'.$i.'" id="qdeMaterial'.$i.'"
                              value=""/>
                           </div>
                          </td>
                          <td><div class="form-rotulo">Preço '.$i.':</div>
    		                <div class="form-campos">
   		                <input style="width:150px;" maxlength="100" value="'.$item["preco"].'" type="text" onChange="somaTotalMaterial()" name="precoMaterial'.$i.'" id="precoMaterial'.$i.'"
                                value=""/>
                                </div>
                         </td>
                      </tr>';
              $i--;                   

             }
            }
      return count($lista);      
  }
  
  function TabelaInserirServicosAvaliacao(){
      $dao = new AvaliacaoDAO();
      $lista = $dao-> getServicosAvaliacao($_GET['idOrdemServico']);
      $idOrdemServico = $_GET['idOrdemServico'];
      $i=count($lista);
      if($lista)
            {
                         
             foreach($lista as $item){

                 echo '<tr><td><div class="form-rotulo">Material:</div>
    		          <div class="form-campos">
                            <select style="width:600px;" name="servico'.$i.'" id="servico'.$i.'">
                            <option value="'.$item["idServico"].'"> ['.$item["idServico"].'] '.$item["nome"].' - Saldo: '.$item["qde"].'</option>';
                            comboServico();
                  echo ' </select></div>
                          </td>
                          <td>
                           <div class="form-rotulo">Quantidade '.$i.':</div>
    		           <div class="form-campos">
   		              <input style="width:150px;" maxlength="100" value="'.$item["qde"].'" onChange="somaTotalServico()" type="text" name="qdeServico'.$i.'" id="qdeServico'.$i.'"
                              value=""/>
                           </div>
                          </td>
                          <td><div class="form-rotulo">Preço '.$i.':</div>
    		                <div class="form-campos">
   		                <input style="width:150px;" maxlength="100" value="'.$item["preco"].'" type="text" onChange="somaTotalServico()" name="precoServico'.$i.'" id="precoServico'.$i.'"
                                value=""/>
                                </div>
                         </td>
                      </tr>';
                    $i--;             

             }
            }
      return count($lista);      
  }
  
  function obtemAvaliacao($idOrdemServico){
      $dao = new AvaliacaoDAO();
      return $dados = $dao-> getAvaliacao($idOrdemServico);
  }

  function CRUDAvaliacao(){

               $dao = new OrdemServicoDAO();

               if($_GET['CRUD'] == "saveAvaliacao")
               {
                 $idOrdemServico = $_GET['idOrdemServico'];
                 $formaPagamento = $_POST['formaPagamento'];
                 $observacoes = $_POST['observacoes'];
                 $dataVencimento = split("/",$_POST["dataVencimento"]);
	         $dataVencimento = $dataVencimento["2"]."-".$dataVencimento["1"]."-".$dataVencimento["0"];

                 $dao -> atualizarOrdemServicoAvaliacao($idOrdemServico,$observacoes,$formaPagamento,$dataVencimento);
                 $dao -> removerMaterialOrdemServico($idOrdemServico);
                 $dao -> removerServicoOrdemServico($idOrdemServico);

                 for($i=1;$i<=$_GET['contMaterial'];$i++)
                 {
                  $idMaterial = $_POST["material$i"];
                  $qdeMaterial = $_POST["qdeMaterial$i"];
                  $precoMaterial = $_POST["precoMaterial$i"];
                  $usuario = $_SESSION['cod'];
                  $dataRetirada = null;
                  $idStatus = 4;

                  $dao -> inserirMaterialOrdemServico($idMaterial,$idOrdemServico,$qdeMaterial,$precoMaterial,$usuario,$dataRetirada,$idStatus);
                 }
                 
                 for($i=1;$i<=$_GET['contServico'];$i++)
                 {
                  $idServico = $_POST["servico$i"];
                  $qdeServico = $_POST["qdeServico$i"];
                  $precoServico = $_POST["precoServico$i"];
                  $usuario = $_SESSION['cod'];
                  $dataRetirada = null;
                  $idStatus = 4;

                  $dao -> inserirServicoOrdemServico($idServico,$idOrdemServico,$qdeServico,$precoServico,$usuario,$dataRetirada,$idStatus);
                 }

                                                      
                 echo '<span class="msg_crud">Atualizado com sucesso!</span>';

               }else if($_GET['CRUD'] == "encerraAvaliacao") {
                     $idOrdemServico = $_GET['idOrdemServico'];
                     $usuario = $_SESSION['cod'];
                     $dao -> encerrarAvaliacao($idOrdemServico,$usuario);
                     echo '<span class="msg_crud">Avaliação encerrada com sucesso!</span>';
                     ?><script>
                           alert("Avaliação encerrada com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Avaliação";
                   </script>
                   <?php

                }else if($_GET['CRUD'] == "enviarEntrega") {
                     $idOrdemServico = $_GET['idOrdemServico'];
                     $idItemColeta = $_GET['idItemColeta'];
                     $usuario = $_SESSION['cod'];
                     $dao -> enviarEntrega($idItemColeta,$usuario);
                     echo '<span class="msg_crud">Item enviado para entrega!</span>';
                
                     
                }else if($_GET['CRUD'] == "voltaStatusProducao"){

                 $idOrdemServico = $_GET['id'];

                 $dao = new AvaliacaoDAO();
                 $dao -> voltaStatusProducao($idOrdemServico);

                 echo '<span class="msg_crud">Status atualizado com sucesso!</span>';
                 ?><script>
                           alert("Status atualizado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Produção";
                   </script>
                 <?php
               }

               $_GET['CRUD']= null;

          }
  
?>
             

