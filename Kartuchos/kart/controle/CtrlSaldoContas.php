<?php

require_once('../modelo/ParcelaDAO.php');

function TabelaSaldoContas() {
    $dao = new ParcelaDAO();

    $idContaBancaria = $_POST["idContaBancaria"];
    $idBanco = $_POST["idBanco"];
    $empresa = $_POST["empresa"];

    $lista = $dao->getContasBancarias($idContaBancaria, $idBanco);

    if ($lista) {
        $i = 0;
        $valorTotal = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            $idConta = $item["idContaBancaria"];
            $nomeBanco = $item["nomeBanco"];
            $nomeContaBancaria = $item["nomeContaBancaria"];

            $dadosTotalPago = $dao->getTotalPago($idConta, $empresa);
            $dadosTotalRecebido = $dao->getTotalRecebido($idConta, $empresa);

            $saldoConta = $dadosTotalRecebido["totalRecebido"] - $dadosTotalPago["totalPago"];
            $valorTotal += $saldoConta;

            echo '<tr ' . $bgColor . '>
	             <td style="font-size:17px;" align="center">' . $i . '</td>
                     <td style="font-size:17px;" align="center">' . $item["nomeBanco"] . '</td>
                     <td style="font-size:17px;" align="center">' . $item["nomeContaBancaria"] . '</td>
                     <td style="font-size:17px; color:green; font-weight: bold;" align="right">R$ ' . number_format($dadosTotalRecebido["totalRecebido"], 2, ',', '.') . '</td>
                     <td style="font-size:17px; color:red; font-weight: bold;" align="right">R$ ' . number_format($dadosTotalPago["totalPago"], 2, ',', '.') . '</td>
                     <td style="font-size:17px; font-weight: bold;';
            if ($saldoConta < 0)
                echo 'color: red;';
            else
                echo 'color: green;';
            echo ' " align="right">R$ ' . number_format($saldoConta, 2, ',', '.') . '</td>
                    </tr>';
        }
        echo '<tr ' . $bgColor . '>
                       <td></td><td></td><td></td><td></td>
                       <td style="font-size:17px;" align="right"><strong>Valor Total:</strong></td>
                       <td style="font-size:17px; ';
        if ($valorTotal < 0)
            echo 'color: red;';
        else
            echo 'color: green;';
        echo '" align="right"><strong>R$ ' . number_format($valorTotal, 2, ',', '.') . '</strong></td>
                   </tr>';
    }
}

function TabelaSaldoContasPrincipal() {
    $dao = new ParcelaDAO();

    $idContaBancaria = null;
    ;
    $idBanco = null;

    $lista = $dao->getContasBancarias($idContaBancaria, $idBanco);

    if ($lista) {
        $i = 0;
        $valorTotal = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            $idConta = $item["idContaBancaria"];
            $nomeBanco = $item["nomeBanco"];
            $nomeContaBancaria = $item["nomeContaBancaria"];

            $dadosTotalPago = $dao->getTotalPago($idConta, $empresa);
            $dadosTotalRecebido = $dao->getTotalRecebido($idConta, $empresa);

            $saldoConta = $dadosTotalRecebido["totalRecebido"] - $dadosTotalPago["totalPago"];
            $valorTotal += $saldoConta;

            echo '<tr ' . $bgColor . '>
			  	     <td style="font-size:10px;" align="center">' . $i . '</td>
                     <td style="font-size:10px;" align="center">' . $item["nomeBanco"] . '</td>
                     <td style="font-size:10px;" align="center">' . $item["nomeContaBancaria"] . '</td>
                     <td style="font-size:10px; color:green; font-weight: bold;" align="right">' . number_format($dadosTotalRecebido["totalRecebido"], 2, ',', '.') . '</td>
                     <td style="font-size:10px; color:red; font-weight: bold;" align="right">' . number_format($dadosTotalPago["totalPago"], 2, ',', '.') . '</td>
                     <td style="font-size:10px; font-weight: bold;';
            if ($saldoConta < 0)
                echo 'color: red;';
            else
                echo 'color: green;';
            echo ' " align="right">' . number_format($saldoConta, 2, ',', '.') . '</td>
                    </tr>';
        }
        echo '<tr ' . $bgColor . '>
                       <td colspan="5" style="font-size:10px;" align="right"><strong>Valor Total:</strong></td>
                       <td style="font-size:10px; ';
        if ($valorTotal < 0)
            echo 'color: red;';
        else
            echo 'color: green;';
        echo '" align="right"><strong>' . number_format($valorTotal, 2, ',', '.') . '</strong></td>
                   </tr>';
    }
}

function CRUDSaldoContas() {

    $dao = new ParcelaDAO();


    if ($_GET['CRUD'] == "transferencia") {

        $idFornecedor = null;
        $idContaBancariaSaque = $_POST["idContaBancariaSaque"];
        $idContaBancariaDeposito = $_POST["idContaBancariaDeposito"];
        $idFormaPagamento = null;
        $descricao = "TRANSFERÊNCIA BANCÁRIA";
        $empresa = null;
        $classe = null;
        $subclasse = null;
        $valorBase = $_POST["valorBase"];
        $dataPrevistaPagamento = $_POST["data"];
        $dataPP = $dataPrevistaPagamento;
        if ($dataPrevistaPagamento != "") {
            $array = split("/", $dataPrevistaPagamento);
            $dataPrevistaPagamento = $array["2"] . "-" . $array["1"] . "-" . $array["0"];
        } else {
            $dataPrevistaPagamento = NULL;
        }        
        $numBoleto = null;
        $notaFiscal = null;
        $idSituacaoParcela = '2';
        $observacoes = "TRANSFERÊNCIA BANCÁRIA DE ".$idContaBancariaSaque." PARA ".$idContaBancariaDeposito." NO VALOR DE ".$valorBase;
        $flgPatrimonio = null;
        $flgDespesaFixa = null;
        $usuario = $_SESSION['cod'];
        $idOrdemServico = null;
        $flgReceber = 0;
        $idContaBancaria = $idContaBancariaSaque;

        $idParcela = $dao->inserirParcela($idOrdemServico, $idFornecedor, $usuario, $idFormaPagamento, $dataCriacao, $descricao, $valorBase, $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $observacoes, $idContaBancaria, $flgReceber, $empresa, $classe, $subclasse, $flgDespesaFixa);
        
        $flgReceber = 1;
        $idContaBancaria = $idContaBancariaDeposito;
        $idParcela = $dao->inserirParcela($idOrdemServico, $idFornecedor, $usuario, $idFormaPagamento, $dataCriacao, $descricao, $valorBase, $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $observacoes, $idContaBancaria, $flgReceber, $empresa, $classe, $subclasse, $flgDespesaFixa);

        echo '<span class="msg_crud">Transferência realizada com sucesso!</span>';
    }

    $_GET['CRUD'] = null;
}
?>


