<?php
  require_once('../modelo/BancoDAO.php');

  function TabelaBancos(){
      $dao = new BancoDAO();
      $lista = $dao-> getBancos($_POST['Banco']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idBanco = $item["idBanco"];
                 $nome = $item["nome"];
                 $numero = $item["numero"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idBanco.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idBanco='.$idBanco.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td align="center">'.$numero.'</td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idBanco='.$idBanco.'\')" href="#">'.$nome.'</a></td>
                   </tr>';


             }
            }
  }

  function obtemBanco($idBanco){
      $dao = new BancoDAO();
      return $dados = $dao-> getBanco($idBanco);
  }

  function CRUDBanco(){

               $dao = new BancoDAO();

               $nome = $_POST['nome'];
               $numero = $_POST['numero'];


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idBanco']){
                    $dao -> atualizarBanco($_GET['idBanco'],$nome,$numero);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idBanco'] = $dao -> inserirBanco($nome,$numero);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteBanco($_GET['idBanco']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }

     function comboBanco(){
      $dao = new BancoDAO();
      $lista = $dao-> getBancos("");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idBanco = $item["idBanco"];
                 $nomeBanco = $item["nome"];
                 echo '<option value="'.$idBanco.'">'.$nomeBanco.'</option>';
             }
            }
  }


  
?>
             

