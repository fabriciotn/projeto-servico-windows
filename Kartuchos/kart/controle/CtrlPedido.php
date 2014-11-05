<?php
  require_once('../modelo/OrdemServicoDAO.php');
  require_once('../modelo/DadosMensaisDAO.php');

   

  function CRUDPedido(){

               $dao = new OrdemServicoDAO();               
               //$daoDadosMensais = new DadosMensaisDAO();

               if($_GET['CRUD'] == "savePedidoLocacao"){
                    
                 $dataVencimento = split("/",$_POST["dataVencimento"]);
	         $dataVencimento = $dataVencimento["2"]."-".$dataVencimento["1"]."-".$dataVencimento["0"];
                 $idOrdemServico = $dao -> inserirOrdemServico(4, $_GET['idCliente'], $_SESSION['cod'], null, null,1,null, null, null, null,
                                                               $_POST['observacoes'], $_POST['formaPagamento'],$dataVencimento, 1);

                  $idMaterial = $_POST["material"];
                  $qde = $_POST["qde"];
                  $preco = $_POST["preco"];
                  $usuario = $_SESSION["cod"];
                  $dataRetirada = null;
                  $idStatus = 4;

                  $dao -> inserirMaterialOrdemServico($idMaterial,$idOrdemServico,$qde,$preco,$usuario,$dataRetirada,$idStatus);
                  $dao = new DadosMensaisDAO();      
                  $dao -> InformaEnvioFaturamento($_GET['idCliente'],$_GET['mes'],$_GET['ano']);
                 
                 echo '<span class="msg_crud">Enviado com sucesso!</span>';
                 ?><script>alert("Enviado com sucesso!");EnviaPopUp("<?php echo $_GET['idCliente'];?>","<?php echo $_GET['tipoCliente'];?>");</script><?php
                   
               }
               $_GET['CRUD']= null;

          }
  
?>
             

