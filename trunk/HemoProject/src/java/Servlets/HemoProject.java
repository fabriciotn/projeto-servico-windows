package Servlets;

import Conecta.ADAuthenticator;
import DAO.UsuariosDAO;
import POJO.Usuarios;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HemoProject extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");

        //Cria uma nova sessão
        HttpSession session = request.getSession(true);

        //Recebe da página de login o usuário e senha digitados
        String user = request.getParameter("user");
        String senha = request.getParameter("pass");

        //rd recebe a página que será direcionada quando
        //chamado o comando rd.forward(request, response);
        RequestDispatcher rd = null;

        if (user.equals("local")) {
            session.setAttribute("user", user);    //usuário             
            rd = request.getRequestDispatcher("principal.jsp");
            rd.forward(request, response);
        }

        //instanciando a classe ADAuthenticator para fazer
        //a validação do MASP e senha no servidor do AD
        ADAuthenticator a = new ADAuthenticator();

        //instanciando a classe UsuariosDAO
        UsuariosDAO dao = new UsuariosDAO();

        //Chama o método getUsu() que recebe um masp e retorna
        //os dados do usuário selecionado.
        List<Usuarios> usuarios = dao.getUsu(user);

        //Interação para validar o usuário
        if (usuarios.isEmpty()) {//verifica se o usuário está vazio.
            //redirecionando para a página erro.jsp
            response.sendRedirect("erro_login.jsp");
        } else {
            if (a.authenticate(user, senha)) {//valida no AD se usuário e senha estão corretos
                //Setando os atributos de sessão
                if (user != null) {
                    session.setAttribute("user", user);    //usuário
                }
                rd = request.getRequestDispatcher("principal.jsp");
                rd.forward(request, response);
            } else {//caso usuário ou senha não estiverem ok encaminha para página de erro.
                //redirecionando para a página erro.jsp
                response.sendRedirect("erro_login.jsp");
            }
        }
    }
}
