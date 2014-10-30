<%-- 
    Created on : 22/11/2013, 14:43:24
    Author     : 00220039
--%>

<%
    //Recebe o valor da variável de sessão e valida se a sessão está ativa
    String masp = (String) session.getAttribute("login");

    if (masp == null) {
        response.sendRedirect("sair.jsp");
    }
%>
