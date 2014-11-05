<?php
    require_once('../modelo/FuncionarioDAO.php');
    if(empty($_SESSION['cod']))
     {
      ?>
        <script charset="utf-8">
           alert ("É necessário logar no sistema!");
           location.href="../visao/index.php";
         </script>
      <?php
     }
     
     function verificaAcesso($idItemMenu,$idFuncionario)
     {         
      $dao = new FuncionarioDAO();            
      if(!($dao -> verificaItemMenu($idItemMenu,$idFuncionario)))      
      {
       ?>
         <script charset="utf-8">
            alert ("Você não tem permissão de acesso!");
            window.history.go(-1);
         </script>
       <?php
      }            
     }
     
     function verificaAlteracao($idItemMenu,$idFuncionario)
     {         
      $dao = new FuncionarioDAO();            
      if($dao -> verificaAlteracaoItemMenu($idItemMenu,$idFuncionario))
         return true;
      else
          return false;
     }        
?>
