<%-- 
    Document   : reacoes
    Created on : 18/10/2013, 14:42:19
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@include file="ValidaSessao.jsp" %>

<%
    //String amostra = session.getAttribute("").toString();
%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <script>
            function validarCampos() {
                amostra = document.f1.amostra.value;
                observacao = document.f1.observacao.value;
                pa1 = document.f1.pa1.value;
                pa2 = document.f1.pa2.value;
                pulso = document.f1.pulso.value;
                prescricao = document.f1.prescricao.value;
                lote = document.f1.lote.value;

                if ((amostra == "")) {
                    alert("Amostra n�o preenchida!");
                    return false;
                }

                if ((observacao == "") || (pa1 == "") || (pa2 == "") || (pulso == "")) {
                    alert("Campos obrigat�rios!");
                    return false;
                }

                return true;
            }
        </script>

        <title>Sistema de Rastreabilidade - Funda��o Hemominas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <div>
                <p>Usu�rio ativo: <%out.println("<b>" + masp + "</b>!");%></p>
                <a href="sair.jsp">Logoff</a>
            </div>
            <!Listagem do Menu!>
            <div id="menu">
                <ul>
                    <li><a href="coleta.jsp">Coleta</a></li>
                    <li><a href="reacoes.jsp">Rea��es Adversas</a></li>
                    <li><a href="fracionamento.jsp">Fracionamento</a></li>
                    <li><a href="relatorios.jsp">Relat�rios</a></li>
                </ul>
                <br/>
            </div>

            <div id="conteudo">
                <h2>Rea��es Adversas do Doador</h2>
                <form method="post" action="ServletReacoes" name="f1" onsubmit="return validarCampos(this)">
                    <div>
                        <label for="amostra"><b>Amostra</b></label><br>
                        <input type="text" name="amostra" id="amostra" size="20px">
                        <input type="button" name="pesquisa" id="pesquisa" value=">>">
                        <input type="button" name="limpa" id="limpa" value="X">
                        <br><br>
                    </div>
                    <div>
                        <label for="reacao"><b>Rea��o</b></label><br>
                        <input type="radio" name="reacao" value="leve" checked="true">Leve<br>
                        <input type="radio" name="reacao" value="moderada">Moderada<br>
                        <input type="radio" name="reacao" value="grave">Grave<br><br>
                    </div>
                    <div>
                        <label for="observacao"><b>Oberva��es</b></label><br>
                        <textarea name="observacao" id="observacao" rows="5" cols="40"></textarea>
                        <br><br>
                    </div>
                    <div  style="float: left">
                        <label for="pa"><b>PA</b></label><br>
                        <input type="text" name="pa1" id="pa1" size="1px"> X
                        <input type="text" name="pa2" id="pa2" size="1px">
                        <br><br>
                    </div>
                    <div>
                        <label for="pulso"><b>Pulso</b></label><br>
                        <input type="text" name="pulso" id="pulso" size="1px"><br><br>
                    </div>
                    <div>
                        <label for="prescricao"><b>Prescri��o</b></label><br>
                        <textarea name="prescricao" rows="2" cols="40"></textarea>
                        <br><br>
                    </div>
                    <div>
                        <label for="lote"><b>Lote</b></label><br>
                        <input type="text" name="lote" id="lote" size="20px"><br><br>
                    </div>


                    <div id="botao">
                        <input type="submit" value="Gravar">&nbsp;&nbsp;
                        <input type="reset" value="Limpar">
                    </div>
                </form>

                <br><br>
                <h3>Hist�rico de rea��es</h3>
                <table border="1" width="600px">
                    <thead>
                        <tr>
                            <th>Amostra</th>
                            <th>Rea��o</th>
                            <th>Observa��es</th>
                            <th>PA</th>
                            <th>Pulso</th>
                            <th>Prescri��o</th>
                            <th>Lote</th>
                        </tr>
                        <tr>
                            
                        </tr>
                    </thead>
                </table>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>