<?php
     include("_templates/_templateCabecalhoNOlog.php");
if($_SESSION["user"])
    include("principal.php");
else
    include("acessaConta.php");

     include("_templates/_templateRodape.php");
?>


