<?php
  require_once('../modelo/ProducaoDAO.php');
  require_once('../modelo/OrdemServicoDAO.php');

  function obtemItemColeta($idItemColeta){
      $dao = new OrdemServicoDAO();
      return $dados = $dao-> getItemColeta($idItemColeta);
  }
  
  function comboTipoProducao(){
      $dao = new ProducaoDAO();
      $lista = $dao-> getTiposProducao();

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 echo '<option value="'.$item["idTipoProducao"].'">'.$item["nome"].'</option>';
             }
            }
  }
  
  function CRUDProducao(){

               $dao = new ProducaoDAO();


               if($_GET['CRUD'] == "saveProducao")
               {

                 $idItemColeta = $_GET['id'];
                 $usuario = $_SESSION['cod'];
                 $qdeRecargas = $_POST['qdeRecargas'];
                 $idTipoProducao = $_POST['idTipoProducao'];
                 $servicoExecutado = $_POST['servicoExecutado'];
                 $observacoes = $_POST['observacoes'];
                 
                 $dao -> atualizarItemColetaProducao($idItemColeta,$servicoExecutado,$observacoes,$usuario,$qdeRecargas,$idTipoProducao);

                 echo '<span class="msg_crud">Atualizado com sucesso!</span>';

               }else if($_GET['CRUD'] == "encerraProducao"){

                 $idItemColeta = $_GET['id'];
                 $idSetor = $_GET['idSetor'];
                 $usuario = $_SESSION['cod'];

                 $dao -> encerrarItemColetaProducao($idItemColeta,$idSetor,$usuario);

                 echo '<span class="msg_crud">Item enviado com sucesso!</span>';
                 ?><script>
                           alert("Item enviado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Produção";
                   </script>
                 <?php
               }else if($_GET['CRUD'] == "voltaStatus"){

                 $idItemColeta = $_GET['id'];
                 $idSetor = $_GET['idSetor'];
                 $idOrdemServico = $_GET['idOrdemServico'];

                 $dao -> voltaStatusItemProducao($idItemColeta,$idSetor,$idOrdemServico);

                 echo '<span class="msg_crud">Status atualizado com sucesso!</span>';
                 ?><script>
                           alert("Status atualizado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Produção";
                   </script>
                 <?php
               }else if($_GET['CRUD'] == "cancelarItem"){

                 $idItemColeta = $_GET['id'];
                 $idSetor = $_GET['idSetor'];
                 $idOrdemServico = $_GET['idOrdemServico'];

                 $dao -> cancelarItem($idItemColeta,$idSetor);

                 echo '<span class="msg_crud">Item cancelado com sucesso!</span>';
                 ?><script>
                           alert("Item cancelado com sucesso!");
                           location.href="listaSolicitacoes.php?statusSolicitacao=Em Produção";
                   </script>
                 <?php
               }else if($_GET['CRUD'] == "delete") {
                     deleteFuncionario($_GET['idServico']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;
  }
  
?>
             

