/*------------------------------CSS HEMOCURRICULO--------------------------------------*/
/*
SISTEMA HEMOCURRICULO - FUNDAÇÂO HEMOMINAS
DESENVOLVIDO POR: GTC - SISTEMAS
RESPONSAVEIS: EDUARDO CAPTEIN / GABRIEL HENRIQUE
*/
html{color:#000;background:#FFF;}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td{margin:0;padding:0;}
table{border-collapse:collapse;border-spacing:0;}
fieldset,img{border:0;}
address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal;}
li{list-style:none;}
caption,th{text-align:left;}
h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;}
q:before,q:after{content:'';}
abbr,acronym {border:0;font-variant:normal;}
/* to preserve line-height and selector appearance */
sup {vertical-align:text-top;}
sub {vertical-align:text-bottom;}
input,textarea,select{font-family:inherit;font-size:inherit;font-weight:inherit;}
/*to enable resizing for IE*/
input,textarea,select{font-size:100%;}
/*because legend doesn't inherit in IE */
legend{color:#000;}

/*---------------------------CSS BASE-----------------------------------------*/

/*
Copyright (c) 2008, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.net/yui/license.txt
version: 2.5.2
*/
/* base.css, part of YUI's CSS Foundation */
h1 {
        /*18px via YUI Fonts CSS foundation*/
        font-size:138.5%;
}
h2 {
        /*16px via YUI Fonts CSS foundation*/
        font-size:123.1%;
}
h3 {
        /*14px via YUI Fonts CSS foundation*/
        font-size:108%;
}
h1,h2,h3 {
        /* top & bottom margin based on font size */
        margin:1em 0;
}
h1,h2,h3,h4,h5,h6,strong {
        /*bringing boldness back to headers and the strong element*/
        font-weight:bold;
}
abbr,acronym {
        /*indicating to users that more info is available */
        border-bottom:1px dotted #000;
        cursor:help;
}
em {
        /*bringing italics back to the em element*/
        font-style:italic;
}
blockquote,ul,ol,dl {
        /*giving blockquotes and lists room to breath*/
        margin:1em;
}
ol,ul,dl {
        /*bringing lists on to the page with breathing room */
        margin-left:2em;
}
ol li {
        /*giving OL's LIs generated numbers*/
        list-style: decimal outside;
}

dl dd {
        /*giving DL's DDs Left Margin*/
        margin-left:1em;
}
th,td {
        /*borders and padding to make the table readable*/
        /*border:1px solid #000;*/
        border: 0px;
        padding:.5em;
}
th {
        /*distinguishing table headers from data cells*/
        font-weight:bold;
        text-align:center;
}
caption {
        /*coordinated margin to match cell's padding*/
        margin-bottom:.5em;
        /*centered so it doesn't blend in to other content*/
        text-align:center;
}
p,fieldset,table,pre {
        /*so things don't run into each other*/
        margin-bottom:1em;
}
/* setting a consistent width, 160px;
   control of type=file still not possible */
input[type=text],input[type=password],textarea{
        width:12.25em;
        width:11.9em;
        border:1px solid #CCCCCC;
        padding:3px;
}

/*--------------------------------CSS FONTS------------------------------------*/

html body{
        color:                          #000;
        font-size:                      12px;
        font-family:            arial,helvetica,clean,sans-serif;
        font-style:             normal;
        font-stretch:           normal;
        font-variant:           normal;
        font-weight:            normal;
        text-align:             left;
        text-decoration:        none;
        text-transform:         none;
        text-shadow:            none;
}
pre,code,kbd,samp,tt {
        font-family:            monospace;
        font-size:                      12px;
        color:                          #CCC;
}
sup {
        vertical-align:         text-top;
        font-size:                      10px;
}
sub {
        vertical-align:         text-bottom;
        font-size:                      10px;
}
abbr, acronym{
        text-decoration:        underline;
}
strong{
        font-weight:            bold;
}
small{
        font-size:                      8px;
}
big{
        font-size:                      30px;
}
h1{
        font-size:                      24px;
}
h2{
        font-size:                      20px;
}
h3{
        font-size:                      18px;
}
h4{
        font-size:                      15px;
}
table{
        font-size:                      13px;
        font-weight:            normal;
}
th{
        font-size:                      13px;
        color:                          black;
        font-weight:            bold;
}
td{
        font-size:                      12px;
        font-weight:            normal;
        color:                          #333;
}
a:link{
        text-decoration:        none;
        color:                          blue;
}
a:visited{
        text-decoration:        none;
        color:                          blue;
}
a:hover{
        text-decoration:        none;
        color:                          gray;
}
a:active{
        text-decoration:        none;
        color:                          blue;
}

label{
        font-weight:            bold;
}


#sgi-topo-login{
        float: right;
        color: black;
        text-align:right;
        margin: 0 auto;
        margin-right: 2%;
        margin-top: 0px;
}

