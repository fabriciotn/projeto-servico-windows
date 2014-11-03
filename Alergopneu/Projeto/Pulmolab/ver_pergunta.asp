<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PULMOLAB</title>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		$('.resposta').hide();
	
		$('.ver2').click(function(){
			
			$('.resposta').toggle();
	
		});

		$('.responder').click(function(){
		var id_atual = $(this).attr("lang");
		var esquerda = (screen.width - 900)/2;
		var topo = (screen.height - 670)/2;
		
		window.open("responder.asp?cod=" + id_atual, "PULMOLAB" , "height=650,width=610,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
		});


	});
</script>
<style>
body
{
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
	padding: 0px 20px 10px 20px;
}
.link_links a{
	color: #333;
	text-decoration:none
	}
.link_links a:hover{
	color: #006699;
	font-style:italic;
	}	
</style>

<!--#include file="conexao.asp"-->

<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>

<%
				cod = request.QueryString("cod")
				
				SQL = "SELECT data, pergunta, respondido, id_pessoa, tipo FROM forum WHERE cod="&cod
'				Response.Write(sql)
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1

if not rs.eof then            

	idAutor = rs("id_pessoa")
	respondido = rs("respondido")
	
	sqlAutor = "SELECT nome, email FROM corpoclinico WHERE id="&idAutor
	'				Response.Write(sql)
	set rsAutor  = server.CreateObject("ADODB.RecordSet")
	rsAutor.Open sqlAutor, objdb,3,1
	
	IF rsAutor.EOF = FALSE THEN
		
		autor = rsAutor("nome")
		email = rsAutor("email")
	
	END IF
		
	dia = day(rs("data"))
	mes = month(rs("data"))
	ano = year(rs("data"))
	hora = hour(rs("data"))
	minuto = minute(rs("data"))
	segundo = second(rs("data"))
	
	if len(dia) = 1 then
	dia = 0&dia
	end if
	
	if len(mes) = 1 then
	mes = 0&mes
	end if
	
	
	
	dataCadastro = dia&"/"&mes&"/"&ano&" "
	
	%>
	<div class="caixaRP" style="padding-bottom:20px; width:500px;">
		
		<div class="link_links" style="width:200px; float:left">
			<%IF respondido = 0 THEN%>
					<a lang="<%=cod%>" class="responder" style="cursor: pointer;" >
					<img style="border: none;" src="img/off.png" title="Pergunta ainda não respondida" />
					</a>
			<%ELSE%>		
					<a lang="<%=cod%>" class="ver2" style="cursor: pointer;">
						<img style="border: none;" src="img/zoom.png" title="Pergunta respondida!" /> Clique aqui para ver a(s) resposta(s).
					</a>
			<%END IF%>
		</div>
	
		<div class="link_links" style="width:200px; float:right; padding-left:30px;">
			<a lang="<%=cod%>" class="responder" style="cursor: pointer;" >
				<img style="border: none; text-decoration:none;" src="img/add.png" title="Adicionar resposta" />&nbsp;Clique aqui para responder.
			</a>
		</div>
		<br />

	</div>
	
	<b style="font-size:15px; font-weight:bold; text-align:left;">Pergunta de: </b>  <%=Server.HTMLEncode(autor)%>
	<br /><br />
	<span style="font-size:10px; text-align:right; float:right; padding-bottom:5px;"> <%=dataCadastro%></span>
	<div style="padding-left:20px; text-align: justify">
		<%=rs("pergunta")%>
	</div>
	
	 
<%end if%>
       
<%

	sqlResposta = "SELECT r.texto, r.idPessoa, r.dataResposta, u.usuario"
	sqlResposta = sqlResposta & " FROM resposta r"
	sqlResposta = sqlResposta & "	INNER JOIN usuario u ON	r.idPessoa = u.id"
	sqlResposta = sqlResposta & " WHERE r.idForum = "& cod
'	Response.Write(sqlResposta)
	Set rsResposta  = Server.CreateObject("ADODB.RecordSet")
	rsResposta.Open sqlResposta, objdb,3,1
	
	WHILE rsResposta.EOF = FALSE
		
		idResposta = rsResposta("idPessoa")
		autorResposta = rsResposta("usuario")
		texto = rsResposta("texto")
%>
		<div class="resposta" style="padding-top:30px;">
			<div style="width:100%;	height:1px;	border-bottom:4px Solid #FFFFFF; clear:both;"></div>
			<br /><br />
			<b style="font-size:15px; font-weight:bold; text-align:left;">Resposta de: </b>  <%=Server.HTMLEncode(autorResposta)%>
			<br />
			<div style="padding-left:20px; text-align: justify">
				<%=texto%>
			</div>
		</div>

<%
		rsResposta.MOVENEXT
	WEND
%>

</body>
</head>
</html>
     
<!--#include file="conexaoOFF.asp" -->
