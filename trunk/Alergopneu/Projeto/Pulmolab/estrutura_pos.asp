<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<link href="css.css" rel="stylesheet" type="text/css" />.
<!-- #include file ="includes.asp" -->

</head>
<style type="text/css">

.abrir {
display:none; 
background: #F7F7F7;
padding:10px;
color:#666;
border:1px solid #999;
float:left;
margin-top:5px;
}

.abrir p {
font-size:12px;	
}

.abri {
cursor:pointer;
display:block;
text-align:justify;
*cursor:auto;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
		
		
		$('.abri').click(function(){
			$div = $(this).next(); 
			/*$('.clicar').slideUp("fast");
			$div.slideToggle("fast");*/

			if($div.css("display")=="none")
			{
				$div.slideDown('fast');
			}
			else
			{
				$div.slideUp('fast');		
			}
		
		});	
		

	});
</script>

<body>



<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
       <div id="titulo_centro"><img src="img/titulo_estrutura.png" width="100" height="16" border="0" /></div>
       
       <div id="texto_centro">
     <%

'	tipo 2 = tipo estrutura pos

	sqlTextos = "SELECT titulo, texto, cod FROM textos WHERE tipo = 2 ORDER BY cod DESC LIMIT 1"
	
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
<p><br />
  </p>
  
<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>FACILIDADES E CARACTERÍSTICAS DO SERVIÇO DE
                    <br />
                  PNEUMOLOGIA E ALERGIA PEDIÁTRICA</strong></p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>  
  
<div class="abrir">
<table width="625" cellspacing="5" class="table">
  <tr>
    <td colspan="3" class="cor_cinza_escuro">1 &ndash; PULMOLAB - LABORAT&Oacute;RIO DE  PNEUMOLOGIA E ALERGIA </td>
  </tr>
  <tr>
    <td width="273" rowspan="6" class="cor_cinza_claro">Prova de Fun&ccedil;ao Pulmonar</td>
    <td width="356" class="cor_cinza_claro">Pr&eacute; e P&oacute;s broncodilata&ccedil;&atilde;o <br /></td>
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
    <td class="cor_cinza_escuro">Dosagem de Eletr&oacute;litos no Suor</td>
    <td class="cor_cinza_escuro">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="6" class="cor_cinza_claro">Testes Al&eacute;rgicos</td>
    <td class="cor_cinza_claro">Inalantes (&aacute;caros, fungos, etc.) <br /></td>
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
    <td rowspan="3" class="cor_cinza_escuro">Imunoterapia  (Vacinas)</td>
    <td class="cor_cinza_escuro">&Aacute;caros</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Himen&oacute;pteros  (abelha e marimbondo)</td>
  </tr>
  <tr>
    <td class="cor_cinza_claro"><p class="cor_cinza_escuro">Alimentos (vacina oral)</p></td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_claro">02 - TOMOGRAFIA COMPUTADORIZADA DE ALTA RESOLU&Ccedil;&Atilde;O</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_escuro">03 - MEDICINA NUCLEAR: Cintilografia  Pulmonar com Ventila&ccedil;&atilde;o e Perfus&atilde;o</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_claro">04 - RESSON&Acirc;NCIA MAGN&Eacute;TICA</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_escuro">05 - HEMODIN&Acirc;MICA  INTERVENSIONISTA: Cateterismo card&iacute;aco e vascular</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_claro">06 - CIRURGIA PEDI&Aacute;TRICA  COM ESPECIALIZA&Ccedil;&Atilde;O EM PNEUMOLOGIA</td>
  </tr>
  <tr>
    <td rowspan="3" class="cor_cinza_escuro">07 - SETOR DE INTERNA&Ccedil;&Atilde;O</td>
    <td class="cor_cinza_escuro">Lactentes</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Escolares</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Adolescentes</td>
  </tr>
  <tr>
    <td rowspan="5" class="cor_cinza_claro">08 &ndash; EQUIPES MULTIDICIPLINARES ESPECIALIZADAS EM</td>
    <td class="cor_cinza_claro">Fibrose C&iacute;stica<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Doen&ccedil;as Neuromusculares &ndash; Programa Ventilar</td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Alergia Alimentar e Anafilaxia &ndash; N&uacute;cleo Allos<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Displasia Broncopulmonar &ndash; N&uacute;cleo Superar<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Doen&ccedil;a de Gaucher</td>
  </tr>
  <tr>
    <td rowspan="10" class="cor_cinza_escuro">09 - AMBULAT&Oacute;RIO DE PNEUMOLOGIA E ALERGIA, REFER&Ecirc;NCIA  DO SUS</td>
    <td><p class="cor_cinza_escuro">Ambulat&oacute;rio de Patologias Respirat&oacute;rias Complexas <br />
    </p></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Fibrose C&iacute;stica<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Asma e demais alergias<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Pneumologia Geral<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Displasia Broncopulmonar (N&Uacute;CLEO SUPERAR)</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Respirador bucal<br /></td>
  </tr>
  <tr>
    <td height="22" class="cor_cinza_escuro">Ambulat&oacute;rio de Reumatologia</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Imunodefici&ecirc;ncias<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Alergia alimentar e anafilaxia (N&Uacute;CLEO ALLOS)</td>
  </tr>
  <tr>
    <td class="cor_cinza_escuro">Ambulat&oacute;rio de Pacientes neurol&oacute;gicos c/ pneumopatias cr&ocirc;nicas</td>
  </tr>
  <tr>
    <td rowspan="5" class="cor_cinza_claro">09 - AMBULAT&Oacute;RIO DE PNEUMOLOGIA E ALERGIA DE CONV&Ecirc;NIOS</td>
    <td class="cor_cinza_claro">Ambulat&oacute;rio de Asma e demais alergias <br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Ambulat&oacute;rio de Pneumologia Geral<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Ambulat&oacute;rio de Displasia Broncopulmonar (N&Uacute;CLEO SUPERAR)<br /></td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Ambulat&oacute;rio de Alergia alimentar e anafilaxia (N&Uacute;CLEO ALLOS)</td>
  </tr>
  <tr>
    <td class="cor_cinza_claro">Ambulat&oacute;rio de Patologias Respirat&oacute;rias Complexas</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_escuro">10 - BRONCOSCOPIA/ENDOSCOPIA  COM LAVADO BRONCOALVEOLAR</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_claro">11 &ndash; POLISSONOGRAFIA  PEDI&Aacute;TRICA</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_escuro">12 - FISIOTERAPIA RESPIRAT&Oacute;RIA PEDI&Aacute;TRICA</td>
  </tr>
  <tr>
    <td colspan="2" class="cor_cinza_claro">13 - CURSO PARA PAIS DE CRIAN&Ccedil;AS ASM&Aacute;TICAS </td>
  </tr>
