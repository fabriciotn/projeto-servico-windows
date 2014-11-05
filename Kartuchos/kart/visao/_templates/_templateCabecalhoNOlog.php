<?php
     session_start();
     //http_response_code(304);
     header('Date: ' . gmstrftime('%a, %d %b %Y %T %Z', $_SERVER['REQUEST_TIME']));
     header_remove('Cache-Control');
     header_remove('Pragma');
     header_remove('Expires');
     require_once('../controle/CtrlFuncionario.php');
     
     //include("../controle/verificaAcesso.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Sistema Kartuchos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="author" content="Juntaweb - www.juntaweb.com.br">
        <meta name="description" content="">
        <meta name="keywords" content="impresão, catucho, katuchos, kasf">
        <link rel="canonical" href="http://www.katuchos.com.br/">
        <link rel="stylesheet" type="text/css" href="css/itens.css" media="screen">
        <link rel="stylesheet" type="text/css" href="css/estrutura.css" media="screen">
        <link rel="stylesheet" type="text/css" media="screen" href="css/calendario.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="css/defaultTheme.css" />
        <script language="JavaScript" src="js/jquery.js"></script>
        <script language="JavaScript" src="js/ordenarTitulo.js"></script>
        <script language="JavaScript" src="js/filtroGrid.js"></script>
        <script language="JavaScript" src="js/funcoes.js"></script>
        <script type="text/javascript" src="js/calendario.js"></script>
        <script type="text/javascript" src="js/jquery.fixedheadertable.js"></script>
        <link rel="shortcut icon" href="images/icons/kartuchos.ico" />
    </head>
   <?php
   if(empty($_GET["semMenuCabecalho"])){
   ?>
   <div class="topo">
            <div class="content">

                <h1 href="#" class="lk-kartuchos" title="voltar para gina principal">
                         Sistema Kartuchos - Acesso Restrito
                </h1>
                <p class="plantao"></p>
	        </div>
        </div>
        <body onload="UR_Start()">
        <?php
         if(!empty($_SESSION["cod"])){
             print '<div id="sgi-topo-login">';
             echo '<img class="alinhaImg" src="images/icons/clock.png" alt="Relógio"/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                     <font size="3px" face="Trebuchet MS, Verdana, Arial, sans-serif" color="#000">'.date("d/m/Y").'  -   <span id="ur"></span></font>
                       &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;';
             echo '<a href="javascript:window.history.go(-1)"><img class="alinhaImg" src="images/icons/voltarPagina.gif" /></a>
                      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;';
             echo 'Você está logado: <span style="color: #3B5998;"><strong>'.$_SESSION['user'].'</strong></span>
                      &#160;&#160;|&#160;&#160;<a href="../controle/logout.php">Sair</a>';
             print '</div>';
         }
         ?>
        <div class="menu-topo">
	        <div class="content">
    	        <ul class="menu">
                    <li id="mnPrincipal"><a href="index.php" title="Tela Principal"></a></li>
                    <?php obtemMenu($_SESSION["cod"]);                    
                  /*  <li id="mnCadastros"><a href="cadastros.php" title="Módulo de Cadastros"></a></li>
                    <li id="mnSolicitacoes"><a href="solicitacoes.php" title="Módulo de Solicitações"></a></li>
                    <li id="mnFinanceiro"><a href="financeiro.php" title="Módulo de Financeiro"></a></li>
                    <li id="mnRelatorios"><a href="relatorio.php" title="Módulo de Relatórios"></a></li>
                    <li id="mnLocacao"><a href="locacao.php" title="Módulo de Locações"></a></li>*/
                    
                    ?>
                    <li id="mnSettings"><a onClick="sobre();" title="Configurações do Sistema"></a></li>
                </ul>
            </div>
        </div>
        <Br>
       <?php
        }
         ?>
        <body>
        <div id="sgi-tudo">
        <div id="sgi-corpo">


                <div id="sgi-sub-menu-topo"></div>
                <div id="sgi-pagina">
                                        <div id="sgi-coluna-esquerda">
                                                <div id="sgi-coluna-esquerda-conteudo">
                                                                        <div id="menu_lateral">


