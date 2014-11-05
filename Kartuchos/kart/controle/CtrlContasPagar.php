<?php

require_once('../modelo/ParcelaDAO.php');

function TabelaParcelasPagarHoje() {
    $dao = new ParcelaDAO();
    $dataInicio = date("Y-m-d");
    $dataTermino = date("Y-m-d");;
    $lista = $dao->getParcelasPagar($dataInicio, $dataTermino, $contaBancaria, $classe, $subClasse);

    $valorTotal = 0;
    $vencidas = 0;
    $valorTotalHoje = 0;


    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#FFC1C1'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            $id = $item["idParcela"];
            $valorTotal += $item['valorBase'];
            if ($item['dataPrevistaPagamentoS'] == date("Ymd"))
                $valorTotalHoje += $item['valorBase'];
            else if ($item['dataPrevistaPagamentoS'] < date("Ymd"))
                $vencidas += $item['valorBase'];
            echo '<tr ' . $bgColor . '>
                       <td>' . $i . '</td>
                       <td>' . $item['descricao'] . '</td>
                       <td align="center">' . $item['dataPrevistaPagamento'] . '</td>
                       <td>' . $item['valorBase'] . '</td>
                    </tr>';
        }
    }
    $totais = array("valorTotal" => $valorTotal, "vencidas" => $vencidas, "valorTotalHoje" => $valorTotalHoje);

    return $totais;
}

