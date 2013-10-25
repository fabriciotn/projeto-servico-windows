<%-- 
    Document   : triagemClinica
    Created on : 15/10/2013, 10:05:35
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="ValidaSessao.jsp" %>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <script>
            function validarTubos() {
                amostra = document.f1.amostra.value;
                tubo2 = document.f1.tuboSorologia1.value;
                tubo3 = document.f1.tuboSorologia2.value;
                tubo4 = document.f1.tuboNat.value;
                tubo5 = document.f1.tuboImuno.value;

                if ((amostra == tubo2) && (amostra == tubo3) && (amostra == tubo4) && (amostra == tubo5)) {

                } else {
                    alert("Tubos não conferem!");
                    return false;
                }

                peso = document.f1.peso.value;
                tempo = document.f1.tempoColeta.value;

                if ((peso == "") || (tempo == "")) {
                    alert("Campos obrigatórios não preenchidos!");
                    return false;
                }
            }
        </script>

        <title>Sistema de Rastreabilidade - Coleta - Fundação Hemominas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <div>
                <p>Usuário ativo: <%out.println("<b>" + masp + "</b>!");%></p>
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
                <h2>Coleta - FIM</h2>
                <form method="post" action="ServletColeta" name="f1" onsubmit="return validarTubos(this)">
                    <div>
                        <label for="amostra"><b>Amostra</b></label><br>
                        <input type="text" name="amostra" id="amostra" size="20px" Value="<%out.println(request.getParameter("amostra"));%>" readonly="true" style="background-color: #CFCFCF"><br><br>
                    </div>

                    <div>
                        <label for="tuboSorologia1"><b>Sorologia 1</b></label>
                        <input type="text" name="tuboSorologia1" id="tuboSorologia1" size="20px"><br><br>
                    </div>
                    <div>
                        <label for="tuboSorologia2"><b>Sorologia 2</b></label>
                        <input type="text" name="tuboSorologia2" id="tuboSorologia2" size="20px"><br><br>
                    </div>
                    <div>
                        <label for="tuboNat"><b>NAT</b></label>
                        <input type="text" name="tuboNat" id="tuboNat" size="20px"><br><br>
                    </div>
                    <div>
                        <label for="tuboImuno"><b>Imuno</b></label>
                        <input type="text" name="tuboImuno" id="tuboImuno" size="20px"><br><br>
                    </div>

                    <div>
                        <label for="peso"><b>Peso Hemocomp.</b></label>
                        <input type="text" name="peso" id="peso" size="10px"><br><br>
                    </div>

                    <div>
                        <label for="tempoColeta"><b>Tempo Coleta</b></label>
                        <input type="text" name="tempoColeta" id="tempoColeta" size="10px"><br><br>
                    </div>

                    <div id="botao">
                        <input type="submit" value="Gravar">
                    </div>
                </form>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>