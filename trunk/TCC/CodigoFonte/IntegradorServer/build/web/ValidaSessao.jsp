<%-- 
    Created on : 22/11/2013, 14:43:24
    Author     : 00220039
--%>

<%
    //Recebe o valor da vari�vel de sess�o e valida se a sess�o est� ativa
    String masp = (String) session.getAttribute("login");

    if (masp == null) {
        response.sendRedirect("sair.jsp");
    }
%>
