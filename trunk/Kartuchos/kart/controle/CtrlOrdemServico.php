<?php
  require_once('../modelo/OrdemServicoDAO.php');

  function TabelaHistoricoColetas(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getColetasCliente($_GET['idCliente']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

              echo '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
                     <td>'.$item["tipo"].'</td>
                     <td>'.$item["dataColeta"].'</td>
                     <td>'.$item["codigoBarras"].'</td>
                     <td>'.$item["descricao"].'</td>
                     <td>'.$item["defeitoRelatado"].'</td>
                     <td>'.$item["servicoExecutado"].'</td>
                     <td>'.$item["nomeStatus"].'</td>
					</tr>';


             }
            }
  }
  
  function TabelaHistoricoServicos(){
      $dao = new OrdemServicoDAO();
      $lista = $dao-> getServicosCliente($_GET['idCliente']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

              echo '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
							<td>'.$item["tipo"].'</td>
							<td>'.$item["data"].'</td>
							<td>'.$item["descricao"].'</td>
							<td>'.$item["preco"].'</td>
							<td>'.$item["qde"].'</td>
							<td>'.$item["nomeStatus"].'</td>
					</tr>';


             }
            }
  }
  

  function CRUDOrdemServico(){

               $dao = new OrdemServicoDAO();


               if($_GET['CRUD'] == "saveColeta")
               {
                 $idOrdemServico = $dao -> inserirOrdemServico(1, $_GET['idCliente'], $_SESSION['cod'], null, null,1,1, null, null, null,
                                                               $_POST['observacoes'], null,null, null);

                 for($i=1;$i<=$_GET['cont'];$i++)
                  $dao -> inserirItemColeta($idOrdemServico, $_POST["item$i"], $_SESSION['cod'],1, $_POST["defeito$i"]);
                 echo '<span class="msg_crud">Inserido com sucesso!</span>';

               }else if($_GET['CRUD'] == "savePedido"){

                 $dataVencimento = split("/",$_POST["dataVencimento"]);
	             $dataVencimento = $dataVencimento["2"]."-".$dataVencimento["1"]."-".$dataVencimento["0"];
                 $idOrdemServico = $dao -> inserirOrdemServico(4, $_GET['idCliente'], $_SESSION['cod'], null, null,1,null, null, null, null,
                                                               $_POST['observacoes'], $_POST['formaPagamento'],$dataVencimento, null);

                 for($i=1;$i<=$_GET['cont'];$i++)
                 {
                  $idMaterial = $_POST["material$i"];
                  $qde = $_POST["qde$i"];
                  $preco = $_POST["preco$i"];
                  $usuario = $_SESSION['cod'];
                  $dataRetirada = null;
                  $idStatus = 4;

                  $dao -> inserirMaterialOrdemServico($idMaterial,$idOrdemServico,$qde,$preco,$usuario,$dataRetirada,$idStatus);
                 }
                 echo '<span class="msg_crud">Inserido com sucesso!</span>';

               }else if($_GET['CRUD'] == "delete") {
                     deleteFuncionario($_GET['idServico']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }
  
?>
             

