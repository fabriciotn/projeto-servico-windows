<%
'	Response.Write(volta)
'	Response.End()
	IF	volta = "forum_medicos.asp" OR volta = "forum_leigos" THEN
%>
		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "<%=volta%>";
			window.opener.focus();
		</script>
<%
	ELSEIF volta = "ferramenta_corpo.asp" THEN
%>
		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "<%=volta%>";
			window.opener.focus();
		</script>
<%
	ELSEIF volta = "forum.asp" THEN
%>
		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.location = "<%=volta%>";
		</script>
<%
	ELSE
%>
		<script type="text/javascript">
			alert('Cadastrado com sucesso!');
			window.close();
			window.opener.location = "ferramenta_corpo.asp";
			window.opener.focus();
		</script>
<%
	END IF
%>