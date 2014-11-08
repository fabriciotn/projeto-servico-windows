<%-- 
    Document   : index
    Created on : 29/10/2014, 11:59:19
    Author     : 12546446
--%>

<%@page import="br.gov.client1.Hemocomponente"%>
<%@page import="br.gov.client1.IntegraWS"%>
<%@page import="br.gov.client1.IntegraWS_Service"%>
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
                <h1>Hospital Madre Tereza</h1>
                <p>Protótipo do sistema para integração com o Hemominas</p>
                <br/>                
                <div>
                    <ul>
                        <li><a href="paciente.jsp">Cadastrar paciente</a></li><br>
                        <li><a href="procedimento.jsp">Registra procedimentos</a></li><br>
                        <li><a href="registraReacoesAdversas.jsp">Registra Reações Adversas</a></li><br>
                        <li><a href="reacoesAdversas.jsp">Visualiza Reações Adversas</a></li><br>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