</table>
</div>


<br />
</p>
<p align="center"><strong>Corpo de Preceptores da pós  graduação em Pneumologia e Alergia Pediátrica<br />
  Hospital Infantil João Paulo II (HIJP  II) e Hospital Felício Rocho (HFR)</strong></p>
<p>&nbsp;</p>
<table cellpadding="5" cellspacing="5" class="table">
  <tr class="titulo_tabela">
    <td width="35%"><p align="center"><strong>PRECEPTOR</strong></p></td>
    <td width="34%"><p align="center"><strong>ÁREA DE ATUAÇÃO</strong></p></td>
    <td width="31%"><p align="center"><strong>LOCAL</strong></p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dr. Wilson Rocha Filho</p></td>
    <td><p align="center">Coordenador do Serviço</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II  <br />
      e<br />
      Hospital  Fel&iacute;cio Rocho</p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dra. Simone Nabuco de Senna</p></td>
    <td><p align="center">Alergia e Pneumologia<br />
      Laboratório de Função Pulmonar</p></td>
    <td><p align="center">Hospital  Fel&iacute;cio Rocho</p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dr. José Semionato Filho</p></td>
    <td><p align="center">Pneumologia e Alergia  <br />
      Doenças Metabólicas (Gaucher)</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dr. Alberto Vergara</p></td>
    <td><p align="center">Fibrose Cística<br />
      Distrofia Muscular</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dra. Luisa Delfim</p></td>
    <td><p align="center">Pneumologia e Alergia<br />
      Fibrose Cística<br />
      Pacientes Neurológicos<br />
      Laboratório de Função Pulmonar </p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II <br />
      e<br />
      Hospital  Fel&iacute;cio Rocho    </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dra. Márcia Leonardo</p></td>
    <td><p align="center">Distrofia Neuromuscular<br />
      Polissonografia</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dra. Mariana Scalco</p></td>
    <td><p align="center">Doenças Neuromusculares<br />
      Alergia e Pneumologia</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dr. Francisco Caldeira Reis</p></td>
    <td><p align="center">Fibrose Cística</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dr. Paulo Bittencourt</p></td>
    <td><p align="center">Broncoscopia e Endoscopia Pediátrica</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II <br />
      e<br />
      Hospital  Fel&iacute;cio Rocho    </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dr. Jorge Andrade Pinto</p></td>
    <td><p align="center">Imunodeficências Primárias</p></td>
    <td><p align="center">Hospital das Clínicas UFMG </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dra. Suzana Fonseca de Oliveira</p></td>
    <td><p align="center">Gastro Pediátrica<br />
      Fibrose Cística<br />
      Alergia Alimentar</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dr. Luis Fernando</p></td>
    <td><p align="center">Terapia Intensiva</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dra. Maria Vitória Quintero</p></td>
    <td><p align="center">Reumatologia Pediátrica</p></td>
    <td><p align="center">Santa Casa de Misericórdia de Belo    Horizonte </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dra. Patrícia Mansur</p></td>
    <td><p align="center">Respirador Bucal</p></td>
    <td><p align="center">Hospital Militar </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td><p>Dr. Edmundo Clarindo</p></td>
    <td><p align="center">Cardiologia Pediátrica<br />
      Hemodinâmica</p></td>
    <td><p align="center">Hospital  Infantil Jo&atilde;o Paulo II <br />
      e<br />
      Hospital  Fel&iacute;cio Rocho    </p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td><p>Dr. Carlos Jorge Simal</p></td>
    <td><p align="center">Medicina Nuclear<br />
      Cintilografia Pulmonar</p></td>
    <td><p align="center">Hospital  Fel&iacute;cio Rocho</p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p align="center"><strong>RESUMO DAS ATIVIDADES DA PÓS GRADUAÇÃO</strong></p>
