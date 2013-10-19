<%-- 
    Document   : newjsp
    Created on : 18/10/2013, 18:29:42
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            var conta = 0;

            function novaLinha() {
                conta++;

                var parte1 = "<tr><td>" + document.getElementById("amostra").value + "</td>";
                var parte2 = "<td>" + document.getElementById("teste1").value + "</td>";
                var parte3 = "<td>" + document.getElementById("teste2").value + "</td>";
                var parte4 = "<td>" + document.getElementById("teste3").value + "</td>";
                var parte5 = "<td id='tabela_linha_" + conta + "'><input type='button' ";
                var parte6 = "value='remover' onClick=\"javascript:removeLinha('tabela_linha_" + conta + "')\"></input>";

                document.getElementById("tabela_produto").innerHTML += parte1 + parte2 + parte3 + parte4 + parte5 + parte6;
                document.getElementById("tabela_produto").innerHTML += "</td></tr>";

            }

            function removeLinha(id) {
                teste = document.getElementById(id);
                teste.parentNode.parentNode.removeChild(teste.parentNode);
            }

        </script>
    </head>
    <body>
        <form>
            <label for="amostra">Amostra</label>
            <input type="text" name="amostra" id="amostra"><br>
            
            <label for="teste1">teste1</label>
            <select id="teste1">
                <option>asdf</option>
                <option>123</option>
            </select>
            
            <label for="teste2">teste2</label>
            <input type="text" name="teste2" id="teste2"><br>
            
            <label for="teste3">teste3</label>
            <input type="text" name="teste3" id="teste3"><br>
            
            <input type="button" value="Inserir" onClick="javascript:novaLinha();"></input>
        </form>


        <form>
            <table id="tabela_produto" border="1">
                <tr>
                    <td>Amostra</td>
                    <td>Motivo</td>
                    <td>Hemocomponente</td>
                    <td>Enviado Para</td>
                </tr>
            </table>
        </form>
    </body>
</html>