#sgi-topo-login a{
                text-decoration:none;
                color: blue;
                }

#sgi-tudo{
        width: 100%;
        text-align:left; margin: 0 auto;
        margin-top: 0px;
        display:block;
        /*background: url(../images/fundo.png) repeat-x fixed;*/
        background: #f7f7f7;
        /*height: 100%; */
        min-height: 80%;
        
}

#sgi-corpo{
        width: 100%;
}

#sgi-topo{
        /*
        background: #ddd;
        height:113px;
        */
        width: 100%;
        /*float:left;*/
}

#sgi-menu-topo{
     /*   background: #ccc;*/
        height: 20px;
        width: 100%;
        /*float:left;*/
}

#sgi-sub-menu-topo{
       /* background: #bbb;*/
        height: 31px;
        width: 100%;
       /* float:left;*/

}

#sgi-pagina{
        width: 100%;
        float:left;
}

#sgi-pagina-bottom{
        height:23px;
        width: 100%;
        float:left;
}

#sgi-coluna-esquerda{
        float: left;
        width: 15%;
        min-height: 80%;
        height: 80%;
}

#sgi-coluna-esquerda-top{
        float: left;
        width: 15%;
        height: 0px;
        color:#fff;
        font-weight:bold;
        text-align:right;
}


#sgi-coluna-esquerda-conteudo{
        float: left;
}

#sgi-conteudo{
        width: 85%;
        float: left;
}

#sgi-conteudo2{
        width: 85%;
        float: left;
}

#sgi-conteudo-titulo{
        width: 85%;
        float: left;
        height: 0px;
        color:#fff;
        font-weight:bold;
        text-align:left;
}


#sgi-texto{
        float:left;
        margin: 0px;
        padding: 0px;
        margin-left: 30px;
        height: 100%;
}

#sgi-redes{
        float:left;
        margin: 0px;
        padding: 0px;
        margin-left: 10%;
        font-family: verdana;
}
/* BASE MENU SGI */

#menu_lateral{
 		width:177px;
        text-align: right;
        padding: 0px;
}


#menu_lateral ul
{
    padding: 0px;
    margin: 0px;
}
#menu_lateral ul li {        display: inline;}
#menu_lateral ul li strong{

        color: #666;
        padding-right: 20px;
        font-size: 13px;
}

#menu_lateral ul li a{

        color:#000;
        text-decoration:none;
        display: block;
        padding-top: 4px;
        padding-right: 20px;
        padding-bottom: 2px;
        margin-top: 3px;
        margin-right: 0px;
        height: 18px;
        font-size: 11px;
}
#menu_lateral ul li a:hover, #menu_lateral ul li a:active {
        background: blue;
        color:#fff;
        font-weight: bold;
}

#menu_lateral ul li a:active {
 		background: blue;
        color:#fff;
        font-weight: bold;
 }
/* Imagens */
html, body
{
   height: 100%;
   background:#3B5998;

}
#sgi-topo {
        background: url(../images/logo.png) no-repeat left;
        margin-left: 15%;
        width: 85%;
}


#sgi-sub-menu-topo{
        background: url(../images/prata.jpg) repeat-x center;
        height: 5px;
		margin-top: 0 auto;
}
#sgi-pagina{
        background: #f7f7f7;
}

#sgi-menu-rodape{
        background: url(../images/prata.jpg) repeat-x center;
        height: 5px;
        width: 100%;
        margin: 0 auto;
        margin-top:0 auto;

}
#sgi-rodape{
        width: 100%;
        height: 0px;
        margin: 0 auto;
        margin-top:0 auto;
}

#sgi-rodape-conteudo{
        font-size:12px;
		color: silver;
		text-align:right;
		text-align:top;
		font-family: verdana;
}


#menu_lateral ul li a {
        color: #6078A8;
}
#menu_lateral ul li a:hover, #menu_lateral ul li.selecionado a {
        background: white;
        color:#3366cc;
}


/*
* FORMULARIOS
*
*/

/* Padroes Elementos */

