<?php
     session_start();
     //limpa sessão
     $_SESSION['cod']=NULL;
     $_SESSION['user']=NULL;
     session_destroy(); // destruo a sess�o
     ?>
         <script charset="utf-8">
           //alert ("Desconectado com sucesso !");
           location.href="../visao/index.php";
         </script>
