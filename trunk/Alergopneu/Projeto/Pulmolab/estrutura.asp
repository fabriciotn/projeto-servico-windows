<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
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
       <div id="titulo_centro"><img src="img/titulo_estrutura.png" width="100" height="16" border="0" /></div>
       
       <div id="texto_centro">
      <p>
     <%

'	tipo 1 = tipo estrutura

	sqlTextos = "SELECT titulo, texto, cod FROM textos WHERE tipo = 1 ORDER BY cod DESC LIMIT 1"
	
	Set rsTextos = server.CreateObject("ADODB.RecordSet")
	
'	Response.Write(sqlTextos)
'	Response.End()
	
	rsTextos.Open sqlTextos, ObjDB,3,1

	IF rsTextos.EOF = FALSE THEN
	
		texto = rsTextos("texto")
		titulo = rsTextos("titulo")
		cod = rsTextos("cod")
%>	
     <%=texto%>
  <%
	END IF
%>
     
   </p>
   <p>&nbsp;</p>
   <p>&nbsp;</p>
   <table width="650" cellspacing="5" class="table">
     <tr>
       <td colspan="3"><p class="titulo_tabela"><strong>FACILIDADES E  CARACTER&Iacute;STICAS DO SERVI&Ccedil;O DE</strong><br />
           <strong>PNEUMOLOGIA E ALERGIA  PEDI&Aacute;TRICA</strong></strong></p></td>
     </tr>
     <tr>
       <td colspan="3" class="cor_cinza_escuro">1 &ndash; PULMOLAB - LABORAT&Oacute;RIO DE  PNEUMOLOGIA E ALERGIA </td>
       </tr>
     <tr>
       <td width="288" rowspan="6" class="cor_cinza_claro">Prova de Fun&ccedil;ao Pulmonar</td>
       <td width="341" class="cor_cinza_claro">Pr&eacute; e P&oacute;s broncodilata&ccedil;&atilde;o         <br /></td>
       
     </tr>
     <tr>
       <td class="cor_cinza_claro">Avalia&ccedil;&atilde;o pr&eacute;-operat&oacute;ria</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Pletismografia </td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">PI max/ PE max</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Resist&ecirc;ncia e condut&acirc;ncia </td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Dilui&ccedil;&atilde;o de H&eacute;lio</td>
     </tr>
     <tr>
       <td rowspan="6" class="cor_cinza_escuro">Testes de Provoca&ccedil;&atilde;o</td>
       <td class="cor_cinza_escuro">Metacolina</td>
       </tr>
     <tr>
       <td class="cor_cinza_escuro">Ant&iacute;geno</td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Exerc&iacute;cio</td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Aspirina e outras drogas<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Metabissulfito<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Alimentos: IgE e n&atilde;o IgE mediadas</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Teste de Caminhada</td>
       <td class="cor_cinza_claro">&nbsp;</td>
     </tr>
     <tr>
       <td><p class="cor_cinza_escuro">Dosagem de Eletr&oacute;litos no Suor</p></td>
       <td class="cor_cinza_escuro">&nbsp;</td>
     </tr>
     <tr>
       <td rowspan="6" class="cor_cinza_claro">Testes Al&eacute;rgicos</td>
       <td class="cor_cinza_claro">Inalantes (&aacute;caros, fungos, etc.)         <br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Epid&eacute;rmicos (pelos, penas, etc.)<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Alimentos</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Himen&oacute;pteros (abelha, marimbondo)<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Penicilina (Pre-Pen)<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Anest&eacute;sicos e outras drogas</td>
     </tr>
     <tr>
       <td colspan="2" class="cor_cinza_escuro">02 - TOMOGRAFIA COMPUTADORIZADA DE ALTA RESOLU&Ccedil;&Atilde;O</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_claro">03 - MEDICINA NUCLEAR: Cintilografia  Pulmonar com Ventila&ccedil;&atilde;o e Perfus&atilde;o</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_escuro">04 - RESSON&Acirc;NCIA MAGN&Eacute;TICA</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_claro">05 - HEMODIN&Acirc;MICA  INTERVENSIONISTA: Cateterismo card&iacute;aco e vascular</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_escuro">06 - CIRURGIA PEDI&Aacute;TRICA  COM ESPECIALIZA&Ccedil;&Atilde;O EM PNEUMOLOGIA</td>
       </tr>
     <tr>
       <td rowspan="3" class="cor_cinza_claro">07 - SETOR DE INTERNA&Ccedil;&Atilde;O</td>
       <td class="cor_cinza_claro">Lactentes</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Escolares</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Adolescentes</td>
     </tr>
     <tr>
       <td rowspan="5" class="cor_cinza_escuro">08 &ndash; EQUIPES MULTIDICIPLINARES ESPECIALIZADAS EM</td>
       <td class="cor_cinza_escuro">Fibrose C&iacute;stica<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Doen&ccedil;as Neuromusculares &ndash; Programa Ventilar</td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Alergia Alimentar e Anafilaxia &ndash; N&uacute;cleo Allos<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Displasia Broncopulmonar &ndash; N&uacute;cleo Superar<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Doen&ccedil;a de Gaucher</td>
     </tr>
     <tr>
       <td rowspan="10" class="cor_cinza_claro">09 - AMBULAT&Oacute;RIO DE PNEUMOLOGIA E ALERGIA, REFER&Ecirc;NCIA  DO SUS</td>
       <td><p class="cor_cinza_claro">Ambulat&oacute;rio de Patologias Respirat&oacute;rias Complexas
         <br />
       </p></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Fibrose C&iacute;stica<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Asma e demais alergias<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Pneumologia Geral<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Displasia Broncopulmonar (N&Uacute;CLEO SUPERAR)</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Respirador bucal<br /></td>
     </tr>
     <tr>
       <td height="22" class="cor_cinza_claro">Ambulat&oacute;rio de Reumatologia</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Imunodefici&ecirc;ncias<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Alergia alimentar e anafilaxia (N&Uacute;CLEO ALLOS)</td>
     </tr>
     <tr>
       <td class="cor_cinza_claro">Ambulat&oacute;rio de Pacientes neurol&oacute;gicos c/ pneumopatias cr&ocirc;nicas</td>
     </tr>
     <tr>
       <td rowspan="5" class="cor_cinza_escuro">09 - AMBULAT&Oacute;RIO DE PNEUMOLOGIA E ALERGIA DE CONV&Ecirc;NIOS</td>
       <td class="cor_cinza_escuro">Ambulat&oacute;rio de Asma e demais alergias         <br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Ambulat&oacute;rio de Pneumologia Geral<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Ambulat&oacute;rio de Displasia Broncopulmonar (N&Uacute;CLEO SUPERAR)<br /></td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Ambulat&oacute;rio de Alergia alimentar e anafilaxia (N&Uacute;CLEO ALLOS)</td>
     </tr>
     <tr>
       <td class="cor_cinza_escuro">Ambulat&oacute;rio de Patologias Respirat&oacute;rias Complexas</td>
     </tr>
     <tr>
       <td colspan="2" class="cor_cinza_claro">10 - BRONCOSCOPIA/ENDOSCOPIA  COM LAVADO BRONCOALVEOLAR</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_escuro">11 &ndash; POLISSONOGRAFIA  PEDI&Aacute;TRICA</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_claro">12 - FISIOTERAPIA RESPIRAT&Oacute;RIA PEDI&Aacute;TRICA</td>
       </tr>
     <tr>
       <td colspan="2" class="cor_cinza_escuro">13 - CURSO PARA PAIS DE CRIAN&Ccedil;AS ASM&Aacute;TICAS </td>
       </tr>
 </table>
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