input { border: 1px solid #ccc;         padding: 3px; }

/* Linhas do formulario */
.formulario  {  display: block;}
.form-linha, .form-linha-error  { margin-top: 3px; padding: 4px;  display: block;  }
.form-rotulo { display: block; font-weight: bold; font-size: 12px;}
.form-rotulo2 { display: inline; font-weight: bold; font-size: 12px; }
.form-campos { display: block;}
.form-campos input{background: white; border: 2px solid silver;}
.form-campos select{border: 2px solid silver;}
.form-campos textarea {}
.form-campos2 { display: inline;}
.form-campos2 input{background: white;  border: 2px solid silver;}
.form-campos2 select{border: 2px solid silver;}
.form-campos2 textarea {}
.hint {}
.hint-pointer {}

                /* Herda e somente mudas as cores */

                .form-linha-error { background: #ffdfdf; color: red;}
                .form-rotulo-erro {}
                .form-rotulo-erro label { font-weight: bold; color: black;}
                .form-campos-erro {}
                .form-campos-erro input{}
                .form-campos-erro select{}
                .form-campos-erro textarea {}

                .form-lista-erros{}
                .form-erro {}

.error_list {  color: red; }
.form-lista-erros {  }
.form-erro{ color: red; }

/* Botoes dos formularios */

.form-botoes        { width: 600px; height: 40px; padding: 2px; display: block; }
.form-botao-voltar  { width: 110px; float: left; padding: 4px;}
.form-botao-enviar  { width: 130px; float: left;}

/* Help e foco dos formularios */
.hint-pointer {
        display: none;
    position: absolute;
        z-index: 5000;
        margin-top: 2px;
        padding-top: 7px;
    background: url(../images/topmiddle.png) no-repeat 15px -5px;

}


.hint {
        display: block;
        background: #FAFAD2;
        color: black;
        padding: 10px;
        margin: 0px;
}
.div-foco {}
input:focus, input.focused { border-color: #9FB6CD; }

.radio_list li { list-style: none;}
.checkbox_list li{ list-style: none;}
.tipo_dados
{
		margin-left: 0px;
		margin-bottom: 10px;
		margin-top: 10px;
		color: black;
		font-size: 14px;
		font-weight: bold;
		float: left;
		display: block;
		width: 100%;

}
table tr.filterColumns input { width:100%;padding: 2px; }

table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp {

background-color: #3B5998;
color: white;
}
table.tablesorter thead tr .header {

	background-repeat: no-repeat;
	background-position: center right;
	cursor: pointer;
}

.tabelaSolicitacoes a{
 color: black;
 text-decoration:none;
 font-size: 12px;
 font-weight: bold;
 }
 
.tabelaDetalhes td{
 color: black;
 text-decoration:none;
 font-size: 12px;
 }

table.sortable input { width:100%;padding: 1px; border: 1px solid silver;}

.header-list { vertical-align:50px;}

.itens_catalogo span {
                       display:none;
                       }
.itens_catalogo a:hover span {
                       overflow: hidden;
                       display: block;
                       position: absolute;
                       /*top: 50em;*/
                       width: -1000px;
                       text-align: left;
                       font-size: 6px;
                       /*padding: 6px 15px 6px;*/
                       border: 1px solid #999;
                       background: #E8EBF2;
                       color: #000;
                       }

.item input
{
		padding: 0px;
		font-size: 11px;
		margin: 0px;
		border: 2px solid #9FB6CD;

}

.remover
{
  float:right;
  width: 20px;
}

.sucesso_senha { margin: 10px; border: 2px solid #ccc; background: #f5f5f5; text-align: center; padding: 10px; font-weight: bold;}


/* funed */

/* Mensagens */
.erro{  background: #F8C7C7; padding: 10px; text-align: center; margin-top: 20px; margin-bottom: 20px; }
.sucesso{ background: #DDF5A0; padding: 10px; text-align: center; margin-top: 20px; margin-bottom: 20px; }
.alerta{ background: #D1F2F7; padding: 10px; text-align: center; margin-top: 20px; margin-bottom: 20px; }


/* list */
.header-list { background: #ddd;}
.table-list { width: 100%;}
.table-tr {background: #222; font-size: 12px; padding: 3px;}
.table-th {color: white;  text-align: left;}
.table-zebra-cinza {background: #f5f5f5;}
.table-zebra-branco {background: #fff;}
.novo-objeto { text-align: right;}
.novo-objeto a{ background: #f9f9f9; padding: 5px; display: inline-table; border: 1px solid #ddd; color: black;}



