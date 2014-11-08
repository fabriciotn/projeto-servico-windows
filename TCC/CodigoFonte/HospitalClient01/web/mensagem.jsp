<%-- 
    Document   : newModeloFabricio
    Created on : 22/10/2013, 11:38:41
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <title></title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="150" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>  
            <div id="conteudo">
                <div id="mensagem">
                    ${msg}
                </div>
                <div id="botao">
                    <a href=${pagina}>Voltar</a>
                </div>
                <br>&nbsp;
            </div>
        </div>
    </body>
</html>