<p>&nbsp;</p>
<%
'  TIPO 10 = RESUMO DAS ATIVIDADES DA POS GRADUACAO

	Set rsTextos = Server.CreateObject("ADODB.RecordSet")

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 10"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</p>



<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>PROGRAMA&Ccedil;&Atilde;O SEMANAL</strong></p>
                <p align="center" class="cor_cinza_claro"><strong>EST&Aacute;GIO ENFERMARIA &ndash; HOSPITAL INFANTIL JOAO  PAULO II<br />
              R1</strong></p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>


<div class="abrir">
          <table width="609" cellpadding="5" cellspacing="5" class="table">
            <tr>
              <td colspan="2" valign="top"><p class="titulo_tabela">SEGUNDA-FEIRA</p></td>
            </tr>
            <tr class="cor_cinza_claro">
              <td width="134" valign="top"><p>7:30 &ndash; 9:00</p></td>
              <td width="438" valign="top"><p>1&ordf; e 3&ordf; segunda do m&ecirc;s : reuni&atilde;o da Fibrose C&iacute;stica<br />
                2&ordf;    segunda feira do m&ecirc;s: reuni&atilde;o de Alergia Alimentar<br />
                &Uacute;ltima segunda do m&ecirc;s: reuni&atilde;o da Distrofia Muscular</p></td>
            </tr>
            <tr class="cor_cinza_escuro">
              <td width="134" valign="top"><p>9:00 &ndash; 12:00</p></td>
              <td width="438" valign="top"><p>Evolu&ccedil;&atilde;o e prescri&ccedil;&atilde;o dos pacientes da Pneumologia    (Enfermaria 3)</p></td>
            </tr>
            <tr class="cor_cinza_claro">
              <td width="134" valign="top"><p>13:00 &ndash; 17:00</p></td>
              <td width="438" valign="top"><p>Interconsultas na semi-interna&ccedil;&atilde;o e demais enfermarias</p></td>
            </tr>
            <tr>
              <td colspan="2" valign="top" class="titulo_tabela">TER&Ccedil;A-FEIRA</td>
            </tr>
            <tr>
              <td valign="top" class="cor_cinza_claro">7:30 &ndash; 9:00</td>
              <td valign="top" class="cor_cinza_claro">Reuni&atilde;o cl&iacute;nica no HFR &ndash; AULAS TE&Oacute;RICAS</td>
            </tr>
            <tr class="cor_cinza_escuro">
              <td valign="top">9:30 &ndash; 12:00</td>
              <td valign="top">Evolu&ccedil;&atilde;o e prescri&ccedil;&atilde;o dos pacientes da  Pneumologia (Enfermaria 3)</td>
            </tr>
            <tr class="cor_cinza_claro">
              <td valign="top">13:00 &ndash; 17:00</td>
              <td valign="top">Interconsultas na semi-interna&ccedil;&atilde;o e demais  enfermarias</td>
            </tr>
            <tr>
              <td colspan="2" valign="top" class="titulo_tabela">QUARTA-FEIRA</td>
            </tr>
            <tr class="cor_cinza_claro">
              <td valign="top">7:30 &ndash; 12:00</td>
              <td valign="top">Evolu&ccedil;&atilde;o e prescri&ccedil;&atilde;o dos pacientes da  Pneumologia (Enfermaria 3)</td>
            </tr>
            <tr class="cor_cinza_escuro">
              <td valign="top">13:00 &ndash; 17:00</td>
              <td valign="top">Atendimento no ambulat&oacute;rio do HIJP II &ndash; consultas de  retorno</td>
            </tr>
            <tr>
              <td colspan="2" valign="top" class="titulo_tabela">QUINTA-FEIRA</td>
            </tr>
            <tr>
              <td rowspan="5" align="center" valign="middle" class="cor_cinza_claro">7:30 &ndash;12:00</td>
              <td valign="top"><p class="cor_cinza_claro">Reuni&atilde;o Cl&iacute;nica no HFR &ndash; Artigos cient&iacute;ficos<br />
              </p></td>
            </tr>
            <tr>
              <td valign="top"><p class="cor_cinza_claro">Discuss&atilde;o cl&iacute;nico-radiol&oacute;gica com Dr. Clementino Proc&oacute;pio<br />
              </p></td>
            </tr>
            <tr>
              <td valign="top"><p class="cor_cinza_claro">Atendimento aos representantes dos laborat&oacute;rios<br />
              </p></td>
            </tr>
            <tr>
              <td valign="top"><p class="cor_cinza_claro">Cursos de Fisiologia Respirat&oacute;ria/ Imunologia B&aacute;sica/ Fun&ccedil;&atilde;o  Pulmonar</p></td>
            </tr>
            <tr>
              <td valign="top" class="cor_cinza_claro">Sec&ccedil;&atilde;o An&aacute;tomo-Cl&iacute;nica (caso cl&iacute;nico do m&ecirc;s) na &uacute;ltima  quinta do m&ecirc;s</td>
            </tr>
            <tr>
              <td rowspan="2" valign="middle" class="cor_cinza_escuro">13:00 &ndash; 17:00</td>
              <td valign="top"><p class="cor_cinza_escuro">Evolu&ccedil;&atilde;o e prescri&ccedil;&atilde;o dos pacientes da Pneumologia (Enfermaria  3)</p></td>
            </tr>
            <tr>
              <td valign="top" class="cor_cinza_escuro">Interconsultas na semi-interna&ccedil;&atilde;o e demais enfermarias</td>
            </tr>
            <tr>
              <td colspan="2" valign="top" class="titulo_tabela"><strong>SEXTA FEIRA</strong></td>
            </tr>
            <tr>
              <td valign="top" class="cor_cinza_claro">7:30 &ndash; 12:00</td>
              <td valign="top" class="cor_cinza_claro">Evolu&ccedil;&atilde;o e prescri&ccedil;&atilde;o dos pacientes da  Pneumologia (Enfermaria 3)</td>
            </tr>
            <tr>
              <td valign="top" class="cor_cinza_escuro">13:00 &ndash; 17:00</td>
              <td valign="top" class="cor_cinza_escuro">Realiza&ccedil;&atilde;o de atividades relacionadas ao  trabalho cient&iacute;fico</td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p><strong><u>Obriga&ccedil;&otilde;es do residente</u></strong><br />
            <br />
          </p>
