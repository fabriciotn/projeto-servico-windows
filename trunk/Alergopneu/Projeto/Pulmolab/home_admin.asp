<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<style type="text/css">
.tabelaADM {
	width:600px;
	margin-bottom:170px;
}
.tabelaADM td {
	text-align:center;
}
.link_links:hover {
	text-decoration:underline;
	font-style:italic;
	color:#66808F;
}
</style>
</head>

<body>

<!-- #include file="topo.asp" --> 
<!-- #include file="sessao.asp" --> 

<!-- #include file="menu.asp" -->

<div id="geral">
  <div id="centro">
    <div id="texto"> 
      
      <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
      <div class="conteudo_adm" style="padding-left:15px;">
        <p>Bem-vindo(a)&nbsp;administrador(a): <b><%=usuario%></b></p>
        <table class="tabelaADM">
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <%IF nivelUsuario <> 2 THEN%>
            <td id="ferramenta"><a href="ferramenta_artigo.asp" style="color: #000000;"><img src="img/artigo.png" title="Gerenciador de artigos" style="padding-left:15px" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_aulas.asp" style="color: #000000;"><img src="img/aula.png" title="Gerenciador de Aulas" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_calendario.asp" style="color: #000000;"><img src="img/calendar.png" title="Gerenciador de Calendário" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_casoClinico.asp" style="color: #000000;"><img src="img/casoClinico.png" title="Gerenciador de Caso cl&iacute;nico do m&ecirc;s" border="0" /></a></td>
          </tr>
          <tr>
            <td id="ferramenta" class="link_links"><a href="ferramenta_artigo.asp" style="color: #000000;">Artigos</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_aulas.asp" style="color: #000000;">Aulas</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_calendario.asp" style="color: #000000;">Calend&aacute;rio</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_casoClinico.asp" style="color: #000000;">Caso cl&iacute;nico do m&ecirc;s</a></td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          <tr>
            <%END IF%>
            <%'IF nivelUsuario = 2 THEN%>
            <td id="ferramenta"><a href="ferramenta_corpo.asp" style="color: #000000;"><img src="img/corpo.png" title="Gerenciador de Corpo Cl&iacute;nico" style="padding-left:15px" border="0" /></a></td>
          <%'END IF%>
          <%IF nivelUsuario <> 2 THEN%>
          
            <td id="ferramenta"><a href="ferramenta_forum.asp" style="color: #000000;"><img src="img/forum.png" title="Gerenciador de f&oacute;rum" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_informacoes.asp" style="color: #000000;"><img src="img/informacao.png" title="Gerenciador de Informa&ccedil;&otilde;s" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_link.asp" style="color: #000000;"><img src="img/link.png" title="Gerenciador de Links" style="padding-left:15px;" border="0" /></a></td>
          </tr>
          <%END IF%>
          <tr>
          <%'IF nivelUsuario = 2 THEN%>
            <td id="ferramenta" class="link_links"><a href="ferramenta_corpo.asp" style="color: #000000;">Corpo Cl&iacute;nico</a></td>
           <%'END IF%> 
          <%IF nivelUsuario <> 2 THEN%>
            <td id="ferramenta" class="link_links"><a href="ferramenta_forum.asp" style="color: #000000;">F&oacute;rum</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_informacoes.asp" style="color: #000000;">Informa&ccedil;&otilde;s &Uacute;teis</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_link.asp" style="color: #000000;">Links Interessantes</a></td>
          </tr>
            </tr>
          
          
            <td colspan="4">&nbsp;</td>
          <tr>
            <td id="ferramenta"><a href="ferramenta_noticias.asp" style="color: #000000;"><img src="img/noticias.png" title="Gerenciador de Not&iacute;cias" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_pesquisa.asp" style="color: #000000;"><img src="img/protocolo_pesquisa.png" title="Gerenciador de Pesquisa" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_protocolos.asp" style="color: #000000;"><img src="img/protocolo.png" title="Gerenciador de Protocolos" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_txt.asp" style="color: #000000;"><img src="img/txt.png" title="Gerenciador de Texto home" border="0" /></a></td>
          </tr>
          <tr>
            <td id="ferramenta" class="link_links"><a href="ferramenta_noticias.asp" style="color: #000000;">Not&iacute;cias</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_pesquisa.asp" style="color: #000000;">Protocolo de Pesquisa</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_protocolos.asp" style="color: #000000;">Protocolos</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_txt.asp" style="color: #000000;">Texto Home</a></td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr style="text-align:center">
            <td id="ferramenta"><a href="ferramenta_textos.asp" style="color: #000000;"><img src="img/estrutura.png" title="Gerenciador de textos" style="padding-left:15px" border="0" /></a></td>
            <td id="ferramenta"><a href="ferramenta_usuario.asp" style="color: #000000;"><img src="img/usuario.png" title="Gerenciador de usu&aacute;rios" style="padding-left:15px" border="0" /></a></td>
          </tr>
          <tr style="text-align:center">
            <td id="ferramenta" class="link_links"><a href="ferramenta_textos.asp" style="color: #000000;">Textos</a></td>
            <td id="ferramenta" class="link_links"><a href="ferramenta_usuario.asp" style="color: #000000;">Administradores</a></td>
            <%END IF%>
          </tr>
        </table>
      </div>
      
      <!-- ***********************************************************************	FIM CONTEUDO ADM ********************************************************************* --> 
      
    </div>
    
    <!-- #include file="direitaADM.asp" --> 
    
  </div>
</div>

<!-- #include file="rodape.asp" -->

</body>
</html>
<!--#include file="conexaoOFF.asp" -->