<?php
  require_once('../modelo/ContaBancariaDAO.php');

  function TabelaContaBancarias(){
      $dao = new ContaBancariaDAO();
      $lista = $dao-> getContaBancarias($_POST['ContaBancaria']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idContaBancaria = $item["idContaBancaria"];
                 $nome = $item['nome'];
                 $agencia = $item['agencia'];
                 $conta = $item['conta'];
                 $nomeEmpresa = $item['nomeEmpresa'];
                 $nomeBanco = $item['nomeBanco'];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idContaBancaria.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idContaBancaria='.$idContaBancaria.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idContaBancaria='.$idContaBancaria.'\')" href="#">'.$nome.'</a></td>
                           <td>'.$agencia.'</td>
                           <td>'.$conta.'</td>
                           <td>'.$nomeEmpresa.'</td>
                           <td>'.$nomeBanco.'</td>
                   </tr>';


             }
            }
  }

  function obtemContaBancaria($idContaBancaria){
      $dao = new ContaBancariaDAO();
      return $dados = $dao-> getContaBancaria($idContaBancaria);
  }

  function CRUDContaBancaria(){

               $dao = new ContaBancariaDAO();

               $nome = $_POST['nome'];
               $agencia = $_POST['agencia'];
               $conta = $_POST['conta'];
               $empresa = $_POST['empresa'];
               $banco = $_POST['banco'];
               $observacoes = $_POST['observacoes'];
               $idSituacao = $_POST['idSituacao'];
               


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idContaBancaria']){
                    $dao -> atualizarContaBancaria($_GET['idContaBancaria'],$nome,$conta,$agencia,$observacoes,$idSituacao,$banco,$empresa);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idContaBancaria'] = $dao -> inserirContaBancaria($nome,$conta,$agencia,$observacoes,$idSituacao,$banco,$empresa);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteContaBancaria($_GET['idContaBancaria']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }



  
?>
             