<%
'  TIPO 11 = ESTÁGIO ENFERMARIA – HOSPITAL INFANTIL JOAO PAULO II - Obrigações do residente

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 11"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</div>

<p>&nbsp;</p>


<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>ESTÁGIO AMBULATÓRIO<br />
HOSPITAL INFANTIL JOAO PAULO II <br />
                  R1</strong></p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>

<div class="abrir">

<table width="609" cellpadding="5" cellspacing="5" class="table">
  <tr>
  <td colspan="2" valign="top"><p class="titulo_tabela">SEGUNDA-FEIRA</p></td>
</tr>
<tr class="cor_cinza_claro">
  <td width="134" valign="middle"><p>7:30 – 9:00</p></td>
  <td width="438" valign="top"><p>1ª e 3ª segunda do mês : reunião da Fibrose Cística<br />
    2ª  segunda feira do mês: reunião de Alergia Alimentar</p>
    Última segunda do mês: reunião da Distrofia Muscular</td>
</tr>
<tr class="cor_cinza_escuro">
  <td valign="top">9:00 – 12:00 </td>
  <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do</p>
    Dr. José Semionato</td>
</tr>
<tr class="cor_cinza_claro">
  <td valign="top">13:00 – 17:00</td>
  <td valign="top">Atendimento de pacientes no Ambulatório do HIJP  II</td>
</tr>
<tr>
  <td colspan="2" valign="top" class="titulo_tabela">TERÇA-FEIRA</td>
</tr>
<tr class="cor_cinza_claro">
  <td valign="top">7:30 – 9:00</td>
  <td valign="top">Reunião clínica no HFR – AULAS </td>
</tr>
<tr class="cor_cinza_escuro">
  <td valign="middle">9:30 – 12:00</td>
  <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do</p>
    Dr. José Semionato</td>
</tr>
<tr class="cor_cinza_claro">
  <td valign="top">13:00 – 17:00</td>
  <td valign="top">Realização de atividades relacionadas ao  trabalho científico</td>
</tr>
<tr>
  <td colspan="2" valign="top" class="titulo_tabela">QUARTA-FEIRA</td>
</tr>
<tr class="cor_cinza_escuro">
  <td valign="top">8:00 – 12:00</td>
  <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do </p>
    Dr. José Semionato</td>
</tr>
<tr class="cor_cinza_claro">
  <td valign="middle">13:00 – 17:00</td>
  <td valign="top">Atendimento de intercorrências da Enfermaria 3 e  interconsultas na semi-internação e demais enfermarias</td>
