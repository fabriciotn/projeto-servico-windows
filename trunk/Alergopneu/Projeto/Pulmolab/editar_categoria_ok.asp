<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<%
	Response.Charset = "UTF-8"
	cod_cat = Request.Form("cod_cat_alt")
	sql="UPDATE categoria_informacoes SET nome='" & Request.Form("name_cat_alt") & "'"
	 sql=sql & " where cod=" & cod_cat
     ObjDB.Execute sql	
%>
<!--#include file="conexaoOFF.asp" -->

		<script type="text/javascript">
			alert('Categoria alterada com sucesso!');
			window.opener.location = "cadastrar_informacao.asp";
			window.opener.focus();
		</script>