package Servlets;

import DAO.ReacoesDAO;
import POJO.Reacoes;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletReacoes extends HttpServlet {

    public static Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");

        HttpSession session = request.getSession(true);

        /*Recebendo os valores da página JSP
         Dados da Coleta*/
        String amostra = request.getParameter("amostra");
        String reacao = request.getParameter("reacao");
        String observacao = request.getParameter("observacao");
        String lote = request.getParameter("lote");
        String prescricao = request.getParameter("prescricao");
        int pa1 = 0;
        int pa2 = 0;
        int pulso = 0;
        if (request.getParameter("pa1") != null) {
            pa1 = Integer.parseInt(request.getParameter("pa1"));
        }
        if (request.getParameter("pa2") != null) {
            pa2 = Integer.parseInt(request.getParameter("pa2"));
        }
        if (request.getParameter("pulso") != null) {
            pulso = Integer.parseInt(request.getParameter("pulso"));
        }

        ReacoesDAO dao = new ReacoesDAO();
        Reacoes reacoesObj = new Reacoes();
        reacoesObj.setAmostra(amostra);
        reacoesObj.setReacao(reacao);
        reacoesObj.setObservacao(observacao);
        reacoesObj.setPa1(pa1);
        reacoesObj.setPa2(pa2);
        reacoesObj.setPulso(pulso);
        reacoesObj.setPrescricao(prescricao);
        reacoesObj.setLote(lote);
        reacoesObj.setOpeReacao((String) session.getAttribute("user"));
        reacoesObj.setDtHrReacao(Calendar.getInstance());
        
        String msg = "";
        
        if(dao.adiciona(reacoesObj)){
            msg = "Reação cadastrada com sucesso!";
        }else{
            msg = "Ocorreu algum erro!<br>Volte e tente novamente.";
        }
        
        session.setAttribute("pagina", "reacoes.jsp");
        session.setAttribute("msg", msg);
        response.sendRedirect("mensagem.jsp");
    }
}