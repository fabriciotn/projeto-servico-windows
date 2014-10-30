<%-- 
    Created on : 22/11/2013, 14:43:24
    Author     : 00220039
--%>
<%@page import="POJO.Hemocomponente"%>
<%@page import="DAO.HemocomponenteDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="ValidaSessao.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <title>Fundação Hemominas</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <div>
                <a href="sair.jsp">Logoff</a>
            </div>
            <!Listagem do Menu!>
            <div id="menu">
                <ul>
                    
                </ul>
                <br/>
            </div>            
            <div id="conteudo">
                <h1><%out.println(session.getAttribute("sistema"));%></h1>
                Bem vindo <%out.println("<b>" + session.getAttribute("nome") + "</b>!");%><br/>
                <ul>
                    <li>Selecione o menu desejado para realizar os procedimentos:</li>
                </ul>
            </div>
            <iframe src="rodape.jsp" width="180" height="20" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>
