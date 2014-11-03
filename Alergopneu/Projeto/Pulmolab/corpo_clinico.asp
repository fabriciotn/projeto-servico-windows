<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->

<style type="text/css">
<!--
.titulo {
font-family:Arial, Helvetica, sans-serif;
font-size:13px;
color:#666666;
text-align:justify;
cursor:pointer;
font-weight:bold;
}

.conteudo {
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
color:#333333;
text-align:justify;
display:none;
}

.conteudo1 {
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
color:#333333;
text-align:justify;
width:430px;
float:left;
margin-top:10px;
margin-right:10px;
margin-bottom:10px;
}

.foto {
font-family:Arial, Helvetica, sans-serif;
font-size:11px;
color:#333333;
text-align:justify;
width:150px;
margin-top:10px;
float:right;
}


.clica3 {
cursor:pointer;
}



.tabela {border-color:#000000; border-width:5px;
}

#padding {padding:5px 10px 5px 10px;}
-->
</style>



</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
	<div id="centro"> 
			
		<div id="texto">
			<div id="titulo_centro">
            		<img src="img/titulo_corpoclinico.png" width="138" height="20" border="0" />
              </div>
			<div id="texto_centro">
				<p>Para conhecer os ex-integrantes. <span class="link"><a href="ex_corpoclinico.asp">Clique aqui</a></span></p>
				<p>&nbsp;</p>
				<table width="350" border="0">
					<tr>
					  <td width="350">
						<table width="468" border="0" >
						  <tbody>
							
					<%
						x = Request.QueryString("x")
					
						SQL = "SELECT"
						SQL = SQL & " c.id, cat.nome AS nomeCategoria, s.nome AS nomeSetor, upper(c.nome) as nome, c.email, c.foto, c.universidade, c.formaturaGraduacao, c.atividade, c.residenciaPediatria,"
						SQL = SQL & " c.inicioPediatria, c.fimPediatria, c.posGraduacao, c.localPOS, c.formaturaPOS, c.especializacao, c.areaInteresse, c.enderecoConsultorio,"
						SQL = SQL & " c.telConsultorio, c.outraResidencia, c.localOutra, c.inicioOutra, c.fimOutra, c.mestrado, c.formaturaMestrado, c.doutorado, c.formaturaDoutorado,"
						SQL = SQL & " c.enderecoConsultorio, c.complementoConsultorio, c.cidadeConsultorio, c.ufConsultorio, c.bairroConsultorio, c.telConsultorio, c.numConsultorio,"
						SQL = SQL & " c.titulo1, c.anoTitulo1, c.titulo2, c.anoTitulo2, c.titulo3, c.anoTitulo3, c.titulo4, c.anoTitulo4, c.titulo5, c.anoTitulo5, c.outroTitulo,"
						SQL = SQL & " c.anoTitulo"
						SQL = SQL & " FROM corpoclinico c"
						SQL = SQL & " LEFT JOIN setor s ON s.cod = c.setor"
						SQL = SQL & " LEFT JOIN categoria cat ON cat.id = c.categoria"
						SQL = SQL & " WHERE aprovado <> 0 AND categoria = 1"' OR categoria = 3 OR categoria = 4 )"
						SQL = SQL & " ORDER BY setor, nome"
					
