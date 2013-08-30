<%-- 
    Document   : CadastroProjeto
    Created on : 30/08/2013, 15:37:25
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Recebe o valor da variável de sessão e valida se a sessão está ativa
    String masp = (String) session.getAttribute("user");
    if (masp == null) {
        response.sendRedirect("Configuracoes/sair.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Configuracoes/CSS/estilo.css">
        <script type="text/javascript" src="Configuracoes/JavaScript/script.js"></script>
        <title>Cadastro de Projetos</title>
    </head>
    <body>
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
                <form method="post" action="ServletProjetos">
                    <div id="#">
                    Código do Projeto<br>
                    <input type="text" name="CodigoProjeto">
                    </div>
                    
                    <div id="#">
                    Nome do Projeto<br>
                    <input type="text" name="NomeProjeto">
                    <br>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
