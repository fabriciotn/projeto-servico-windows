<%-- 
    Document   : ValidaSessao
    Created on : 31/08/2013, 12:13:18
    Author     : Fabricio
--%>

<%
    //Recebe o valor da variável de sessão e valida se a sessão está ativa
    String masp = (String) session.getAttribute("user");

    if (masp == null) {
        response.sendRedirect("sair.jsp");
    }
%>
