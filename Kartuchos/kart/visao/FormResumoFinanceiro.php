<?php
     include("_templates/_templateCabecalho.php");
     include("../controle/CtrlResumoFinanceiro.php");
     
     verificaAcesso(22, $_SESSION["cod"]);
     
if(isset($_POST["mesInicio"]))
	$mesInicio = $_POST["mesInicio"];
else
	$mesInicio = date("m");

if(isset($_POST["anoInicio"]))
	$anoInicio = $_POST["anoInicio"];
else
	$anoInicio = date("Y");

if(isset($_POST["mesTermino"]))
	$mesTermino = $_POST["mesTermino"];
else
	$mesTermino = date("m");

if(isset($_POST["anoTermino"]))
	$anoTermino = $_POST["anoTermino"];
else
	$anoTermino = date("Y");
?>
</div></div></div>
  <div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <div class="tipo_dados" align="center">Resumo Financeiro</div>
                 <br>
                 <hr>
                 <br>
                  <table>
                  <tr>
                    <td width="150px">
                       <div class="form-rotulo">Data Início:</div>
                    </td><td width="450px">
	                   <div class="form-campos">
                        <select name="mesInicio" id="mesInicio">
                        	<option value="1" <?php if($mesInicio == "1") echo "selected"; ?>>Janeiro</option>
                            <option value="2" <?php if($mesInicio == "2") echo "selected"; ?>>Fevereiro</option>
                            <option value="3" <?php if($mesInicio == "3") echo "selected"; ?>>Março</option>
                            <option value="4" <?php if($mesInicio == "4") echo "selected"; ?>>Abril</option>
                            <option value="5" <?php if($mesInicio == "5") echo "selected"; ?>>Maio</option>
                            <option value="6" <?php if($mesInicio == "6") echo "selected"; ?>>Junho</option>
                            <option value="7" <?php if($mesInicio == "7") echo "selected"; ?>>Julho</option>
                            <option value="8" <?php if($mesInicio == "8") echo "selected"; ?>>Agosto</option>
                            <option value="9" <?php if($mesInicio == "9") echo "selected"; ?>>Setembro</option>
                            <option value="10" <?php if($mesInicio == "10") echo "selected"; ?>>Outubro</option>
                            <option value="11" <?php if($mesInicio == "11") echo "selected"; ?>>Novembro</option>
                            <option value="12" <?php if($mesInicio == "12") echo "selected"; ?>>Dezembro</option>
                        </select>
                    	M&ecirc;s&nbsp;
                        <select name="anoInicio" id="anoInicio">
                        	<option value="<?php echo date('Y')-3; ?>" <?php if($anoInicio == (date('Y')-3)) echo "selected"; ?>><?php echo date('Y')-3; ?></option>
                            <option value="<?php echo date('Y')-2; ?>" <?php if($anoInicio == (date('Y')-2)) echo "selected"; ?>><?php echo date('Y')-2; ?></option>
                            <option value="<?php echo date('Y')-1; ?>" <?php if($anoInicio == (date('Y')-1)) echo "selected"; ?>><?php echo date('Y')-1; ?></option>
                            <option value="<?php echo date('Y'); ?>" <?php if($anoInicio == (date('Y'))) echo "selected"; ?>><?php echo date('Y'); ?></option>
                            <option value="<?php echo date('Y')+1; ?>" <?php if($anoInicio == (date('Y')+1)) echo "selected"; ?>><?php echo date('Y')+1; ?></option>
                            <option value="<?php echo date('Y')+2; ?>" <?php if($anoInicio == (date('Y')+2)) echo "selected"; ?>><?php echo date('Y')+2; ?></option>
                            <option value="<?php echo date('Y')+3; ?>" <?php if($anoInicio == (date('Y')+3)) echo "selected"; ?>><?php echo date('Y')+3; ?></option>
                        </select>
                        Ano
                       </div>
                    </td>
                    </tr>
                    <tr>
                    <td width="150px">
                       <div class="form-rotulo">Data Término:</div>
                       </td><td width="450px">
	                   <div class="form-campos">
                        <select name="mesTermino" id="mesTermino">
                        	<option value="1" <?php if($mesTermino == "1") echo "selected"; ?>>Janeiro</option>
                            <option value="2" <?php if($mesTermino == "2") echo "selected"; ?>>Fevereiro</option>
                            <option value="3" <?php if($mesTermino == "3") echo "selected"; ?>>Março</option>
                            <option value="4" <?php if($mesTermino == "4") echo "selected"; ?>>Abril</option>
                            <option value="5" <?php if($mesTermino == "5") echo "selected"; ?>>Maio</option>
                            <option value="6" <?php if($mesTermino == "6") echo "selected"; ?>>Junho</option>
                            <option value="7" <?php if($mesTermino == "7") echo "selected"; ?>>Julho</option>
                            <option value="8" <?php if($mesTermino == "8") echo "selected"; ?>>Agosto</option>
                            <option value="9" <?php if($mesTermino == "9") echo "selected"; ?>>Setembro</option>
                            <option value="10" <?php if($mesTermino == "10") echo "selected"; ?>>Outubro</option>
                            <option value="11" <?php if($mesTermino == "11") echo "selected"; ?>>Novembro</option>
                            <option value="12" <?php if($mesTermino == "12") echo "selected"; ?>>Dezembro</option>
                    </select>
                    M&ecirc;s&nbsp;
                    <select name="anoTermino" id="anoTermino" class="style15">
                        	<option value="<?php echo date('Y')-3; ?>" <?php if($anoTermino == (date('Y')-3)) echo "selected"; ?>><?php echo date('Y')-3; ?></option>
                            <option value="<?php echo date('Y')-2; ?>" <?php if($anoTermino == (date('Y')-2)) echo "selected"; ?>><?php echo date('Y')-2; ?></option>
                            <option value="<?php echo date('Y')-1; ?>" <?php if($anoTermino == (date('Y')-1)) echo "selected"; ?>><?php echo date('Y')-1; ?></option>
                            <option value="<?php echo date('Y'); ?>" <?php if($anoTermino == (date('Y'))) echo "selected"; ?>><?php echo date('Y'); ?></option>
                            <option value="<?php echo date('Y')+1; ?>" <?php if($anoTermino == (date('Y')+1)) echo "selected"; ?>><?php echo date('Y')+1; ?></option>
                            <option value="<?php echo date('Y')+2; ?>" <?php if($anoTermino == (date('Y')+2)) echo "selected"; ?>><?php echo date('Y')+2; ?></option>
                            <option value="<?php echo date('Y')+3; ?>" <?php if($anoTermino == (date('Y')+3)) echo "selected"; ?>><?php echo date('Y')+3; ?></option>
                    </select>
                    Ano
                       </div>
                    </td>
                    </tr>
                    <tr>
                    <td></td><td></td>
                    <td align="left">
                     <div class="form-botoes">
                      <div class="form-botao-voltar">
                        <br>
                        <img style="cursor: pointer;" onClick="Envia('<?php echo $PHP_SELF; ?>?CRUD=null');" alt="Salvar" src="images/botao_pesquisar.gif" />
                      </div>
                      </div>
                    </td>
                  </tr>
                  </table>
                  <br>
                  <hr>
                  <br>
                          <table class="sortable" width="95%">
                            <thead>
                             <tr class="header-list">
                                 <th width="10" height="2" align="center">Nº</th>
                                 <th width="500" style="vertical-align:text-bottom;" align="left">Período</th>
                                 <th width="350" style="vertical-align:text-bottom;" align="left">Valor Previsto a Receber</th>
                                 <th width="250" style="vertical-align:text-bottom;" align="center">Valor Recebido</th>
                                 <th width="350" style="vertical-align:text-bottom;" align="left">Valor Previsto a Pagar</th>
                                 <th width="250" style="vertical-align:text-bottom;" align="center">Valor Pago</th>

                             </tr>
                            </thead>
                            <tbody style="border-bottom: 1px solid black">
                                   <?php TabelaResumoFinanceiro(); ?>
                            </tbody>
                          </table>
                      <BR>
      </form>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



