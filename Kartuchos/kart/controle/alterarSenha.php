<?php
  session_start();
  require_once('../modelo/UsuarioDAO.php');


  if(empty ($_POST['senhaAtual']) || empty ($_POST['senhaNova'])|| empty ($_POST['senhaNovaAgain'])) {
            ?>
                   <script charset="utf-8">
                           alert("Dados obrigatorios nao preenchidos !");
                           window.history.go(-1);
                           //location.href="../views/ExibirAlteraSenhaRH.php";
                   </script>
            <?php
            }

  $cod = $_SESSION['cod'];
  $senhaNova= $_POST['senhaNova'];
  $senhaNovaAgain= $_POST['senhaNovaAgain'];
  
  if($senhaNova == $senhaNovaAgain)
  {

  $dao = new AcessoExternoDAO();
  $senhaAtual= $_POST['senhaAtual'];
  $senhaAtual = md5($senhaAtual);

  $senha = $dao -> getSenha($cod);
                    if($senha == $senhaAtual){
                               $senhaNova = md5($senhaNova);
                               $dao -> atualizarSenha($cod,$senhaNova);
                               ?>
                               <script charset="utf-8">
                                       alert("Senha Atualizada com Sucesso!");
                                       location.href="../visao/index.php";
                               </script>
                               <?php
                               }else{
                                     ?>
                                     <script charset="utf-8">
                                       alert("Senha Atual Incorreta!");
                                       window.history.go(-1);
                                       </script>
                                       <?php
                                      }

   }else {
          ?>
           <script charset="utf-8">
            alert("Senhas novas digitadas não conferem!");
            window.history.go(-1);
           </script>
          <?php
         }
