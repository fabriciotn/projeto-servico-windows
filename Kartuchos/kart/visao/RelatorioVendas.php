<?php
    ob_start();
    session_start();

    $titulo1 = "Relatório de Vendas";
    require_once("_templates/_templateCabecalhoRelatorio.php");
    require_once("_templates/_templateCabecalhoRelatorioPDF.php");
    include("../controle/CtrlRelatorio.php");;

      if($_POST["dataInicio"] != "") $dataInicio = $_POST["dataInicio"]; else $dataInicio = date("d/m/Y");
      if($_POST["dataTermino"] != "") $dataTermino = $_POST["dataTermino"]; else $dataTermino = date("d/m/Y");

$filtro = '<div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <fieldset>
            <legend style="font-weight:bold;" border="0">Escolha os Filtros</legend>
                  <table class="filtro">
                   <tr>
                   <td>
                       <div class="form-rotulo2">Data Início:</div>
                   </td>
                   <td width="150px;">
	                   <div class="form-campos2">
                        <input style="width:100px;" maxlength="100" type="text" name="dataInicio" id="dataInicio" value="';
                        if($_POST['dataInicio']) $filtro .= $_POST['dataInicio']; else $filtro .= date("d/m/Y");
                    $filtro .= '"/>
                        <img class="alinhaImg" id="calendarioDataInicio" src="images/icons/calendario.png" />
                       </div>
                    </td>
                    <td>
                       <div class="form-rotulo2">Data Término:</div>
                    </td>
                    <td  width="150px;">
	                   <div class="form-campos2">
                        <input style="width:100px;" maxlength="100" type="text" name="dataTermino" id="dataTermino" value="';
                        if($_POST['dataTermino']) $filtro .= $_POST['dataTermino']; else $filtro .= date("d/m/Y");
                    $filtro .= '"/>
                        <img class="alinhaImg" id="calendarioDataTermino" src="images/icons/calendario.png" />
                       </div>
                    </td>
                    <td>
        		                <div class="form-rotulo2"><label for="vendedor">Vendedor:</label></div>
                    </td>
                    <td>
        		                <div class="form-campos2">
                                  <input style="text-align:left;width:300px;" maxlength="255" type="text"
                                  name="vendedor" id="vendedor" value="'.$_POST['vendedor'].'"/>
        		        </div>
        		        </td>
        		    </tr>
    		        <tr>
        		        <td>
        		                <div class="form-rotulo2">Código de barras:</div>
                        </td>
                        <td>
        		                <div class="form-campos2">
                                  <input style="text-align:left;width:100px;" maxlength="150" type="text"
                                  name="codigoBarras" id="codigoBarras" value="'.$_POST['codigoBarras'].'"/>
        		        </div>
        		        </td>
                        <td>
        		           <div class="form-rotulo2"><label for="cliente">Cliente:</label></div>
        		        </td>
                        <td>
        		                <div class="form-campos2">
                                  <input style="text-align:left;width:300px;" maxlength="255" type="text"
                                  name="cliente" id="cliente" value="'.$_POST['cliente'].'"/>
        		        </div>
        		        </td>
        		        <td>
        		                <div class="form-rotulo2"><label for="cliente">Gerar arquivo:&#160;&#160;&#160;</label></div>
                        </td>
                        <td>
        		                <div class="form-campos2">
                                  <a href="#"  onClick="Envia(\''.$PHP_SELF.'?tipoRelatorio=EXCEL\')"><img width="30px alt="Gerar em Excel" src="images/icons/excel_icon.png" /></a>
                                  &#160;&#160;&#160;
                                  <a href="#" onClick="Envia(\''.$PHP_SELF.'?tipoRelatorio=PDF\')"><img width="30px" alt="Gerar em PDF" src="images/icons/pdf_icon.png" /></a>
        		        </div>
        		        </td>
                    </tr>
                    <tr>
                    <td colspan="6" align="right">
                     <div class="form-botoes">
                      <div class="form-botao-voltar">
                        <br>
                        <img style="cursor: pointer;" onClick="Envia(\''.$PHP_SELF.'\')" alt="Salvar" src="images/botao_pesquisar.gif" />
                      </div>
                      </div>
                    </td>
                  </tr>
                  </table>
                  </fieldset>
                  <br>
                  <hr>
      </form>
               <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>';

$html = '<div class="tipo_dados" align="center">Vendas Realizadas de '.$dataInicio.' a '.$dataTermino.'</div>
          <table class="separate">
              <thead>
                <tr>
                       <th width="19px">Nº</th>
                       <th width="38px"> OS</th>
                       <th width="200px"> Cliente</th>
                       <th width="200px"> Descrição</th>
                       <th width="20px"> Código Barras</th>
                       <th width="20px"> Qde</th>
                       <th width="84px"> Preço Unitário (R$)</th>
                       <th width="80px"> Valor Total (R$)</th>
                       <th width="50px">Funcionário Vendas</th>
                       <th width="94px">Data Venda</th>
                       <th width="94px">Forma Pagamento</th>
                       <th width="38px">N.F.</th>
                       <th width="20px">Boleto | Data Vencimento</th>
                       <th width="94px">Empresa</th>
	                </tr>
                   </thead>
                   <tbody>';
                   $html .= RelatorioVendas2();
                   $html .= '</tbody>
            </table>

	</body>
	</html>';

    if($_GET['tipoRelatorio'] == "PDF")
    {
     ini_set("memory_limit","999M"); //vai expandir a memória do seu servidor para 10 Megas
     ini_set ("max_execution_time", "999");

     $pdf = $cabecalhoPDF.$html;
     //$html = ob_get_clean();
     require_once("mpdf54/mpdf.php");
     $mpdf=new mPDF();
     $mpdf=new mPDF('pt','A4-L',3,'',8,8,5,14,9,9,'P');
     $mpdf->allow_charset_conversion=true;
     $mpdf->charset_in='iso-8859-1';
     $mpdf->SetDisplayMode('fullpage');
     $mpdf->SetFooter('DATA: {DATE j/m/Y}     HORARIO: {DATE H:i}|SISTEMA KARTUCHOS|PAGINA:{PAGENO}/{nb}');
     $mpdf->WriteHTML($pdf);
     $mpdf->Output();
     //echo $html;
    }else if($_GET['tipoRelatorio'] == "EXCEL")
    {
     header("Content-type: application/vnd.ms-excel");
     header("Content-type: application/force-download");
     header ("Cache-Control: no-cache, must-revalidate");
     header ("Pragma: no-cache");
     header ("Content-Description: PHP Generated Data" );
     header("Content-Disposition: attachment; filename=RelatorioVendas.xls");

     echo $html;
    }else{
          echo $cabecalho;
          ?>
            <script>
             $(document).ready(function(){
                 $('#calendarioDataInicio').click(function(){
            		$(this).calendario({
            			target:'#dataInicio',
            			top:-150,
            			left:0
            		});
            	});

            	$('#calendarioDataTermino').click(function(){
            		$(this).calendario({
            			target:'#dataTermino',
            			top:-150,
            			left:0
            		});
            	});
            });
            </script>
            <?php
            
          echo $filtro.$html;
         }

?>
