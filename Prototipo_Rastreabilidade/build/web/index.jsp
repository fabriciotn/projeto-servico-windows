<%-- 
    Document   : index
    Created on : 14/10/2013, 16:00:34
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>
        <title>Login</title>
    </head>
    <body onload="foco()">
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="100px" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
            <!Página de Login!>
            <div id="conteudo">
                <h1>Sistema de Rastreabilidade</h1>
                <br>
                <form method="post" action="Login" name="form">
                    <h3>Entre com usuário e senha</h3>
                    <label for="nome">Usuário:</label><input type="text" name="user" value=""><br/>
                    <label for="nome">Senha:</label><input type="password" name="pass" value=""><br/>
                    <input type="submit" value="Logar" id="submitbutton"><input type="reset" value="Limpar" id="resetbutton">
                </form>
            </div>
            <iframe src="rodape.jsp" width="180px" height="20px" frameborder="0" scrolling="no"></iframe>
        </div>
    </body>
</html>