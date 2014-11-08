<%-- 
    Document   : registraOperacao
    Created on : 29/10/2014, 17:17:26
    Author     : 12546446
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="br.gov.client1.Paciente"%>
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
        Paciente result = null;
        try {
            IntegraWS_Service service = new IntegraWS_Service();
            IntegraWS port = service.getIntegraWSPort();
            int id = Integer.parseInt(request.getParameter("id"));
            result = port.recebeDadosPaciente(id);

            if (result.getId() > 0) {
                session.setAttribute("idPaciente", result.getId());
                session.setAttribute("nomePaciente", result.getNome());
                session.setAttribute("cpfPaciente", result.getCpf());
                session.setAttribute("rgPaciente", result.getRg());
                session.setAttribute("paiPaciente", result.getNomeDoPai());
                session.setAttribute("maePaciente", result.getNomeDaMae());
                session.setAttribute("aboPaciente", result.getAbo());
                session.setAttribute("rhPaciente", result.getRh());
                session.setAttribute("enderecoPaciente", result.getEndereco());

                session.setAttribute("codInstituicao", "5");
            }else{
                session.setAttribute("msg", "Paciente não localizado");
                session.setAttribute("pagina", "procedimentoMeio.jsp");
                response.sendRedirect("mensagem.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
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

                <form method="post" action="ServletProcedimento" name="form1">
                    <%
                        out.println("<h3>Hemocomponente: " + session.getAttribute("numeroBolsa") + "</h3>");
                        out.println("<b>Descrição: </b>" + session.getAttribute("descricaoBolsa") + "<br>");
                        out.println("<b>ABO: </b>" + session.getAttribute("aboBolsa") + "<br>");
                        out.println("<b>RH: </b>" + session.getAttribute("rhBolsa") + "<br><br>");

                        out.println("<b>Nome do paciente: </b>" + result.getNome() + "<br>");
                        out.println("<b>CPF: </b>" + result.getCpf() + "<br>");
                        out.println("<b>RG: </b>" + result.getRg() + "<br>");
                        out.println("<b>Nome do pai: </b>" + result.getNomeDoPai() + "<br>");
                        out.println("<b>Nome da mae: </b>" + result.getNomeDaMae() + "<br>");
                        out.println("<b>ABO paciente: </b>" + result.getAbo() + "<br>");
                        out.println("<b>RH paciente: </b>" + result.getRh() + "<br>");
                        out.println("<b>Enderço:  </b>" + result.getEndereco() + "<br><br>");

                        Date date = new Date();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    %>

                    <label for="data"><b>Data do procedimento:</b></label>
                    <input type="text" name="data" id="data" value="<%out.print(sdf.format(date));%>"><br>

                    <label for="motivo"><b>Motivo:</b></label>
                    <input type="text" name="motivo" id="motivo"><br>

                    <label for="responsavel"><b>Responsavel:</b></label>
                    <input type="text" name="responsavel" id="responsavel"><br>

                    <label for="obs"><b>Observações:</b></label>
                    <textarea name="obs" id="obs"></textarea>
                    <br>

                    <input type="submit" value="Registrar Procedimento">
                </form>
            </div>
        </div>
    </body>
</html>
