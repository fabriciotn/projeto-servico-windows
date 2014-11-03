<%
	categoriaForum	=	Session("categoriaForum")
	emailForum	=	Session("emailForum")
	nomeForum	=	Session("nomeForum")
	idForum	=	Session("idForum")
	
	Session("idForum") = idForum
	Session("nomeForum") = nomeForum
	Session("emailForum") = emailForum
	Session("categoriaForum") = categoriaForum
%>