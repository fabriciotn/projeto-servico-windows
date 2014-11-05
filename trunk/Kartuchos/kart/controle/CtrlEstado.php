<?php
  require_once('../modelo/EstadoDAO.php');

  function comboEstado(){
      $dao = new EstadoDAO();
      $lista = $dao-> getEstados();

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idEstado = $item["idEstado"];
                 $nomeEstado = $item["nome"];
                 echo '<option value="'.$idEstado.'">'.$nomeEstado.'</option>';
             }
            }
  }


  
?>
             

