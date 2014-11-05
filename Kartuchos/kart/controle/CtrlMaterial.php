<?php
  require_once('../modelo/MaterialDAO.php');

  function TabelaMateriais(){
      $dao = new MaterialDAO();
      $lista = $dao-> getMateriais($_POST['idMaterial'],$_POST['material']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idMaterial = $item["idMaterial"];
                 $descricao = $item["descricao"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             
                 echo '<tr '.$bgColor.'>
                           <td>'.$idMaterial.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idMaterial='.$idMaterial.'\')"
                                                                            src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idMaterial='.$idMaterial.'\')" href="#">'.$descricao.'</a></td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=entradaMaterial&idMaterial='.$idMaterial.'\')"
                                                                            src="images/icons/setaEntrada.jpg" alt="Editar"/></td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=saidaMaterial&idMaterial='.$idMaterial.'\')"
                                                                            src="images/icons/setaSaida.jpg" alt="Editar"/></td>
                   </tr>';


             }
            }
  }
  
  function TabelaHistoricoMateriais(){
      $dao = new MaterialDAO();
      $lista = $dao-> getMateriaisCliente($_GET['idCliente']);

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
  
  function TabelaEntradasMaterial($idMaterial){
      $dao = new MaterialDAO();
      $lista = $dao-> getEntradasMaterial($idMaterial);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
             
                 $idEntradaMaterial = $item["idEntradaMaterial"];
                 $descricao = $item["descricao"];
                 $nomeFantasia = $item["nomeFantasia"];
                 $dataEntrada = $item["dataEntrada"];
                 $qdeComprada = $item["qdeComprada"];
                 $valorUnitarioPago = $item["valorUnitarioPago"];
                 $notaFiscalEntrada = $item["notaFiscalEntrada"];
                 
                 $valorTotal = $qdeComprada * $valorUnitarioPago;
                 

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td align="center">
                             <img
                             onClick="Envia(\''.$PHP_SELF.'?acao=entradaMaterial&idMaterial='.$idMaterial.'&idEntradaMaterial='.$idEntradaMaterial.'\')"
                                  src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td align="center">
                             <img
                             onClick="confirmacao(\'Deseja realmente excluir?\',\''.$PHP_SELF.'?acao=entradaMaterial&idMaterial='.$idMaterial.'&idEntradaMaterial='.$idEntradaMaterial.'&CRUD=deleteEntradaMaterial\')"
                                  src="images/icons/excluir.png" alt="Editar"/></td>
                           <td>'.$descricao.'</td>
                           <td>'.$nomeFantasia.'</td>
                           <td>'.$dataEntrada.'</td>
                           <td>'.$qdeComprada.'</td>
                           <td>'.$valorUnitarioPago.'</td>
                           <td>'.$valorTotal.'</td>
                           <td>'.$notaFiscalEntrada.'</td>
                           
                   </tr>';


             }
            }
  }
  
  function TabelaSaidasMaterial($idMaterial){
      $dao = new MaterialDAO();
      $lista = $dao-> getSaidasMaterial($idMaterial);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){

                 $idSaidaMaterial = $idMaterialOrdemServico = $item["idMaterialOrdemServico"];
                 $descricao = $item["descricao"];
                 $idOrdemServico = $item["idOrdemServico"];
                 $qde = $item["qde"];
                 $preco = $item["preco"];
                 $dataRetirada = $item["dataRetirada"];

                 $valorTotal = $qde * $preco;


                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$descricao.'</td>
                           <td>'.$idOrdemServico.'</td>
                           <td>'.$dataRetirada.'</td>
                           <td>'.$qde.'</td>
                           <td>'.$preco.'</td>
                           <td>'.$valorTotal.'</td>

                   </tr>';


             }
            }
  }
  
  function obtemMaterial($idMaterial){
      $dao = new MaterialDAO();
      return $dados = $dao-> getMaterial($idMaterial);

  }
  
  function obtemEntradaMaterial($idEntradaMaterial){
      $dao = new MaterialDAO();
      return $dados = $dao-> getEntradaMaterial($idEntradaMaterial);

  }
  
  function CRUDMaterial(){

               $dao = new MaterialDAO();
               if($_GET['CRUD'] == "save")
               {

                $descricao = $_POST['descricao'];
                $qdeMinima = $_POST['qdeMinima'];
                $precoVenda = $_POST['precoVenda'];
                $precoRevenda = $_POST['precoRevenda'];
                $lucro = $_POST['lucro'];
                $lucro_minimo = $_POST['lucro_minimo'];
                $situacao = $_POST['situacao'];
                $flgConsumo = $_POST['flgConsumo'];
                $descricaoDetalhada = $_POST['descricaoDetalhada'];

                if($_GET['idMaterial']){
                    $dao -> atualizarMaterial($_GET['idMaterial'],$descricao,$qdeMinima,$precoVenda,$precoRevenda,$lucro,$lucro_minimo,$situacao,$flgConsumo,$descricaoDetalhada);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }else{
                      $_GET['idMaterial'] =$dao -> inserirMaterial($descricao,$qdeMinima,$precoVenda,$precoRevenda,$lucro,$lucro_minimo,$situacao,$flgConsumo,$descricaoDetalhada);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
               }
               else if($_GET['CRUD'] == "saveEntradaMaterial")
               {
                $fornecedor = $_POST['fornecedor'];
                $qdeComprada = $_POST['qdeComprada'];
                $valorUnitarioPago = $_POST['valorUnitarioPago'];
                $notaFiscalEntrada = $_POST['notaFiscalEntrada'];

                if($_GET['idEntradaMaterial']){
                    $dao -> atualizarEntradaMaterial($_GET['idEntradaMaterial'],$_GET['idMaterial'],$fornecedor,$qdeComprada,$valorUnitarioPago,$notaFiscalEntrada);
                    echo '<span class="msg_crud">Entrada atualizada com sucesso!</span>';
                }else{
                      $dao -> inserirEntradaMaterial($_GET['idMaterial'],$fornecedor,$qdeComprada,$valorUnitarioPago,$notaFiscalEntrada);
                      $_GET['acao'] = "entradaMaterial";
                      echo '<span class="msg_crud">Entrada inserida com sucesso!</span>';
                     }
               }
               else if($_GET['CRUD'] == "saveSaidaMaterial")
               {
                $qde = $_POST['qdeBaixa'];

                $dao -> inserirSaidaMaterial($_GET['idMaterial'],0,$qde,0,$_SESSION["cod"]);
                $_GET['acao'] = "saidaMaterial";
                echo '<span class="msg_crud">Saída inserida com sucesso!</span>';
               }
               else if($_GET['CRUD'] == "delete")
               {
                     $dao -> deleteMaterial($_GET['idMaterial']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
               }
               else if($_GET['CRUD'] == "deleteEntradaMaterial")
               {
                     $dao -> removerEntradaMaterial($_GET['idEntradaMaterial']);
                     $_GET['acao'] = "entradaMaterial";
                     $_GET['idEntradaMaterial'] = null;
                     echo '<span class="msg_crud">Entrada removida com sucesso!</span>';
               }
               $_GET['CRUD']= null;

          }
    function comboMaterial(){
      $dao = new MaterialDAO();
      $lista = $dao-> getMateriais("","");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $saldoEstoque =  $item["qdeComprada"] - $item["qdeUtilizada"];
                 //if($saldoEstoque > 0)
                 if(!$saldoEstoque)
                     $coloreVermelho = ' class="optionzerado" ';
                 else
                     $coloreVermelho = null ;
                   echo '<option '.$coloreVermelho.' value="'.$item["idMaterial"].'"> ['.$item["idMaterial"].'] '.$item["descricao"].' - Saldo: '.$saldoEstoque.'</option>';
             }
            }
  }

  function comboMaterialNovoPedido(){
      $dao = new MaterialDAO();
      $lista = $dao-> getMateriais("","");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $saldoEstoque =  $item["qdeComprada"] - $item["qdeUtilizada"];
                 //if($saldoEstoque > 0)
                 if(!$saldoEstoque)
                     $coloreVermelho = ' class="optionzerado" ';
                 else
                     $coloreVermelho = null ;
                   echo '<option '.$coloreVermelho.' value="'.$item["idMaterial"].'-'.$saldoEstoque.'-'.$item["lucro"].'-'.$item["lucro_minimo"].'"> ['.$item["idMaterial"].'] '.$item["descricao"].' - Saldo: '.$saldoEstoque.'</option>';
             }
            }
  }

  
?>
             

