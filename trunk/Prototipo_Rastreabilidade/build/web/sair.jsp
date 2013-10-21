<%-- 
    Document   : sair
    Created on : 03/01/2011, 11:21:49
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <title>Sair</title>
    </head>
    <body>
        <%
            session.setAttribute("user", null);
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
