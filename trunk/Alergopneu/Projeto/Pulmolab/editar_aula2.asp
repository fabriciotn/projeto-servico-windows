<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conexao.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Instituto de Ortopedia e Traumatologia</title>
<%cod = Request.QueryString("cod")%>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>	<!-- JQUERY BASICA -->
<script type="text/javascript">
		
	$(document).ready(function(){	
	
		$('#abriArquivo').click(function(){
		
			var arquivo = $(this).attr("lang");
			window.open("aulas/"+arquivo);
		
		});


		$('#link1').click(function(){

			var esquerda = (screen.width - 900)/2;
			var topo = (screen.height - 670)/2;
		
			window.open("inserir_arquivo.asp?cod=<%=cod%>", "PULMOLAB" , "height=300,width=380,top=" + topo + ",left=" + 	esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");
	
		});	
		
	$('#cadastra').click(function(){
	
		$.post('verifica_arquivo.asp',
		 { 
				 cod : <%=cod%>
		 
		 },function(response){
				if(response=="valido")
				{
					alert('Aula atualizada com sucesso!');
					window.close();
					window.opener.location =  "ferramenta_aulas.asp";
					window.opener.focus();
				}
				else
				{
					alert("Erro! Insira um arquivo por favor.");
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
</head>

<body>
<p align="center"><img src="img/logo.png" alt="" border="0" /></p>
<%
	cod = cint(cod)
	
	SQL = "SELECT arquivo, cod, obs FROM aulas WHERE cod = " & cod
	set rs  = server.CreateObject("ADODB.RecordSet")
	rs.Open SQL, objdb,3,1
	
	
	IF rs.EOF = FALSE THEN
		
		arquivo = rs("arquivo")
		codArquivo = rs("cod")
		obs = rs("obs")
	
	END IF				
				
				
%>
<form method="post" id="formulario" name="formulario" action="editar_aula2_ok.asp">
  <table style="font-family: Tahoma; font-size: 8pt;">
    <tr>
      <td class="area"><b>Arquivo:</b></td>
    </tr>
    <tr>
      <td class="area">
		<%if TRIM(arquivo) = "" then%>
			<a id="link1" name="link1" style="cursor:pointer; text-decoration: underline; font-weight: bold; color: #4F7C6C;">
				<img alt="" src="img/add.png"style:"border: none;" title="Inserir arquivo" />
			</a>
		<%else%>
			<a id="abriArquivo" lang="<%=arquivo%>">
				<img alt="" width="60" height="50" src="img/aula.png" style="border: none;" title="Clique para abrir" />
			</a>
			<span style="padding-left: 10px;">Ações:&nbsp;
				<a href="delete_arquivo.asp?cod=<%=cod%>" onclick="return confirm('Deseja realmente excluir o arquivo?')">
					<img style="border: none;" src="img/delete.png" title="Excluir primeira imagem" />
				</a>
			</span>
        <%end if%>
      </td>
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
  </table>
</form>
</body>
</html>
<!--#include file="conexaoOFF.asp" -->