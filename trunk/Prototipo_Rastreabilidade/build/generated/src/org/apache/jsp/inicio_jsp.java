package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;

public final class inicio_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/ValidaSessao.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

    //Recebe o valor da variável de sessão e valida se a sessão está ativa
    String masp = (String) session.getAttribute("user");

    if (masp == null) {
        response.sendRedirect("sair.jsp");
    }

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"estilocss.css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"script.js\"></script>\n");
      out.write("\n");
      out.write("        <title>Sistema de Rastreabilidade - Fundação Hemominas</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <span id=\"MsgAguarde\" style=\"display:none; font-size:11px;\">\n");
      out.write("            Aguarde...\n");
      out.write("        </span>\n");
      out.write("\n");
      out.write("        <div id=\"tudo\">\n");
      out.write("            <div id=\"frame\">\n");
      out.write("                <iframe src=\"banner.jsp\" height=\"100px\" width=\"100%\" frameborder=\"0\" scrolling=\"no\"></iframe>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <a href=\"sair.jsp\">Logoff</a>\n");
      out.write("            </div>\n");
      out.write("            <!Listagem do Menu!>\n");
      out.write("            <div id=\"menu\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"coleta.jsp\">Coleta</a></li>\n");
      out.write("                    <li><a href=\"reacoes.jsp\">Reações Adversas</a></li>\n");
      out.write("                    <li><a href=\"fracionamento.jsp\">Fracionamento</a></li>\n");
      out.write("                    <li><a href=\"relatorios.jsp\">Relatórios</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <br/>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"conteudo\">\n");
      out.write("                <h2>Sistema de rastreabilidade.</h2>\n");
      out.write("                Bem vindo ");
out.println("<b>" + masp + "</b>!");
      out.write("<br/>\n");
      out.write("                <ul>\n");
      out.write("                    <li>Selecione o menu desejado para realizar os procedimentos:</li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
