package Servlets;

import DAO.ControleDeEntregaDAO;
import POJO.ControleDeEntrega;
import POJO.Reacoes;
import java.util.Calendar;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletControleEntrega extends HttpServlet {

    public static Connection con;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");

        HttpSession session = request.getSession(true);

        /*Recebendo os valores da página JSP
         Dados da Coleta*/
        String amostra = request.getParameter("amostra");
        String motivo = request.getParameter("motivo");
        String hemocomponente = request.getParameter("hemocomponente");
        String outroHemocomp = request.getParameter("outro");
        String destino = request.getParameter("destino");
        

        ControleDeEntregaDAO dao = new ControleDeEntregaDAO();
        ControleDeEntrega ControleDeEntregaObj = new ControleDeEntrega();
        ControleDeEntregaObj.setAmostra(amostra);
        ControleDeEntregaObj.setMotivo(motivo);
        ControleDeEntregaObj.setHemocomponente(hemocomponente);
        ControleDeEntregaObj.setOutroHemocomp(outroHemocomp);
        ControleDeEntregaObj.setDestino(destino);
        ControleDeEntregaObj.setOperador((String) session.getAttribute("user"));
        ControleDeEntregaObj.setDataHora(Calendar.getInstance());
        
        String msg = "";
        
        if(dao.adiciona(ControleDeEntregaObj)){
            msg = "Bolsa " + amostra + " registrada com sucesso!";
        }else{
            msg = "Ocorreu algum erro!<br>Volte e tente novamente.";
        }
        
        session.setAttribute("pagina", "controleDeEntrega.jsp");
        session.setAttribute("msg", msg);
        response.sendRedirect("mensagem.jsp");
    }
}