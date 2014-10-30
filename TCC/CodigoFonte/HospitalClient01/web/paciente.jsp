<%-- 
    Document   : registraOperacao
    Created on : 29/10/2014, 17:17:26
    Author     : 12546446
--%>

<%@page import="br.gov.client1.IntegraWS"%>
<%@page import="br.gov.client1.IntegraWS_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="estilocss.css">
        <script type="text/javascript" src="script.js"></script>

        <title>Hospital Madre Tereza</title>
    </head>
    <body>
        <div id="tudo">
            <div id="frame">
                <iframe src="banner.jsp" height="150" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>          
            <div id="conteudo">
                <a href="index.jsp"><< V O L T A R</a>
                <h1>Hospital Madre Tereza</h1>
                <p>Protótipo do sistema para integração com o Hemominas</p>
                <br/><br/>

                <form method="post" action="ServletPaciente" name="form1">
                    <label for="nome"><b>Nome do paciente:</b></label>
                    <input type="text" name="nome" id="nome"><br>

                    <label for="cpf"><b>CPF:</b></label>
                    <input type="text" name="cpf" id="cpf"><br>

                    <label for="rg"><b>RG:</b></label>
                    <input type="text" name="rg" id="rg"><br>

                    <label for="nomePai"><b>Nome do pai:</b></label>
                    <input type="text" name="nomePai" id="nomePai"><br>

                    <label for="nomeMae"><b>Nome da mãe:</b></label>
                    <input type="text" name="nomeMae" id="nomeMae"><br>

                    <label for="aboPac"><b>ABO do paciente:</b></label>
                    <input type="text" name="aboPac" id="aboPac"><br>

                    <label for="rhPac"><b>RH do paciente:</b></label>
                    <input type="text" name="rhPac" id="rhPac"><br>

                    <label for="endereco"><b>Endereço do paciente:</b></label>
                    <input type="text" name="endereco" id="endereco"><br><br>

                    <input type="submit" value="Gravar"> <input type="reset" value="Limpar">
                </form>
            </div>
        </div>
    </body>
</html>
