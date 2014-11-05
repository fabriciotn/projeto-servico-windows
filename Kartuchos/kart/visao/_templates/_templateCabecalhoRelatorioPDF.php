<?php
$cabecalhoPDF ='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Sistema Kartuchos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="author" content="Juntaweb - www.juntaweb.com.br">
        <meta name="description" content="">
        <meta name="keywords" content="impresão, catucho, katuchos, kasf">
        <link rel="canonical" href="http://www.katuchos.com.br/">
        <link rel="stylesheet" type="text/css" media="screen" href="css/calendario.css" />
        <script language="JavaScript" src="js/jquery.js"></script>
        <script language="JavaScript" src="js/funcoes.js"></script>
        <script type="text/javascript" src="js/calendario.js"></script>
        <link rel="shortcut icon" href="images/icons/kartuchos.ico" />
<style>

.alinhaImg{border: 0px;padding: 0px;position: absolute;}


.formulario  {  display: block;}
.form-linha, .form-linha-error  { margin-top: 3px; padding: 4px;  display: block;  }
.form-rotulo { display: block; font-weight: bold; font-size: 12px;}
.form-rotulo2 { display: inline; font-weight: bold; font-size: 12px;  }
.form-campos { display: block; color: blue; font-weight: bold;}
.form-campos input{background: white; border: 2px solid silver; color: blue;font-weight: bold;}
.form-campos select{border: 2px solid silver; color: blue;font-weight: bold;}
.form-campos textarea { color: blue;font-weight: bold;}
.form-campos2 { display: inline;color: blue; font-weight: bold;}
.form-campos2 input{background: white;  border: 2px solid silver;color: blue;font-weight: bold;}
.form-campos2 select{border: 2px solid silver;color: blue;font-weight: bold;}
.form-campos2 textarea {color: blue;font-weight: bold;}

.tipo_dados
{
		margin-left: 0px;
		margin-bottom: 10px;
		margin-top: 10px;
		color: black;
		font-size: 18px;
		font-weight: bold;
}

body {padding: 0px;
     margin-left: 0px;
     margin-right: 0px;
     background: white;
}

table.separate th {
  background-color: #3B5998;
  color: white;
}
#sgi-conteudo{background-color: silver; border: 0px;}
tbody {background-color: silver; border: 0px;}

table.separate th,td {
  padding: 5px;
  border:1px solid white;
  font-size: 13px;
}

table.filtro th,td {
  padding: 5px;
  border:0px solid white;
  font-size: 13px;
}

table.separate {
  border-spacing: 0px;
  font-size: 12px;
}

table.separate tr {
  border: 2px solid #33d;
}


div.titulo {
           text-align: center;
           font-size: 15px;
           }
div.cabecalho {
           text-align: left;
           font-size: 12px;
           background-color: white;
           }

</style>

</head>

<body>
    <div class="cabecalho">';
if($tipoRelatorio != "EXCEL")
    $cabecalhoPDF .= '<img style="float:right;width: 130px;" src="../visao/images/logo-kartuchos.png" />';

    $cabecalhoPDF .= '

    Sistema Kartuchos <BR>
    <strong>'.$titulo1.'</strong><br>
    Gerado por  <strong>'.$_SESSION['user'].'</strong> na data <strong>'.date("d/m/Y").'</strong>
    </div>
    <br>
    <hr>';
?>
