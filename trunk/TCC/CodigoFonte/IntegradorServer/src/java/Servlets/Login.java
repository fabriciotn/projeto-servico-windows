/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Conexao.Conecta;
import DAO.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 12546446
 */
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");

        Conecta con = new Conecta();
        con.conecta();

        POJO.Login user = new POJO.Login();
        LoginDAO logDao = new LoginDAO();
        user = logDao.validaUsuario(request.getParameter("user"), request.getParameter("pass"));

        //Cria uma nova sessÃ£o
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = null;

        if (user.getLogin() != null) {
            //Setando os atributos de sessÃ£o
            session.setAttribute("login", user.getLogin());
            session.setAttribute("nome", user.getNome());
            
            response.sendRedirect("inicio.jsp");
        } else {
            response.sendRedirect("erro_login.jsp");
        }
    }
}