function TabelaParcelasPagar() {
    $dao = new ParcelaDAO();
    if ($_POST["dataInicio"] != "") {
        $dataInicio = split("/", $_POST["dataInicio"]);
        $dataInicio = $dataInicio["2"] . "-" . $dataInicio["1"] . "-" . $dataInicio["0"];
    }
    if ($_POST["dataTermino"] != "") {
        $dataTermino = split("/", $_POST["dataTermino"]);
        $dataTermino = $dataTermino["2"] . "-" . $dataTermino["1"] . "-" . $dataTermino["0"];
    }

    $contaBancaria = $_POST["SContaBancaria"];
    $classe = $_POST["SClasse"];
    $subClasse = $_POST["SSubClasse"];

    $lista = $dao->getParcelasPagar($dataInicio, $dataTermino, $contaBancaria, $classe, $subClasse);

    $valorTotal = 0;
    $vencidas = 0;
    $valorTotalHoje = 0;

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#ff8989'" : $bgColor = "bgColor='#ff7676'";
            $i++;
            $id = $item["idParcela"];
            $valorTotal += $item['valorBase'];
            if ($item['dataPrevistaPagamentoS'] == date("Ymd"))
                $valorTotalHoje += $item['valorBase'];
            else if ($item['dataPrevistaPagamentoS'] < date("Ymd"))
                $vencidas += $item['valorBase'];
            echo "<input type='hidden' name='idParcela$i' id='idParcela$i' value='$id' />";
            echo '
                    <tr class="linhaParcelaPagar" style="border-bottom: 1px solid silver" ' . $bgColor . '>
		     <td  width="30px" align="center"><input id="botao' . $i . '" type="button" class="botao" value=" + " onclick="Oculta(this,\'detalhes' . $i . '\')" /></td>
                     <td  width="10px" align="center"><div class="form-campos2">' . $i . '</div></td>
                     <td  width="300px" align="center"><div class="form-campos2">
                        <span class="exibeInformacao">' . $item["descricao"] . '
                    <div id="detalhes' . $i . '" style="display:none;" >


                   <table width="700px">
                    <tr ' . $bgColor . '>
                        <td colspan="4" align="right"><input type="button" class="botao" value=" FECHAR " onclick="Oculta(botao' . $i . ',\'detalhes' . $i . '\')" /></td>
                    </tr>
                    <tr ' . $bgColor . '>
                     <td>Conta Bancária</td>
                     <td>Empresa</td>
                     <td>Forma de Pagamento</td>  
                     <td></td>
                    </tr>
                    <tr ' . $bgColor . '>
                     <td>
                       <select name="idContaBancaria' . $i . '" id="idContaBancaria' . $i . '">
                        <option value="' . $item["idContaBancaria"] . '" selected="selected">' . $item["nomeContaBancaria"] . '</option>';
            comboContaBancaria();
            echo ' </select>
                     </td>
                     <td>
                       <select name="empresa' . $i . '" id="empresa' . $i . '">
                        <option value="' . $item["empresa"] . '" selected="selected">' . $item["nomeEmpresa"] . '</option>';
            comboEmpresa();
            echo ' </select>
                     </td>
                     <td>
                       <select name="idFormaPagamento' . $i . '" id="idFormaPagamento' . $i . '">
                        <option value="' . $item["idFormaPagamento"] . '" selected="selected">' . $item["formaPagamento"] . '</option>';
            comboFormaPagamento();
            echo '</select>
                     </td>
                     <td></td>
                    </tr>
                    <tr ' . $bgColor . '>
                        <td>Despexa Fixa</td>
                        <td>Classe / Sub-Classe</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr ' . $bgColor . '>
                       <td>
                        <input type="radio" name="flgDespesaFixa' . $i . '" id="flgDespesaFixa' . $i . '" value="1" ';
            echo ( $item['flgDespesaFixa'] == 1 ? 'checked' : '' );
            echo'>Sim
                                &nbsp;&nbsp;
                                <input type="radio" name="flgDespesaFixa' . $i . '" id="flgDespesaFixa' . $i . '" value="0" ';
            echo ( $item['flgDespesaFixa'] == 0 ? 'checked' : '' );
            echo'>Não
                       </td>
                       <td>' . $item["classe"] . ' / ' . $item["subclasse"] . '</td>
                       <td></td>
                       <td></td>
                    </tr>
                    <tr ' . $bgColor . '>
                        <td>Observação:</td>
                        <td colspan="3">
                          <textarea style="width:700px;height:50px;" name="observacoes' . $i . '" id="observacoes' . $i . '">' . $item['observacoes'] . '</textarea>
                        </td>
                    </tr> 
                    <tr ' . $bgColor . '>
                         <td colspan="4" align="right" >
                            <a href="#"><input type="button" class="botao" value=" SALVAR " onClick="Envia(\'' . $PHP_SELF . '?CRUD=updateContasPagar&linha=' . $i . '\');" alt="SALVAR"/>
                         </td>    
                    </tr>
                    </table>



                        </div></span>
                     </td>
                     <td width="100px"  align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="valorBase' . $i . '" id="valorBase' . $i . '" value="' . $item["valorBase"] . '"/
                        </div>
                     </td>
                     <td  width="120px" align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataPrevistaPagamento' . $i . '" id="dataPrevistaPagamento' . $i . '" value="' . $item["dataPrevistaPagamento"] . '"/>
                        </div>
                     </td>
                     <td  width="120px" align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="numBoleto' . $i . '" id="numBoleto' . $i . '" value="' . $item["numBoleto"] . '"/>
                        </div>
                     </td>
                     <td  width="120px" align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="notaFiscal' . $i . '" id="notaFiscal' . $i . '" value="' . $item["notaFiscal"] . '"/>
                        </div>
                     </td>
                     <td  width="80px" align="center">
                     <div class="form-campos2">';
            if ($item['flgDespesaFixa'])
                echo "Sim";
            else
                echo "Não";

            echo '</div> 
                        </td>
                     <td width="20px" align="center"><input type="checkbox" name="cancelarParcela' . $i . '" id="cancelarParcela' . $i . '" value="' . $i . '"></td>
                     <td width="20px" align="center"><input type="checkbox" name="efetuarPagamento' . $i . '" id="efetuarPagamento' . $i . '" value="' . $i . '"></td>
                     <td align="center" width="20px" ><a href="#"><img onClick="Envia(\''.$PHP_SELF.'?CRUD=updateContasPagar&linha='.$i.'\');" alt="Atualizar" src="images/atualizar.gif" /></td>    
					</tr>';
        }
        echo '<input type="hidden" name="qtdParcelas" id="qtdParcelas" value="' . $i . '" />';
    }
    $totais = array("qtd" => $i,"valorTotal" => $valorTotal, "vencidas" => $vencidas, "valorTotalHoje" => $valorTotalHoje);

    return $totais;
}

