<?php
include("../controle/CtrlCliente.php");
include("../controle/CtrlDadosMensaisLocacao.php");
include("../controle/CtrlLocacao.php");
include("../controle/CtrlImpressora.php");
?>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/ordenarTitulo.js"></script>
<script language="JavaScript" src="js/filtroGrid.js"></script>
<script language="JavaScript" src="js/funcoes.js"></script>
<link rel="stylesheet" type="text/css" href="css/itens.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/estrutura.css" media="screen">
<?php
$mes = $_GET['mes'];
$ano = $_GET['ano'];

if ($_GET['CRUD']) {
    CRUDDadosMensais();
}

$_GET['idCliente'] = $_GET['idLocacao'];

$dadosLocacao = obtemLocacao($_GET['idCliente']);

if ($_GET['tipoCliente'] == "dadosPF")
    obtemClientePF($_GET['idCliente']);
else if ($_GET['tipoCliente'] == "dadosPJ")
    obtemClientePJ($_GET['idCliente']);

if ($_GET['idImpressora']) {
    $dadosImpressora = obtemImpressora($_GET['idImpressora']);
    $dadosCopiaAnterior = obtemRegistroAnterior($_GET['idImpressora'], $mes, $ano);

    $total_copias_absoluto_anterior = $dadosCopiaAnterior['total_copias_absoluto'];
    $total_digit_absoluto_anterior = $dadosCopiaAnterior['total_digit_absoluto'];

    $total_copias_absoluto = $_POST['total_copias_absoluto'];
    $total_digit_absoluto = $_POST['total_digit_absoluto'];

    $dadosMensais = obtemDadosMensais($_GET['idLocacao'], $_GET['idImpressora'], $mes, $ano);
    $idDadosMensaisLocacao = $dadosMensais['idDadosMensaisLocacao'];
    if ($idDadosMensaisLocacao and !$total_copias_absoluto)
        $alteraImpressora = true;

    $totaisDadosMensaisMes = obtemLocacoesMensaisMes();

    if ($total_copias_absoluto || $dadosMensais['total_copias_absoluto']) {
        if (!$total_copias_absoluto)
            $total_copias_absoluto = $dadosMensais['total_copias_absoluto'];
        if ($idDadosMensaisLocacao)
            $total_copias_absoluto_anterior = $dadosMensais['total_copias_absoluto_anterior'];
        if (!$total_copias_absoluto_anterior)
            $total_copias_absoluto_anterior = $dadosImpressora['num_copias_inicial'];
        //$total_copias = $total_copias_absoluto - $total_copias_absoluto_anterior;
        //echo $totaisDadosMensaisMes["total_copias"];
        $total_copias_excedentes = $totaisDadosMensaisMes["total_copias"] - $dadosLocacao['franquia_compartilhada'];
        $total_coloridas_excedentes = $totaisDadosMensaisMes["total_coloridas"] - $dadosLocacao['franquia_colorida'];

        if ($dadosImpressora['tipo_impressao'] != "Colorida") {
            $total_copias = $total_copias_absoluto - $total_copias_absoluto_anterior;
            $total_copias_excedentes += $total_copias;
            //$valor_total = $dadosLocacao['valor'] + ($dadosLocacao['valor_copia_excedente'] * $total_copias_excedentes);
        } else {
            echo $total_coloridas = $total_copias_absoluto - $total_copias_absoluto_anterior;
            echo $total_coloridas_excedentes += $total_coloridas;
            //$total_coloridas = $total_copias;
            //$valor_total = $dadosLocacao['valor'] + ($dadosLocacao['valor_colorida'] * $total_coloridas_excedentes);            
        }

        if ($total_copias_excedentes < 0)
            $total_copias_excedentes = 0;
        if ($total_coloridas_excedentes < 0)
            $total_coloridas_excedentes = 0;

        $valor_total = $dadosLocacao['valor'] + ($dadosLocacao['valor_copia_excedente'] * $total_copias_excedentes) + ($dadosLocacao['valor_colorida'] * $total_coloridas_excedentes);
    }

    if ($total_digit_absoluto || $dadosMensais['total_digit_absoluto']) {
        if (!$total_digit_absoluto)
            $total_digit_absoluto = $dadosMensais['total_digit_absoluto'];
        if ($idDadosMensaisLocacao)
            $total_digit_absoluto_anterior = $dadosMensais['total_digit_absoluto_anterior'];
        if (!$total_digit_absoluto_anterior)
            $total_digit_absoluto_anterior = $dadosImpressora['num_digit_inicial'];
        $total_digit = $total_digit_absoluto - $total_digit_absoluto_anterior;

        $total_digit_impressoras += $total_digit;

        $total_digit_excedentes = ($total_digit_impressoras + $totaisDadosMensaisMes["total_digit"]) - ($dadosLocacao['franquia_compartilhada'] * ($dadosLocacao['bonus'] / 100));
        if ($total_digit_excedentes < 0)
            $total_digit_excedentes = 0;
        $valor_total = $valor_total + ($dadosLocacao['valor_digit_excedente'] * $total_digit_excedentes);
    }
    //calculaCopia($total_copias_absoluto,$dadosMensais['total_copias_absoluto']);
    //calculaDigitalizacao($total_digit_absoluto,$dadosMensais['total_digit_absoluto']);
}
?>
<script>
    function getID() {
        return <?php echo $_GET['idCliente']; ?>
    }
    function AtualizaCopias(total_anterior, total_atual, link)
    {
        if (parseInt(total_anterior) > parseInt(total_atual.value))
        {
            alert("Total atual deve ser maior que o total anterior!");
            total_atual.value = "";
            total_atual.focus();
        } else {
            document.getElementById("form").action = link;
            document.getElementById("form").submit();
        }

    }
