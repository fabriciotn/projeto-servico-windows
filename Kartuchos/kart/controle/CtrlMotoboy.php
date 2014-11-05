<?php
  require_once('../modelo/MotoboyDAO.php');

  function TabelaMotoboys(){
      $dao = new MotoboyDAO();
      $lista = $dao-> getMotoboys($_POST['motoboy']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idMotoboy = $item["idMotoboy"];
                 $nome = $item["nome"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idMotoboy.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idMotoboy='.$idMotoboy.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idMotoboy='.$idMotoboy.'\')" href="#">'.$nome.'</a></td>
                   </tr>';


             }
            }
  }

  function obtemMotoboy($idMotoboy){
      $dao = new MotoboyDAO();
      return $dados = $dao-> getMotoboy($idMotoboy);
  }

  function CRUDMotoboy(){

               $dao = new MotoboyDAO();

               $nome = $_POST['nome'];
               $endereco = $_POST['endereco'];
               $telefone = $_POST['telefone'];
               $celular = $_POST['celular'];
               $situacao = $_POST['situacao'];
               $observacoes = $_POST['observacoes'];


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idMotoboy']){
                    $dao -> atualizarMotoboy($_GET['idMotoboy'],$nome,$endereco,$telefone,$celular,$situacao,$observacoes);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idMotoboy'] = $dao -> inserirMotoboy($nome,$endereco,$telefone,$celular,$situacao,$observacoes);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     $dao -> removerMotoboy($_GET['idMotoboy']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                     $_GET['acao']="lista";
                    }

               $_GET['CRUD']= null;

          }
          
  function comboMotoboy(){
      $dao = new MotoboyDAO();
      $lista = $dao-> getMotoboys();

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idMotoboy = $item["idMotoboy"];
                 $nomeMotoboy = $item["nome"];
                 echo '<option value="'.$idMotoboy.'">'.$nomeMotoboy.'</option>';
             }
            }
  }


  
?>
             

