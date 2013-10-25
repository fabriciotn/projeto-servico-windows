<%-- 
    Document   : rastreabilidade
    Created on : 23/10/2013, 14:30:02
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
                var Radio = null;
                Radio = f1.radio;

                for (var i = 0; i < Radio.length; i++) {
                    if (Radio[i].checked) {
                        if (Radio[i].value == "amostra") {
                            document.getElementById('divamostra').style.display = "block";
                            document.getElementById('divperiodo').style.display = "none";
                        } else {
                            document.getElementById('divperiodo').style.display = "block";
                            document.getElementById('divamostra').style.display = "none";
                        }
                    }
                }
            }
        </script>

        <title></title>
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
                <h2>Rastreabilidade</h2>
                <form method="post" action="#" name="f1">
                    <div>
                        <input type="radio" name="radio" value="amostra" checked="true" onclick="habilitaCampo(this);">Por amostra
                        <input type="radio" name="radio" value="periodo" onclick="habilitaCampo(this);">Por período/processo
                    </div>
                    <br><br>
                    <div id="divamostra">
                        <label for="amostra">Doação</label>
                        <input type="text" id="amostra" name="amostra" size="20px"><br>
                    </div>
                    <div id="divperiodo" style="display: none">
                        <label for="periodoInicial">Data Inicial</label>
                        <input type="text" id="periodoIncial" name="periodoIncial" size="10px"><br>

                        <label for="periodoFinal">Data Final</label>
                        <input type="text" id="periodoFinal" name="periodoFinal" size="10px"><br>

                        <label for="processo">Processo</label>
                        <select name="processo" id="processo">
                            <option value="null">-</option>
                            <option value="cadastro">CADASTRO</option>
                            <option value="tclinica">TRIAGEM CLÍNICA</option>
                            <option value="thematologica">TRIAGEM HEMATOLÓGICA</option>
                            <option value="coleta">COLETA</option>
                        </select><br>

                        <div id="divcadastro">
                            <label for="tipo">Tipo Doador</label>
                            <select name="tipo" id="tipo">
                                <option value="null">-</option>
                                <option value="espontanea">ESPONTÂNEA</option>
                                <option value="reposicao">REPOSIÇÃO</option>
                                <option value="beneficio">BENEFÍCIO</option>
                                <option value="convidado">CONVIDADO</option>
                                <option value="autologa">AUTÓLOGA</option>
                            </select><br>

                            <label for="agendado">Agendado</label>
                            <select id="agendado" name="agendado">
                                <option value="ambos" checked="true">Ambos
                                <option value="sim">Sim
                                <option value="nao">Não
                            </select>
                            <br>

                            <label for="temperatura">Temperatura</label>
                            <input type="text" id="temperatura" name="temperatura" size="3px">
                            <br>

                            <label for="inaptidao">Cod. Inaptidão Clínica</label>
                            <input type="text" id="inaptidao" name="inaptidao" size="3px">
                            <br>

                            <label for="volume">Volume Coletado</label>
                            <input type="text" id="volume" name="volume" size="3px">
                            <br>
                        </div>
                    </div>
                    <br><br>
                    <div id="button">
                        <input type="submit" value="Pesquisar">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
