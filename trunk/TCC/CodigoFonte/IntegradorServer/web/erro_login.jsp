<%-- 
    Created on : 22/11/2013, 14:43:24
    Author     : 00220039
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Erro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>

            <div>
                <a href="sair.jsp">Logoff</a>
            </div>

            <div id="conteudo">
                <img alt="erro" src="img/erro.jpg" border="0" align="absmiddle"/>
                <h2>Usuário ou senha inválidos!</h2>
                <a class="voltar" href="index.jsp">
                    <img alt="voltar" src="img/voltar.png" border="0" align="absmiddle">Voltar e tentar novamente
                </a>
            </div>
        </div>

    </body>
</html>