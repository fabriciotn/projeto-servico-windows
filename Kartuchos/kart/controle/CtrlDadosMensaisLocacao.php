<?php
require_once('../modelo/LocacaoDAO.php');
require_once('../modelo/DadosMensaisDAO.php');
require_once('../modelo/ImpressoraDAO.php');

function TabelaDadosMensaisImpressorasLocacao() {
    $dao = new ImpressoraDAO();
    $mes = $_GET['mes'];
    $ano = $_GET['ano'];
    if(!$mes) $mes = date("m");
    if(!$ano) $ano = date("Y");
    $lista = $dao->getImpressorasLocacao($_GET['idCliente'],$mes,$ano);

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {
            $idImpressora = $item["idImpressora"];
            $marca = $item["marca"];
            $modelo = $item["modelo"];
            $patrimonio = $item["patrimonio"];
            $setor = $item["setor"];
            $numSerie = $item["numSerie"];
            $tipo = $item["tipo"];
            $tipo_impressao = $item["tipo_impressao"];
            $situacao = $item["situacao"];
            $idCliente = $_GET['idCliente'];
            $tipoCliente = $_GET['tipoCliente'];
            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;
            if($item["mes"]) $bgColor = "bgColor='orange'";
            echo '<tr ' . $bgColor . '>
                           <td><input style="border: 1px solid black;" class="botao" type="button" value="  Substituir Impressora  "
                           onclick="InsereDadosMensaisLocacao(' . $idCliente . ',\'' . $tipoCliente . '\',' . $idImpressora . ',1);" /></td>
                           <td>' . $idImpressora . '</td>
                           <td>' . $marca . '</td>
                           <td>' . $modelo . '</td>
                           <td>' . $patrimonio . '</td>
                           <td>' . $setor . '</td>
                           <td>' . $numSerie . '</td>
                           <td>' . $tipo . '</td>
                           <td>' . $tipo_impressao . '</td>
                           <td>
                           <input style="border: 1px solid black;" class="botao" type="button" value="  Inserir Dados  "
                           onclick="InsereDadosMensaisLocacao(' . $idCliente . ',\'' . $tipoCliente . '\',' . $idImpressora . ',0);" /></td>
                            <td><input style="border: 1px solid black;" class="botao" type="button" value="  Abrir  "
                           onclick="abrir(\'FormSuporte.php?idCliente=' . $idCliente . '&tipoCliente=' . $tipoCliente . '\');" /></td>
                   </tr>';
        }
    }
}

function obtemLocacoesMensaisMes() {
    $dao = new DadosMensaisDAO();
    $idLocacao = $_GET['idLocacao'];
    $idImpressora = $_GET['idImpressora'];
    $mes = $_GET['mes'];
    $ano = $_GET['ano'];
    $lista = $dao->getLocacoesMensaisMes($idLocacao, $idImpressora, $mes, $ano);

    $total_copias = 0;
    $total_digit = 0;
    if ($lista) {
        foreach ($lista as $item) {
        $total_copias += $item["total_copias"];
        $total_digit += $item['total_digit'];
        $total_coloridas += $item['total_coloridas'];
        }
    }
    $totais = array("total_copias" => $total_copias, "total_digit" => $total_digit, "total_coloridas" => $total_coloridas);

    return $totais;
}

function TabelaLocacoesMensaisMes() {
    $dao = new DadosMensaisDAO();
    $idLocacao = $_GET['idLocacao'];
    $idImpressora = $_GET['idImpressora'];
    $mes = $_GET['mes'];
    $ano = $_GET['ano'];
    $lista = $dao->getLocacoesMensaisMes($idLocacao, $idImpressora, $mes, $ano);

    if ($lista) {
        $i = 0;
        foreach ($lista as $item) {
            $idDadosMensaisLocacao = $item["idDadosMensaisLocacao"];
            $marca = $item["marca"];
            $modelo = $item["modelo"];
            $patrimonio = $item["patrimonio"];
            $numSerie = $item["numSerie"];
            $total_copias_absoluto_anterior = $item["total_copias_absoluto_anterior"];
            $total_copias_absoluto = $item["total_copias_absoluto"];
            $total_copias = $item["total_copias"];
            $total_digit = $item['total_digit'];
            !($i % 2) ? $bgColor = "bgColor='#B0C4DE'" : $bgColor = "bgColor='#F7F7F7'";
            $i++;

            echo '<tr ' . $bgColor . '>
                           <td>' . $idDadosMensaisLocacao . '</td>
                           <td>' . $marca . '</td>
                           <td>' . $modelo . '</td>
                           <td>' . $patrimonio . '</td>
                           <td>' . $numSerie . '</td>
                           <td>' . $total_copias_absoluto_anterior . '</td>
                           <td>' . $total_copias_absoluto . '</td>
                           <td>' . $total_copias . '</td>
                           <td>' . $total_digit . '</td>                           
                   </tr>';
        }
    }
}

