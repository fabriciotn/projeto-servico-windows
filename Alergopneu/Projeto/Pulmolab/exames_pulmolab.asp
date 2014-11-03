<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<!-- #include file="includes.asp" -->
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
       <div id="titulo_centro"><img src="img/titulo_examespulmolab.png" width="474" height="20" border="0" /></div>
       
       <div id="texto_centro">
 <%
 	SQL = "SELECT cod, data, titulo, texto FROM textos WHERE tipo = 6"

	Set rsFibrose = Server.CreateObject("ADODB.RecordSet")
	
	rsFibrose.Open SQL, ObjDb, 3, 1
	
	IF rsFibrose.EOF = FALSE THEN
	
		titulo = rsFibrose("titulo")
		texto = rsFibrose("texto")
	END IF
 %>
 <p>
 	<%=titulo%>
 </p>
 <br /><br />
<!-- <p>
 	<%=texto%>
 </p>-->


<table width="567" cellpadding="10" cellspacing="5" class="table">
  <tr>
    <td width="557" class="cor_cinza_claro"><strong>PROVA DE FUN&Ccedil;&Atilde;O PULMONAR</strong></td>
    </tr>
  <tr>
    <td class="cor_cinza_escuro">Pr&eacute; e P&oacute;s broncodilata&ccedil;&atilde;o<br />
Avalia&ccedil;&atilde;o pr&eacute;-operat&oacute;ria<br />
Pletismografia<br />
PI max/ PE max<br />
Resist&ecirc;ncia e condut&acirc;ncia <br />
Dilui&ccedil;&atilde;o de H&eacute;lio</td>
  </tr>
  <tr>
    <td class="cor_cinza_claro"><strong>TESTES DE PROVOCA&Ccedil;&Atilde;O</strong></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Metacolina<br />
Ant&iacute;geno<br />
Exerc&iacute;cio<br />
Aspirina e outras drogas<br />
Metabissulfito<br />
Alimentos: IgE e n&atilde;o IgE mediadas</td>
  </tr>
  <tr>
    <td class="cor_cinza_claro"><strong>TESTE DA CAMINHADA</strong></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro"><strong>DOSAGEM DE ELETR&Oacute;LITOS NO SUOR</strong></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro"><strong>pH-METRIA DE 24 HORAS</strong></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro"><strong>TESTES AL&Eacute;RGICOS</strong></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Inalantes (&aacute;caros, fungos, etc.)<br />
Epid&eacute;rmicos (pelos, penas, etc.) <br />
Alimentos<br />
Himen&oacute;pteros (abelha, marimbondo)<br />
Penicilina (Pre-Pen)<br />
Anest&eacute;sicos e outras drogas</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">IMUNOTERAPIA (vacinas)</td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">&Aacute;caros<br />
      Himen&oacute;pteros  (abelha e marimbondo)
      <br />
      Alimentos (vacina oral)</td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
       </div>
       
       </div>
       
 <!-- #include file="direita_menor.asp" -->      

 </div>      
</div>
</div>
    

<!-- #include file="rodape.asp" -->

<!--#include file="conexaoOFF.asp" -->

</body>
</html>
