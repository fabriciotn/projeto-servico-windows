/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import br.gov.client1.IntegraWS;
import br.gov.client1.IntegraWS_Service;
import br.gov.client1.Reacoes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author 12546446
 */
public class ServletReacoes extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/IntegradorServer/IntegraWS.wsdl")
    private IntegraWS_Service service;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        int idUtilizacao = Integer.parseInt(request.getParameter("idProcedimento").toString());
        String reacaoAdversa = request.getParameter("reacao");

        Reacoes reacao = new Reacoes();
        reacao.setIdUtilizacao(idUtilizacao);
        reacao.setReacao(reacaoAdversa);

        String msg = "";
        if (gravarReacoes(reacao)) {
            msg = "Inserido com sucesso!";
        } else {
            msg = "Falha na operação!";
        }
        
        session.setAttribute("msg", msg);
        session.setAttribute("pagina", "registraReacoesAdversas.jsp");
        response.sendRedirect("mensagem.jsp");
    }

    private boolean gravarReacoes(Reacoes reacao) {
        IntegraWS port = service.getIntegraWSPort();
        return port.gravarReacoes(reacao);
    }
}
