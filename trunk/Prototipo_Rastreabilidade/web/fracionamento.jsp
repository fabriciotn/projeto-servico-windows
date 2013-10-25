<%-- 
    Document   : fracionamento
    Created on : 18/10/2013, 19:11:28
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
        <title>Fracionamento</title>
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
                <h2>Fracionamento/Produção</h2>
                <ul>
                    <li><a href="controleDeEntrega.jsp">Controle de Entrega</a></li><br>
                    <li><a href="#">Controle de recebimento e inspeção visual de sangue total</a></li><br>
                    <li><a href="#">Controle produção e inspeção visual de hemocomponentes</a></li><br>
                    <li><a href="#">Registro de procedimentos especiais</a></li><br>
                </ul>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>