function TabelaHistoricoLocacao() {
    $dao = new DadosMensaisDAO();
    $lista = $dao->getLocacoesMensais($_GET['idCliente']);

    if ($lista) {
        $i = 0;
        $flagMes = null;
        $flagAno = null;
        $idCliente = $_GET['idCliente'];
        $tipoCliente = $_GET['tipoCliente'];
        $total_copias_mes = 0;
        $first = 0;
        foreach ($lista as $item) {
            $idDadosMensaisLocacao = $item["idDadosMensaisLocacao"];
            $idImpressora = $item["idImpressora"];
            $marca = $item["marca"];
            $modelo = $item["modelo"];
            $patrimonio = $item["patrimonio"];
            $setor = $item["setor"];
            $numSerie = $item["numSerie"];
            $tipo = $item["tipo"];
            $tipo_impressao = $item["tipo_impressao"];
            $situacao = $item["situacao"];
            $mes = $item["mes"];
            $ano = $item["ano"];
            $total_copias_absoluto_anterior = $item["total_copias_absoluto_anterior"];
            $total_copias_absoluto = $item["total_copias_absoluto"];
            $total_copias = $item["total_copias"];
            $total_coloridas = $item["total_coloridas"];
            $total_digit = $item["total_digit"];
            $valor = $item["valor_total"];
            $valor_total = $item["valor_total"];
            




            //!($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
            $i++;

            if ($flagMes != $mes || $flagAno != $ano) {
                if($first)
                {     
                 echo '<tr '.$bgColor.'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
                 echo '<td><b>'.$total_copias_mes.'</b></td><td><b>'.$total_coloridas_mes.'</b></td><td></td><td></td><td>
                         <input style="border: 1px solid black;" class="botao" type="button" value="  Gerar relatório mensal  "
                           onclick="abrir(\'FormRelatorioAfericao.php?idCliente=' . $idCliente . '&tipoCliente=' . $tipoCliente . '&mes=' . $flagMes . '&ano=' . $flagAno . '\');" /></td></tr>';                 
                }
                $first=1;
                $total_copias_mes = 0;
                $total_coloridas_mes = 0;
                $flagMes = $mes;
                $flagAno = $ano;
                if ($bgColor == "bgColor='#F7F7F7'")$bgColor = "bgColor='#B0C4DE'";else $bgColor = "bgColor='#F7F7F7'";
                
                $valor = $item["valor_total"];
                $valor = "R$ " . number_format($valor, 3, ',', '.');
                if ($item["envioFaturamento"] != "00/00/0000")
                    $botaoFaturamento = "<strong>Enviado em " . $item["envioFaturamento"] . "</strong>";
                else
                    $botaoFaturamento = '<input style="border: 1px solid black;" class="botao" type="button" value="  Enviar Aferição Faturamento  "
                           onclick="abrir(\'FormPedidoLocacao.php?idCliente=' . $idCliente . '&tipoCliente=' . $tipoCliente . '&mes=' . $mes . '&ano=' . $ano . '&valor=' . $valor_total . '\');" />';
            } else {
                $valor = "";
                $botaoFaturamento = "";
            }

            echo '<tr ' . $bgColor . '>
                           <td>' . $idDadosMensaisLocacao . '</td>
                           <td>' . $idImpressora . '</td>    
                           <td>' . $marca . '</td>
                           <td>' . $modelo . '</td>
                           <td>' . $patrimonio . '</td>
                           <td>' . $setor . '</td>
                           <td>' . $numSerie . '</td>
                           <td>' . $tipo . '</td>
                           <td>' . $tipo_impressao . '</td>
                           <td>' . $mes . ' / ' . $ano . '</td>
                           <td>' . $total_copias_absoluto_anterior . '</td>
                           <td>' . $total_copias_absoluto . '</td>
                           <td>' . $total_copias . '</td>
                           <td>' . $total_coloridas . '</td>
                           <td>' . $total_digit . '</td>
                           <td>' . $valor . '</td>                           
                           <td>' . $botaoFaturamento . '</td>
                   </tr>';
            $total_copias_mes += $total_copias;
            $total_coloridas_mes += $total_coloridas;
        }
         echo '<tr '.$bgColor.'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
         echo '<td><b>'.$total_copias_mes.'</b></td><td><b>'.$total_coloridas_mes.'</b></td><td></td><td></td><td>
                 <input style="border: 1px solid black;" class="botao" type="button" value="  Gerar relatório mensal  "
                           onclick="abrir(\'FormRelatorioAfericao.php?idCliente=' . $idCliente . '&tipoCliente=' . $tipoCliente . '&mes=' . $flagMes . '&ano=' . $flagAno . '\');" /></td></tr>';
    
         
            }
}

