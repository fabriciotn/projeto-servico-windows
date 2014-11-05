<?php
  require_once('../modelo/UsuarioDAO.php');

  function TabelaItemAcessoExterno(){
      $dao = new AcessoExternoDAO();
      $lista = $dao-> getItemAcessoExterno($_SESSION['cod']);
      if($lista)
            {
             foreach($lista as $item){
                 $idCliente = $item["idCliente"];
                 $nomeCliente = $item["nome"];
                 $cpfCnpj =  $item["cpfCnpj"];
             echo '<tr>
                       <td>'.$idCliente.'</td>
                       <td>'.$nomeCliente.'</td>
                       <td>'.$cpfCnpj.'</td>
                   </tr>';


             }
            }
  }
?>
             