</script>


<style>
    html{
        background: #ebebeb;
        background:-moz-linear-gradient(left, #ebebeb, #b3b3b3);
        background:-webkit-linear-gradient(left, #ebebeb, #b3b3b3);
        background:-o-linear-gradient(left, #ebebeb, #b3b3b3);
        background:-ms-linear-gradient(left, #ebebeb, #b3b3b3);
        background:linear-gradient(left, #ebebeb, #b3b3b3);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b3b3b3', endColorstr='#ebebeb',GradientType=1);
    }
</style>

<body>
    <div id="sgi-tudo">
        <div id="sgi-corpo">
            <div id="sgi-pagina">
                <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">
                    <div id="sgi-conteudo">
                        <div id="sgi-texto">
                            <div class="tipo_dados">Cadastro de Dados Mensais da Locação</div>
                            <br><br>
                            <div style="width: 100%;">
                                <table id="tabela" class="sortable">
                                    <thead>
                                        <tr class="header-list">
                                            <th width='80px' align='center'>Id</th>
                                            <th align='center'>Marca</th>
                                            <th width='150px' align='center'>Modelo</th>
                                            <th width='150px' align='center'>Patrimônio</th>
                                            <th width='150px' align='center'>Nº Série</th>
                                            <th width='250px' align='center'>Total Cópias Absoluto Anterior</th>
                                            <th width='150px' align='center'>Total Cópias Absoluto</th>
                                            <th width='150px' align='center'>Total Cópias Preta</th>
                                            <th width='150px' align='center'>Total Digitalização</th>
                                        </tr>
                                    </thead>
                                    <tbody style="border-bottom: 1px solid black">
<?php TabelaLocacoesMensaisMes(); ?>
                                    </tbody>
                                </table>
                            </div>
                            <table>
                                <?php
                                if ($_GET["flagSubstituir"]) {
                                    ?>  
                                    <tr><td colspan="3">
                                            <div class="form-rotulo">Selecione a Impressora que irá substituí-la:</div>
                                            <div class="form-campos">
                                                <select name='impressora_substituicao' id='impressora_substituicao'>
                                                    <?php
                                                    if ($_POST['impressora_substituicao']) {
                                                        $dadosImpressoraSubstituicao = obtemImpressora($_POST['impressora_substituicao']);
                                                        echo "<option value='" . $dadosImpressoraSubstituicao["idImpressora"] . "'>" . $dadosImpressoraSubstituicao["marca"] . " / " . $dadosImpressoraSubstituicao["modelo"] . " ( " . $dadosImpressoraSubstituicao["patrimonio"] . " ) </option>";
                                                    }
                                                    ComboImpressorasSubstituicao();
                                                    ?>                                
                                                </select>

                                            </div>
                                        </td></tr>
                                    <?php
                                }
                                ?>

                                <tr>
                                    <td colspan="10">
                                        <div class="form-rotulo">ID: <?php echo $_GET['idCliente']; ?><BR></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="300px">
                                        <div class="form-rotulo">Impressora (patrimônio):</div>
                                        <div class="form-campos"><?php echo $dadosImpressora["idImpressora"] . " - " . $dadosImpressora["marca"] . " | " . $dadosImpressora["modelo"] . "  -  ( " . $dadosImpressora["patrimonio"] . " ) "; ?></div>
                                    </td>
                                    <td width="300px">
                                        <div class="form-rotulo">Mês / Ano:</div>
                                        <div class="form-campos"><?php
                                            echo $mes . " / " . $ano;
                                            ;
                                            ?></div>
                                    </td>
                                    <td width="300px">
                                        <div class="form-rotulo">Franquia Compartilhada Preta:</div>
                                        <div class="form-campos">
                                            <?php
                                            echo $dadosLocacao['franquia_compartilhada'] . " páginas/ R$ " . $dadosLocacao['valor'];
                                            ;
                                            ?></div>
                                    </td>                                                                  
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Valor Cópia Preta Excedente:</div>
                                        <div class="form-campos"><?php echo $dadosLocacao['valor_copia_excedente']; ?></div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Valor Digitalização Excedente:</div>
                                        <div class="form-campos"><?php echo $dadosLocacao['valor_digit_excedente']; ?></div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Franquia Digitalização:</div>
                                        <div class="form-campos">
<?php echo ($dadosLocacao['franquia_compartilhada'] * ($dadosLocacao['bonus'] / 100)) . " digitalizações"; ?> 
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Total Impressões Mês:</div>
                                        <div class="form-campos"><?php echo $total_copias; ?></div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Total Digitalizações Mês:</div>
                                        <div class="form-campos"><?php
                                            echo $total_digit_impressoras;
                                            ;
                                            ?></div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Valor Cópia Colorida:</div>
                                        <div class="form-campos">
<?php echo $dadosLocacao['valor_colorida']; ?></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Total Absoluto Impressões Anterior:</div>
                                        <div class="form-campos"><?php
                                            if ($idDadosMensaisLocacao) {
                                                $total_copias_absoluto_anterior = $dadosMensais['total_copias_absoluto_anterior'];
                                            }

                                            if (!$total_copias_absoluto_anterior)
                                                $total_copias_absoluto_anterior = $dadosImpressora['num_copias_inicial'];

                                            echo $total_copias_absoluto_anterior;
                                            ?>
                                            <input type="hidden" name="total_copias_absoluto_anterior" id="total_copias_absoluto_anterior" value="<?php echo $total_copias_absoluto_anterior; ?>"/>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Total Absoluto Digitalizações Anterior:</div>
                                        <div class="form-campos">
                                            <?php
                                            if ($idDadosMensaisLocacao)
                                                $total_digit_absoluto_anterior = $dadosMensais['total_digit_absoluto_anterior'];

                                            if (!$total_digit_absoluto_anterior)
                                                $total_digit_absoluto_anterior = $dadosImpressora['num_digit_inicial'];

                                            echo $total_digit_absoluto_anterior;
                                            ?>

                                            <input type='hidden' name='total_digit_absoluto_anterior' id='total_digit_absoluto_anterior' value='<?php echo $total_digit_absoluto_anterior; ?>'/>
                                        </div>
                                    </td>
                                    <td width="300px">
                                        <div class="form-rotulo">Franquia Impressão Colorida:</div>
                                        <div class="form-campos">
                                            <?php
                                            echo $dadosLocacao['franquia_colorida'] . " páginas";
                                            ;
                                            ?></div>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Total Absoluto Impressões Atual:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_copias_absoluto" id="total_copias_absoluto" 
                                                   onChange='AtualizaCopias("<?php echo $total_copias_absoluto_anterior; ?>", this, "dadosMensaisLocacao.php?idLocacao=<?php echo $_GET['idLocacao']; ?>&idImpressora=<?php echo $_GET['idImpressora']; ?>&mes=<?php echo $mes; ?>&ano=<?php echo $ano; ?>&flagSubstituir=<?php echo $_GET['flagSubstituir']; ?>")'
                                                   <?php
                                                   if ($alteraImpressora)
                                                       echo "value='" . $dadosMensais['total_copias_absoluto'] . "'";
                                                   else
                                                       echo "value='" . $total_copias_absoluto . "'";
                                                   ?>
                                                   />            
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Total Absoluto Digitalizações:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_digit_absoluto" id="total_digit_absoluto" 
                                                   onChange='AtualizaCopias("<?php echo $total_digit_absoluto_anterior; ?>", this, "dadosMensaisLocacao.php?idLocacao=<?php echo $_GET['idLocacao']; ?>&idImpressora=<?php echo $_GET['idImpressora']; ?>&mes=<?php echo $mes; ?>&ano=<?php echo $ano; ?>&flagSubstituir=<?php echo $_GET['flagSubstituir']; ?>")'
                                                   <?php
                                                   if ($alteraImpressora)
                                                       echo "value='" . $dadosMensais['total_digit_absoluto'] . "'";
                                                   else
                                                       echo "value='" . $total_digit_absoluto . "'";
                                                   ?>
                                                   />   
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Total de Impressões Preta:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_copias" id="total_copias"
                                            <?php
                                            /*if ($alteraImpressora)
                                                echo "value='" . $dadosMensais['total_copias'] . "'";
                                            else   */
                                                echo "value='" . $total_copias . "'";
                                            ?>
                                                   />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Total de Digitalizações:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_digit" id="total_digit"
                                            <?php
                                            /*if ($alteraImpressora)
                                                echo "value='" . $dadosMensais['total_digit'] . "'";
                                            else */
                                                echo "value='" . $total_digit . "'";
                                            ?>
                                                   />
                                        </div>
                                    </td> 
                                    <td>
                                        <div class="form-rotulo">Total Coloridas:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_coloridas" id="total_coloridas"
                                            <?php
                                            /*if ($alteraImpressora)
                                                echo "value='" . $dadosMensais['total_coloridas'] . "'";
                                            else*/
                                                echo "value='" . $total_coloridas . "'";
                                            ?>
                                                   />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Total Impressões Pretas Excedentes:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_copias_excedentes" id="total_copias_excedentes"
                                            <?php
                                            /*if ($alteraImpressora)
                                                echo "value='" . $dadosMensais['total_copias_excedentes'] . "'";
                                            else */
                                                echo "value='" . $total_copias_excedentes . "'";
                                            ?>
                                                   />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Total Digitalizações Excedentes:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_digit_excedentes" id="total_digit_excedentes"
                                            <?php
                                            /*if ($alteraImpressora)
                                                echo "value='" . $dadosMensais['total_digit_excedentes'] . "'";
                                            else    */
                                                echo "value='" . $total_digit_excedentes . "'";
                                            ?>      
                                                   />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-rotulo">Total Coloridas Excedentes:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="total_coloridas_excedentes" id="total_coloridas_excedentes"
                                            <?php
                                           /* if ($alteraImpressora)
                                                echo "value='" . $dadosMensais['total_coloridas_excedentes'] . "'";
                                            else    */
                                                echo "value='" . $total_coloridas_excedentes . "'";
                                            ?>      
                                                   />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-rotulo">Valor Total:</div>
                                        <div class="form-campos">
                                            <input style="width:150px;" maxlength="100" type="text" name="valor_total" id="valor_total" 
                                            <?php
                                            if (!$valor_total)
                                                echo "value='" . $dadosMensais['valor_total'] . "'";
                                            else
                                                echo "value='" . $valor_total . "'";
                                            ?>
                                                   />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="200">
                                        <div class="form-rotulo">Observações:</div>
                                        <div class="form-campos">
                                            <textarea style="width:700px;height:50px;" name="observacoes" id="observacoes"><?php echo $dadosMensais['observacoes']; ?></textarea>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <BR>
                            <div class="form-botoes">
                                <div class="form-botao-voltar">
                                    <a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
                                <div class="form-botao-voltar">
                                    <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idDadosMensaisLocacao=<?php echo $idDadosMensaisLocacao; ?>&idLocacao=<?php echo $_GET['idLocacao']; ?>&tipoCliente=<?php echo $_GET['tipoCliente']; ?>&idImpressora=<?php echo $_GET['idImpressora']; ?>&mes=<?php echo $mes; ?>&ano=<?php echo $ano; ?>&flagSubstituir=<?php echo $_GET['flagSubstituir']; ?>&CRUD=saveDadosMensais');" alt="Salvar" src="images/salvar.gif" /></a>
                                </div>
                            </div>
                            </form>            <!-- end corpo //-->
