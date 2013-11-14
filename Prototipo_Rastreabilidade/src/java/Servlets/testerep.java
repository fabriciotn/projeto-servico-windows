/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Conecta.ConectaOracle;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperManager;
import net.sf.jasperreports.engine.JasperPrint;

/**
 *
 * @author 12546446
 */
public class testerep extends HttpServlet {

    private Connection connection;

    public testerep(){
        this.connection = ConectaOracle.conecta();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Na variavel pathJasper ficara o caminho do diretório para 
        // os relatórios compilados (.jasper)
        String pathJasper = getServletContext().getRealPath("/WEB-INF/") + "\\";

        // A variavel path armazena o caminho real para o contexto
        // isso é util pois o seu web container pode estar instalado em lugares diferentes
        String path = getServletContext().getRealPath("/");
        
        
        //Parametros do relatorio
        Map parametros = new HashMap();
        

        try {
            // Aqui ele cria o relatório
            JasperPrint impressao = JasperFillManager.fillReport(pathJasper+ "report1.jasper", parametros, this.connection);
            // Grava o relatório em disco em pdf
            JasperManager.printReportToPdfFile(impressao, path + "/report1.pdf");
            // Redireciona para o pdf gerado
            response.sendRedirect("report1.pdf");
        } catch (Exception e) {
            response.getWriter().println("Erro ao gerar o relatório: " + e);
            e.printStackTrace();
        }

    }
}
