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
<p><span class="destaque_vermelho">Corpo de Preceptores da residência de Pneumologia e Alergia Pediátrica Hospital Felício Rocho  (HFR)  e Centro Geral de Pediatria  (CGP) </span></p>
<p>&nbsp;</p>
<table class="table">
  <tr class="titulo_tabela">
    <td width="40%"><div align="center">PRECEPTOR</div></td>
    <td width="36%"><div align="center">ÁREA                               DE ATUAÇÃO</div></td>
    <td width="24%"><div align="center">LOCAL</div></td>
  </tr>
  <tr>
    <td>Dr. Wilson Rocha Filho</td>
    <td>Coordenador do Serviço<br />
      Amb.   Pneumologia e Alergia<br />
      Pacientes internados</td>
    <td >Hospital Felício Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra. Simone Nabuco de   Senna</td>
    <td>Amb. Alergia e Pneumologia<br />
      Lab.   Função Pulmonar</td>
    <td>Hospital Felício Rocho </td>
  </tr>
  <tr>
    <td >Dr. José Semionato Filho</td>
    <td >Amb. Pneumologia e Alergia   e Sub especialidades: Drepanocitose, Tuberculose<br />
      Doenças Metabólicas   (Gaucher)</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dr. Alberto Vergara</td>
    <td>Fibrose Cística<br />
      Distrofia   Muscular</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dra. Marisa Lage Ribeiro</td>
    <td >Amb. Alergia e Pneumologia</td>
    <td >Hospital Felício Rocho </td>
  </tr>
  <tr>
    <td >Dra. Luisa Delfim</td>
    <td>Amb. Pneumologia e Alergia<br />
      Ambulatório   de Displasia Broncopulmonar<br />
      Ambulatório de Pacientes Neurológicos<br />
      Lab.   Função Pulmonar/ Função Pulmonar Lactente</td>
    <td>Hospital Felício Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra. Márcia Leonardo</td>
    <td >Polissonografia</td>
    <td>Hospital Felício Rocho </td>
  </tr>
  <tr>
    <td>Dr. Francisco Caldeira   Reis</td>
    <td>Amb. Fibrose Cística</td>
    <td>Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dr. Paulo Bittencourt</td>
    <td >Broncoscopia e Endoscopia   Pediátrica</td>
    <td>Hospital Felício Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dr. Clementino de Mendonça   Pereira Procópio</td>
    <td >Lab. Função Pulmonar <br />
      Radiologia   de Tórax</td>
    <td>Hospital Felício Rocho </td>
  </tr>
  <tr>
    <td>Dr. Jorge Andrade Pinto</td>
    <td>Ambulatório de   Imunodeficências Primárias</td>
    <td >Hospital das Clínicas UFMG </td>
  </tr>
  <tr>
    <td>Dra. Suzana Fonseca de   Oliveira</td>
    <td>Gastro Pediátrica<br />
      Amb.   Fibrose Cística</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra. Maria Vitória   Quintero</td>
    <td >Ambulatório de   Reumatologia Pediátrica</td>
    <td >Santa Casa de Misericórdia   de Belo Horizonte </td>
  </tr>
  <tr>
    <td>Dra. Maria Aparecida   Grossi</td>
    <td>Ambulatório de   Dermatologia</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dra. Patrícia Mansur</td>
    <td>Ambulatório do Respirador   Bucal</td>
    <td >Hospital Militar </td>
  </tr>
  <tr>
    <td>Dra. Amarillis Batista   Teixeira</td>
    <td >Neonatologia<br />
      Ambulatório   de Displasia Broncopulmonar</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra Luciana  Dolabela   Veloso Gauzzi</td>
    <td >Neurologia Pediátrica<br />
      Ambulatório   de Neuropatas com Problemas Pulmonares</td>
    <td>Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dra Rosângela Figueiredo</td>
    <td>Hematologia Pediátrica<br />
      Ambulatório   de Drepanocitose</td>
    <td >Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td>Dr. Edmundo Clarindo</td>
    <td >Cardiologia Pediátrica<br />
      Hemodinâmica</td>
    <td >Hospital Felício Rocho/   Centro Geral de Pediatria </td>
  </tr>
  <tr>
    <td >Dr. Max Carsalad</td>
    <td >Cirurgia Torácica   Pediátrica</td>
    <td >Hospital Felício Rocho </td>
  </tr>
  <tr>
    <td>Dr. Carlos Jorge Simal</td>
    <td>Medicina Nuclear<br />
      Cintilografia   Pulmonar</td>
    <td >Hospital Felício Rocho </td>
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