function TabelaDespesasFixas() {
    $dao = new ParcelaDAO();
    $lista = $dao->getDespesasFixas();

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;
            $id = $item["idDespesaFixa"];
            $diaVencimento = $item["diaVencimento"];
            echo "<input type='hidden' name='descricao$id' id='descricao$id' value='" . $item['descricao'] . "'/>
                    <input type='hidden' name='observacao$id' id='observacao$id' value='" . $item['observacoes'] . "'/>
                    <input type='hidden' name='classe$id' id='classe$id' value='" . $item['classe'] . "'/>
                    <input type='hidden' name='subclasse$id' id='subclasse$id' value='" . $item['subclasse'] . "'/>
                    <input type='hidden' name='empresa$id' id='empresa$id' value='" . $item['empresa'] . "'/>
                   ";

            echo '<tr ' . $bgColor . '>
                     <td align="center">
                       <input type="checkbox" name="idDespesaFixa[]" id="idDespesaFixa[]" value="' . $item["idDespesaFixa"] . '">
                     </td>
                     <td>' . $item["idParcelaInicial"] . '</td>
                     <td align="center">' . $item["descricao"] . '</td>
                     <td align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="valorBase' . $id . '" id="valorBase' . $id . '" value="' . $item["valorBase"] . '"/
                        </div>
                     </td>
                     <td align="center">
                        <div class="form-campos">
                        <select name="idContaBancaria' . $id . '" id="idContaBancaria' . $id . '">
                        <option value="' . $item["idContaBancaria"] . '" selected="selected">' . $item["nomeContaBancaria"] . '</option>';
            comboContaBancaria();
            echo ' </select>
                        </div>
                     </td>

                     <td align="center">
                        <div class="form-campos">
                        <select name="idFormaPagamento' . $id . '" id="idFormaPagamento' . $id . '">
                        <option value="' . $item["idFormaPagamento"] . '" selected="selected">' . $item["formaPagamento"] . '</option>';
            comboFormaPagamento();
            echo '</select>
                        </div>
                     </td>
                     <td align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="dataPrevistaPagamento' . $id . '" id="dataPrevistaPagamento' . $id . '" value="' . date("$diaVencimento/m/Y") . '"/>
                        </div>
                     </td>
                     <td align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="numBoleto' . $id . '" id="numBoleto' . $id . '" value="' . $item["numBoleto"] . '"/>
                        </div>
                     </td>
                     <td align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="notaFiscal' . $id . '" id="notaFiscal' . $id . '" value="' . $item["notaFiscal"] . '"/>
                        </div>
                     </td>
					</tr>';
        }
    }
}

function TabelaHistoricoServicos() {
    $dao = new OrdemServicoDAO();
    $lista = $dao->getServicosCliente($_GET['idCliente']);

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {

            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            echo '<tr ' . $bgColor . '>
			  	     <td>' . $i . '</td>
                            <td>' . $item["tipo"] . '</td>
							<td>' . $item["data"] . '</td>
							<td>' . $item["descricao"] . '</td>
							<td>' . $item["preco"] . '</td>
							<td>' . $item["qde"] . '</td>
							<td>' . $item["nomeStatus"] . '</td>
					</tr>';
        }
    }
}

