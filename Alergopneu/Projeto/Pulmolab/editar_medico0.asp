<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<!-- #include file="includes.asp" -->

<style type="text/css">
<!--
	.dado{
		width:180px;
		text-align:left;
	}
	.anoTitulos{
		width:80px;
		height:10px;
		text-align:left;
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


	id = Request.QueryString("id")
	SQL = "SELECT categoria as codCategoria FROM corpoclinico WHERE id = "& id
'	RESPONSE.Write(SQL)
'	Response.End()
	set rs = server.CreateObject("ADODB.RecordSet")

	rs.Open SQL, ObjDB,3,1
	
	IF rs.EOF = FALSE THEN 
		codCategoria = rs("codCategoria")
	END IF

	IF codCategoria = "1" THEN
		titulo = "Cadastro de Corpo Cl&iacute;nico"
		url = "formCorpo.asp"
	ELSEIF codCategoria = "2" THEN
		titulo = "Profissionais da &aacute;rea de sa&uacute;de"
		url = "formProfissionaisAreaSaude.asp"
	ELSEIF outro <> "" OR codCategoria = "3" THEN
		titulo = "Pós - Graduandos"
		url = "formPosGraduandosAtivos.asp"
	ELSEIF codCategoria = "4" THEN
		titulo = "Cadastro de Ex P&oacute;s Graduandos"
		url = "formExPos.asp"
	ELSEIF codCategoria = "5" THEN
		titulo = "Profissionais da &aacute;rea de sa&uacute;de"
		url = "formProfissionaisAreaSaude.asp"
'		titulo = "M&eacute;dicos e Estudantes da &aacute;rea de Sa&uacute;de"
'		url = "formMedicos.asp"
	ELSEIF codCategoria = "6" THEN
		titulo = "Cadastro para Leigos"
		url = "formLeigos.asp"
	ELSEIF outro <> "" THEN
		titulo = "Cadastro de P&oacute;s Graduando em Atividade"
		url = "formPosGraduandoAtivo.asp"
	END IF

	'Response.Write(url & "|||" )

%>

<div id="cadastro_exemplo">
	<div id="titulo_cadastro_exemplo"><%=titulo%></div>
	<div id="table_cadastro_exemplo">
<%
	if Request("teste") = "1" then
	Response.Write(codCategoria)
	end if

	IF codCategoria = "1" THEN
%>	
		<!-- #include file="formCorpo.asp" -->      
<%
	ELSEIF codCategoria = "2" THEN
%>	
		<!-- #include file="formProfissionaisAreaSaude.asp" -->      
<%
	ELSEIF outro <> "" OR codCategoria = "3" THEN
%>	
		<!-- #include file="formPosGraduandoAtivo.asp" -->      
<%
	ELSEIF codCategoria = "4" THEN
%>	
		<!-- #include file="formExPos.asp" -->      
<%
	ELSEIF codCategoria = "5" THEN
%>	
		<!-- #include file="formProfissionaisAreaSaude.asp" -->      
		<!-- # include file="formMedicos.asp" -->      
<%
	ELSEIF codCategoria = "6" THEN
%>	
		<!-- #include file="formLeigos.asp" -->      
<%
	END IF
%>


	</div>
</div>

</body>
</html>
<!--#include file="conexaoOFF.asp" -->