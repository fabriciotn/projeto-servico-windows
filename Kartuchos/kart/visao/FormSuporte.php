<?php
include("_templates/_templateCabecalho.php");
include("../controle/CtrlCliente.php");
include("../controle/CtrlSuporte.php");
include("../controle/CtrlImpressora.php");
?>
<script>
    function refreshPagina(id, tipo) {
        location.href = "formSuporte.php?idCliente=" + id + "&tipoCliente=" + tipo;
    }
    function refreshImpressora() {
        document.location.reload();
    }

    $(document).ready(function() {
        $('#calendarioData').click(function() {
            $(this).calendario({
                target: '#data',
                top: -100,
                left: -100
            });
        });
    });
</script>
</div></div></div>
<?php
if ($_GET['CRUD'])
    CRUDSuporte();
?>
<div id="sgi-conteudo">
    <div id="sgi-texto">
        <form name="form" id="form" method="post"  ENCTYPE="multipart/form-data">

            <div class="tipo_dados" style="text-align:center;">Cadastrar Chamado</div>
            <hr>
            <div id="cliente" style="width: 100%;">
                Código do Cliente:
                <input type="text" value="<?php echo $_GET['idCliente']; ?>" id="codCliente" />
                <input type="button" class="botao"  value="  ...  " onclick="abrir('dadosCliente.php');" />
                <?php
                if ($_GET['idCliente']) {
                    /*
                      $dadosLocacao = obtemLocacao($_GET['idCliente']);
                      if($dadosLocacao)
                      $_GET['idLocacao'] = $dadosLocacao['idLocacao'];
                     */
                    if ($_GET['tipoCliente'] == "PF") {
                        $dadosCliente = obtemClientePF($_GET['idCliente']);
                        ?>
                        <table>
                            <tr>
                                <td colspan="10">
                                    <div class="form-rotulo">Pessoa Física</div>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-rotulo">Nome:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['nome']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">CPF:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['cpf']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">Endereço Completo:</div>
                                    <div class="form-campos">
        <?php echo $dadosCliente['endereco'] . ", " . $dadosCliente['bairro'] . " - " . $dadosCliente['cidade'] . ", " . $dadosCliente['estado']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">Email:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['email']; ?></div>
                                </td>
                            </tr>
                        </table>
        <?php
    } else {
        $dadosCliente = obtemClientePJ($_GET['idCliente']);
        ?>
                        <table>
                            <tr>
                                <td colspan="10">
                                    <div class="form-rotulo">Pessoa Jurídica</div>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-rotulo">Nome Fantasia:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['nomeFantasia']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">Razão Social:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['razaoSocial']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">CNPJ:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['cnpj']; ?></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-rotulo">Inscrição Estadual:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['inscricaoEstadual']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">Responsável:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['responsavel']; ?></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-rotulo">Retenção ISS:</div>
                                    <div class="form-campos"><?php echo ( $dadosCliente['retencaoISS'] == 1 ? 'Sim' : 'Não' ); ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">Endereço Completo:</div>
                                    <div class="form-campos">
        <?php echo $dadosCliente['endereco'] . ", " . $dadosCliente['bairro'] . " - " . $dadosCliente['cidade'] . ", " . $dadosCliente['estado']; ?></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-rotulo">Telefone:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['telefone']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">E-Mail:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['email']; ?></div>
                                </td>
                                <td>
                                    <div class="form-rotulo">Limite de crédito:</div>
                                    <div class="form-campos"><?php echo $dadosCliente['limiteCredito']; ?></div>
                                </td>
                            </tr>
                        </table>

        <?php
    }
    if (!$_GET['status']) {
        ?>
                        <br><div class="tipo_dados" style="text-align:center;">Dados do Chamado</div>
                        <hr>
                        <table>
                        <?php
                        if ($_GET['idSuporte']) {
                            $dadosSuporte = obtemSuporte($_GET['idSuporte']);
                            ?>
                                <tr>
                                    <td><div class="form-rotulo">ID: </div>
                                        <div class="form-campos"><?php echo $dadosSuporte['idChamado']; ?></div></td>
                                    <td><div class="form-rotulo">Data de Abertura: </div>
                                        <div class="form-campos"><?php echo $dadosSuporte['data_abertura']; ?></div></td>                                   
                                    <td><div class="form-rotulo">Responsável: </div>
                                        <div class="form-campos"><?php echo $dadosSuporte['responsavel']; ?></div></td>
                                    <td><div class="form-rotulo">Equipamento: </div>
                                        <div class="form-campos"><?php echo $dadosSuporte['equipamento']; ?></div></td>
                                    <td><div class="form-rotulo">Patrimônio: </div>
                                        <div class="form-campos"><?php echo $dadosSuporte['patrimonio']; ?></div></td>
                                </tr>
                                <tr>                                    
                                    <td><div class="form-rotulo">Defeito Alegado: </div>
                                    <div class="form-campos"><?php echo $dadosSuporte['defeito_alegado']; ?></div></td>                                    
                                </tr>
                                <tr>                           
                                    <td colspan="10">
                                        <div class="form-rotulo">Técnico:</div>
                                        <div class="form-campos">
                                            <input style="width:300px;" value="<?php echo $dadosSuporte['tecnico']; ?>" maxlength="300" type="text" name="tecnico" id="tecnico"/>
                                        </div>
                                    </td>                                                           
                                </tr>
                                <tr>
                                    <td colspan="10">                                
                                        <div class="form-rotulo">Garantia:</div>
                                        <div class="form-campos">
                                            <select name='garantia' id='garantia'>
                                                <option value="<?php echo $dadosSuporte['garantia']; ?>"><?php echo $dadosSuporte['garantia']; ?></option>
                                                <option value='Sim'>Sim</option>
                                                <option value='Não'>Não</option>
                                                <option value='Inviabilidade de análise técnica no local. Laudo técnico em até 7 dias úteis.'>
                                                 Inviabilidade de análise técnica no local. Laudo técnico em até 7 dias úteis.</option>
                                            </select>                
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="10">
                                        <div class="form-rotulo">Defeito Constatado / Help Desk:</div>
                                        <div class="form-campos">
                                            <textarea style="width:700px;height:30px;" name="defeito_constatado" id="defeito_constatado"><?php echo $dadosSuporte['defeito_constatado']; ?></textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="10">
                                        <div class="form-rotulo">Solução:</div>
                                        <div class="form-campos">
                                            <textarea style="width:700px;height:30px;" name="solucao" id="solucao"><?php echo $dadosSuporte['solucao']; ?></textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="10">                                
                                        <div class="form-rotulo">Status:</div>
                                        <div class="form-campos">
                                            <select name='status' id='status'>                                                
                                                <option value='2'>Em atendimento</option>
                                                <option value='3'>Concluído</option>
                                                <option value='4'>Suspenso</option>
                                            </select>                
                                        </div>
                                    </td>
                                </tr>
                                </table>
                            <BR>
                            <div class="form-botoes">
                                <div class="form-botao-voltar">
                                    <a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
                                <div class="form-botao-voltar">
                                    <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&tipoCliente=<?php echo $_GET['tipoCliente']; ?>&idSuporte=<?php echo $_GET['idSuporte']; ?>&CRUD=save');" alt="Salvar" src="images/salvar.gif" /></a>
                                </div>
                            </div>
                                
            <?php
        } else {
            ?>
                                <tr>
                                    <td colspan="10">
                                        <div class="form-rotulo">(Novo Chamado)</div>
                                    </td>
                                </tr>
                                <tr>                           
                                    <td colspan="2">
                                        <div class="form-rotulo">Responsável:</div>
                                        <div class="form-campos">
                                            <input style="width:300px;" maxlength="300" type="text" name="responsavel" id="responsavel"/>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="form-rotulo">Marca e Modelo do Equipamento:</div>
                                        <div class="form-campos">
                                            <input style="width:300px;" maxlength="300" type="text" name="equipamento" id="equipamento"/>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="form-rotulo">Patrimônio:</div>
                                        <div class="form-campos">
                                            <input style="width:300px;" maxlength="300" type="text" name="patrimonio" id="patrimonio"/>
                                        </div>
                                    </td>                                    
                                    <!--<td colspan="2">
                                        <div class="form-rotulo">Caso houver, selecione a Impressora:</div>
                                        <div class="form-campos">
                                            <select name='idImpressora' id='idImpressora'>
                                                <option value=""> -- Selecione a Impressora -- </option>
                                            <?php// comboImpressora(); ?>                                
                                            </select>                
                                        </div>
                                    </td> -->                          
                                </tr>
                                <tr>
                                    <td colspan="10">
                                        <div class="form-rotulo">Defeito Alegado:</div>
                                        <div class="form-campos">
                                            <textarea style="width:700px;height:30px;" name="defeito_alegado" id="defeito_alegado"></textarea>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <BR>
                            <div class="form-botoes">
                                <div class="form-botao-voltar">
                                    <a href="javascript:window.history.go(-1)"><img alt="Voltar" src="images/voltar.gif" /></a>		</div>
                                <div class="form-botao-voltar">
                                    <a href="#"><img onClick="Envia('<?php echo $PHP_SELF; ?>?idCliente=<?php echo $_GET['idCliente']; ?>&tipoCliente=<?php echo $_GET['tipoCliente']; ?>&CRUD=save');" alt="Salvar" src="images/salvar.gif" /></a>
                                </div>
                            </div>
            <?php
        }
        ?>     

                </form>
                <br>
                <div class="tipo_dados" style="text-align:center;">Histórico de Chamados do Cliente</div>
                <hr>
                <div style="width: 100%;">
                    <table id="tabela" class="sortable">
                        <thead>
                            <tr class="header-list">
                                <th width="10" height="2" align="center">Nº</th>                                                                                  
                                <th width="150" style="vertical-align:text-bottom;" align="left">Impressora (Marca/Modelo/nº Série</th>
                                <th width="150" style="vertical-align:text-bottom;" align="left">Abertura</th>
                                <th width="300" style="vertical-align:text-bottom;" align="left">Defeito Alegado</th>
                                <th width="150" style="vertical-align:text-bottom;" align="center">Atendimento</th>
                                <th width="80" style="vertical-align:text-bottom;" align="center">Técnico</th>
                                <th width="250" style="vertical-align:text-bottom;" align="center">Defeito Constatado</th>
                                <th width="100" style="vertical-align:text-bottom;" align="center">Garantia</th>
                                <th width="300" style="vertical-align:text-bottom;" align="center">Solução</th>
                                <th width="150" style="vertical-align:text-bottom;" align="center">Fechamento</th>
                                <th width="50" style="vertical-align:text-bottom;" align="center">Status</th>
                            </tr>
                        </thead>
                        <tbody style="border-bottom: 1px solid black">
                        <?php TabelaHistoricoChamados();  ?>
                        </tbody>
                    </table>
                </div>
                <hr>
                <br>
                            <?php
                        }
                    } else {
                        ?>              
            <hr>
            <br>
            <?php
        }
        ?>

    </div>
    <br>
        <?php
        include("_templates/_templateRodape.php");
        ?>



