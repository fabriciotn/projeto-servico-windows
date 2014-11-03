<%@ LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<head>
<%
	usuario = Session("usuario")
	Session("usuario") = usuario

%>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
			$('#Cadastrar').click(function(){
				<%
				campo_ob = "evento,dataInicio"
				campos_ob = SPLIT(campo_ob,",")
				for i = 0 to Ubound(campos_ob)
				%>
					if( $('#<%=campos_ob(i)%>').val() == '' ){
						alert('O campo <%=Ucase( Replace( campos_ob(i) ,"_", " ") )%> é obrigatório');
						return false;
					}
				<%
				next
				%>

			});

			// mascara para campos especificos
			$('.data').mask("99/99/9999");
		
			$('.Esconde').hide();
			$('.Esconde1').hide();
			$('.Esconde2').hide();
			$('.Esconde3').hide();
			$('.trHorario').hide();
			$('.trAssunto').hide();
			$('.trRepeticao').hide();
			$('.local_Reuniao').hide();
		
			$('#tipo').change(function(){
				if( $('#tipo').val() == 'Reunião' )
				{
					$('.trHorario').fadeIn();
					$('.trAssunto').fadeIn();
					$('.dataFimTR').fadeOut();
					$('.trRepeticao').fadeIn();
					$('.local_todos').fadeOut();
					$('.local_Reuniao').fadeIn();
				}
				else
				{
					$('.dataFimTR').fadeIn();
					$('.trHorario').fadeOut();
					$('.trAssunto').fadeOut();
					$('.local_todos').fadeIn();
					$('.trRepeticao').fadeOut();
					$('.local_Reuniao').fadeOut();
				}
			});
		
			$('.dataEvento').click(function(){
				if( $(this).val() == '1' )
				{
					$('.Esconde').fadeIn();
					$('.Esconde1').fadeIn();
					$('.Esconde2').fadeOut();
					$('.Esconde3').fadeOut();
				}
				else if( $(this).val() == '2' )
				{
					$('.Esconde').fadeIn();
					$('.Esconde2').fadeIn();
					$('.Esconde1').fadeOut();
					$('.Esconde3').fadeOut();
				}
				else if( $(this).val() == '3' )
				{
					$('.Esconde').fadeIn();
					$('.Esconde3').fadeIn();
					$('.Esconde1').fadeOut();
					$('.Esconde2').fadeOut();
				}
				else
				{
					$('.Esconde').fadeOut();
					$('.Esconde1').fadeOut();
					$('.Esconde2').fadeOut();
					$('.Esconde3').fadeOut();
				}
			});

			$('.dataEvento').click(function(){
				if( $(this).is(":checked") )
				{
					$('.dataEvento').removeAttr("checked");
					$(this).attr({ checked: "checked" });
				}
			});
	});		

</script>
<style type="text/css">
<!--
.dataEvento {
	padding-left:140px;
}
body {
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
}
.style1 {
	font-size: 14px;
	font-weight: bold;
}
td {
	padding-left: 50px;
}
textarea {
	background:#F5F5F5;
	border:1px solid #CCCCCC;
	font-family:Arial, Helvetica, sans-serif;
	font-size:11px;
}
.data {
	width:100px;
}
.semanaDia {
	width:100px;
	padding-top:5px;
}
-->
</style>
</head>

