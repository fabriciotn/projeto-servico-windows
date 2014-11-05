<?php
  require_once('../modelo/ServicoDAO.php');

  function TabelaServicos(){
      $dao = new ServicoDAO();
      $lista = $dao-> getServicos($_POST['idServico'],$_POST['servico']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idServico = $item["idServico"];
                 $nome = $item["nome"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             
                 echo '<tr '.$bgColor.'>
                           <td>'.$idServico.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idServico='.$idServico.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idServico='.$idServico.'\')" href="#">'.$nome.'</a></td>
                   </tr>';


             }
            }
  }

  function obtemServico($idServico){
      $dao = new ServicoDAO();
      return $dados = $dao-> getServico($idServico);
  }

  function CRUDServico(){

               $dao = new ServicoDAO();

               $nome = $_POST['nome'];
               $descricao = $_POST['descricao'];
               $preco = $_POST['preco'];
               $situacao = $_POST['situacao'];
               

               if($_GET['CRUD'] == "save")
               {
                if($_GET['idServico']){
                    $dao -> atualizarServico($_GET['idServico'],$nome,$descricao,$preco,$situacao);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idServico'] = $dao -> inserirServico($nome,$descricao,$preco,$situacao);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteFuncionario($_GET['idServico']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }

   function comboServico(){
      $dao = new ServicoDAO();
      $lista = $dao-> getServicos("","");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                   echo '<option value="'.$item["idServico"].'">'.$item["nome"].'</option>';
             }
            }
  }
  
?>
             

