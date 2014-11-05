<?php
  require_once('../modelo/FornecedorDAO.php');

  function TabelaFornecedores(){
      $dao = new FornecedorDAO();
      $lista = $dao-> getFornecedores($_POST['fornecedor']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idFornecedor = $item["idFornecedor"];
                 $nomeFantasia = $item["nomeFantasia"];
                 $razaoSocial = $item["razaoSocial"];
                 $cnpj = $item["cnpj"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             
                 echo '<tr '.$bgColor.'>
                           <td>'.$idFornecedor.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idFornecedor='.$idFornecedor.'\')"
                                                                            src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idFornecedor='.$idFornecedor.'\')" href="#">'.$nomeFantasia.'</a></td>
                           <td>'.$razaoSocial.'</td>
                           <td>'.$cnpj.'</td>
                   </tr>';


             }
            }
  }
  
  function obtemFornecedor($idFornecedor){
      $dao = new FornecedorDAO();
      return $dados = $dao-> getFornecedor($idFornecedor);
      //echo $nome = $dadosFuncionario['nomeFuncionario'];

  }
      function CRUDFornecedor(){

               $dao = new FornecedorDAO();

               $nomeFantasia = $_POST['nomeFantasia'];
               $razaoSocial = $_POST['razaoSocial'];
               $cnpj = $_POST['cnpj'];
               $contato = $_POST['contato'];
               $endereco = $_POST['endereco'];
               $bairro = $_POST['bairro'];
               $cidade = $_POST['cidade'];
               $estado = $_POST['estado'];
               $cep = $_POST['cep'];
               $telefone1 = $_POST['telefone1'];
               $telefone2 = $_POST['telefone2'];
               $celular = $_POST['celular'];
               $email1 = $_POST['email1'];
               $email2 = $_POST['email2'];
               $observacoes = $_POST['observacoes'];
               

               if($_GET['CRUD'] == "save")
               {
                if($_GET['idFornecedor']){
                    $dao -> atualizarFornecedor($_GET['idFornecedor'],$nomeFantasia,$razaoSocial,$cnpj,$contato,$endereco,$bairro,
                                                $cidade,$estado,$cep,$telefone1,$telefone2,$celular,$email1,$email2,$observacoes);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idFornecedor'] = $dao -> inserirFornecedor($nomeFantasia,$razaoSocial,$cnpj,$contato,$endereco,$bairro,
                                                $cidade,$estado,$cep,$telefone1,$telefone2,$celular,$email1,$email2,$observacoes);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "delete") {
                     deleteFuncionario($_GET['idFornecedor']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }
          
  function comboFornecedor(){
      $dao = new FornecedorDAO();
      $lista = $dao-> getFornecedores();

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idFornecedor = $item["idFornecedor"];
                 $nomeFantasia = $item["nomeFantasia"];
                 echo '<option value="'.$idFornecedor.'">'.$nomeFantasia.'</option>';
             }
            }
  }


  
?>
             

