<%-- 
    Document   : controleDeEntrega
    Created on : 18/10/2013, 19:14:47
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="ValidaSessao.jsp" %>

<!DOCTYPE HTML">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <script type="text/javascript">
            var conta = 0;

            function novaLinha() {
                conta++;

                var parte1 = "<tr><td>" + document.getElementById("amostra").value + "</td>";
                var parte2 = "<td>" + document.getElementById("motivo").value + "</td>";
                var parte3 = "<td>" + document.getElementById("hemocomponente").value + "</td>";
                var parte4 = "<td>" + document.getElementById("destino").value + "</td>";
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

        <title>Fracionamento - Controle de Entrega</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <div>
                <a href="sair.jsp">Logoff</a>
            </div>
            <!Listagem do Menu!>
            <div id="menu">
                <ul>
                    <li><a href="coleta.jsp">Coleta</a></li>
                    <li><a href="reacoes.jsp">Reações Adversas</a></li>
                    <li><a href="fracionamento.jsp">Fracionamento</a></li>
                    <li><a href="relatorios.jsp">Relatórios</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2>Fracionamento - CONTROLE DE ENTREGA</h2>

                <form method="post" action="#">
                    <div>
                        <label for="amostra">Amostra</label>
                        <input type="text" name="amostra" id="amostra"><br>
                    </div>

                    <div>
                        <label for="motivo">Motivo</label>
                        <select id="motivo">
                            <option>Controle Mensal</option>
                            <option>Liberação</option>
                            <option>Procedimentos especiais</option>
                            <option>PAI Pos.</option>
                            <option>Verificação Swirling</option>
                            <option>Hemovigilância</option>
                            <option>Hemocomponente para análise</option>
                            <option>Plasma com sorologia +</option>
                        </select>
                    </div>

                    <div>
                        <label for="hemocomponente">Hemocomponente</label>
                        <select id="hemocomponente">
                            <option>CHM</option>
                            <option>PQ</option>
                            <option>PFC</option>
                            <option>OUTRO</option>
                        </select>
                    </div>

                    <div>
                        <label for="destino">Enviado Para</label>
                        <select id="destino">
                            <option>Laboratório de Imuno</option>
                            <option>Laboratório de hematologia</option>
                            <option>Laboratório de sorologia</option>
                            <option>Laboratório de CQ</option>
                            <option>Distribuição</option>
                        </select>
                    </div>

                    <div>
                        <input type="button" value="Inserir" onClick="javascript:novaLinha();">
                    </div>
                </form>

                <div>
                    <table id="tabela_produto" border="1">
                        <tr>
                            <td>Amostra</td>
                            <td>Motivo</td>
                            <td>Hemocomponente</td>
                            <td>Enviado Para</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
