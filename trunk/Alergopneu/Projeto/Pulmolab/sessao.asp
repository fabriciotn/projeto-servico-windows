<%
	usuario = Session("usuario")
	nivelUsuario = Session("nivelUsuario")
	
	if usuario = "" then
		Session.Abandon()
		Response.Redirect("area_admin.asp")
	end if
%>