<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateConfiguracoes.php");
     include("../controle/acessoExterno.php")
?>
<div id="sgi-conteudo">
<div id="sgi-texto">
            <div class="tipo_dados">Configura��es</div>
<span class="area_campo">
                           <br><br><br>
			               Voc� est� acessando o m�dulo de Configura��es:
                           <br><br />
                           Os clientes associados a seu login s�o:
                           <table style="width: 100%;" class="tablesorter" id="tabela">
                           <thead>
        	               <tr class="header-list">
        		               <th style="text-align: left; width: 20px;">C�digo</th>
                               <th style="text-align: left; width: 300px;">Nome</th>
        		               <th style="text-align: left; width: 300px;">CPF / CNPJ</th>
        	                </tr>
                           </thead>
                           <tbody style="border-bottom: 1px solid black">
                           <?php TabelaItemAcessoExterno();?>
                           </tbody>
                            </table>
                            <script>
                            $(document).ready(function() {
                            $('table#tabela').columnFilters({alternateRowClassNames:['rowa','rowb'], excludeColumns:[6]});
                            $('#tabela').tablesorter( {sortList: [[0,0], [0,0]]} );
                            });
                            </script>
            <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



