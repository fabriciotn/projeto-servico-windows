<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
       <div id="titulo_centro"><img src="img/titulo_posgraduacao.png" width="152" height="21" border="0" /></div>
       
       <div id="texto_centro">
<%

'	tipo 3 = tipo pos-graduacao

	sqlTextos = "SELECT titulo, texto, cod FROM textos WHERE tipo = 3 ORDER BY cod DESC LIMIT 1"
	
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
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><span class="destaque_vermelho">Corpo de Preceptores da resid�ncia de Pneumologia e Alergia Pedi�trica Hospital Fel�cio Rocho  (HFR)  e Centro Geral de Pediatria  (CGP) </span></p>
<p>&nbsp;</p>
<table class="table">
  <tr class="titulo_tabela">
    <td width="40%"><div align="center">PRECEPTOR</div></td>
    <td width="36%"><div align="center">�REA                               DE ATUA��O</div></td>
    <td width="24%"><div align="center">LOCAL</div></td>
  </tr>
  <tr>
    <td>Dr. Wilson Rocha Filho</td>
    <td>Coordenador do Servi�o<br />
      Amb.   Pneumologia e Alergia<br />
      Pacientes internados</td>
    <td >Hospital Fel�cio Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra. Simone Nabuco de   Senna</td>
    <td>Amb. Alergia e Pneumologia<br />
      Lab.   Fun��o Pulmonar</td>
    <td>Hospital Fel�cio Rocho </td>
  </tr>
  <tr>
    <td >Dr. Jos� Semionato Filho</td>
    <td >Amb. Pneumologia e Alergia   e Sub especialidades: Drepanocitose, Tuberculose<br />
      Doen�as Metab�licas   (Gaucher)</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dr. Alberto Vergara</td>
    <td>Fibrose C�stica<br />
      Distrofia   Muscular</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dra. Marisa Lage Ribeiro</td>
    <td >Amb. Alergia e Pneumologia</td>
    <td >Hospital Fel�cio Rocho </td>
  </tr>
  <tr>
    <td >Dra. Luisa Delfim</td>
    <td>Amb. Pneumologia e Alergia<br />
      Ambulat�rio   de Displasia Broncopulmonar<br />
      Ambulat�rio de Pacientes Neurol�gicos<br />
      Lab.   Fun��o Pulmonar/ Fun��o Pulmonar Lactente</td>
    <td>Hospital Fel�cio Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra. M�rcia Leonardo</td>
    <td >Polissonografia</td>
    <td>Hospital Fel�cio Rocho </td>
  </tr>
  <tr>
    <td>Dr. Francisco Caldeira   Reis</td>
    <td>Amb. Fibrose C�stica</td>
    <td>Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dr. Paulo Bittencourt</td>
    <td >Broncoscopia e Endoscopia   Pedi�trica</td>
    <td>Hospital Fel�cio Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dr. Clementino de Mendon�a   Pereira Proc�pio</td>
    <td >Lab. Fun��o Pulmonar <br />
      Radiologia   de T�rax</td>
    <td>Hospital Fel�cio Rocho </td>
  </tr>
  <tr>
    <td>Dr. Jorge Andrade Pinto</td>
    <td>Ambulat�rio de   Imunodefic�ncias Prim�rias</td>
    <td >Hospital das Cl�nicas UFMG </td>
  </tr>
  <tr>
    <td>Dra. Suzana Fonseca de   Oliveira</td>
    <td>Gastro Pedi�trica<br />
      Amb.   Fibrose C�stica</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra. Maria Vit�ria   Quintero</td>
    <td >Ambulat�rio de   Reumatologia Pedi�trica</td>
    <td >Santa Casa de Miseric�rdia   de Belo Horizonte </td>
  </tr>
  <tr>
    <td>Dra. Maria Aparecida   Grossi</td>
    <td>Ambulat�rio de   Dermatologia</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dra. Patr�cia Mansur</td>
    <td>Ambulat�rio do Respirador   Bucal</td>
    <td >Hospital Militar </td>
  </tr>
  <tr>
    <td>Dra. Amarillis Batista   Teixeira</td>
    <td >Neonatologia<br />
      Ambulat�rio   de Displasia Broncopulmonar</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra Luciana  Dolabela   Veloso Gauzzi</td>
    <td >Neurologia Pedi�trica<br />
      Ambulat�rio   de Neuropatas com Problemas Pulmonares</td>
    <td>Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra Ros�ngela Figueiredo</td>
    <td>Hematologia Pedi�trica<br />
      Ambulat�rio   de Drepanocitose</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dr. Edmundo Clarindo</td>
    <td >Cardiologia Pedi�trica<br />
      Hemodin�mica</td>
    <td >Hospital Fel�cio Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dr. Max Carsalad</td>
    <td >Cirurgia Tor�cica   Pedi�trica</td>
    <td >Hospital Fel�cio Rocho </td>
  </tr>
  <tr>
    <td>Dr. Carlos Jorge Simal</td>
    <td>Medicina Nuclear<br />
      Cintilografia   Pulmonar</td>
    <td >Hospital Fel�cio Rocho </td>
  </tr>
</table>
<p><br />
</p>
<p>&nbsp;</p>
   <p>&nbsp;</p>
       </div>
       
       </div>
       
 <!-- #include file="direita_menor.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->

<!--#include file="conexaoOFF.asp" -->

</body>
</html>