</tr>
<tr>
  <td colspan="2" valign="top" class="titulo_tabela">QUINTA-FEIRA</td>
</tr>
<tr>
  <td rowspan="5" valign="middle" class="cor_cinza_claro">7:30 –12:00</td>
  <td valign="top"><p class="cor_cinza_claro">Reunião Clínica no HFR – Artigos científicos<br />
  </p></td>
</tr>
<tr>
  <td valign="top"><p class="cor_cinza_claro">Discussão clínico-radiológica com Dr. Clementino Procópio<br />
  </p></td>
</tr>
<tr>
  <td valign="top"><p class="cor_cinza_claro">Atendimento aos representantes dos laboratórios<br />
  </p></td>
</tr>
<tr>
  <td valign="top"><p class="cor_cinza_claro">Cursos de Fisiologia Respiratória/ Imunologia Básica/ Função  Pulmonar</p></td>
</tr>
<tr>
  <td valign="top" class="cor_cinza_claro">Secção Anátomo-Clínica (caso clínico do mês) na última  quinta do mês</td>
</tr>
<tr class="cor_cinza_escuro">
  <td valign="top">13:00 – 17:00</td>
  <td valign="top">Atendimento de pacientes com Fibrose Cística sob  supervisão do  Dr. Alberto Vergara e Dr.  Francisco Reis</td>
</tr>
<tr>
  <td colspan="2" valign="top" class="titulo_tabela">SEXTA-FEIRA</td>
</tr>
<tr class="cor_cinza_claro">
  <td valign="middle">8:00 – 12:00</td>
  <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do Dr. José Semionato</p></td>
</tr>
<tr class="cor_cinza_escuro">
  <td valign="top">13:00 – 17:00</td>
  <td valign="top">Atendimento de pacientes no Ambulatório do HIJP  II</td>
</tr>
</table>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Obrigações do residente
  
<%
'  TIPO 12 = ESTÁGIO AMBULATÓRIO HOSPITAL INFANTIL JOAO PAULO II R1 - Obrigações do residente

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 12"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</p>
</div>

<p>&nbsp;</p>

<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>                EST&Aacute;GIO ESPECIALIDADE 1 </strong><br />
              <strong>R1</strong><br />
              </p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>

<div class="abrir">
  <table width="609" cellpadding="5" cellspacing="5" class="table">
    <tr>
      <td colspan="2" valign="top"><p class="titulo_tabela">SEGUNDA-FEIRA</p></td>
    </tr>
    <tr class="cor_cinza_claro">
      <td width="134" valign="middle"><p>7:00 &ndash; 12:00</p></td>
      <td width="438" valign="top"><p>Acompanhamento de pacientes internados no CTI do  Hospital Infantil Jo&atilde;o Paulo II sob a supervis&atilde;o do Dr. Luiz Fernando</p></td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="top">13:00 &ndash; 17:00</td>
      <td valign="top"><p>Broncoscopia sob a supervis&atilde;o do Dr. Paulo  Bittencourt</p></td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">TER&Ccedil;A-FEIRA</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="top">7:30 &ndash; 9:00</td>
      <td valign="top">Reuni&atilde;o cl&iacute;nica no HFR &ndash; AULAS </td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="middle">9:30 &ndash; 12:00</td>
      <td valign="top"><p>Atendimento de pacientes no Ambulat&oacute;rio do HFR sob  supervis&atilde;o do </p>
        Dr. Wilson Rocha Filho</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="top">13:00 &ndash; 17:00</td>
      <td valign="top">Realiza&ccedil;&atilde;o de atividades relacionadas ao  trabalho cient&iacute;fico</td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">QUARTA-FEIRA</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="top">7:00 &ndash; 12:00</td>
      <td valign="top"><p>Ambulat&oacute;rio Allos &ndash; Hospital Infantil Jo&atilde;o Paulo  II</p></td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="middle">13:00 &ndash; 17:00</td>
      <td valign="top">Pulmolab e cobertura aos pacientes internados no  HFR</td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">QUINTA-FEIRA</td>
    </tr>
    <tr>
      <td rowspan="5" valign="middle" class="cor_cinza_claro">7:30 &ndash;12:00</td>
      <td valign="top"><p class="cor_cinza_claro">Reuni&atilde;o Cl&iacute;nica no HFR &ndash; Artigos cient&iacute;ficos</p></td>
    </tr>
    <tr>
      <td valign="top"><p class="cor_cinza_claro">Discuss&atilde;o cl&iacute;nico-radiol&oacute;gica com Dr. Clementino Proc&oacute;pio </p></td>
    </tr>
    <tr>
      <td valign="top"><p class="cor_cinza_claro">Atendimento aos representantes dos laborat&oacute;rios<br />
      </p></td>
    </tr>
    <tr>
      <td valign="top"><p class="cor_cinza_claro">Cursos de Fisiologia Respirat&oacute;ria/ Imunologia B&aacute;sica/ Fun&ccedil;&atilde;o  Pulmonar</p></td>
    </tr>
    <tr>
      <td valign="top" class="cor_cinza_claro">Sec&ccedil;&atilde;o An&aacute;tomo-Cl&iacute;nica (caso cl&iacute;nico do m&ecirc;s) na &uacute;ltima  quinta do m&ecirc;s</td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="top">13:00 &ndash; 17:00</td>
      <td valign="top">Pulmolab e cobertura aos pacientes internados no  HFR</td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">SEXTA-FEIRA</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="middle">7:00 &ndash; 12:00</td>
      <td valign="top"><p>Acompanhamento de pacientes internados no CTI do  Hospital Infantil Jo&atilde;o Paulo II sob a supervis&atilde;o do Dr. Luiz Fernando</p></td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="top">13:00 &ndash; 17:00</td>
      <td valign="top">Atendimento de intercorr&ecirc;ncias da Enfermaria 3 e  interconsultas na semi-interna&ccedil;&atilde;o e demais enfermarias</td>
    </tr>
  </table> 


  <p>&nbsp;</p>
  <p>Obrigações do residente
    
    
