<?php
    ob_start();
    session_start();

    $titulo1 = "Relat�rio de Estoque";
    require_once("_templates/_templateCabecalhoRelatorio.php");
    require_once("_templates/_templateCabecalhoRelatorioPDF.php");
    include("../controle/CtrlRelatorio.php");;

$filtro = '<div id="sgi-conteudo">
       <div id="sgi-texto">
       <form name="form" id="form" method="post" id="auto"  ENCTYPE="multipart/form-data">
            <fieldset>
            <legend style="font-weight:bold;" border="0">Escolha os Filtros</legend>
                  <table class="filtro">
                    <tr>
                    <td>
        		                <div class="form-rotulo2">Material:</div>
                    </td>
                    <td>
        		                <div class="form-campos2">
                                  <input style="text-align:left;width:300px;" maxlength="255" type="text"
                                  name="material" id="material" value="'.$_POST['material'].'"/>
        		        </div>
        		        </td>
                        <td>
        		                <div class="form-rotulo2">Consumo:</div>
                        </td>
                        <td>
        		                <div class="form-campos2">
                                <select name="flgConsumo" id="flgConsumo" class="style15">
			                    <option value=""></option>
			                    <option value="">Todos</option>
		                     	<option value="1">Sim</option>
			                    <option value="0">N�o</option>
		                        </select>
        		        </div>
        		        </td>
        		        <td>
        		                <div class="form-rotulo2">Gerar arquivo:&#160;&#160;&#160;</div>
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
                    <td colspan="4" align="right">
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

$html = '<div class="tipo_dados" align="center"> Relat�rio Estoque Abaixo Quantidade M�nima ( '.date("d/m/Y").' )</div>
          <table class="separate">
              <thead>
                <tr>
                       <th width="19px">N�</th>
                       <th width="50px">C�digo</th>
                       <th width="350px">Material</th>
                       <th width="100px">Pre�o Venda</th>
                       <th width="100px">Pre�o Revenda</th>
                       <th width="100px">Qde Comprada</th>
                       <th width="100px">Qde Utilizada</th>
                       <th width="100px">Saldo</th>
                       <th width="100px">Qde M�nima</th>
                       <th width="150px">Consumo M�dio (dia)</th>
	                </tr>
                   </thead>
                   <tbody>';
                   $html .= RelatorioEstoqueBaixo();
                   $html .= '</tbody>
            </table>

	</body>
	</html>';

    if($_GET['tipoRelatorio'] == "PDF")
    {
     ini_set("memory_limit","999M"); //vai expandir a mem�ria do seu servidor para 10 Megas
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
