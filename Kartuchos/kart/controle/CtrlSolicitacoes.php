<?php
  require_once('../modelo/SolicitacoesDAO.php');
  require_once('../modelo/ClienteDAO.php');

  function TabelaClientesSolicitacoes($complemento){
      $dao = new SolicitacoesDAO();
      $lista = $dao-> getClientesSolicitacoes($_POST['cliente'],$complemento);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $daoCliente = new ClienteDAO();
                 $idCliente = $item["idCliente"];
                 $nomeCliente = $daoCliente-> getNome($idCliente);

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
             $i++;
             
             if($idCliente == $_GET['idCliente']) $bgColor="bgColor='orange'";
             
             echo '<tr '.$bgColor.'>
                    <td><a onClick="Envia(\''.$idCliente.'\')" href="#">'.$nomeCliente.'&nbsp;';

                  if($dados["tipoVenda"] == 1)
                               echo "(LOCAÇÃO)";
                  else if($dados["tipoVenda"] == 2)
                               echo "(CONTRATO)";

             echo '</td>
                  </a></tr>';


             }
            }
  }
  
  function TabelaSolicitacoes(){

       $dao = new SolicitacoesDAO();
       
       if($_GET['statusSolicitacao'] == "Em Produção")
       {
        $lista = $dao-> getSolicitacoesProducao($codigoBarras,$complemento);
        $link = 'formProducao.php';
       }
       else if($_GET['statusSolicitacao'] == "Em Avaliação")
       {
        $lista = $dao-> getSolicitacoesAvaliacao($cliente);
        $link = 'formAvaliacao.php';

       }
       else if($_GET['statusSolicitacao'] == "Em Aprovação")
       {
        $lista = $dao-> getSolicitacoesAprovacao($cliente);
        $link = 'formAprovacao.php';

       }
       else if($_GET['statusSolicitacao'] == "Em Faturamento")
       {
        $lista = $dao-> getSolicitacoesFaturamento($cliente);
        $link = 'formFaturamento.php';

       }
       else if($_GET['statusSolicitacao'] == "Em Expedição")
       {
        $lista = $dao-> getSolicitacoesExpedicao($cliente);
        $link = 'formExpedicao.php';

       }

       if($lista)
            {
             $ordemServico=null;
             $numeroLinha=0;
             foreach($lista as $item){
             if($ordemServico != $item["idOrdemServico"]){
							$ordemServico = $item["idOrdemServico"];
							if($bgColor == "bgColor='#F7F7F7'")
								$bgColor = "bgColor='#B0C4DE'";
							else
								$bgColor = "bgColor='#F7F7F7'";
            }

           echo '<tr '.$bgColor.'>
                       <td align="center">'.$numeroLinha++.'</td>
                       <td align="center"><a href="'.$link.'?id='.$item["id"].'"><img src="images/icons/user_edit.png"
                                              alt="Editar"/></td>
                       <td>&nbsp;'.$item["nomeCliente"].'&nbsp;';

							if($item["tipoVenda"] == 1)
                               echo "(LOCAÇÃO)";
                            else if($item["tipoVenda"] == 2)
                               echo "(CONTRATO)";

               echo '&nbsp;</td>
					   <td align="center">'.$item["idOrdemServico"].'</td>
		               <td align="center">'.$item["codigoBarras"].'</td>
		               <td>'.$item["descricao"].'</td>
		               <td align="center">'.$item["data"].'</td>
		               <td>'.$item["nomeStatus"].'</td>
                   </tr>';


             }
            }

 }
  
  function TabelaItensSolicitacoes($complemento){
      $dao = new SolicitacoesDAO();
      if($_GET['idCliente'])
      {
       $idCliente = $_GET['idCliente'];
       $lista = $dao-> getItensSolicitacoes($idCliente,$complemento);
       if($lista)
            {
             $i=0;
             $numeroLinha=0;
             foreach($lista as $item){
             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
             $i++;

             if($item["idStatus"] == "1"or $item["idStatus"] == "14")
		        $link = 'formItemColeta.php?id='.$item["idOrdemServico"];
		     else if($item["idStatus"] == "2")
                 $link = 'formProducao.php?id='.$item["id"];
		     else if($item["idStatus"] == "3")
                 $link = 'formAvaliacao.php?id='.$item["idOrdemServico"];
			 else if($item["idStatus"] == "4")
                 $link = 'formFaturamento.php?id='.$item["idOrdemServico"];
		     else if($item["idStatus"] == "5" or $item["idStatus"] == "12" or $item["idStatus"] == "13")
                 $link = 'formExpedicao.php?id='.$item["idOrdemServico"];
			 else if($item["idStatus"] == "8")
                 $link = 'formAprovacao.php?id='.$item["id"];
			 else if($item["idStatus"] == "9")
                 $link = 'formProducao.php?id='.$item["id"];
			 else if($item["idStatus"] == "10")
                 $link = 'formProducao.php?id='.$item["id"];


             echo '<tr '.$bgColor.'>
                       <td>'.$numeroLinha++.'</td>
					   <td><a href="'.$link.'"><img src="images/icons/user_edit.png" alt="Editar"/></a></td>
                       <td>'.$item["idOrdemServico"].'</td>
		               <td>'.$item["tipo"].'</td>
		               <td>'.$item["descricao"].'</td>
		               <td>'.$item["qde"].'</td>
		               <td>'.$item["data"].'</td>
		               <td>'.$item["nomeStatus"].'</td>
                               <td>'.$item["observacoes"].'</td>
                   </tr>';


             }
            }
     }
 }
?>


