<%-- 
    Document   : triagemClinica
    Created on : 15/10/2013, 10:05:35
    Author     : 12546446
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="POJO.Coleta"%>
<%@page import="DAO.ColetaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="ValidaSessao.jsp" %>

<%
    ColetaDAO dao = new ColetaDAO();
    List<Coleta> amostras = dao.getAmostra(request.getParameter("amostra"));


    String action = "";

    if (amostras.size() == 0) {
        action = "ServletColeta";
    } else {
        for (Coleta c : amostras) {
            if ((c.getOpeFimColeta() == null) || (c.getOpeFimColeta().isEmpty())) {
                request.getRequestDispatcher("fimColeta.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("msgColeta.jsp").forward(request, response);
            }
        }
    }
%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <script>
            function validarCampos() {
                tipoBolsa = document.f1.tipoBolsa.value;
                loteBolsa = document.f1.loteBolsa.value;

                if ((tipoBolsa == "") || (loteBolsa == "")) {
                    alert("Campos obrigatórios não preenchidos!");
                    return false;
                }

                return true;
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
                <h2>Coleta - Inicio</h2>
                <form method="post" action="<%out.println(action);%>" name="f1" onsubmit="return validarCampos(this)">
                    <div>
                        <label for="amostra"><b>Amostra</b></label><br>
                        <input type="text" name="amostra" id="amostra" size="20px" Value="<%out.println(request.getParameter("amostra"));%>" readonly="true" style="background-color: #CFCFCF"><br><br>
                    </div>

                    <div>
                        <label for="tipoBolsa"><b>Tipo da Bolsa</b></label>
                        <input type="text" name="tipoBolsa" id="tipoBolsa" size="20px"><br>
                    </div>

                    <div>
                        <label for="loteBolsa"><b>Lote da Bolsa</b></label>
                        <input type="text" name="loteBolsa" id="loteBolsa" size="20px"><br>
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