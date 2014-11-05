<?php
  session_start();
  require_once('../modelo/UsuarioDAO.php');


  if(empty ($_POST['login']) || empty ($_POST['senha'])) {
            ?>
                   <script charset="utf-8">
                           alert("Dados obrigatorios nao preenchidos !");
                           location.href="../visao/index.php";
                   </script>
            <?php
            }

  $dao = new UsuarioDAO();
  $login = $_POST['login'];
  $senhaPostada = $_POST['senha'];
  
  $lista = $dao-> verificarLogin ($login,$senhaPostada);
  if($lista)
        {
         foreach($lista as $item){
         $_SESSION["user"] = $item['nome'];
         $_SESSION["login"] = $item['usuario'];
         $_SESSION["cod"] = $item['idFuncionario'];
         
                    ?>
                    <script charset="utf-8">
                                       //alert("Login efetuado com sucesso !");
                                       location.href="../visao/index.php";
                    </script>
                    <?php
             }
          }else{
                   ?>
                    <script charset="utf-8">
                     alert("Usuario ou senha incorretos!");
                     location.href="../visao/index.php";
                    </script>
                   <?php
                  }
             

