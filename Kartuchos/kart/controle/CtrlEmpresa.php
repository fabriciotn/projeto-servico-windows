<?php
  require_once('../modelo/EmpresaDAO.php');

  function TabelaEmpresas(){
      $dao = new EmpresaDAO();
      $lista = $dao-> getEmpresas($_POST['empresa']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idEmpresa = $item["idEmpresa"];
                 $nome = $item["nome"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idEmpresa.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idEmpresa='.$idEmpresa.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idEmpresa='.$idEmpresa.'\')" href="#">'.$nome.'</a></td>
                   </tr>';


             }
            }
  }

  function obtemEmpresa($idEmpresa){
      $dao = new EmpresaDAO();
      return $dados = $dao-> getEmpresa($idEmpresa);
  }

  function CRUDEmpresa(){

               $dao = new EmpresaDAO();

               $nome = $_POST['nome'];
               $endereco = $_POST['endereco'];
               $bairro = $_POST['bairro'];
               $cidade = $_POST['cidade'];
               $estado = $_POST['estado'];
               $cep = $_POST['cep'];
               $telefone = $_POST['telefone'];
               $celular = $_POST['celular'];
               $situacao = $_POST['situacao'];
               $observacoes = $_POST['observacoes'];


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idEmpresa']){
                    $dao -> atualizarEmpresa($_GET['idEmpresa'],$nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$situacao,$observacoes);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idEmpresa'] = $dao -> inserirEmpresa($nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$situacao,$observacoes);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteEmpresa($_GET['idEmpresa']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }
          
  function comboEmpresa(){
      $dao = new EmpresaDAO();
      $lista = $dao-> getEmpresas("");

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idEmpresa = $item["idEmpresa"];
                 $nomeEmpresa = $item["nome"];
                 echo '<option value="'.$idEmpresa.'">'.$nomeEmpresa.'</option>';
             }
            }
  }


  
?>
             