function TabelaHistoricoLocacaoAfericao() {
    $dao = new DadosMensaisDAO();
    $lista = $dao->getLocacoesMensaisAfericao($_GET['idCliente'],$_GET["mes"],$_GET["ano"]);

    if ($lista) {
        $i = 0;
        $flagMes = null;
        $flagAno = null;
        $idCliente = $_GET['idCliente'];
        $tipoCliente = $_GET['tipoCliente'];
        $total_copias_mes = 0;
        $first = 0;
        foreach ($lista as $item) {
            $idDadosMensaisLocacao = $item["idDadosMensaisLocacao"];
            $idImpressora = $item["idImpressora"];
            $marca = $item["marca"];
            $modelo = $item["modelo"];
            $patrimonio = $item["patrimonio"];
            $setor = $item["setor"];
            $numSerie = $item["numSerie"];
            $tipo = $item["tipo"];
            $tipo_impressao = $item["tipo_impressao"];
            $situacao = $item["situacao"];
            $mes = $item["mes"];
            $ano = $item["ano"];
            $total_copias_absoluto_anterior = $item["total_copias_absoluto_anterior"];
            $total_copias_absoluto = $item["total_copias_absoluto"];
            $total_copias = $item["total_copias"];
            $total_coloridas = $item["total_coloridas"];
            $total_digit = $item["total_digit"];
            $valor = $item["valor_total"];
            $valor_total = $item["valor_total"];

            //!($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
            $i++;
            if ($flagMes != $mes || $flagAno != $ano) {
                if($first)
                {     
                 echo '<tr '.$bgColor.'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
                 echo '<td><b>'.$total_copias_mes.'</b></td><td><b>'.$total_coloridas_mes.'</b></td><td></td><td></td><td>
                         <input style="border: 1px solid black;" class="botao" type="button" value="  Gerar relatório mensal  "
                           onclick="abrir(\'FormRelatorioAfericao.php?idCliente=' . $idCliente . '&tipoCliente=' . $tipoCliente . '&mes=' . $flagMes . '&ano=' . $flagAno . '\');" /></td></tr>';                 
                }
                $first=1;
                $total_copias_mes = 0;
                $total_coloridas_mes =0;
                $flagMes = $mes;
                $flagAno = $ano;
                if ($bgColor == "bgColor='#F7F7F7'")$bgColor = "bgColor='#B0C4DE'";else $bgColor = "bgColor='#F7F7F7'";
                
                $valor = $item["valor_total"];
                $valor = "R$ " . number_format($valor, 3, ',', '.');
                if ($item["envioFaturamento"] != "00/00/0000")
                    $botaoFaturamento = "<strong>Enviado em " . $item["envioFaturamento"] . "</strong>";
                else
                    $botaoFaturamento = '<input style="border: 1px solid black;" class="botao" type="button" value="  Enviar Aferição Faturamento  "
                           onclick="abrir(\'FormPedidoLocacao.php?idCliente=' . $idCliente . '&tipoCliente=' . $tipoCliente . '&mes=' . $mes . '&ano=' . $ano . '&valor=' . $valor_total . '\');" />';
            } else {
                $valor = "";
                $botaoFaturamento = "";
            }

            echo '<tr ' . $bgColor . '>
                           <td>' . $idDadosMensaisLocacao . '</td>
                           <td>' . $idImpressora . '</td>    
                           <td>' . $marca . '</td>
                           <td>' . $modelo . '</td>
                           <td>' . $patrimonio . '</td>
                           <td>' . $setor . '</td>
                           <td>' . $numSerie . '</td>
                           <td>' . $tipo . '</td>
                           <td>' . $tipo_impressao . '</td>
                           <td>' . $mes . ' / ' . $ano . '</td>
                           <td>' . $total_copias_absoluto_anterior . '</td>
                           <td>' . $total_copias_absoluto . '</td>
                           <td>' . $total_copias . '</td>
                           <td>' . $total_coloridas . '</td>
                           <td>' . $total_digit . '</td>
                           <td>' . $valor . '</td>                                                      
                   </tr>';
            $total_copias_mes += $total_copias;
            $total_coloridas_mes += $total_coloridas;
        }
         echo '<tr '.$bgColor.'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
         echo '<td><b>'.$total_copias_mes.'</b></td><td><b>'.$total_coloridas_mes.'</b></td><td></td><td></td></tr>';
    
         
            }
}

