<%-- 
    Document   : ValidaSessao
    Created on : 31/08/2013, 12:13:18
    Author     : Fabricio
--%>

<%
    //Recebe o valor da vari�vel de sess�o e valida se a sess�o est� ativa
    String masp = (String) session.getAttribute("user");

    if (masp == null) {
        response.sendRedirect("sair.jsp");
    }
%>
