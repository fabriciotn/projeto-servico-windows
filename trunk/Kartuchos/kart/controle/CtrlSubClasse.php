
<?php
  require_once('../modelo/SubClasseDAO.php');

  function TabelaSubClasses(){
      $dao = new SubClasseDAO();
      $lista = $dao-> getSubClasses($_POST['SubClasse']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idSubClasse = $item["idSubClasse"];
                 $descricao = $item["descricao"];
                 $descricaoClasse = $item["descricaoClasse"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idSubClasse.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idSubClasse='.$idSubClasse.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td>'.$descricaoClasse.'</td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idSubClasse='.$idSubClasse.'\')" href="#">'.$descricao.'</a></td>
                   </tr>';


             }
            }
  }

  function obtemSubClasse($idSubClasse){
      $dao = new SubClasseDAO();
      return $dados = $dao-> getSubClasse($idSubClasse);
  }

  function CRUDSubClasse(){

               $dao = new SubClasseDAO();

               $descricao = $_POST['descricao'];
               $idClasse = $_POST['classe'];


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idSubClasse']){
                    $dao -> atualizarSubClasse($_GET['idSubClasse'],$idClasse,$descricao);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
                else{
                      $idSubClasse = $dao -> inserirSubClasse($idClasse,$descricao);
                      $dados = $dao-> getSubClasse($idSubClasse);
                      $_POST['descricaoClasse'] = $dados['descricaoClasse'];
                      echo $_POST['classe'] = $dados['idClasse'];
                      $_GET['idSubClasse'] = null;
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteSubClasse($_GET['idSubClasse']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }

     function comboSubClasse(){
      $dao = new SubClasseDAO();
      $lista = $dao-> getSubClasses("");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idSubClasse = $item["idSubClasse"];
                 $descricaoSubClasse = $item["descricao"];
                 echo '<option value="'.$idSubClasse.'">'.$descricaoSubClasse.'</option>';
             }
            }
  }


  
?>
             

