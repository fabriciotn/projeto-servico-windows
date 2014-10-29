<%-- 
    Document   : newjsp
    Created on : 28/10/2014, 21:57:33
    Author     : Fabrício Teixeira
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
                <h1><%session.setAttribute("sistema", "Integrador"); out.println(session.getAttribute("sistema"));%></h1>
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
