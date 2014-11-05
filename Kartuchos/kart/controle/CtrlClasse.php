<?php
  require_once('../modelo/ClasseDAO.php');

  function TabelaClasses(){
      $dao = new ClasseDAO();
      $lista = $dao-> getClasses($_POST['Classe']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idClasse = $item["idClasse"];
                 $descricao = $item["descricao"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idClasse.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idClasse='.$idClasse.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idClasse='.$idClasse.'\')" href="#">'.$descricao.'</a></td>
                   </tr>';


             }
            }
  }

  function obtemClasse($idClasse){
      $dao = new ClasseDAO();
      return $dados = $dao-> getClasse($idClasse);
  }

  function CRUDClasse(){

               $dao = new ClasseDAO();

               $descricao = $_POST['descricao'];
               $numero = $_POST['numero'];
               
               if($_GET['CRUD'] == "save")
               {
                if($_GET['idClasse']){
                    $dao -> atualizarClasse($_GET['idClasse'],$descricao);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idClasse'] = $dao -> inserirClasse($descricao);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteClasse($_GET['idClasse']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }

     function comboClasse(){
      $dao = new ClasseDAO();
      $lista = $dao-> getClasses("");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idClasse = $item["idClasse"];
                 $descricaoClasse = $item["descricao"];
                 echo '<option value="'.$idClasse.'">'.$descricaoClasse.'</option>';
             }
            }
  }


  
?>
             

