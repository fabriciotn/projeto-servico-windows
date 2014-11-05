@import "estilo-internas.css";
/************* ESTRUTURA GERAL *************************************/

div.base{
    width: 100%;
    float:left;

}
div.content{
    width:95%;
    margin:0 auto;
    /*position:relative;*/
    margin-left: 5%;
}
h1, h2, h3, h4, h5 {
	font-weight:normal;
}
/************* TOPO *************************************/
div.topo{
	background:#E1E3E5 url(../images/bg-topo.png) 0 0 repeat-x;
	height:85px;
}
div.topo h1{
	/*background:url(../images/logo-gasmig.png) 0 0 no-repeat;*/
	background:url(../images/logo-kartuchos_black.png) 0 0 no-repeat;
	width:300px;
	height:80px;
	text-indent:-9000px;
	margin:5px 0 0 15px;
	float:left;

}
a.link-mapa:hover{
	text-decoration:underline;
}
p.plantao{
    width:200px;
	height:75px;
    background:url(../images/telefone.png) 0 0 no-repeat;
    position:absolute;
	right:0;
	top:20px;
    text-indent:-9000px;
    margin-right: 15px;
}
/************* MENU *************************************/
.menu-topo{
	height:31px;
	border-bottom: 1px solid black;
    background: #f7f7f7;
    display:block;
}

ul.menu
{
	width:900px;
	float:left;
	margin-left:0px;
}
ul.menu li{
	float:left;
}
ul.menu li a{
	float:left;
	display:block;
	height:31px;
    /*text-indent:-9000px;*/
}
ul.menu li#mnPrincipal a{
	background:url(../images/mn-principal.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnPrincipal a:hover{
	background:url(../images/mn-principal.png) 0 -28px no-repeat;
}

ul.menu li#mnRelatorios a{
	background:url(../images/mn-Relatorios.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnRelatorios a:hover{
	background:url(../images/mn-Relatorios.png) 0 -28px no-repeat;
}

ul.menu li#mnCadastros a{
	background:url(../images/mn-cadastros.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnCadastros a:hover{
	background:url(../images/mn-cadastros.png) 0 -28px no-repeat;
}

ul.menu li#mnSolicitacoes a{
	background:url(../images/mn-Solicitacoes.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnSolicitacoes a:hover{
	background:url(../images/mn-Solicitacoes.png) 0 -28px no-repeat;
}

ul.menu li#mnFinanceiro a{
	background:url(../images/mn-Financeiro.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnFinanceiro a:hover{
	background:url(../images/mn-Financeiro.png) 0 -28px no-repeat;
}

ul.menu li#mnLocacao a{
	background:url(../images/mn-Locacao.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnLocacao a:hover{
	background:url(../images/mn-Locacao.png) 0 -28px no-repeat;
}

ul.menu li#mnSettings a{
	background:url(../images/mn-Settings.png) 0 0 no-repeat;
	width:90px;
}
ul.menu li#mnSettings a:hover{
	background:url(../images/mn-Settings.png) 0 -28px no-repeat;
}

.menuCRUD{ display:inline;
            }

.menuCRUD a{
              color: white;
              padding: 2px;
              font-size: 15px;
              width: 300px;
            }
            
.menuCRUD li{
              display:inline;
              background: #3B5998;
              padding: 10px;
            }
            
.menuCRUD li:hover, li:hover a{
              display:inline;
              background: white;
              color: #3B5998;
            }
/************* FOOTER *************************************/

div.info-kartuchos{
	margin-left:0px;
	float:left;
    width:100%;
	display:inline;
}
div.info-kartuchos h3{
	color:#fff;
	font-size:85%;
	font-weight:bold;
}
div.info-kartuchos address{
	color:#fff;
	font-size:85%;
	font-style:normal;
}
div.info-kartuchos p{
	color:#fff;
	font-size:100%;
    margin-top:3px;
}

