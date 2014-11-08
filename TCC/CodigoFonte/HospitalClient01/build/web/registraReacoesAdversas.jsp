<%-- 
    Document   : registraReacoesAdversas
    Created on : 08/11/2014, 10:11:13
    Author     : 12546446
--%>

<%@page import="java.util.List"%>
<%@page import="br.gov.client1.Reacoes"%>
<%@page import="br.gov.client1.IntegraWS_Service"%>
<%@page import="br.gov.client1.IntegraWS"%>
<%@page import="br.gov.client1.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                <form method="post" action="registraReacoesAdversas.jsp" name="form1">
                    Código do Paciente: <input type="text" name="id" id="id">
                    <input type="submit" value="ok">
                </form>
                <br><br>

                <%
                    Paciente paciente = null;
                    IntegraWS port = null;

                    if (request.getParameter("id") != null) {
                        int idPaciente = Integer.parseInt(request.getParameter("id"));

                        try {
                            IntegraWS_Service service = new IntegraWS_Service();
                            port = service.getIntegraWSPort();


                            paciente = port.recebeDadosPaciente(idPaciente);

                            if (paciente.getId() > 0) {
                                session.setAttribute("idPaciente", paciente.getId());
                                session.setAttribute("nomePaciente", paciente.getNome());
                                session.setAttribute("cpfPaciente", paciente.getCpf());
                                session.setAttribute("rgPaciente", paciente.getRg());
                                session.setAttribute("paiPaciente", paciente.getNomeDoPai());
                                session.setAttribute("maePaciente", paciente.getNomeDaMae());
                                session.setAttribute("aboPaciente", paciente.getAbo());
                                session.setAttribute("rhPaciente", paciente.getRh());
                                session.setAttribute("enderecoPaciente", paciente.getEndereco());

                                out.println("<b>Nome do paciente: </b>" + paciente.getNome() + "<br>");
                                out.println("<b>CPF: </b>" + paciente.getCpf() + "<br>");
                                out.println("<b>RG: </b>" + paciente.getRg() + "<br>");
                                out.println("<b>Nome do pai: </b>" + paciente.getNomeDoPai() + "<br>");
                                out.println("<b>Nome da mae: </b>" + paciente.getNomeDaMae() + "<br>");
                                out.println("<b>ABO paciente: </b>" + paciente.getAbo() + "<br>");
                                out.println("<b>RH paciente: </b>" + paciente.getRh() + "<br>");
                                out.println("<b>Enderço:  </b>" + paciente.getEndereco() + "<br><br>");
                %>
                <br><br>
                <form method="post" action="ServletReacoes" name="form2">
                    <label for="idPaciente">Código do Procedimento: </label>
                    <input type="text" name="idProcedimento" id="idProcedimento"><br>
                    <label for="reacao">Reação: </label>
                    <input type="text" name="reacao" id="reacao"><br>
                    <input type="submit" value="Registrar reação">
                </form>
                <%
                            } else {
                                idPaciente = 0;
                                session.setAttribute("msg", "Paciente não localizado");
                                session.setAttribute("pagina", "registraReacoesAdversas.jsp");
                                response.sendRedirect("mensagem.jsp");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                %>

            </div>
        </div>
    </body>
</html>