<%
'  TIPO 13 = ESTÁGIO ESPECIALIDADE 1 - Obrigações do residente

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 13"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</div>

<p>&nbsp;</p>

<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>EST&Aacute;GIO ENFERMARIA  HFR / PULMOLAB</strong><br />
                  <strong>R2</strong><br />
              </p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>

<div class="abrir">

<table width="609" cellpadding="5" cellspacing="5" class="table">
  <tr>
    <td colspan="2" valign="top"><p class="titulo_tabela">SEGUNDA-FEIRA</p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td width="134" valign="middle"><p>7:30 – 8:30</p></td>
    <td width="438" valign="top"><p>Evolução e prescrição dos pacientes internados para a  pneumologia no HFR</p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle">8:30 – 12:00</td>
    <td valign="top">Participar da realização e interpretação de  todos os exames solicitados ao PULMOLAB</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top"><p>Participar da realização e interpretação de  todos os exames solicitados ao PULMOLAB</p></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">TERÇA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle"><p>7:00 – 7:30</p></td>
    <td valign="top">Evolução e prescrição dos pacientes internados  para a pneumologia no HFR</td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle">7:30 – 9:00</td>
    <td valign="top"><p>Reunião clínica no HFR – AULAS </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">9:30 – 12:00</td>
    <td valign="top">Participar da realização e interpretação de  todos os exames solicitados ao PULMOLAB</td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top">Participar da realização e interpretação de todos  os exames solicitados ao PULMOLAB</td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">QUARTA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle"><p>7:30 – 8:30</p></td>
    <td valign="top"><p>Evolução e prescrição dos pacientes internados para a  pneumologia no HFR</p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle">8:30  - 12:00</td>
    <td valign="top">Participar da realização e interpretação de  todos os exames solicitados ao PULMOLAB</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top">Atendimento ambulatório Hospital Infantil João Paulo  II</td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">QUINTA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">7:00 – 7:30</td>
    <td valign="top">Evolução e prescrição dos pacientes internados  para a pneumologia no HFR</td>
  </tr>
  <tr>
    <td rowspan="5" valign="middle" class="cor_cinza_escuro">7:30 –12:00</td>
    <td valign="top"><p class="cor_cinza_escuro">Reunião Clínica no HFR – Artigos científicos<br />
    </p></td>
  </tr>
  <tr>
    <td valign="top"><p class="cor_cinza_escuro">Discussão clínico-radiológica com Dr. Clementino Procópio<br />
    </p></td>
  </tr>
  <tr>
    <td valign="top"><p class="cor_cinza_escuro">Atendimento aos representantes dos laboratórios<br />
    </p></td>
  </tr>
  <tr>
    <td valign="top"><p class="cor_cinza_escuro">Cursos de Fisiologia Respiratória/ Imunologia Básica/ Função  Pulmonar</p></td>
  </tr>
  <tr>
    <td valign="top" class="cor_cinza_escuro">Secção Anátomo-Clínica (caso clínico do mês) na última  quinta do mês</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="top">13:00 – 17:00</td>
    <td valign="top">Atividades relacionadas ao trabalho científico </td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">SEXTA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle"><p>7:30 – 8:30</p></td>
    <td valign="top"><p>Evolução e prescrição dos pacientes internados  para a pneumologia no HFR</p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle"><p>8:30  - 11:00</p></td>
    <td valign="top"><p>Participar da realização e  interpretação de todos os exames solicitados ao PULMOLAB</p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="top">11:00 – 12:00</td>
    <td valign="top">Corrida leito quinzenal na Maternidade Odete  Valadares</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top">Participar da realização e interpretação de  todos os exames solicitados ao PULMOLAB</td>
  </tr>
