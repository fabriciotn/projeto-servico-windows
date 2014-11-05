<?php
  require_once('../modelo/FuncionarioDAO.php');

  function TabelaFuncionarios(){
      $dao = new FuncionarioDAO();
      $lista = $dao-> getFuncionarios($_POST['funcionario']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idFuncionario = $item["idFuncionario"];
                 $nome = $item["nomeFuncionario"];
                 $usuario = $item["usuario"];
                 $nomeLoja = $item["nomeLoja"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             
                 echo '<tr '.$bgColor.'>
                           <td>'.$idFuncionario.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idFuncionario='.$idFuncionario.'\')"
                                                                            src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idFuncionario='.$idFuncionario.'\')" href="#">'.$nome.'</a></td>
                           <td>'.$usuario.'</td>
                           <td>'.$nomeLoja.'</td>
                   </tr>';


             }
            }
  }
  
  function obtemFuncionario($idFuncionario){
      $dao = new FuncionarioDAO();
      return $dados = $dao-> getFuncionario($idFuncionario);
      //echo $nome = $dadosFuncionario['nomeFuncionario'];

  }
  
  function obtemMenu($idFuncionario){
      $dao = new FuncionarioDAO();
      $lista = $dao-> getMenu($idFuncionario);
      if($lista)
            {
             $i=0;
             
             foreach($lista as $item){
                 
                 echo $idItemMenu = $item["iditemmenu"];
                 echo $itemMenu = $item["itemMenu"];
                 $nome = $item["nome"];
                 echo '<li id="mn'.$nome.'"><a href="'.$nome.'.php" title="Módulo de '.$nome.'"></a></li>';
                 
              }
            }
             

  }
  
  function obtemItemMenu($idMenu,$idFuncionario){
      $dao = new FuncionarioDAO();
      $lista = $dao-> getItemMenu($idMenu,$idFuncionario);
      if($lista)
            {
             $i=0;
             
             foreach($lista as $item){
                 
                 echo $idItemMenu = $item["iditemmenu"];
                 $itemMenu = $item["itemMenu"];
                 $nome = $item["nome"];
                 echo '<li id="mn'.$nome.'"><a href="'.$nome.'.php" title="Módulo de '.$nome.'"></a></li>';
              }
            }
             

  }
  
  function obtemPermissoesFuncionario($idFuncionario){
      $dao = new FuncionarioDAO();
      $lista = $dao-> getPermissoesFuncionarios($idFuncionario);
      $menuAnterior = null;
      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idItemMenu = $item["iditemmenu"];
                 $itemMenu = $item["itemMenu"];
                 $menu = $item["menu"];
                 $checkView = "";
                 $checkEdit = "";
                 $privilegio = $item["privilegio"];
                 
                 if($privilegio == 0)
                    $checkView = "checked";
                 else if($privilegio == 1)
                        {
                         $checkView = "checked";
                         $checkEdit = "checked";
                        }


                 if($menu != $menuAnterior)
                 {
                  echo '</table>
                       <br>
                       <table>
                              <tr>
                                  <td colspan="10"><strong>'.$menu.'</strong></td>
                              </tr>';
                  $menuAnterior=$menu;
                 }

                 echo '<tr>
                           <td width="50px"></td>
                           <td width="150px">'.$itemMenu.'</td>
                           <td><input name="permissoesView[]" id="permissoesView" type="checkbox" value="'.$idItemMenu.'" '.$checkView.'/>&nbsp;&nbsp;Visualização</td>
                           <td><input name="permissoesEdit[]" id="permissoesEdit" type="checkbox" value="'.$idItemMenu.'" '.$checkEdit.'/>&nbsp;&nbsp;Alteração</td>
                           <input type="hidden" id="teste" name="teste" value="teste"/>
                   </tr>';


             }
            }
       }
      function CRUDFuncionario(){

               $dao = new FuncionarioDAO();

               $nome = $_POST['nome'];
               $endereco = $_POST['endereco'];
               $bairro = $_POST['bairro'];
               $cidade = $_POST['cidade'];
               $estado = $_POST['estado'];
               $cep = $_POST['cep'];
               $telefone = $_POST['telefone'];
               $celular = $_POST['celular'];
               $email = $_POST['email'];
               $usuario = $_POST['usuario'];
               $senha = $_POST['senha'];
               $senhaAntiga = $_POST['senhaAntiga'];
               $loja = $_POST['loja'];
               $observacoes = $_POST['observacoes'];
               

               if($_GET['CRUD'] == "save")
               {
                if($_GET['idFuncionario']){
                 if($senhaAntiga != $senha)
                    $senha = md5($senha);
                    $dao -> atualizarFuncionario($_GET['idFuncionario'],$nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$usuario,$senha,$loja,$observacoes);


                    $dao -> removerPermissoes($_GET['idFuncionario']);
                    
                    if( isset($_POST['permissoesEdit']) ){
                        for($i = 0; $i<count($_POST["permissoesEdit"]); $i++) {
                    /*foreach($lista as $item)
                    {
                     if(($_POST["View".$item["idItemMenu"]]) OR ($_POST["Edit".$item["idItemMenu"]]))
                     {
                      if(@$_POST["Edit".$item["idItemMenu"]])
                        $privilegio = 1;
                      else
                        $privilegio = null; */
                      $dao -> inserirPermissoes($_GET['idFuncionario'],$_POST["permissoesEdit"][$i],1);
                     }
                    }
                    if( isset($_POST['permissoesView']) ){
                        for($i = 0; $i<count($_POST["permissoesView"]); $i++) {
                      $dao -> inserirPermissoes($_GET['idFuncionario'],$_POST["permissoesView"][$i],null);
                     }
                    }
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
                 //atualizar permissões;
               else{
                      $_POST['idFuncionario'] = $dao -> inserirFuncionario($nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$usuario,$senha,$loja,$observacoes);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">inserido com sucesso!</span>';
                     }
               }else if($_GET['CRUD'] == "delete") {
                     deleteFuncionario($_GET['idFuncionario']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }
    function comboFuncionario(){
      $dao = new FuncionarioDAO();
      $lista = $dao-> getFuncionarios();

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idFuncionario = $item["idFuncionario"];
                 $nomeFuncionario = $item["nomeFuncionario"];
                 echo '<option value="'.$idFuncionario.'">'.$nomeFuncionario.'</option>';
             }
            }
  }


  
?>
             

