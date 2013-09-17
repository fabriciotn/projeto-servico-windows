<%-- 
    Document   : CadastroProjeto
    Created on : 30/08/2013, 15:37:25
    Author     : 12546446
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidaSessao.jsp" %>

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
                <iframe src="banner.jsp" height="130px" width="100%" frameborder="0" scrolling="no"></iframe>
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
            <form method="post" action="ResumoProjeto.jsp" id="form">
                <div id="conteudo">
                    <div id="Codigo">
                        <label for="CodigoProjeto">Cód Projeto</label><br>
                        <input type="text" name="CodigoProjeto" id="CodigoProjeto" size="5">
                        <a href="#">
                            <img src="Configuracoes/Imagens/search.png" onclick="habilitar('conteudo', false, true);">
                        </a>
                        <a href="#">
                            <img src="Configuracoes/Imagens/add.png" onclick="habilitar('conteudo', true, true);">
                        </a>
                    </div>
                    <div id="Nome">
                        <label for="NomeProjeto">Nome do Projeto</label><br>
                        <input type="text" name="NomeProjeto" id="NomeProjeto" size="65">
                    </div>
                    <div id="Resp">
                        <label for="Responsavel">Resp. pelo Projeto</label><br>
                        <input type="text" name="Responsavel" id="Responsavel" size="65">
                    </div>
                    <div id="DataIni">
                        <label for="DataInicio">Data de Inicio</label><br>
                        <input type="text" name="DataInicio" id="DataInicio" size="10">
                    </div>
                    <div id="Descr">
                        <label for="Descricao">Descrição</label><br>
                        <textarea name="Descricao" id="Descricao" rows="10" cols="50"></textarea>
                    </div>
                    <div id="buttons">
                        <input type="submit" value="Gravar" id="buttonok">
                        <input type="reset" value="Limpar" id="buttonreset">
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

<!--
<div id="botao">
                        <a href="CadastroTAP.jsp">Termo de Abertura</a>
                    </div>
                    <div id="botao">
                        <a href="CadastroTAR.jsp">Termo de Alteração</a>
                    </div>
                    <div id="botao">
                        <a href="EspecificacaoRequisitos.jsp">Espec. de Requisitos</a>
                    </div>
                    <div id="botao">
                        <a href="FormularioTestes.jsp">Formul. de Testes</a>
                    </div>
                    <div id="botao">
                        <a href="TermoDeAceite.jsp">Termo de Aceite</a>
                    </div>
                    <div id="botao">
                        <a href="DocRelacionados.jsp">Documentos Relacionados</a>
                    </div>
-->