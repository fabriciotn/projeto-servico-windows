<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateFinanceiro.php");
     include("../controle/CtrlSuporte.php");
?>
<script>
$(document).ready(function() {

    $('#tabelaGrid1').fixedHeaderTable({ footer: true, altClass: 'odd' });
    $('#tabelaGrid2').fixedHeaderTable({ footer: true, altClass: 'odd' });
   // $('#tabela').fixedHeaderTable({ footer: true, altClass: 'odd' });

});
</script>
<div id="sgi-conteudo">
<div id="sgi-texto">
            <div class="tipo_dados">Financeiro</div>
            <span class="area_campo">
                        <br><br><br>
			            Você está acessando o módulo Financeiro:
                           <br><br />
                           <table width="95%" align="center" border="0px">
                    <tr><td colspan="10"/>
                    <table>
                        <tr>
                            <td>Data de Abertura</td>
                            <td style="width:80px;">
                                <div class="form-rotulo">Data Início:</div>
                                <div class="form-campos">
                                    <input style="width:80px;" maxlength="100" type="text" name="dataInicio" id="dataInicio" value="<?php if($_POST['dataInicio']) echo $_POST['dataInicio']; else echo date("d/m/Y");?>" />
                                </div>
                            </td>
                            <td><img id="calendarioDataInicio" src="images/icons/calendario.png" /></td>
                            <td style="width:80px;">
                                <div class="form-rotulo">Data Término:</div>
                                <div class="form-campos">
                                    <input style="width:80px;" maxlength="100" type="text" name="dataTermino" id="dataTermino" value="<?php if($_POST['dataTermino']) echo $_POST['dataTermino']; else echo date("d/m/Y");?>" />
                                </div>
                            </td>
                            <td><img id="calendarioDataTermino" src="images/icons/calendario.png" /></td>
                            <td align="right">
                                <div class="form-botoes">
                                    <div class="form-botao-voltar">
                                        <br>
                                        <img style="cursor: pointer;" onClick="Envia('<?php echo $PHP_SELF; ?>?status=<?php echo $_GET['status'];?>');" alt="Salvar" src="images/botao_pesquisar.gif" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table></td></tr>
                    <tr>
                        <td>
                            <input class="botao" style="padding:10px;<?php if($_GET['status']==1) echo "background:orange";?>" type="button" onClick="Envia('<?php echo $PHP_SELF; ?>?status=1');" value="Em Aberto"/>
                            <input class="botao" style="padding:10px;<?php if($_GET['status']==2) echo "background:orange";?>" type="button" onClick="Envia('<?php echo $PHP_SELF; ?>?status=2');" value="Em Atendimento"/>
                            <input class="botao" style="padding:10px;<?php if($_GET['status']==3) echo "background:orange";?>" type="button" onClick="Envia('<?php echo $PHP_SELF; ?>?status=3');" value="Concluídos"/>
                            <input class="botao" style="padding:10px;<?php if($_GET['status']==4) echo "background:orange";?>" type="button" onClick="Envia('<?php echo $PHP_SELF; ?>?status=4');" value="Suspensos"/>
                            <input class="botao" style="padding:10px;<?php if($_GET['status']=="null") echo "background:orange";?>" type="button" onClick="Envia('<?php echo $PHP_SELF; ?>?status=null');" value="Todos"/>
                        </td>
                        <td align="right"><input class="botao" onClick="Envia('FormSuporte.php');" style="padding:10px" type="button" value="Novo Chamado"/></td>
                    </tr>
                    </table>
                           
                           <div class="grid" style="width: 98%; height: 400px;">
                                <table id="tabela" class="sortable"  width="100%">
                                    <thead>
                                        <tr class="header-list">
                                            <th width="10" height="2" align="center">Nº</th>
                                            <th width="200" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>Cliente</th>
                                            <th width="150" style="vertical-align:text-bottom;" align="left"><input type="text" id="txtColuna3"/>Equipamento</th>
                                            <th width="150" style="vertical-align:text-bottom;" align="left"><input type="text" id="txtColuna3"/>Patrimônio</th>
                                            <th width="150" style="vertical-align:text-bottom;" align="left"><input type="text" id="txtColuna3"/>Abertura</th>
                                            <th width="300" style="vertical-align:text-bottom;" align="left"><input type="text" id="txtColuna3"/>Defeito Alegado</th>
                                            <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>Atendimento</th>
                                            <th width="80" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>tecnico</th>
                                            <th width="250" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>Defeito Constatado</th>
                                            <th width="100" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>Garantia</th>
                                            <th width="300" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>Solução</th>
                                            <th width="150" style="vertical-align:text-bottom;" align="center"><input type="text" id="txtColuna3"/>Fechamento</th>
                                            <th width="50" style="vertical-align:text-bottom;" align="center">Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody style="border-bottom: 1px solid black">
                                        <?php TabelaSuportes(); ?>                                   </tbody>

                                </table>
                            </div>
                           
                           
        </form>
            <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<script>
$(document).ready(function() {

    $('#tabelaGrid1').fixedHeaderTable({ footer: true, altClass: 'odd' });
    $('#tabelaGrid2').fixedHeaderTable({ footer: true, altClass: 'odd' });
    $('#tabela').fixedHeaderTable({ footer: true, altClass: 'odd' });

});
</script>
<?php
     include("_templates/_templateRodape.php");
?>



