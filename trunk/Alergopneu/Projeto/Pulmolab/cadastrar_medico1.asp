<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<!-- #include file="includes.asp" -->

<style type="text/css">
<!--
	.dado{
		width:200px;
	}
	.anoTitulos{
		width:80px;
		height:10px;
	}
	.dado_maior{
		width:250px;
	}
-->
</style>
</head>

<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<%

	ultima_pagina = Session("ultima_pagina")
	Session ("ultima_pagina") = ultima_pagina
	
	categoria = Request.Form("categoria")
	
	outro = Request.QueryString("outro")
	
	volta = "ferramenta_corpo.asp"

	IF categoria = "1" THEN
		titulo = "Cadastro de Corpo Cl&iacute;nico"
		url = "formCorpo.asp"
	ELSEIF categoria = "2" THEN
		titulo = "Profissionais da &aacute;rea de sa&uacute;de"
		url = "formProfissionaisAreaSaude.asp"
	ELSEIF categoria = "4" THEN
		titulo = "Cadastro de Ex P&oacute;s Graduandos"
		url = "formExPos.asp"
	ELSEIF categoria = "5" THEN
		titulo = "M&eacute;dicos e Estudantes da &aacute;rea de Sa&uacute;de"
		url = "formMedicos.asp"
	ELSEIF categoria = "6" THEN
		titulo = "Cadastro para Leigos"
		url = "formLeigos.asp"
'	ELSEIF outro <> "" THEN
	ELSEIF categoria = "3" THEN
		titulo = "Cadastro de P&oacute;s Graduando em Atividade"
		url = "formPosGraduandoAtivo.asp"
	END IF

%>

<div id="cadastro_exemplo">
	<div id="titulo_cadastro_exemplo"><%=titulo%></div>
	<div id="table_cadastro_exemplo">
<%
	IF categoria = "1" THEN
%>	
		<!-- #include file="formCorpo.asp" -->      
<%
	ELSEIF categoria = "2" THEN
%>	
		<!-- #include file="formProfissionaisAreaSaude.asp" -->      
<%
'	ELSEIF outro <> "" THEN
	ELSEIF categoria = "3" THEN
%>	
		<!-- #include file="formPosGraduandoAtivo.asp" -->      
<%
	ELSEIF categoria = "4" THEN
%>	
		<!-- #include file="formExPos.asp" -->      
<%
	ELSEIF categoria = "5" THEN
%>	    
		<!-- #include file="formMedicos.asp" --> 
<%
	ELSEIF categoria = "6" THEN
%>	
		<!-- #include file="formLeigos.asp" -->       
<%
	END IF
%>


	</div>
</div>

</body>
</html>