</table>
<p>&nbsp;</p>
<p><strong><u>Obrigações do residente</u></strong><br />
  <br />
</p>
<%
'  TIPO 14 = ESTÁGIO ENFERMARIA  HFR / PULMOLAB - Obrigações do residente

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 14"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</div>

<p>&nbsp;</p>

<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>ESTÁGIO AMBULATÓRIO <br />
                HOSPITAL INFANTIL JOAO PAULO II

                    <br />
                  R2</strong></p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>

<div class="abrir">
<table width="609" cellpadding="5" cellspacing="5" class="table">
  <tr>
    <td colspan="2" valign="top"><p class="titulo_tabela">SEGUNDA-FEIRA</p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td width="134" valign="middle"><p>7:30 – 8:30</p></td>
    <td width="438" valign="top"><p>1ª e 3ª segunda do mês : reunião da Fibrose Cística<br />
2ª  segunda feira do mês: reunião de Alergia Alimentar</p>
Última segunda do mês: reunião da Distrofia Muscular</td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle">9:00 – 12:00</td>
    <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do Dr. José Semionato</p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP  II</p></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">TERÇA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle"><p>7:30 – 9:00</p></td>
    <td valign="top">Reunião clínica no HFR – AULAS </td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle">9:30 – 12:00</td>
    <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do Dr. José Semionato</p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top">Atividades relacionadas ao trabalho científico</td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">QUARTA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle"><p>7:30 – 12:00</p></td>
    <td valign="top"><p>Ambulatório de Alergia Alimentar - ALLOS HIJPII </p></td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle">13:00 – 17:00</td>
    <td valign="top">Participar da realização e interpretação de todos os  exames solicitados ao PULMOLAB e cobrir eventuais necessidades dos pacientes  HFR</td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">QUINTA-FEIRA</td>
  </tr>
  <tr>
    <td rowspan="5" valign="middle" class="cor_cinza_escuro">7:30 –12:00</td>
    <td valign="top"><p class="cor_cinza_escuro">Reunião Clínica no HFR – Artigos científicos
</p></td>
  </tr>
  <tr>
    <td valign="top"><p class="cor_cinza_escuro">Discussão clínico-radiológica com Dr. Clementino Procópio
</p></td>
  </tr>
  <tr>
    <td valign="top"><p class="cor_cinza_escuro">Atendimento aos representantes dos laboratórios<br />
</p></td>
  </tr>
  <tr>
    <td valign="top"><p class="cor_cinza_escuro">Cursos de Fisiologia Respiratória/ Imunologia Básica/ Função  Pulmonar</p></td>
  </tr>
  <tr>
    <td valign="top" class="cor_cinza_escuro">Secção Anátomo-Clínica (caso clínico do mês) na última  quinta do mês</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="top">13:00 – 17:00</td>
    <td valign="top"><p>Atendimento de pacientes com Fibrose Cística sob supervisão  do </p>
Dr. Francisco reis e Dr. Alberto Vergara</td>
  </tr>
  <tr>
    <td colspan="2" valign="top" class="titulo_tabela">SEXTA-FEIRA</td>
  </tr>
  <tr class="cor_cinza_claro">
    <td valign="middle"><p>8:00 – 12:00</p></td>
    <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP II sob  supervisão do Dr. José Semionato</p></td>
  </tr>
  <tr class="cor_cinza_escuro">
    <td valign="middle"><p>13:00 – 17:00</p></td>
    <td valign="top"><p>Atendimento de pacientes no Ambulatório do HIJP  II</p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p><strong><u>Obrigações do residente</u></strong><br />
  <br />
</p>
<%
'  TIPO 15 = ESTÁGIO AMBULATÓRIO R2 - Obrigações do residente

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 15"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</div>

<p>&nbsp;</p>

<div class="abri">
          <table width="100%" border="0">
            <tr>
              <td width="97%"><p align="center" class="cor_cinza_claro"><strong>ESTÁGIO ESPECIALIDADES 2 

                    <br />
                  R2</strong></p></td>
              <td width="3%" class="cor_cinza_claro"><img src="img/mais.png" width="15" height="15" /></td>
            </tr>
          </table>
</div>

