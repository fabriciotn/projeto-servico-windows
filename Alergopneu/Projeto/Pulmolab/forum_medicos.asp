<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<link rel="stylesheet" href="css_menu/style.css" type="text/css" media="screen"/>

<style type="text/css">
	h2 {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 22px;
		font-weight: bold;
		color: #FF6600;
		border-bottom: 2px solid;
	}
	h3 {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 13px;
		font-weight: bold;
		color: #333333;
	}
	h4 {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 14px;
		font-weight: bold;
		color: #00496C;
	}
	.style1 {
		font-size: 11px;
		font-weight: bold;
	}
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
	
	
	
	.style2 {font-size: 11px
	}
	.tabela {border-color:#000000; border-width:5px;
	}
	
	#padding {padding:5px 10px 5px 10px;}
	.titulo1 {font-family:Arial, Helvetica, sans-serif;
	font-size:13px;
	color:#666666;
	text-align:justify;
	cursor:pointer;
	font-weight:bold;
	}
	.tablePerguntar{
		width:480px;
	}
	.tableForum tr td{
		border:#CCCCCC 1px solid;
	}
	.dadoForum{
		width:91px;
		height:54px;
		background:url(img/fundoDadoForum.png) no-repeat;
		font-size:14px;
		font-weight:bold;
		color:#FFFFFF;
	}
	.dadoForumResposta
	{
		width:91px;
		height:54px;
		background:url(img/fundoDadoForum2.png) no-repeat;
		font-size:14px;
		font-weight:bold;
	}
	.dadoForumResposta
	{
		width:91px;
		height:54px;
		background:url(img/fundoDadoForum2.png) no-repeat;
		font-size:14px;
		font-weight:bold;
	}
	.textoForum{
		width:510px;
		color:#666666;
		font-size:12px;
		padding-left:10px;
	}
	.textoPergunta{
		color:#666666;
		width:430px;
		height:50px;
	}
	.link_links a{
	color: #333;
	text-decoration:none
	
	}
	.link_links a:hover{
	color: #333;
	text-decoration: underline
	
	}
	#meuCadastro a{
		color:#333333;
		text-decoration:none;
	}
	#meuCadastro a:hover{
		color:#006666;
		text-decoration:underline;
		font-style:italic;
	}	
</style>
</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
<!-- #include file="confere_forum.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
       <div id="titulo_centro"><img src="img/titulo_forummedicos.png" width="151" height="17" border="0" /></div>
       <div id="texto_centro">
			 <div style="float:left; margin-bottom:20px; cursor:pointer">
				<a id="meuCadastro" lang="<%=idForum%>">Meu cadastro</a>
			 </div> 

			 <div style="float:right; margin-bottom:20px;">
				Selecione o f&oacute;rum:
				<select name="tipoForum" id="tipoForum">
					<option value="0">Selecionar</option>
					<option value="2">F&oacute;rum Leigos&nbsp;</option>
					<option value="1">F&oacute;rum M&eacute;dico&nbsp;</option>
				</select>
			 </div> 
   <p>&nbsp;</p>
<%
	
	SQL = "SELECT * FROM forum WHERE tipo = 1 ORDER BY data DESC"

	Set rsForum = Server.CreateObject("ADODB.RecordSet")

'	Response.Write(SQL)
'	Response.End()

	rsForum.Open SQL, ObjDB, 3, 1
	
IF rsForum.EOF = FALSE THEN
	
	WHILE rsForum.EOF = FALSE 

		pergunta = rsForum("pergunta")
		cod = rsForum("cod")
		idPessoa = rsForum("id_pessoa")
		ativo = rsForum("ativo")
		respondido = rsForum("respondido")
		data = rsForum("data")
		
		dia = Day(data)
		mes = Month(data)
		ano = Year(data)
		
		if len(dia) = 1 then
			dia = 0&dia
		end if
		
		if len(mes) = 1 then
			mes = 0&mes
		end if

		data = dia &"/"& mes &"/"& ano
		
		'*********************************************  SELECT DO AUTOR DA PERGUNTA ***************************************

		sqlAutor = "SELECT id, nome, email, categoria FROM corpoclinico WHERE id = " & idPessoa

		Set rsAutor = Server.CreateObject("ADODB.RecordSet")
	
'		Response.Write(sqlAutor)
'		Response.End()
	
		rsAutor.Open sqlAutor, ObjDB, 3, 1
		
		IF rsAutor.EOF = FALSE THEN
			
			autor = rsAutor("nome")
			emailAutor = rsAutor("email")
			categoria = rsAutor("categoria")

		END IF	

	
