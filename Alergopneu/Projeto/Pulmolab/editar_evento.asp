<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include file="conexao.asp"-->
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">

$(document).ready(function(){

		// mascara para campos especificos
			$('.data').mask("99/99/9999");

		$('#cadastra').click(function(){

				if ($('#titulo').val() == '')          
    			{
	        		alert("Erro! Preencha corretamente o título da notícia.");
            		return false;                                 
    			}
			 
				if ($('#texto').val() == '')
    			{
			 		alert("Erro! Preencha corretamente o texto da notícia.");
             		return false;                                 
    			}
	
		});

});		

</script>

<style type="text/css">
<!--
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
}

.style1 {
	font-size: 14px;
	font-weight: bold;
}
td
{
	padding-left: 50px;
}

textarea {
background:#F5F5F5;
border:1px solid #CCCCCC;
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
}
-->
</style>

<title>PULMOLAB</title>

<body>
							
                            
                            
                            <div id="centraliza_conteudo">
                            
                            
<!-- ***************************************************************		CONTEUDO AREA ADMIN ************************************************************************ -->                            

                            <div id="conteudoTexto" style="padding-top:10px" align="center">

		<p align="center"><img src="img/logo.png" alt="" border="0" width="300" /></p>
<br />
<%
usuario = Session("usuario")
Session("usuario") = usuario
				cod = Request.QueryString("cod")
				
				SQL = "SELECT * FROM eventos WHERE cod="&cod
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1
				
				local = rs("local")
				evento = rs("evento")
				horario = rs("horario")
				apresentacao = rs("apresentacao")
				assunto = replace(rs("conteudo"),"<br />",chr(13))
				IF apresentacao <> "" THEN
					apresentacao = replace(apresentacao,"<br />",chr(13))
				END IF
				
				dia = Day(rs("dataInicio"))
				mes = Month(rs("dataInicio"))
				ano = Year(rs("dataInicio"))

				if len(dia) = 1 then
				dia = 0&dia
				end if
				
				if len(mes) = 1 then
				mes = 0&mes
				end if
			
				dataInicio = dia &"/"& mes &"/"& ano

				dia = Day(rs("dataFinal"))
				mes = Month(rs("dataFinal"))
				ano = Year(rs("dataFinal"))

				if len(dia) = 1 then
				dia = 0&dia
				end if
				
				if len(mes) = 1 then
				mes = 0&mes
				end if
			
				
				dataFinal = dia &"/"& mes &"/"& ano

%>

        <form method="post" action="editar_evento_ok.asp">
        <table style="font-family: Tahoma; font-size: 8pt;">
        
		<tr>
		  <td colspan="4" class="area"><b>Evento:</b></td>
		  </tr>
		<tr>
        <td colspan="4" class="area"><input type="text" name="evento" id="evento" size="51" value="<%=evento%>"/></td>
		</tr>
		<tr>
		  <td>&nbsp;</td>
		  <td colspan="3">&nbsp;</td>
	    </tr>
		<tr>
		  <td class="area" colspan="4"><b>Local</b>:</td>
		</tr>
		<tr>
		  <%
		  	IF Lcase(local) = "centro de estudos – hospital felício rocho" OR local = "Auditório do Hospital Infantil João Paulo II" THEN
		  		IF local = "Auditório do Hospital Infantil João Paulo II" THEN
					seleciona2 = "selected"
				ELSE
					seleciona1 = "selected"
				END IF
		  %>
			  <td colspan="4" class="local_Reuniao">
				<select name="local" id="local">	
					<option <%=seleciona1%>>Centro de Estudos – Hospital Felício Rocho</option>
					<option <%=seleciona2%>>Auditório do Hospital Infantil João Paulo II</option>
				</select>
			  </td>
		  <%ELSE%>
			  <td colspan="4" class="local_todos">
				<input type="text" name="local" id="local" size="51" value="<%=local%>" />
			  </td>
		  <%END IF%>
		</tr>
		<tr>
		  <td>&nbsp;</td>
		  <td colspan="3">&nbsp;</td>
		</tr>
		<tr>
		  <td colspan="4" class="area"><b>Data In&iacute;cio: (dia/mes/ano)</b></td>
		  </tr>
		<tr>
        <td colspan="4" class="area"><input type="text" name="dataInicio" class="data" id="dataInicio" size="51" value="<%=dataInicio%>"/></td>
		</tr>
		<tr>
		  <td>&nbsp;</td>
		  <td colspan="3">&nbsp;</td>
		</tr>
		<tr>
		  <td colspan="4" class="area"><b>Data Final: (dia/mes/ano)</b></td>
		  </tr>
		<tr>
        <td colspan="4" class="area"><input type="text" name="dataFinal" class="data" id="dataFinal" size="51" value="<%=dataFinal%>"/></td>
		</tr>
		<tr>
		  <td>&nbsp;</td>
		  <td colspan="3">&nbsp;</td>
		</tr>
		<tr>
		  <td colspan="4" class="area"><b>Hor&aacute;rio:</b></td>
		  </tr>
		<tr>
        <td colspan="4" class="area"><input type="text" name="horario" class="horario" id="horario" value="<%=horario%>"/></td>
		</tr>
		<tr>
		  <td class="area">&nbsp;</td>
		  <td colspan="3">&nbsp;</td>
		  </tr>
		<tr>
		  <td colspan="4" class="area"><b>Apresentação:</b></td>
		  </tr>
		<tr>
        <td colspan="4" class="area"><textarea name="apresentacao" id="apresentacao" style="width: 280px; height: 100px;"><%=apresentacao%></textarea></td>
		</tr>
		<tr>
		  <td class="area">&nbsp;</td>
		  <td colspan="3">&nbsp;</td>
		  </tr>
		<tr>
		  <td class="area"><b>Assunto:</b></td>
		  <td colspan="3">&nbsp;</td>
		  </tr>
		<tr>
		<td colspan="4" class="area"><textarea name="conteudo" id="conteudo" style="width: 280px; height: 100px;"><%=assunto%></textarea></td>
		</tr>	
		<tr>
		  <td colspan="4">
		  	<b>Aten&ccedil;&atilde;o:</b> Para colocar um trecho em negrito, it&aacute;lico ou
			
			sublinhado,
			<br /> coloque-o entre as respectivas tags: 
			&lt;b&gt;&lt;/b&gt;, &lt;i&gt;&lt;/i&gt; ou &lt;u&gt;&lt;/u&gt;.
		  	<br />
			<br />
		  	<u>Exemplo:</u>
			<br />			
			&lt;u&gt;Venha&lt;/u&gt; &lt;i&gt;conhecer&lt;/i&gt; o&lt;b&gt;PULMOLAB&lt;/b&gt;!
			<br />
			<br />
			<u>Resultado:</u>
		  <br />			
		  <u>Venha</u> <i>conhecer</i> o <b>PULMOLAB</b>!
		  	</td>
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
		<td colspan="4">
		<input type="hidden" name="cod" id="cod" value="<%=cod%>" />
		<input type="submit" class="botoes" id="cadastra" value="Salvar" style="cursor: pointer;">
		</td>
		</tr>
		</table>

		</form>
		
<!-- ****************************** FIM CONTEUDO ********************--> 


</div>



</div>




</body>
</html>
<!--#include file="conexaoOFF.asp" -->
