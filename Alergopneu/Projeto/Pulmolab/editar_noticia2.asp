<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Instituto de Ortopedia e Traumatologia</title>
<link rel="stylesheet" href="estilo.css" />
<script src="js/AC_RunActiveContent.js" language="javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript">
		
	$(document).ready(function(){	
	
			$('.tr1').hide();
			$('.tr2').hide();
	
	<%cod = Request.QueryString("cod")%>
	
		$('#link1').click(function(){
		
		if ($('#tipo1').is(':checked'))
		{
 			 var tipo = 1;
		}
		else if ($('#tipo2').is(':checked'))
		{
 			 var tipo = 2;
		}
		else if ($('#tipo3').is(':checked'))
		{
 			 var tipo = 3;
		}
		else
		{
			tipo = 1
		}
	
			
			
			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
		
			window.open("cadastrar_imagem1d.asp?cod=<%=cod%>&modelo=" + tipo, "Exposystems2" , "height=300,width=380,top=" + topo + ",left=" + 	esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

		});	
		
		$('#link2').click(function(){
		
		if ($('#tipo1').is(':checked'))
		{
 			 var tipo = 1;
		}
		else if ($('#tipo2').is(':checked'))
		{
 			 var tipo = 2;
		}
		else if ($('#tipo3').is(':checked'))
		{
 			 var tipo = 3;
		}
		else
		{
			tipo = 1
		}
	

			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
		
			window.open("cadastrar_imagem2d.asp?cod=<%=cod%>&modelo=" + tipo, "Exposystems2" , "height=300,width=380,top=" + topo + ",left=" + 	esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

		});	
		
		
	
	$('#tipo1').click(function(){	
		{
			$('.tr1').hide();
			$('.tr2').hide();
		}
	});
	
	$('#tipo2').click(function(){	
		{
			$('.tr1').show();
			$('.tr2').hide();
		}
	});
	
	$('#tipo3').click(function(){	
		{
			$('.tr1').show();
			$('.tr2').show();
		}
	});


	if ($('#tipo1').is(':checked') == true)
	{
			$('.tr1').hide();
			$('.tr2').hide();
	}
	else if ($('#tipo2').is(':checked') == true)
	{
			$('.tr1').show();
			$('.tr2').hide();
	}
	else if ($('#tipo3').is(':checked') == true)
	{
			$('.tr1').show();
			$('.tr2').show();
	}


$('#cadastra').click(function(){


	if ( ($('#tipo1').is(':checked') == false) && ($('#tipo2').is(':checked') == false) && ($('#tipo3').is(':checked') == false) )
	{
 			 alert("Erro! Selecione o modelo da notícia.");
			 return false;
	}

		else if ($('#tipo1').is(':checked'))
		{
 			 var tipo = 1;
		}
		else if ($('#tipo2').is(':checked'))
		{
 			 var tipo = 2;
		}
		else if ($('#tipo3').is(':checked'))
		{
 			 var tipo = 3;
		}
		else
		{
			tipo = 1
		}
	
		
		
		$.post('verifica_imagens2.asp',
		 { 
				 modelo: tipo,
				 cod : <%=cod%>
		 
		 },function(response)
		 	{
				if(response=="valido")
				{
					$('#formulario').submit();
				}
				else
				{
					alert("Erro! Insira todas as imagens necessárias para o modelo escolhido.");
					$('#email').val('').focus();
					return false;
				}		
			});

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
-->
</style>

<body>

		<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<br />
<%
				cod = Request.QueryString("cod")
				cod = cint(cod)
				
				SQL = "select * from noticias where cod="&cod
				set rs  = server.CreateObject("ADODB.RecordSet")
				rs.Open SQL, objdb,3,1
				
				texto = replace(rs("noticia"),"<br />",chr(13))
%>
        
		<form method="post" id="formulario" name="formulario" action="editar_noticia2_ok.asp">
        <table style="font-family: Tahoma; font-size: 8pt;">
        
		
				<tr>
				  <td class="area"><b>Modelo:</b></td>
		  </tr>
				<tr>

		
		<td class="area">
		<%
		modelo = Request.QueryString("modelo")
'		response.Write(modelo)
'		response.End()
		if TRIM(modelo) = "" then
			modelo = rs("modelo")
		end if
		%>
		<input name="tipo" id="tipo1" value="1" type="radio" style="border: none;" <%if cint(modelo) = 1 then%> checked="checked" <%end if%> />		<img alt="" src="img/modelo1.png" />&nbsp;&nbsp;
		<input name="tipo" id="tipo2" value="2" type="radio" style="border: none;" <%if cint(modelo) = 2 then%> checked="checked" <%end if%> />		<img alt="" src="img/modelo2.png" />&nbsp;&nbsp;
		<input name="tipo" id="tipo3" value="3" type="radio" style="border: none;" <%if cint(modelo) = 3 then%> checked="checked" <%end if%> />		<img alt="" src="img/modelo3.png" />		</td>
		</tr>
		
		
		
		
		        <tr class="tr1">
		          <td class="area">&nbsp;</td>
          </tr>
		        <tr class="tr1">
		          <td class="area"><b>Primeira imagem:</b></td>
          </tr>
        
		<tr class="tr1">
		<td class="area">
		<%
		sql = "select * from noticias where cod = "&cod
		set rs = server.CreateObject("ADODB.RecordSet")
		rs.open sql, objdb, 3, 1
		%>
		<%if TRIM(rs("imagem1")) = "" then%>
		<a id="link1" name="link1" style="cursor:pointer; text-decoration: underline; font-weight: bold; color: #4F7C6C;"><img alt="" src="img/add.png"style:"border: none;" title="Inserir primeira imagem" /></a>
		<%else%>
		 <a href="#" onClick="window.open('./ver_imagem2.asp?nome=<%=rs("imagem1")%>&path=images/news/&amp;type=popup&amp;src=ane/<%=rs("imagem1")%>','imagem','width=100,height=100,left=0,top=0,scrollbars=no,resizable=yes')">
<img alt="" width="60" height="50" src="anexo/<%=rs("imagem1")%>" style="border: none;" title="Clique para abrir" /></a>
<span style="padding-left: 10px;">Ações:&nbsp;<a href="delete_imagem1b.asp?cod=<%=rs("cod")%>" onclick="return confirm('Deseja realmente excluir a primeira imagem?')"><img style="border: none;" src="img/delete.png" title="Excluir primeira imagem" /></a></span>	
		 <%end if%>		</td>
		</tr>
		
		<tr class="tr2">
		  <td class="area">&nbsp;</td>
		  </tr>
		<tr class="tr2">
		  <td class="area"><b>Segunda imagem:</b></td>
		  </tr>
		<tr class="tr2">
		<td class="area">
		<%if TRIM(rs("imagem2")) = "" then%>
		<a id="link2" name="link2" style="cursor:pointer; text-decoration: underline; font-weight: bold; color: #4F7C6C;"><img alt="" src="img/add.png"style:"border: none;" title="Inserir segunda imagem" /></a>
<%else%>
				 <a href="#" onClick="window.open('./ver_imagem2.asp?nome=<%=rs("imagem2")%>&path=images/news/&amp;type=popup&amp;src=anexo/<%=rs("imagem2")%>','imagem','width=100,height=100,left=0,top=0,scrollbars=no,resizable=yes')">
<img alt="" width="60" height="50" src="anexo/<%=rs("imagem2")%>" style="border: none;" title="Clique para abrir" /></a>
<span style="padding-left: 10px;">Ações:&nbsp;<a href="delete_imagem2b.asp?cod=<%=rs("cod")%>" onclick="return confirm('Deseja realmente excluir a segunda imagem?')"><img style="border: none;" src="img/delete.png" title="Excluir segunda imagem" /></a></span>	
	
          <%end if%>		</td>
		</tr>
		<tr>
		  <td class="area">&nbsp;</td>
		  </tr>
		<tr>
		  <td class="area">&nbsp;</td>
		  </tr>
		<tr>
		  <td class="area">
		<input type="hidden" id="cod" name="cod" value="<%=cod%>" />
		<input type="button" class="botoes" id="cadastra" value="Atualizar" style="cursor: pointer;">
		  </td>
		  </tr>
		<%rs.Close%>
		</table>
		
<p align="center"> 

		</form>
</p>
		


        
</body>
</head>
</html>
<!--#include file="conexaoOFF.asp" -->