%>
	<table cellpadding="1" cellspacing="1" class="tableForum">
		<tr>
			<td class="dadoForum">
				&nbsp;Pergunta:
				<%IF dia <> "" AND mes <> "" THEN%>
					<span style="font-size:10px; font-weight:normal;">&nbsp;&nbsp;<%=data%></span>
				<%END IF%>
			</td>
			<td>
				<div class="textoForum">
<!--				De: <%'=autor%> -->
					<%=pergunta%>
			  </div>
			</td>
		</tr>
  <%IF respondido = 1 THEN
			
			Set rsResposta = Server.CreateObject("ADODB.RecordSet")
			
			sqlResposta = "SELECT r.texto, r.idPessoa, u.usuario"
			sqlResposta = sqlResposta & " FROM resposta r"
			sqlResposta = sqlResposta & "	INNER JOIN usuario u ON	r.idPessoa = u.id"
			sqlResposta = sqlResposta & " WHERE r.idForum = "& cod
			
'			Response.Write(sqlResposta)
'			Response.End()
			rsResposta.Open sqlResposta, ObjDB, 3, 1
			
			WHILE rsResposta.EOF = FALSE
				
				idResposta = rsResposta("idPessoa")
				autorResposta = rsResposta("usuario")
				texto = rsResposta("texto")
				

		%>
				<tr>
					<td class="dadoForumResposta">&nbsp;Resposta:</td>
					<td>
						<div class="textoForum">
							<b><%=autorResposta%></b>
							<br /><br />
							<%=texto%>
						</div>
					</td>	
				</tr>
		<%	
				rsResposta.MOVENEXT
			WEND
		
	END IF%>
	</table>

	<img src="img/divisoriaForum.png"  style="padding:10px 0 10px 0;"/>
		
<%
	rsForum.MOVENEXT
	WEND
ELSE
%>
	N&atilde;o h&aacute; perguntas cadastradas neste f&oacute;rum.
<%END IF%>
   <p>&nbsp;</p>
   
<!-- 		*********************************************	PERGUNTAR	*********************************************************		-->   

	<form method="post" name="formPerguntar" id="formPerguntar" action="perguntar_ok.asp">
		<table class="tablePerguntar" style="padding-top:200px;">
			<tr>
				<td>
					<img src="img/perguntas.png" />
				</td>
				<td>
					<textarea name="pergunta" id="perguntaForum" class="textoPergunta" >Digite aqui sua pergunta</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align:right">
					<input type="hidden" value="<%=email%>" name="email" id="email" />
					<input type="hidden" value="<%=nome%>" name="nome" id="nome" />
					<input type="hidden" value="medicos" name="tipo" id="tipo" />
					<input type="submit" value="Enviar" name="Enviar" id="Enviar" style="width:80px;"/>
				</td>
			</tr>
		</table>
	</form>


<!-- 		*********************************************	FIM PERGUNTAR	*********************************************************		-->   
       </div>
       
       </div>
       
 <!-- #include file="direita_menor.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->


<script type="text/javascript">
	$(document).ready(function(){
//o algoritmo abaixo deleta o texto "Digite aqui sua pergunta" caso a pessoa clique no input perguntaForum
		$('#perguntaForum').focus(function(){
			if( $('#perguntaForum').val() == 'Digite aqui sua pergunta' ){
				$(this).val('');
			}
		});
//o algoritmo abaixo insere o texto "Digite aqui sua pergunta" caso a pessoa clique fora do input perguntaForum
		$('#perguntaForum').blur(function(){
			if( $('#perguntaForum').val() == '' ){
				$(this).val('Digite aqui sua pergunta');
			}
		});
		
//o algoritmo abaixo verifica se a opcao do select foi alterada redirecionando para outro tipo de forum
		$('#tipoForum').change(function(){
			if( $('#tipoForum').val() == 1 ){
				window.location = "forum_medicos.asp";
			}
			else
			{
				window.location = "forum_leigos.asp";
			}
		});
		

//		Verificacao se quem esta perguntando ja eh cadastrado e se o campo pergunta esta vazio
		$('#formPerguntar').submit(function(){
			
			if( ($('#nome').val() == '') && ($('#email').val() == '') ){
				alert('Somente usuários cadastrados podem perguntar');
				window.location = "forum.asp";
				return false;
			}
			if( $('#perguntaForum').val() == '' || $('#perguntaForum').val() == 'Digite aqui sua pergunta'){
				alert('O campo pergunta é obrigatório');
				return false;
			}
		});

//		acessa o cadastro do usuario
		$('#meuCadastro').click(function(){

			var id_atual = $(this).attr("lang");
			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
			
			window.open("verificaMedico.asp?id=" + id_atual, "PULMOLAB" , "height=800,width=570,top=" + topo + ",left=" + esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

		});
	});

</script>
