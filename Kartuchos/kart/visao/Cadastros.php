<?php
     include("_templates/_templateCabecalho.php");
     include("_templates/_templateCadastros.php");
     //include("../controle/CtrlCadastros.php")
?>
<script>
function Envia(idCliente)
{
        document.getElementById("form").action = "solicitacoes.php?idCliente="+idCliente;
        document.getElementById("form").submit();

}
</script>
<div id="sgi-conteudo">
<div id="sgi-texto">
            <div class="tipo_dados">Cadastros</div>
<span class="area_campo">
                        <br><br><br>
			   Você está acessando o módulo de Cadastros:
                           <br><br />
                           <table border="0px">
                           <tr>
                           <td valign="top">
                           <div class="tipo_dados">Cadastros de Produtos</div>
                                     <a href="formMaterial.php">Materiais</a><br /><br>
                                     <a href="formServico.php">Serviços</a><br /><br>
                           </td>
                           <td valign="top">
                           <div class="tipo_dados">Cadastros Internos</div>
                                     <a href="formFuncionario.php">Funcionários</a><br /><br>
                                     <a href="formEmpresa.php">Lojas</a><br /><br>
                                     <a href="formMotoboy.php">Motoboys</a><br /><br>
                                     <a href="ConversoesCategoria.php">Funções</a><br /><br>
                           </td>
                           <td valign="top">
                           <div class="tipo_dados">Cadastros Externos</div>
                                     <a href="formCliente.php">Cliente</a><br /><br>
                                     <a href="formFornecedor.php">Fornecedor</a><br /><br>
                                     <a href="ConversoesCategoria.php">Cliente com Acesso Externo
                           </td>
                           </tr>
                           </table>
        </form>
            <!-- end corpo //-->
        </div>
<!-- end tudo //-->
</div>
</div>
<?php
     include("_templates/_templateRodape.php");
?>



