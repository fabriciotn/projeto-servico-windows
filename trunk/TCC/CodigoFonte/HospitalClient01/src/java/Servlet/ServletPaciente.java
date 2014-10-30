/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import br.gov.client1.IntegraWS;
import br.gov.client1.IntegraWS_Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author 12546446
 */
public class ServletPaciente extends HttpServlet {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/IntegradorServer/IntegraWS.wsdl")
    private IntegraWS_Service service;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String pai = request.getParameter("nomePai");
        String mae = request.getParameter("nomeMae");
        String aboPac = request.getParameter("aboPac");
        String rhPac = request.getParameter("rhPac");
        String endereco = request.getParameter("endereco");
        
        IntegraWS port = service.getIntegraWSPort();
        port.gravaPaciente(nome, cpf, rg, pai, mae, aboPac, rhPac, endereco);
        
        response.sendRedirect("index.jsp");
    }

}
