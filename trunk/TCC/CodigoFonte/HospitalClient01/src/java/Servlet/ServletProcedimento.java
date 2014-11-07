/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import br.gov.client1.IntegraWS_Service;
import java.io.IOException;
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
public class ServletProcedimento extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/IntegradorServer/IntegraWS.wsdl")
    private IntegraWS_Service service;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(); 
        
        int codPaciente = Integer.parseInt(session.getAttribute("idPaciente").toString());
        String codHemocomponente = session.getAttribute("numeroBolsa").toString();
        String data = request.getParameter("data");
        //01/01/1010
        String dataFormatada = data.substring(6,10) + "-" + data.substring(3,5) + "-" + data.substring(0,2);
        String motivo = request.getParameter("motivo");
        String responsavel = request.getParameter("responsavel");
        String obs = request.getParameter("obs");
        int codInstituicao = Integer.parseInt(session.getAttribute("codInstituicao").toString());
        
        if(gravaUtilizacao(codPaciente, codHemocomponente, dataFormatada, motivo, responsavel, obs, codInstituicao)){
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("erro_login.jsp");
        }

    }

    private boolean gravaUtilizacao(
            int codPaciente, String codHemocomponente,
            String data,
            String motivo, String responsavel,
            String obs, int codInstituicao) {

        br.gov.client1.IntegraWS port = service.getIntegraWSPort();
        return port.gravaUtilizacao(
                codPaciente, 
                codHemocomponente, 
                data, 
                motivo, 
                responsavel, 
                obs, 
                codInstituicao);
    }
}
