package Servlets;

import Relatorios.Relatorio;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;

public class Relatorios extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        byte[] relatorioByte = null;
        try {
            Relatorio a = new Relatorio();
            
            //Recebe o caminho da pasta do relatório e concatena com o nome da logo
            String path = request.getSession().getServletContext()
                    .getRealPath("/WEB-INF/classes/Relatorios") + "/LogoHemominas.jpg";  
            
            relatorioByte = a.armazem(200, 300, "2013", "074", path);
        } catch (JRException ex) {
            ex.printStackTrace();
        }

        //Parametros para nao fazer cache e o que será exibido..  
        response.setContentType("application/pdf");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        //Envia para o navegador o pdf..  
        ServletOutputStream servletOutputStream = response.getOutputStream();
        servletOutputStream.write(relatorioByte);
        servletOutputStream.flush();
        servletOutputStream.close();
    }
}
