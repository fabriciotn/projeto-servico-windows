<%-- 
    Document   : newjsp
    Created on : 28/10/2014, 21:57:33
    Author     : Fabrício Teixeira
--%>

<%@page import="Conexao.Conecta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            Conecta con = new Conecta();
            con.conecta();
        %>
        
        <h1>Hello World!</h1>
    </body>
</html>
