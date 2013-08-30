<%-- 
    Document   : relatorio
    Created on : 04/01/2013, 15:06:50
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Recebe o valor da variável de sessão e valida se a sessão está ativa
    String masp = (String) session.getAttribute("user");
    if (masp == null) {
        response.sendRedirect("sair.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Configuracoes/CSS/estilo.css">
        <script type="text/javascript" src="Configuracoes/JavaScript/script.js"></script>
        <title>JSP Page</title>
    </head>

    <body onload="foco()">
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <div>
                <a href="sair.jsp">Logoff</a>
            </div>
            
            <div id="menu">
                <ul>
                    <li><a href="principal.jsp">Inicio</a></li>
                    <li><a href="CadastroProjeto.jsp">Cadastro de Projetos</a></li>
                    <li><a href="#">---</a></li>
                    <li><a href="#">---</a></li>
                </ul>
                <br/>
            </div>
            
            <!Página de Login!>
            <div id="conteudo">
                Painel principal
            </div>
        </div>
    </body>
</html>
