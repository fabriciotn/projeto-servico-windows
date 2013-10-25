<%-- 
    Document   : controleDeEntrega
    Created on : 18/10/2013, 19:14:47
    Author     : 12546446
--%>

<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJO.ControleDeEntrega"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@include file="ValidaSessao.jsp" %>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <script>
            function validarCampos() {
                amostra = document.f1.amostra.value;
                var indexSelect = document.getElementById("hemocomponente").selectedIndex;
                var valueSelected = f1.hemocomponente.options[indexSelect].value;

                if ((amostra == "")) {
                    alert("Amostra não preenchida!");
                    return false;
                }

                if (valueSelected == "OUTRO") {
                    if (document.f1.outro.value == "") {
                        alert("Campos obrigatórios não preenchidos!");
                        return false;
                    }
                }

                return true;
            }

            function habilitaCampo() {
                var indexSelect = document.getElementById("hemocomponente").selectedIndex;
                var valueSelected = f1.hemocomponente.options[indexSelect].value;
                if (valueSelected == "OUTRO") {
                    document.getElementById('outro').style.display = "block";
                } else {
                    document.getElementById('outro').style.display = "none";
                }
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
                <h2>Fracionamento - CONTROLE DE ENTREGA</h2>

                <form method="post" action="ServletControleEntrega" name="f1" onsubmit="return validarCampos(this);">
                    <div>
                        <label for="amostra">Amostra</label>
                        <input type="text" name="amostra" id="amostra"><br>
                    </div>

                    <div>
                        <label for="motivo">Motivo</label>
                        <select id="motivo" name="motivo">
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
                        <select id="hemocomponente" name="hemocomponente" onchange="habilitaCampo(this);">
                            <option>CHM</option>
                            <option>PQ</option>
                            <option>PFC</option>
                            <option>OUTRO</option>
                        </select>
                    </div>
                    <div id="outro" style="display: none;">
                        <label for="outro">&nbsp;</label>
                        <input type="text" name="outro">
                    </div>

                    <div>
                        <label for="destino">Enviado Para</label>
                        <select id="destino" name="destino">
                            <option>Laboratório de Imuno</option>
                            <option>Laboratório de hematologia</option>
                            <option>Laboratório de sorologia</option>
                            <option>Laboratório de CQ</option>
                            <option>Distribuição</option>
                        </select>
                    </div>
                    <br>
                    <div>
                        <label for="submit">&nbsp;</label>
                        <input type="submit" value="Inserir" name="submit">
                    </div>
                </form>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>