function CRUDContasPagar() {

    $dao = new ParcelaDAO();


    if ($_GET['CRUD'] == "novaContaPagar") {

        $idFornecedor = $_POST["idFornecedor"];
        $idContaBancaria = $_POST["idContaBancaria"];
        $idFormaPagamento = $_POST["idFormaPagamento"];
        $descricao = $_POST["descricao"];
        $empresa = $_POST["empresa"];
        $classe = $_POST["classe"];
        $subclasse = $_POST["subClasse"];
        $valorBase = $_POST["valorBase"];
        $dataPrevistaPagamento = $_POST["dataPrevistaPagamento"];
        $dataPP = $dataPrevistaPagamento;
        if ($dataPrevistaPagamento != "") {
            $array = split("/", $dataPrevistaPagamento);
            $dataPrevistaPagamento = $array["2"] . "-" . $array["1"] . "-" . $array["0"];
        } else {
            $dataPrevistaPagamento = NULL;
        }
        $numBoleto = $_POST["numBoleto"];
        $notaFiscal = $_POST["notaFiscal"];
        $idSituacaoParcela = '1';
        $observacoes = $_POST["observacoes"];
        $flgPatrimonio = $_POST["flgPatrimonio"];
        $flgDespesaFixa = $_POST["flgDespesaFixa"];
        $usuario = $_SESSION['cod'];
        $idOrdemServico = null;
        $flgReceber = 0;

        $idParcela = $dao->inserirParcela($idOrdemServico, $idFornecedor, $usuario, $idFormaPagamento, $dataCriacao, $descricao, $valorBase, $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $observacoes, $idContaBancaria, $flgReceber, $empresa, $classe, $subclasse, $flgDespesaFixa);

        if ($flgDespesaFixa) {
            $dataPrevistaPagamento = $_POST["dataPrevistaPagamento"];
            $dataPP = $dataPrevistaPagamento;
            if ($dataPrevistaPagamento != "") {
                $array = split("/", $dataPrevistaPagamento);
                $diaVencimento = $array["0"];
                $mesVencimento = $array["1"];
                $anoInicio = $array["2"];
            }
            $dao->inserirDespesaFixa($idParcela, $diaVencimento, $mesVencimento, $anoInicio, $valorBase, $descricao, $empresa, $classe, $subclasse, $idContaBancaria);
        }

        echo '<span class="msg_crud">Inserido nova conta com sucesso!</span>';
    } else if ($_GET['CRUD'] == "saveContasPagar") {
        echo $_POST["qtdParcelas"];
        for ($i = 1; $i <= $_POST["qtdParcelas"]; $i++) {
            $idParcela = $_POST["idParcela$i"];
            $descricao = $_POST["descricao$i"];
            $valorBase = $_POST["valorBase$i"];
            $idContaBancaria = $_POST["idContaBancaria$i"];
            $idFormaPagamento = $_POST["idFormaPagamento$i"];
            $dataPrevistaPagamento = $_POST["dataPrevistaPagamento$i"];
            $dataPP = $dataPrevistaPagamento;
            if ($dataPrevistaPagamento != "") {
                $array = split("/", $dataPrevistaPagamento);
                $dataPrevistaPagamento = $array["2"] . "-" . $array["1"] . "-" . $array["0"];
            } else {
                $dataPrevistaPagamento = NULL;
            }
            $numBoleto = $_POST["numBoleto$i"];
            $notaFiscal = $_POST["notaFiscal$i"];
            $empresa = $_POST["empresa$i"];
            $classe = $_POST["classe$i"];
            $subclasse = $_POST["subclasse$i"];
            $observacoes = $_POST["observacoes$i"];

            if (isset($_POST["cancelarParcela$i"])) {
                $idSituacaoParcela = "3";
                $dataPagamento = "null";
            } else if (isset($_POST["efetuarPagamento$i"])) {
                $idSituacaoParcela = "2";
                $dataPagamento = date("Y-m-d");
            } else {
                $idSituacaoParcela = "1";
                $dataPagamento = "NULL";
            }

            $usuario = $_SESSION['cod'];
            $flgDespesaFixa = $_POST["flgDespesaFixa$i"];
            
            $dao->atualizarParcela($idParcela, $descricao, $valorBase, $multa, $juros, $idContaBancaria, $idFormaPagamento, $empresa, $dataPagamento, $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $flgPatrimonio, $flgDespesaFixa, $observacoes);
        }
        echo '<span class="msg_crud">Atualizado com sucesso!</span>';
    } else if ($_GET['CRUD'] == "updateContasPagar") {

        //echo $_POST["qtdParcelas"]."passou";
        $linha = $_GET['linha'];
        $idParcela = $_POST["idParcela$linha"];
        $descricao = $_POST["descricao$linha"];
        $valorBase = $_POST["valorBase$linha"];
        $idContaBancaria = $_POST["idContaBancaria$linha"];
        $idFormaPagamento = $_POST["idFormaPagamento$linha"];
        $dataPrevistaPagamento = $_POST["dataPrevistaPagamento$linha"];
        $dataPP = $dataPrevistaPagamento;
        if ($dataPrevistaPagamento != "") {
            $array = split("/", $dataPrevistaPagamento);
            $dataPrevistaPagamento = $array["2"] . "-" . $array["1"] . "-" . $array["0"];
        } else {
            $dataPrevistaPagamento = NULL;
        }
        $numBoleto = $_POST["numBoleto$linha"];
        $notaFiscal = $_POST["notaFiscal$linha"];
        $empresa = $_POST["empresa$linha"];
        $classe = null;
        $subclasse = null;
        $observacoes = $_POST["observacoes$linha"];


        if (isset($_POST["cancelarParcela$linha"])) {
            $idSituacaoParcela = "3";
            $dataPagamento = "null";
        } else if (isset($_POST["efetuarPagamento$linha"])) {
            $idSituacaoParcela = "2";
            $dataPagamento = date("Y-m-d");
        } else {
            $idSituacaoParcela = "1";
            $dataPagamento = "NULL";
        }

        $usuario = $_SESSION['cod'];
        $flgDespesaFixa = $_POST["flgDespesaFixa$linha"];

        $dao->atualizarParcela($idParcela, $descricao, $valorBase, $multa, $juros, $idContaBancaria, $idFormaPagamento, $empresa, $dataPagamento, $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $flgPatrimonio, $flgDespesaFixa, $observacoes);
        echo '<span class="msg_crud">Parcela ' . $idParcela . ' atualizada com sucesso!</span>';
    } else if ($_GET['CRUD'] == "delete") {
        deleteFuncionario($_GET['idServico']);
        echo '<span class="msg_crud">Removido com sucesso!</span>';
    }

    $_GET['CRUD'] = null;
}
?>


