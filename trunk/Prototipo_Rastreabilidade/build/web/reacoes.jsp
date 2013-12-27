<%-- 
    Document   : Reações
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
            function validarCampos() {
                amostra = document.f1.amostra.value;

                if ((amostra == "")) {
                    alert("Amostra não preenchida!");
                    return false;
                }
                return true;
            }
        </script>

        <title>Sistema de Rastreabilidade - Reações - Fundação Hemominas</title>
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
                <h2>Reações Adversas</h2>
                <form method="post" action="inicioReacoes.jsp" name="f1" onsubmit="return validarCampos(this)">
                    <div>
                        <label for="amostra"><b>Amostra</b></label><br>
                        <input type="text" name="amostra" id="amostra" size="20px" Value="${amostra}"><br><br>
                    </div>
                    <div id="botao">
                        <input type="submit" value="Próximo">
                    </div>
                </form>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>