function obtemRegistroAnterior($idImpressora, $mes, $ano) {
    $dao = new DadosMensaisDAO();
    return $dados = $dao->getRegistoAnterior($idImpressora, $mes, $ano);
}

function obtemDadosMensais($idLocacao, $idImpressora, $mes, $ano) {
    $dao = new DadosMensaisDAO();
    return $dados = $dao->getDadosMensais($idLocacao, $idImpressora, $mes, $ano);
}

function CRUDDadosMensais() {

    $dao = new dadosMensaisDAO();

    $idLocacao = $_GET['idLocacao'];
    $idImpressora = $_GET['idImpressora'];
    $mes = $_GET['mes'];
    $ano = $_GET['ano'];

    $tipo_impressao = $_POST['tipo_impressao'];
    $total_copias_absoluto_anterior = $_POST["total_copias_absoluto_anterior"];
    $total_copias_absoluto = $_POST["total_copias_absoluto"];
    $total_digit_absoluto_anterior = $_POST["total_digit_absoluto_anterior"];
    $total_digit_absoluto = $_POST["total_digit_absoluto"];
    $total_copias = $_POST["total_copias"];
    $total_coloridas = $_POST["total_coloridas"];
    $total_digit = $_POST["total_digit"];
    $total_copias_excedentes = $_POST["total_copias_excedentes"];
    $total_coloridas_excedentes = $_POST["total_coloridas_excedentes"];
    $total_digit_excedentes = $_POST["total_digit_excedentes"];
    $observacoes = $_POST["observacoes"];


    $valor_total = $_POST["valor_total"];

    if ($_GET['CRUD'] == "saveDadosMensais") {
        if($_GET['flagSubstituir'])
        {
           $daoImpressora = new ImpressoraDAO();
           $daoImpressora -> inserirImpressoraLocacao($_POST["impressora_substituicao"],$_GET['idLocacao']);
           
           $daoImpressora -> atualizarStatus($_POST["impressora_substituicao"],"Alugada");

           $daoImpressora -> removerImpressoraLocacao($idImpressora,$_GET['idLocacao']);
           $daoImpressora -> atualizarStatus($idImpressora,"À disposição"); 
        }
        $dao->atualizaValorTotalMes($idLocacao,$mes,$ano,$valor_total);
        if ($_GET['idDadosMensaisLocacao']) {
            $dao->atualizarDadosMensais($_GET['idDadosMensaisLocacao'], $idLocacao, $idImpressora, $total_copias_absoluto_anterior, $total_copias_absoluto, $total_copias,$total_coloridas, $total_digit_absoluto_anterior, $total_digit_absoluto, $total_digit, $total_copias_excedentes,$total_coloridas_excedentes, $total_digit_excedentes, $observacoes, $valor_total, $mes, $ano);
            //echo "passou";            
            echo '<span class="msg_crud">Atualizado com sucesso!</span>';
            ?><script>alert("Atualizado com sucesso!");</script><?php
        } else {
            $_GET['idDadosMensaisLocacao'] = $dao->inserirDadosMensais($idLocacao, $idImpressora, $total_copias_absoluto_anterior, $total_copias_absoluto, $total_copias,$total_coloridas, $total_digit_absoluto_anterior, $total_digit_absoluto, $total_digit, $total_copias_excedentes,$total_coloridas_excedentes, $total_digit_excedentes, $observacoes, $valor_total, $mes, $ano);
            $_GET['acao'] = "dados";
            //echo "passou2";
            echo '<span class="msg_crud">Inserido com sucesso!</span>';
            ?><script>alert("Inserido com sucesso!");</script><?php
        }
        ?><script>EnviaPopUp(<?php echo $_GET["idLocacao"]?>,"<?php echo $_GET["tipoCliente"]?>");</script><?php
    }

    $_GET['CRUD'] = null;
}
?>
             

