<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="DAO.PreliminaresDAO"%>
<%@page import="POJO.Preliminares"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
        <meta http-equiv="refresh" content="0;URL=preliminares.jsp">
        <link rel="stylesheet" href="estilo.css">
        <script type="text/javascript" src="script.js"></script>

        <%
            //Recebe o valor da vari�vel de sess�o e valida se a sess�o est� ativa
            String masp = (String) session.getAttribute("user");
            if (masp == null) {
                response.sendRedirect("sair.jsp");
            }
            
            Long id = Long.parseLong(request.getParameter("id"));
            PreliminaresDAO dao = new PreliminaresDAO();
            dao.exclui(id);
        %>

        <title>Sistema de Laudos T�cnicos - Funda��o Hemominas</title>
    </head>
    <body>
    </body>
</html>