<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">
<p align="center"><img src="img/logo.png" alt="" border="0" width="300" /></p>
<br />
<form method="post" action="cadastrar_evento_ok.asp" id="cadastraEvento">
  <table style="font-family: Tahoma; font-size: 8pt;">
    <tr>
      <td colspan="4" class="area"><b>Evento:</b></td>
    </tr>
    <tr>
      <td colspan="4"><select name="evento" id="evento">
          <option value="AULA">AULA</option>
          <option value="CLUBE DE REVISTA">CLUBE DE REVISTA</option>
          <option value="CASO CLÍNICO DO MÊS">CASO CLÍNICO DO MÊS</option>
          <option value="REUNIÃO DA FIBROSE CÍSTICA">REUNIÃO DA FIBROSE CÍSTICA</option>
          <option value="ALERGIA ALIMENTAR – NÚCLEO ALLOS">ALERGIA ALIMENTAR – NÚCLEO ALLOS</option>
          <option value="DOENÇAS NEUROMUSCULARES">DOENÇAS NEUROMUSCULARES</option>
        </select></td>
    </tr>
    <tr>
      <!--<td colspan="4" class="area"><input type="text" name="evento" id="evento" size="51"/></td>-->
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td class="area" colspan="4"><b>Selecione o tipo do evento</b>:</td>
    </tr>
    <tr>
      <td colspan="4"><select name="tipo" id="tipo">
          <option value="Congresso"> Congresso</option>
          <option value="Reunião"> Reuni&atilde;o</option>
        </select></td>
    </tr>
    <tr>
      <td class="area" colspan="4"><b>Local</b>:</td>
    </tr>
    <tr>
      <td colspan="4" class="local_Reuniao"><select name="local" id="local">
          <option>Centro de Estudos – Hospital Felício Rocho</option>
          <option>Auditório do Hospital Infantil João Paulo II</option>
        </select></td>
      <td colspan="4" class="local_todos"><input type="text" name="local" id="local" size="51" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4" class="area"><b>Data In&iacute;cio: (dia/mes/ano)</b></td>
    </tr>
    <tr>
      <td colspan="4" class="area"><input type="text" name="dataInicio" id="dataInicio" class="data"/></td>
    </tr>
    <tr class="dataFimTR">
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr class="dataFimTR">
      <td colspan="4" class="area"><b>Data Final: (dia/mes/ano)</b></td>
    </tr>
    <tr class="dataFimTR">
      <td colspan="4" class="area"><input type="text" name="dataFinal" class="data" id="dataFinal"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
<!--    
<tr class="trRepeticao">
      <td class="area" colspan="4">Caso o evento se repita, marque a op&ccedil;&atilde;o em que o evento se enquadra:</td>
    </tr>
    <tr class="trRepeticao">
      <td><input type="checkbox" class="dataEvento" name="repeticao" id="repeticao1" value="1"/>
        &nbsp;Semanal<br />
        <input type="checkbox" class="dataEvento" name="repeticao" id="repeticao2" value="2"/>
        &nbsp;Quinzenal<br />
        <input type="checkbox" class="dataEvento" name="repeticao" id="repeticao3" value="3"/>
        &nbsp;Mensal<br />
        <input type="checkbox" class="dataEvento" name="repeticao" id="repeticao4" value="4"/>
        &nbsp;Anual<br /></td>
    </tr>