<div class="abrir">
  <br />
  <table width="609" cellpadding="5" cellspacing="5" class="table">
    <tr>
      <td colspan="2" valign="top"><p class="titulo_tabela">SEGUNDA-FEIRA</p></td>
    </tr>
    <tr class="cor_cinza_claro">
      <td width="134" valign="middle"><p>8:00 &ndash; 11:00</p></td>
      <td width="438" valign="top"><p>Atendimento de pacientes no Ambulat&oacute;rio de  Respirador bucal no Hospital Militar sob supervis&atilde;o da Dra. Patr&iacute;cia Mansur</p></td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="middle">13:00 &ndash; 17:00</td>
      <td valign="top"><p>Acompanhamento domiciliar dos pacientes do  programa VENTILAR sob a supervis&atilde;o do Dr. Alberto Vergara</p></td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">TER&Ccedil;A-FEIRA</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="middle"><p>7:30 &ndash; 9:00</p></td>
      <td valign="top"><p>Reuni&atilde;o cl&iacute;nica no HFR &ndash; AULAS </p></td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="middle">9:00 &ndash; 12:00</td>
      <td valign="top">Atendimento de pacientes no Ambulat&oacute;rio do HFR sob  supervis&atilde;o do <br />
        Dr. Wilson Rocha Filho</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="middle">13:00 &ndash; 17:00</td>
      <td valign="top"><p>Atendimento de pacientes no Ambulat&oacute;rio do HIJP  II</p></td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">QUARTA-FEIRA</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="middle"><p>8:00 &ndash; 12:00</p></td>
      <td valign="top"><p>Atendimento de pacientes no Ambulat&oacute;rio de imunodefici&ecirc;ncias  com </p>
        Dr. Jorge Andrade Pinto</td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="middle"><p>13:00 &ndash; 16:00</p></td>
      <td valign="top"><p>Broncoscopia sob a supervis&atilde;o do Dr. Paulo Bittencourt</p></td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="middle">16:00 &ndash; 19:00</td>
      <td valign="top">Ambulat&oacute;rio de Paralisia Cerebral com Dra. Luiza  Delfim</td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">QUINTA-FEIRA</td>
    </tr>
    <tr>
      <td rowspan="5" valign="middle" class="cor_cinza_claro">7:30 &ndash;12:00</td>
      <td valign="top"><p class="cor_cinza_claro">Reuni&atilde;o Cl&iacute;nica no HFR &ndash; Artigos cient&iacute;ficos<br />
      </p></td>
    </tr>
    <tr>
      <td valign="top"><p class="cor_cinza_claro">Discuss&atilde;o cl&iacute;nico-radiol&oacute;gica com Dr. Clementino Proc&oacute;pio</p></td>
    </tr>
    <tr>
      <td valign="top"><p class="cor_cinza_claro">Atendimento aos representantes dos laborat&oacute;rios<br />
      </p></td>
    </tr>
    <tr>
      <td valign="top"><p class="cor_cinza_claro">Cursos de Fisiologia Respirat&oacute;ria/ Imunologia B&aacute;sica/ Fun&ccedil;&atilde;o  Pulmonar</p></td>
    </tr>
    <tr>
      <td valign="top" class="cor_cinza_claro">Sec&ccedil;&atilde;o An&aacute;tomo-Cl&iacute;nica (caso cl&iacute;nico do m&ecirc;s) na &uacute;ltima  quinta do m&ecirc;s</td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="top">13:00 &ndash; 17:00</td>
      <td valign="top"><p>Acompanhamento e interpreta&ccedil;&atilde;o de polissonografia com a </p>
        Dra. M&aacute;rcia Leonardo</td>
    </tr>
    <tr>
      <td colspan="2" valign="top" class="titulo_tabela">SEXTA-FEIRA</td>
    </tr>
    <tr class="cor_cinza_claro">
      <td valign="middle"><p>8:00 &ndash; 12:00</p></td>
      <td valign="top"><p>Atividades relacionadas ao trabalho cient&iacute;fico</p></td>
    </tr>
    <tr class="cor_cinza_escuro">
      <td valign="middle"><p>13:00 &ndash; 17:00</p></td>
      <td valign="top"><p>Atendimento de pacientes no Ambulat&oacute;rio de  Reumatologia pedi&aacute;trica com Dra. Maria Vit&oacute;ria </p></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><strong><u>Obriga&ccedil;&otilde;es do residente</u></strong><br />
    <br />
  </p>
<%
'  TIPO 16 = ESTÁGIO ESPECIALIDADES 2 - Obrigações do residente

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 16"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
  <p><br />
  </p>
  <p class="tit_noticia"><strong>CARGA HOR&Aacute;RIA &ndash; 1&ordm; ANO</strong><br />
  </p>
  <br />
  <br />
  </u>
<%
'  TIPO 17 = CARGA HORÁRIA – 1º ANO

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 17"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
  </p>
  <p>&nbsp;</p>
  <strong class="tit_noticia">CARGA HOR&Aacute;RIA &ndash; 2&ordm; ANO</strong><br />
  <br />
  </p>
<%
'  TIPO 18 = CARGA HORÁRIA – 2º ANO

	SQL = "SELECT texto, titulo, data FROM textos WHERE tipo = 18"
	
	rsTextos.Open SQL, ObjDb, 3, 1
	
	IF rsTextos.EOF = FALSE THEN
		texto = rsTextos("texto")
		Response.Write(texto)	
	END IF
	
	rsTextos.Close
%>
</div>

</br>
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
