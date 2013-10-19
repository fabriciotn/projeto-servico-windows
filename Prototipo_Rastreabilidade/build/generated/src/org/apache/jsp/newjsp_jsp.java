package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            var conta = 0;\n");
      out.write("\n");
      out.write("            function novaLinha() {\n");
      out.write("                conta++;\n");
      out.write("\n");
      out.write("                var parte1 = \"<tr><td>Teste \" + conta + \"</td>\";\n");
      out.write("                var parte2 = \"<td  id='tabela_linha_\" + conta + \"'><input type='button' \";\n");
      out.write("                var parte3 = \"value='remover' onClick=\\\"javascript:removeLinha('tabela_linha_\" + conta + \"')\\\"></input>\";\n");
      out.write("\n");
      out.write("                document.getElementById(\"tabela_produto\").innerHTML += parte1 + parte2 + parte3;\n");
      out.write("                document.getElementById(\"tabela_produto\").innerHTML += \"</td></tr>\";\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function removeLinha(id) {\n");
      out.write("                teste = document.getElementById(id);\n");
      out.write("                teste.parentNode.parentNode.removeChild(teste.parentNode);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form>\n");
      out.write("            <input type=\"button\" value=\"inserir\" onClick=\"javascript:novaLinha()\"></input>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <table id=\"tabela_produto\" >\n");
      out.write("            <tr>\n");
      out.write("                <td> Teste 1</td>\n");
      out.write("                <td id=\"tabela_linha_1\"><input type=\"button\" value=\"remover\" onclick=\"javascript:removeLinha('tabela_linha_1')\"></td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