-->
    <tr class="Esconde">
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr class="Esconde1">
      <td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Ao escolher a op&ccedil;&atilde;o semanal, o evento será cadastrado nos 12 meses a seguir a partir da data de in&iacute;cio cadastrada, com intervalo de 7 dias! </td>
    </tr>
    <tr class="Esconde2">
      <td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Ao escolher a op&ccedil;&atilde;o quinzenal, o evento será cadastrado nos 12 meses a seguir a partir da data de in&iacute;cio cadastrada, com intervalo de 15 dias! </td>
    </tr>
    <tr class="Esconde3">
      <td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Ao escolher a op&ccedil;&atilde;o mensal, o evento será cadastrado nos 12 meses a seguir a partir da data de in&iacute;cio cadastrada, com intervalo de 30 dias! </td>
    </tr>
    <!--		<tr class="Esconde1">
		  <td>
		  	<input type="radio" class="dia" name="dia" id="dia" value="segunda"/>&nbsp;Segunda-Feira<br />
			<input type="radio" class="dia" name="dia" id="dia" value="terca"/>&nbsp;Ter&ccedil;a-Feira<br />
			<input type="radio" class="dia" name="dia" id="dia" value="quarta"/>&nbsp;Quarta-Feira<br />
			<input type="radio" class="dia" name="dia" id="dia" value="quinta"/>&nbsp;Quinta-Feira<br />
			<input type="radio" class="dia" name="dia" id="dia" value="sexta"/>&nbsp;Sexta-Feira<br />
			<input type="radio" class="dia" name="dia" id="dia" value="sabado"/>&nbsp;S&aacute;bado<br />
			<input type="radio" class="dia" name="dia" id="dia" value="domingo"/>&nbsp;Domingo<br />		  </td>
		</tr>
		<tr class="Esconde2">
		  <td class="area" colspan="4">Selecione o dia do m&ecirc;s em que o evento se realiza:</td>
		</tr>
		<tr class="Esconde2">
		  <td>
		  	<div class="semanaDia">Segunda-Feira</div>
		  	<input type="radio" class="dia" name="dia" id="dia" value="segunda"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="segunda"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="segunda"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="segunda"/>&nbsp;4&ordf;
			<br /><div class="semanaDia">Ter&ccedil;a-Feira</div>
			<input type="radio" class="dia" name="dia" id="dia" value="terca"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="terca"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="terca"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="terca"/>&nbsp;4&ordf;
			<br /><div class="semanaDia">Quarta-Feira</div>
			<input type="radio" class="dia" name="dia" id="dia" value="quarta"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="quarta"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="quarta"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="quarta"/>&nbsp;4&ordf;
			<br /><div class="semanaDia">Quinta-Feira</div>
			<input type="radio" class="dia" name="dia" id="dia" value="quinta"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="quinta"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="quinta"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="quinta"/>&nbsp;4&ordf;
			<br /><div class="semanaDia">Sexta-Feira</div>
			<input type="radio" class="dia" name="dia" id="dia" value="sexta"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="sexta"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="sexta"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="sexta"/>&nbsp;4&ordf;
			<br /><div class="semanaDia">S&aacute;bado</div>
			<input type="radio" class="dia" name="dia" id="dia" value="sabado"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="sabado"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="sabado"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="sabado"/>&nbsp;4&ordf;
			<br /><div class="semanaDia">Domingo</div>
			<input type="radio" class="dia" name="dia" id="dia" value="domingo"/>&nbsp;1&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="domingo"/>&nbsp;2&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="domingo"/>&nbsp;3&ordf;
			<input type="radio" class="dia" name="dia" id="dia" value="domingo"/>&nbsp;4&ordf;
			<br />
		  </td>
		</tr>	-->
    <tr class="trHorario">
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr class="trHorario">
      <td colspan="4" class="area"><b>Hor&aacute;rio:</b></td>
    </tr>
    <tr class="trHorario">
      <td colspan="4" class="area"><input type="text" name="horario" class="horario" id="horario"/></td>
    </tr>
    <tr>
      <td class="area">&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4" class="area"><b>Feriado ou recesso: (dia/mes/ano)</b></td>
    </tr>
    <tr>
      <td colspan="4" class="area"><input type="text" name="feriado" id="feriado" class="data"/></td>
    </tr>
    <tr>
      <td colspan="4" class="area"><b>Apresentação:</b></td>
    </tr>
    <tr>
      <td colspan="4" class="area"><textarea name="apresentacao" id="apresentacao" style="width: 280px; height: 100px;"><%=apresentacao%></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr class="trAssunto">
      <td class="area"><b>Assunto:</b></td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr class="trAssunto">
      <td colspan="4" class="area"><textarea name="assunto" id="assunto" style="width: 320px; height: 100px;"></textarea></td>
    </tr>
    <tr>
      <td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Para colocar um trecho em negrito, it&aacute;lico ou
        
        sublinhado, <br />
        coloque-o entre as respectivas tags: 
        &lt;b&gt;&lt;/b&gt;, &lt;i&gt;&lt;/i&gt; ou &lt;u&gt;&lt;/u&gt;. <br />
        <br />
        <u>Exemplo:</u> <br />
        &lt;u&gt;Venha&lt;/u&gt; &lt;i&gt;conhecer&lt;/i&gt; o&lt;b&gt;PULMOLAB&lt;/b&gt;! <br />
        <br />
        <u>Resultado:</u> <br />
        <u>Venha</u> <i>conhecer</i> o <b>PULMOLAB</b>! </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4"><input type="submit" class="botoes" id="Cadastrar" value="Cadastrar" style="cursor: pointer;"></td>
    </tr>
  </table>
</form>
</body>
