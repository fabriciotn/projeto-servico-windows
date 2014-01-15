<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <link rel="stylesheet" href="css/table_jui.css" />
        <link rel="stylesheet" href="css/jquery-ui-1.8.4.custom.css" />
        <script type="text/javascript" src="JQuery/jquery.mim.js"></script>
        <script type="text/javascript" src="JQuery/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="script.js"></script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                oTable = $('#idTabela').dataTable({
                    "aoColumns": [
                        {"sType": 'date'}, //dataHora Solicitação
                        {"sType": 'html'}, //Origem
                        {"sType": 'html'}, //Nome
                        {"sType": 'date'}, //dataHora Atendimento
                        {"sType": 'html'}  //Numero da Bolsa
                    ],
                    "bPaginate": true,
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers",
                    "iDisplayLength": 25 //quantidade de registros padrão
                });
            });
        </script>

        <title>Controle de Fluxo de Bolsas Fenotipadas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            
            <!Listagem do Menu!>   
            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Lista</a></li>
                    <li><a href="cadastroSolicitacao.jsp">Cadastrar Solicitações</a></li>
                    <li><a href="administrativo.jsp">Administrativo</a></li>
                    <li><a href="relatorios.jsp">Relatórios</a></li>
                </ul>
                <br/>
            </div>
            
            <!Conteúdo!> 
            <div id="conteudo">
                <h2>Controle de Fluxo de Bolsas Fenotipadas</h2>
                <center>
                    <table cellpadding="0" cellspacing="0" border="0" class="display" id="idTabela">
                        <thead>
                            <tr>
                                <th>Data Solicitação</th>
                                <th>Origem</th>
                                <th>Nome</th>
                                <th>Data Atendimento</th>
                                <th>Nº Bolsa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                int i = 0;
                                String unidade = "";
                                String setor = "";
                                String equipamento = "";
                                String fornecedor = "";
                                //String responsavel = "";

                                out.println("<tr>"
                                        + "<td>" + i + "</td>"
                                        + "<td>" + sdf.format(new Date()) + "</td>"
                                        + "<td>" + unidade + "</td>"
                                        + "<td><a href=\"visualiza.jsp?id_laudo=" + i + "&id_setor=" + i + "\">" + i + "</a></td>"
                                        + "<td>" + setor + "</td>"
                                        + "</tr>");
                                i++;
                            %>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>
