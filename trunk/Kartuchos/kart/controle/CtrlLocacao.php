<?php
  require_once('../modelo/LocacaoDAO.php');
  require_once('../modelo/ImpressoraDAO.php');

  function TabelaImpressorasLocacao(){
      $dao = new ImpressoraDAO();
      $lista = $dao-> getImpressorasLocacao($_GET['idCliente'],NULL,NULL);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idImpressora = $item["idImpressora"];
                 $marca = $item["marca"];
                 $modelo = $item["modelo"];
                 $patrimonio = $item["patrimonio"];
                 $numSerie = $item["numSerie"];
                 $tipo = $item["tipo"];
                 $tipo_impressao = $item["tipo_impressao"];
                 $situacao = $item["situacao"];
                 $idCliente=$_GET["idCliente"];
                 $tipoCliente = $_GET["tipoCliente"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idImpressora.'</td>
                           <td>'.$marca.'</td>
                           <td>'.$modelo.'</td>
                           <td>'.$patrimonio.'</td>
                           <td>'.$numSerie.'</td>
                           <td>'.$tipo.'</td>
                           <td>'.$tipo_impressao.'</td>
                           <td align="center">
                             <img
                             onClick="confirmacao(\'Deseja realmente desvincular a impressora código '.$idImpressora.'?\',\''.$PHP_SELF.'?idCliente='.$idCliente.'&tipoCliente='.$tipoCliente.'&idImpressora='.$idImpressora.'&CRUD=desvincularImpressora\')"
                                  src="images/icons/excluir.png" alt="Editar"/></td>
                   </tr>';


             }
            }
  }

  function obtemLocacao($idLocacao){
      $dao = new LocacaoDAO();
      return $dados = $dao-> getLocacao($idLocacao);
  }

  function CRUDLocacao(){

               $dao = new LocacaoDAO();

               $franquia_compartilhada = $_POST["franquia_compartilhada"];
               $franquia_colorida = $_POST["franquia_colorida"];
               $valor = $_POST["valor"];
               $valor_copia_excedente = $_POST["valor_copia_excedente"];
               $valor_digit_excedente = $_POST["valor_digit_excedente"];
               $bonus = $_POST["bonus"];
               $valor_colorida = $_POST["valor_colorida"];
               $emailFaturamento = $_POST["emailFaturamento"];
               $observacoes = $_POST["observacoes"];
               $empresa = $_POST["empresa"];
               $prazo_pagamento_dias = $_POST["prazo_pagamento_dias"];
               $data = split("/",$_POST["data"]);
	       $data = $data["2"]."-".$data["1"]."-".$data["0"];
               

               $data_afericao = split("/",$_POST["data_afericao"]);
	           $data_afericao = $data_afericao["0"];
               
               $data_final_contrato = split("/",$_POST["data_final_contrato"]);
	           $data_final_contrato = $data_final_contrato["2"]."-".$data_final_contrato["1"]."-".$data_final_contrato["0"];


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idLocacao']){
                    $dao -> atualizarLocacao($_GET['idLocacao'],$franquia_compartilhada,$franquia_colorida,$valor,$valor_copia_excedente,$valor_digit_excedente,
                                                $bonus,$valor_colorida,$observacoes,$data,$data_afericao,$data_final_contrato,$emailFaturamento,$empresa,$prazo_pagamento_dias);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
               else{
                      $_GET['idLocacao'] = $dao -> inserirLocacao($_GET['idCliente'],$franquia_compartilhada,$franquia_colorida,$valor,$valor_copia_excedente,$valor_digit_excedente,
                                                                  $bonus,$valor_colorida,$observacoes,$data,$data_afericao,$data_final_contrato,$emailFaturamento,$empresa,$prazo_pagamento_dias);
                      $_GET['acao'] = "dados";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
              }else if($_GET['CRUD'] == "desvincularImpressora") {
                        $dao = new ImpressoraDAO();
                        //insere impressora na locacao
                         $dao -> removerImpressoraLocacao($_GET['idImpressora'],$_GET['idCliente']);
                        //atualiza status da impressora
                         $dao -> atualizarStatus($_GET['idImpressora'],"À disposição");                       
                     echo '<span class="msg_crud">Impressora desvinculada com sucesso!</span>';                
              }else if($_GET['CRUD'] == "delete") {
                     deleteLocacao($_GET['idLocacao']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }

?>
             

