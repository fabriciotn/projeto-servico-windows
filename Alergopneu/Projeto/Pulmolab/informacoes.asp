<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="wilson rocha filho, alergia pediatrica, pneumologia pediatrica, pneumologia e alergia em pediatria, Pulmolab, alergia alimentar, nucleo allos, programa ventilar, doencas neuromusculares, fibrose cistica, displasia broncopulmonar, nucleo superar">

<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<script type="text/javascript">
	$(document).ready(function(){	
		$('.tr_titulo').hide();
		$('.abre_titulo').click(function(){
			var cod_cat = $(this).attr("lang");
			$('.tr_titulo_' + cod_cat).toggle();
		});
		$('.abre_texto').click(function(){
//			$('.tr_texto').hide();
			var cod = $(this).attr("lang");
			$('.tr_texto_' + cod).toggle();
		});
		$('.abre_img').click(function(){
//			$('.tr_img').hide();
			var cod = $(this).attr("lang");
			$('.tr_img_' + cod).toggle();
		});
/*		$('.abri').click(function(){
			$div = $(this).next(); 
			if($div.css("display")=="none"){
				$div.slideDown('fast');
			}else{
				$div.slideUp('fast');		
			}
		});	*/
	});

</script>
</head>
<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
<style type="text/css">
.abrir {
	display:none;
	background: #F7F7F7;
	padding:10px;
	color:#666;
	border:1px solid #999;
	float:left;
	margin-top:5px;
	line-height:22px;
	min-width:485px;
}
.abrir p {
	font-size:12px;
	float:left
}
.abri {
	cursor:pointer;
	display:block;
	text-align:justify;
	float:left;
*cursor:auto;
}
.table tr td {
	padding:5px;
	background-color:#DFE6EC;
}
</style>    
<div id="geral">
	<div id="centro"> 
		<div id="texto">
			<div id="titulo_centro">
				<img src="img/titulo_informacoes.png" width="112" height="16" border="0" />
			</div>
			<div id="texto_centro">
				<%	SQL = "SELECT i.cod, i.titulo, i.texto, i.arquivo, i.cod_categoria_informacoes, COALESCE(ci.nome, 'SEM CATEGORIA') AS categoria" & vbcrlf
					SQL =  SQL & " FROM informacoes i" & vbcrlf
					SQL =  SQL & " LEFT JOIN categoria_informacoes ci ON ci.cod = i.cod_categoria_informacoes" & vbcrlf
					SQL =  SQL & " ORDER BY ci.cod, ci.nome, i.titulo" & vbcrlf
					Set rsInfo = Server.CreateObject("ADODB.RecordSet")
					rsInfo.Open SQL, ObjDb, 3, 1
					
					'	Response.Write(SQL)
					
					WHILE rsInfo.EOF = FALSE
					
					titulo		= rsInfo("titulo")
					categoria	= rsInfo("categoria")
					arquivo		= rsInfo("arquivo")
					cod			= rsInfo("cod")
					texto			= rsInfo("texto")
					cod_cat		= rsInfo("cod_categoria_informacoes")	%>
				<% if categoria_anterior <> rsInfo("categoria") then %>
				<table width="500" border="0" class="table">
					<tr>
						<td width="94%" >
							<p class="cor_cinza_claro">
								<a href="#" class="abre_titulo" lang="<%=cod_cat%>"><%=categoria%></a>
							</p>	
						</td>
						<td class="cor_cinza_claro">
							<a href="#" class="abre_titulo" lang="<%=cod_cat%>">
								<img src="img/mais.png" width="15" height="15" />
							</a>	
						</td>
					</tr>
				</table>
				<% end if %>
				<div class="tr_titulo tr_titulo_<%=cod_cat%> abrir">
					<span class="linha1">
						<% if arquivo <> "" then %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="abre_img" lang="<%=cod%>"><%=titulo%></a>
						<% elseif texto <> "" then %>
							<a href="#" class="abre_texto" lang="<%=cod%>"><%=titulo%></a>
						<% end if %>
					</span>
				<% if arquivo <> "" then %>
					<br />
					<div class="tr_img tr_img_<%=cod%>" style="display:none; margin-left:32px;">
						<div style="padding-left:10px; font-style:italic; width:400px;"><%=texto%></div>
					</div>
					<div class="tr_img tr_img_<%=cod%>" style="display:none">
						<div style="height:45px; margin-left:40px;">
							<a href="informacoes/<%=arquivo%>" target="_blank">
								<img src="img/pdf.png" width="119" height="19" border="0" align="left" />
							</a>
						</div>
					</div>
				<%	end if %>
				</div>	
			<%	categoria_anterior = categoria
			rsInfo.MOVENEXT
			WEND %>	 
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