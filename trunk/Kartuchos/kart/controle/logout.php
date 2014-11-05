<?php
     session_start();
     //limpa sessÃ£o
     $_SESSION['cod']=NULL;
     $_SESSION['user']=NULL;
     session_destroy(); // destruo a sessão
     ?>
         <script charset="utf-8">
           //alert ("Desconectado com sucesso !");
           location.href="../visao/index.php";
         </script>
