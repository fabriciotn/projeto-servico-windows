<%-- 
    Document   : index
    Created on : 29/10/2014, 11:59:19
    Author     : 12546446
--%>

<%@page import="br.gov.client1.Hemocomponente"%>
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
    <%
        Hemocomponente hemocomp = null;
        try {
            IntegraWS_Service service = new IntegraWS_Service();
            IntegraWS port = service.getIntegraWSPort();
            // TODO initialize WS operation arguments here
            String numeroBolsa = request.getParameter("bolsa");
            // TODO process result here
            if(request.getParameter("bolsa") == null){
                numeroBolsa = session.getAttribute("numeroBolsa").toString();
            }
            hemocomp = port.recebeDadosHemocomponente(numeroBolsa);
            session.setAttribute("numeroBolsa", numeroBolsa);

            if (hemocomp.getCodigo() != null) {
                session.setAttribute("numeroBolsa", hemocomp.getCodigo());
                session.setAttribute("aboBolsa", hemocomp.getAbo());
                session.setAttribute("rhBolsa", hemocomp.getRh());
                session.setAttribute("descricaoBolsa", hemocomp.getDescricao());
            }else{
                session.setAttribute("msg", "Hemocomponente não localizado");
                session.setAttribute("pagina", "procedimento.jsp");
                response.sendRedirect("mensagem.jsp");
            }
        } catch (Exception ex) {
            out.print("erro");
        }
    %>
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
                <%
                    out.println("<h3>Hemocomponente: " + hemocomp.getCodigo() + "</h3>");
                    out.println("<b>Descrição: </b>" + hemocomp.getDescricao() + "<br>");
                    out.println("<b>ABO: </b>" + hemocomp.getAbo() + "<br>");
                    out.println("<b>RH: </b>" + hemocomp.getRh() + "<br>");
                %>
                <br><br>
                <form method="post" action="procedimentoFim.jsp" name="form1">
                    Código do Paciente: <input type="text" name="id" id="id">
                    <input type="submit" value="ok">
                </form>
            </div>
        </div>
    </body>
</html>
