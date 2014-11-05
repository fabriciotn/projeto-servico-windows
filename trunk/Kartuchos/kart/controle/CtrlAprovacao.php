<?php
  require_once('../modelo/AprovacaoDAO.php');
  require_once('../modelo/OrdemServicoDAO.php');

  function obtemItemColeta($idItemColeta){
      $dao = new OrdemServicoDAO();
      return $dados = $dao-> getItemColeta($idItemColeta);
  }
  
  function CRUDAprovacao(){

               $dao = new AprovacaoDAO();


               if($_GET['CRUD'] == "saveAprovacao")
               {

                 $idItemColeta = $_GET['id'];
                 $usuario = $_SESSION['cod'];
                 $servicoExecutado = $_POST['servicoExecutado'];
                 $observacoes = $_POST['observacoes'];
                 
                 $dao -> atualizarItemColetaAprovacao($idItemColeta,$servicoExecutado,$observacoes,$usuario);

                 echo '<span class="msg_crud">Atualizado com sucesso!</span>';

               }else if($_GET['CRUD'] == "encerraAprovacao"){

                 $idItemColeta = $_GET['id'];
                 $idSetor = $_GET['idSetor'];
                 $usuario = $_SESSION['cod'];

                 $dao -> encerrarItemColetaAprovacao($idItemColeta,$idSetor,$usuario);

                 echo '<span class="msg_crud">Item enviado com sucesso!</span>';
                 ?><script>
                           alert("Item enviado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Aprovação";
                   </script>
                 <?php
               }

               $_GET['CRUD']= null;
  }
  
?>
             

