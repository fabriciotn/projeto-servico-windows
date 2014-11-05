<?php

require_once('../modelo/SuporteDAO.php');
require_once('../modelo/ImpressoraDAO.php');

function TabelaSuportes() {
    $dao = new SuporteDAO();

    $status = $_GET['status'];
    if ($status == "null")
        $status = "";
    else if (!$status)
        $status = " AND not a.status=3";
    else
        $status = " AND a.status='$status'";
    
    if($_POST["dataInicio"] != ""){
      $dataInicio = split("/",$_POST["dataInicio"]);
      $dataInicio = $dataInicio["2"]."-".$dataInicio["1"]."-".$dataInicio["0"];
      }else $dataInicio = date("Y-m-d");
      if($_POST["dataTermino"] != ""){
      $dataTermino = split("/",$_POST["dataTermino"]);
      $dataTermino = $dataTermino["2"]."-".$dataTermino["1"]."-".$dataTermino["0"];
      }else $dataTermino = date("Y-m-d");
      
      $dataTermino.= " 23:59:59";


    $lista = $dao->getSuportes($dataInicio,$dataTermino,$status);

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {
            $idChamado = $item["idChamado"];
            $idCliente = $item["idCliente"];
            $tipoCliente = $item["tipoCliente"];


            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            echo "<tr " . $bgColor . " >";
            echo "<td align='center'>" . $item["idChamado"] . "</td>";
            echo "<td>" . $item["nomeCliente"] . "</td>";
            echo "<td>" . $item["equipamento"] . "</td>";
            echo "<td>" . $item["patrimonio"] . "</td>";
            echo "<td>" . $item["data_abertura"] . "</td>";
            echo "<td>" . $item["defeito_alegado"] . "</td>";
            echo "<td>" . $item["data_atendimento"] . "</td>";
            echo "<td>" . $item["tecnico"] . "</td>";
            echo "<td>" . $item["defeito_constatado"] . "</td>";
            echo "<td>" . $item["garantia"] . "</td>";
            echo "<td>" . $item["solucao"] . "</td>";
            echo "<td>" . $item["data_fechamento"] . "</td>";
            echo "<td>";
            if ($item["status"] == 1) {
                echo "<input type='button'
                            onclick='javascript:window.location=\"FormSuporte.php?flagChamado=2&idSuporte=" . $idChamado . "&idCliente=" . $idCliente . "&tipoCliente=" . $tipoCliente . "\"'
                            name='Bt_Submit' class='botao' value='Atender' />";
            } else if ($item["status"] == 2) {
                echo "<input type='button'
                            onclick='javascript:window.location=\"FormSuporte.php?flagChamado=2&idSuporte=" . $idChamado . "&idCliente=" . $idCliente . "&tipoCliente=" . $tipoCliente . "\"'
                            name='Bt_Submit' class='botao' value='Concluír' />";
            } else if ($item["status"] == 3) {
                echo "<strong>Concluído</strong>";
            } else {
                echo "<strong>Suspenso</strong>";
            }
            echo "</td>";
            echo "</tr>";
        }
    }
}

function TabelaHistoricoChamados() {
    $dao = new SuporteDAO();

    
    $lista = $dao->getHistoricoSuportes($_GET["idCliente"]);

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            echo "<tr " . $bgColor . " >";
            echo "<td align='center'>" . $item["idChamado"] . "</td>";            
            echo "<td>" . $item["equipamento"] . "</td>";
            echo "<td>" . $item["patrimonio"] . "</td>";
            echo "<td>" . $item["data_abertura"] . "</td>";
            echo "<td>" . $item["defeito_alegado"] . "</td>";
            echo "<td>" . $item["data_atendimento"] . "</td>";
            echo "<td>" . $item["tecnico"] . "</td>";
            echo "<td>" . $item["defeito_constatado"] . "</td>";
            echo "<td>" . $item["garantia"] . "</td>";
            echo "<td>" . $item["solucao"] . "</td>";
            echo "<td>" . $item["data_fechamento"] . "</td>";
            echo "<td>";
            if ($item["status"] == 1) {
                echo "<strong>Aberto</strong>";
            } else if ($item["status"] == 2) {
                echo "<strong>Em atendimento</strong>";
            } else if ($item["status"] == 3) {
                echo "<strong>Concluído</strong>";
            } else {
                echo "<strong>Suspenso</strong>";
            }
            echo "</td>";
            echo "</tr>";
        }
    }
}

function obtemSuporte($idSuporte) {
    $dao = new SuporteDAO();
    return $dados = $dao->getSuporte($idSuporte);
}

function CRUDSuporte() {

    $dao = new SuporteDAO();

    if ($_GET['CRUD'] == "save") {
        if ($_GET['idSuporte']) {
            $idChamado = $_GET['idSuporte'];
            $tecnico = $_POST["tecnico"];
            $defeito_constatado = $_POST["defeito_constatado"];
            $garantia = $_POST["garantia"];
            $solucao = $_POST["solucao"];
            if ($_POST['status'] == 2) {
                $status = 2;
                $data_conclusao = "";
                $data_atendimento = ", data_atendimento=NOW()";
            } else {
                $status = $_POST['status'];
                $data_conclusao = ", data_fechamento=NOW()";
                $data_atendimento = "";
            }

            $dao->atualizarSuporte($idChamado, $tecnico, $defeito_constatado, $data_atendimento, $garantia, $solucao, $status, $data_conclusao);
            echo '<span class="msg_crud">Atualizado com sucesso!</span>';            
                  ?>
                    <script>
                           alert("Chamado atualizado com sucesso!");
                           location.href="suporte.php";
                    </script>
                  <?php
        } else {
            $idCliente = $_GET["idCliente"];
            $responsavel = $_POST["responsavel"];
            //$idImpressora = $_POST["idImpressora"];
            $equipamento = $_POST["equipamento"];
            $patrimonio = $_POST["patrimonio"];
            $defeito_alegado = $_POST["defeito_alegado"];
            $usuario = $_SESSION['cod'];
            $_GET['idSuporte'] = $dao->inserirSuporte($usuario, $idCliente, $responsavel, $equipamento,$patrimonio, $defeito_alegado);
            $_GET['acao'] = "dados";
            echo '<span class="msg_crud">Inserido com sucesso!</span>';
        }
    } else if ($_GET['CRUD'] == "delete") {
        removerSuporte($_GET['idSuporte']);
        echo '<span class="msg_crud">Removido com sucesso!</span>';
    }

    $_GET['CRUD'] = null;
}
?>
             