'						Response.Write(SQL)
'						Response.End()
					
						Set rs = server.CreateObject("ADODB.RecordSet")
						rs.Open sql, ObjDB,3,1
						
						WHILE rs.EOF = false 
							foto = rs("foto")
							IF foto = "" THEN
								foto = "img/foto_breve.jpg"
							ELSE
								foto = "foto/"& foto											
							END IF
						
							vetorTitulos = ""
							IF rs("titulo1") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = rs("titulo1") & " " & rs("anotitulo1")
							END IF
							IF rs("titulo2") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo2") & " " & rs("anotitulo2")
							END IF
							IF rs("titulo3") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo3") & " " & rs("anotitulo3")
							END IF
							IF rs("titulo4") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo4") & " " & rs("anotitulo4")
							END IF
							IF rs("titulo5") <> "" THEN
								IF vetorTitulos <> "" THEN
									vetorTitulos = vetorTitulos & ", "
								END IF
								vetorTitulos = vetorTitulos & rs("titulo5") & " " & rs("anotitulo5")
							END IF   ' vetor titulo de especialista
							
							' ----------------------	PEGA O SETOR DO REGISTRO -----------------------
							
							IF rs("nomeSetor") <> "" THEN
								setor = rs("nomeSetor")
							ELSE
								nomeCategoria = rs("nomeCategoria")
							END IF
					%>
							<tr>
								<%IF setor <> "" AND rs("nomeSetor") <> setor_anterior THEN%>
								  <td class="destaque_vermelho"><%=setor%></td>
								<%ELSEIF setor = "" THEN%>
								  <td class="destaque_vermelho"><%=nomeCategoria%></td>
								<%END IF%>
							</tr>
							<tr>
							  <td>&nbsp;</td>
							  </tr>
							<tr>
							  <td>  
								
								<span class="clica3 titulo"><div style="width:600px; float:left"> <div style="width:400px; float:left" >. <%=rs("nome")%>   </div>
								  <div style="width:120px; float:left;">
									<img src="img/maisinformacoes.jpg"  alt="Clique para saber mais informa&ccedil;&otilde;es sobre este palestrante" width="100" height="22" border="0" /> 
									</div>
								  </div></span>
								<div align="justify" class="conteudo" id="medico_<%=rs("id")%>"> <br />
								  <div class="conteudo1" style="line-height:18px;">
									<%IF rs("atividade") <> "" THEN%>
										<%=rs("atividade")%><br />
									<%END IF%>
									<%IF rs("universidade") <> "" THEN%>
										<%=rs("universidade")%>&nbsp;
									<%IF rs("formaturaGraduacao") <> "" THEN
										 Response.Write(" em " & rs("formaturaGraduacao"))
									END IF%>
									<br />
									<%END IF%>
									<%IF rs("residenciaPediatria") <> "" THEN%>
										Resid&ecirc;ncia de Pediatria <%=rs("residenciaPediatria")%>&nbsp; <%=rs("inicioPediatria")%>&nbsp;&nbsp; &agrave; &nbsp;&nbsp; <%=rs("fimPediatria")%>
										<br />
									<%END IF%>
									<%IF rs("outraResidencia") <> "" THEN%>
										Resid&ecirc;ncia de <%=rs("outraResidencia")%>&nbsp; <%=rs("localOutra")%>&nbsp; <%=rs("inicioOutra")%>&nbsp;&nbsp; &agrave; &nbsp;&nbsp; <%=rs("fimOutra")%>
										<br />
									<%END IF%>
									<%IF rs("posGraduacao") <> "" THEN%>
										P&oacute;s Gradua&ccedil;&atilde;o em &nbsp;<%=rs("posGraduacao")%>&nbsp; na &nbsp;<%=rs("localPOS")%>&nbsp; &nbsp;<%=rs("formaturaPOS")%>
										<br />
									<%END IF%>
									<%IF rs("mestrado") <> "" THEN%>
										Mestrado: &nbsp;<%=rs("mestrado")%>&nbsp; <%=rs("formaturaMestrado")%>
										<br />
									<%END IF%>
									<%IF rs("doutorado") <> "" THEN%>
										Doutorado: &nbsp;<%=rs("doutorado")%>&nbsp; <%=rs("formaturaDoutorado")%>
										<br />
									<%END IF%>
									<%IF rs("especializacao") <> "" THEN%>
										Especializa&ccedil;&atilde;o em: &nbsp;<%=rs("especializacao")%>
										<br />
									<%END IF%>
									<%IF rs("areaInteresse") <> "" THEN%>
										&Aacute;reas de Interesse: &nbsp;<%=rs("areaInteresse")%>
										<br />
									<%END IF%>
									
									<%IF vetorTitulos <> "" THEN%>
										T&iacute;tulos de Especialista: <%=vetorTitulos%> <br />
									<%END IF%>
									
									<%IF rs("enderecoConsultorio") <> "" THEN%>
									Consult&oacute;rio:&nbsp;<br />
									<a href="http://www.google.com.br/maps?source=embed&amp;f=q&amp;hl=pt-BR&amp;geocode=&amp;q=<%=rs("enderecoConsultorio")%>" target="_blank"  title="Veja o endereço no mapa">
										<img src="img/maps.png" style="border:none" />	
										<%=rs("enderecoConsultorio")%>&nbsp;
										<%IF rs("numConsultorio") <> "" THEN%>
											<%=rs("numConsultorio")%>&nbsp;
										<%END IF%>
										<%IF rs("complementoConsultorio") <> "" THEN%>
											<%=rs("complementoConsultorio")%>&nbsp;
										<%END IF%>
										<br />
										<%IF rs("cidadeConsultorio") <> "" THEN%>
											<%=rs("cidadeConsultorio")%>&nbsp; - &nbsp;
										<%END IF%>
										<%IF rs("ufConsultorio") <> "" THEN%>
											<%=rs("ufConsultorio")%>.
										<%END IF%>
									</a>
										<br />
										<%IF rs("telConsultorio") <> "" THEN%>
											Telefone: <%=rs("telConsultorio")%>
										<%END IF%>
									<%END IF%>
									
									</div>
								  
								  <div class="foto">
									<img src="<%=foto%>" width="73" height="78" border="0" />
								  </div>
								  </div>
								<br />
								<br />
								</td>
							  </tr>
							<%
									setor_anterior = rs("nomeSetor")
									rs.MOVENEXT
								WEND						
							%>         
							
							</tbody>
						</table>
					  </td>
					</tr>
				</table>
			</div>
			
		</div>
		   
	 <!-- #include file="direita_menor.asp" -->      
	
	</div>
    </div>
</div>
    
<!-- #include file="rodape.asp" -->



</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		$('.clica3').click(function(){
			
			$div = $(this).next(); 

			if($div.css("display")=="block")
			{
				$('.conteudo').slideUp('fast');
			}
			else
			{
				$(this).next().slideDown('fast');
			}
		
		});

		if('<%=x%>' != '')
		{
			$('#medico_<%=x%>').show();
		}
	});
</script>
