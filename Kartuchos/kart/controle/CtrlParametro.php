<?php
  require_once('../modelo/ParametroDAO.php');

    function comboFormaPagamento(){
      $dao = new ParametroDAO();
      $lista = $dao-> getFormaPagamento();

      if($lista)
             foreach($lista as $item)
                   echo '<option value="'.$item["idFormaPagamento"].'">'.$item["nome"].'</option>';

      }

    function comboMotoboy(){
      $dao = new ParametroDAO();
      $lista = $dao-> getMotoboy();

      if($lista)
             foreach($lista as $item)
                   echo '<option value="'.$item["idMotoboy"].'">'.$item["nome"].'</option>';

      }

   function comboContaBancaria(){
      $dao = new ParametroDAO();
      $lista = $dao-> getContaBancaria();

      if($lista)
             foreach($lista as $item)
                   echo '<option value="'.$item["idContaBancaria"].'">'.$item["nome"].'</option>';

      }

   function comboSituacaoParcela(){
      $dao = new ParametroDAO();
      $lista = $dao-> getSituacaoParcela();

      if($lista)
             foreach($lista as $item)
                   echo '<option value="'.$item["idSituacaoParcela"].'">'.$item["nome"].'</option>';

      }


  
?>
             

