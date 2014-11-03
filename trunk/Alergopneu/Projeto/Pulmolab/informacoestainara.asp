<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css.css" rel="stylesheet" type="text/css" />
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
	});

</script>
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

<!-- #include file="topo.asp" --> 

<!-- #include file="menu.asp" -->

<div id="geral">
	<div id="centro">
		<div id="texto">
			<div id="titulo_centro">
				<img src="img/titulo_informacoes.png" width="112" height="16" border="0" />
			</div>
			<div id="texto_centro">
<%	SQL_CAT = "SELECT cod AS cod_cat, LCASE(nome) FROM categoria_informacoes"
	Set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open SQL_CAT, ObjDb, 3, 1
	while rs.eof = false %>
				<div class="abri">
					<table width="510" border="0" class="table">
						<tr>
							<td width="94%" >
								<p class="cor_cinza_claro">
									<strong><%=rs(1)%></strong>
								</p>
							</td>
							<td width="6%" class="cor_cinza_claro">
								<img src="img/mais.png" width="15" height="15" />
							</td>
						</tr>
					</table>
				</div>
		<%	SQL = "SELECT cod, arquivo, titulo, texto FROM informacoes WHERE cod_categoria_informacoes = "& rs(0) &" ORDER BY data"
'			Response.Write(SQL)
			Set rsInfo = Server.CreateObject("ADODB.RecordSet")
			rsInfo.Open SQL, ObjDb, 3, 1
			while rsInfo.eof = false %>
				<div class="abrir">
					<span class="linha1">
						<a href="#"><%=rsInfo(2)%></a>
					</span><br />
				</div>
				
		<%	rsInfo.Movenext
			wend
'			rsInfo.Close
	rs.Movenext
	wend
'	rs.CLose	%>
				<br />
			</div>
		</div>
		
		<!-- #include file="direita_menor.asp" --> 
	</div>
</div>
</div>

<!-- #include file="rodape.asp" --> 

<!--#include file="conexaoOFF.asp" -->

</body></html>