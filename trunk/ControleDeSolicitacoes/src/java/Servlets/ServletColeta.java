package Servlets;

import DAO.ColetaDAO;
import POJO.Coleta;
import java.util.Calendar;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletColeta extends HttpServlet {

    public static Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);

        /*Recebendo os valores da página JSP
         Dados da Coleta*/
        String amostra = request.getParameter("amostra");
        String tipoBolsa = request.getParameter("tipoBolsa");
        String loteBolsa = request.getParameter("loteBolsa");

        int peso = 0;
        if (request.getParameter("peso") != null) {
            peso = Integer.parseInt(request.getParameter("peso"));
        }

        int tempoColeta = 0;
        if (request.getParameter("tempoColeta") != null) {
            tempoColeta = Integer.parseInt(request.getParameter("tempoColeta"));
        }


        ColetaDAO dao = new ColetaDAO();
        Coleta coletaObj = new Coleta();
        coletaObj.setAmostra(amostra);
        coletaObj.setTipoBolsa(tipoBolsa);
        coletaObj.setLoteBolsa(loteBolsa);
        coletaObj.setDtHrInicioColeta(Calendar.getInstance());
        coletaObj.setOpeInicioColeta((String) session.getAttribute("user"));
        
        coletaObj.setPeso(peso);
        coletaObj.setTempoColeta(tempoColeta);
        coletaObj.setDtHrFimColeta(Calendar.getInstance());
        coletaObj.setOpeFimColeta((String) session.getAttribute("user"));

        String msg = "";
        
        if ((peso == 0) || (tempoColeta == 0)) {
            if (dao.adiciona(coletaObj)) {
                msg = "Amostra " + amostra + " registrada com sucesso!";
            } else {
                //mudar o direcionamento da pagina
                msg = "Ocorreu algum erro!<br>Volte e tente novamente.";
            }
        } else {
            if (dao.edita(coletaObj, amostra)) {
                msg = "Amostra " + amostra + " registrada com sucesso!";
            } else {
                msg = "Ocorreu algum erro!<br>Volte e tente novamente.";
            }
        }
        
        session.setAttribute("pagina", "coleta.jsp");
        session.setAttribute("msg", msg);
        response.sendRedirect("mensagem.jsp");
    }
}