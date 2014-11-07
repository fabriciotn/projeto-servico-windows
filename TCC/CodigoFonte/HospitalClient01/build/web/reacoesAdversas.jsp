<%-- 
    Document   : reacoesAdversas
    Created on : 06/11/2014, 22:14:36
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <title>Hospital Madre Tereza</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="150" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>           
            <div id="conteudo">
                <a href="index.jsp"><< V O L T A R</a>
                <h1>Hospital Madre Tereza</h1>
                <p>Protótipo do sistema para integração com o Hemominas</p>
                <br/><br/>

                <form method="post" action="reacoesAdversas.jsp" name="form1">
                    Nome do Paciente: <input type="text" name="paciente" id="paciente">
                    <input type="submit" value="ok">
                </form>

                <%
                
                    
                    
                %>
                
                <table border="1">
                    <thead>
                        <tr>
                            <td>ID Paciente</td>
                            <td>Nome Paciente</td>
                            <td>ID Procedimento</td>
                            <td>Data Procedimento</td>
                            <td>ID Reação</td>
                            <td>Reação</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                                
                            %>
                        </tr>
                    </tbody>
                </table>
                
            </div>
        </div>
    </body>
</html>
