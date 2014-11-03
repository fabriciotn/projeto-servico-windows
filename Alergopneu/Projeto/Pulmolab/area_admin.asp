<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->

<script type="text/javascript">

Ext.onReady(function(){



		var winTrocaSenha = new Ext.Window({
			modal:true,
			title:'Alteração de senha',
			closable:false,
			width:400,
			height:160,
			style: 'color: #000000;',
			resizable:false,
			items:[
					new Ext.form.FormPanel({
												action: 'confere_login.asp',
												method: 'POST',
												id:'formPanelTrocaSenha',
												bodyStyle:'padding:5px;busu.id = linha["id"].ToString();order:none;',
												labelWidth: 98,
												items:[{
														id:'senhaantiga',
														fieldLabel:'Senha antiga',
														inputType:'password',
														xtype:'textfield',
														allowBlank:false,
														width:170
													},{
														id:'senhanova',
														fieldLabel:'Nova senha',
														inputType:'password',
														xtype:'textfield',
														allowBlank:false,
														width:170
													},{
														id:'confirmasenha',
														fieldLabel:'Confirme a senha',
														inputType:'password',
														xtype:'textfield',
														allowBlank:false,
														width:170								
												}]	
											})										
				],
			buttons:[{
					text:'Confirmar',
					handler:function(){
						var form = Ext.getCmp('formPanelTrocaSenha').getForm();
						if(form.isValid())
						form.submit({
								waitTitle:'Processando...',
								waitMsg:'Verificando a alteração de senha...',
								url: 'alterar_senha.asp',
								failure: function(form,action){
									Ext.MessageBox.alert('Erro',action.result.msg_erro)
									},								
								success: function(form,action)
									{
											Ext.MessageBox.alert('Solicitação Concluída',action.result.msg,function(btn, text){
																window.location = "home_admin.asp"
																Ext.getCmp('senha').getValue('');//Limpa o campo senha.
																Ext.getCmp('senhaantiga').getValue('');
																Ext.getCmp('senhanova').getValue('');
																Ext.getCmp('confirmasenha').getValue('');
															});
									}
							});
						}
					},{
						text:'Fechar',
						handler:function()
						{
						winTrocaSenha.hide();
						}				
					}]
		});
								
								
		var logar = function(){var form = Ext.getCmp('frmLogin').getForm();
						if(form.isValid())
							form.submit({
//								waitTitle:'Processando...',
//							    waitMsg:'Conferindo os dados...',
							   	url: 'confere_login.asp',
							   	failure: function(form,action){
//												win.destroy();
												Ext.MessageBox.alert('Erro',action.result.msg_erro)
												Ext.getCmp('email').focus();
												Ext.getCmp('senha').getValue('');
								},									
								success: function(form,action) {
//									win.destroy();
									if (action.result.msg == "trocasenha") {
									    winTrocaSenha.show();
									}
									else
									{
//									Ext.MessageBox.alert('Acesso Liberado',action.result.msg,function(btn, text){
										
										window.location = "home_admin.asp"
//									});									
										}
								
									window.close;
													}
								});
								}


			var win = new Ext.FormPanel({
				title:'Identificação de Acesso',
				style: 'text-align: left; border: solid 1px #E5E5E5; background-image: url(img/fundo.png);',
				bodyStyle:'padding: 80px 10px 5px 5px;border-bottom:solid 1px #FFFFFF; background: url(img/logo3.png) no-repeat center 2px; font-size: 8pt;',
				labelWidth: 40,
				id: 'frmLogin',
				name: 'frmLogin',
				url:'confere_login.asp',
//				modal:true,
				width: 260,
				height: 200,
				items:[{
							id:'email',
							name:'email',
							fieldLabel:'E-mail',
							xtype:'textfield',
							allowBlank:false,
//							vtype: 'email',
							width: 196
						},{
							id:'senha',
							name:'senha',
							fieldLabel:'Senha',
							inputType:'password',
							xtype:'textfield',
							allowBlank:false,
							width: 196,
							fireKey : function(e){
								if(e.getKey() == e.ENTER && this.getValue().length > 0) {
								logar();
								
								}
							}
						}]
						,buttons:[{
							text:'Entrar',
							handler:function(){
								logar();
							}
							
				
					
					}/*,{
						text:'Requisitar Senha',
						handler:function(){
							var winSenha = new Ext.Window({
								modal:true,
								title:'Requisitar Senha',
								width:400,
								height:100,
								style: 'color: #000000;',
								resizable:false,
								items:[
								new Ext.form.FormPanel({
									method: 'POST',
									name:'formPanelLembrarSenha',
									id:'formPanelLembrarSenha',
									bodyStyle:'padding:5px;border:none;',
									items:[{
										fieldLabel:'E-mail de acesso',
										name:'email',
										xtype:'textfield',
										allowBlank:false,
										width:'90%',
										vtype: 'email'
									}]	
								})
							],
							buttons:[ {
								text:'Requisitar',
								handler:function(){
									if(Ext.getCmp('formPanelLembrarSenha').form.isValid()){
										form = Ext.getCmp('formPanelLembrarSenha').getForm();
										form.submit({
											waitTitle:'Processando...',
										    waitMsg:'Requisitando nova senha...',
										   	url: 'confere_email.asp',
										   	success: function(form,action) {
						                    Ext.MessageBox.alert('Atenção!',action.result.msg);
												winSenha.close();
											},
											failure: function(form,action){
										    if (action.result.msg != ''){
										    Ext.MessageBox.alert('Erro',action.result.msg);
										    }else{
										    Ext.MessageBox.alert('Erro','O sistema não recebeu o e-mail digitado. Tente novamente.');
										    }
										    winSenha.close();
										   }
										});
									}
								}
							}]
						});
					//	winSenha.show();
					}
				}*/]
			});
			win.render("conteudo_adm");
		});	
</script>
<style type="text/css">
<!--
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
-->
</style>

</head>

<body>


<!-- #include file="topo.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
 
 <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
	<div id="conteudo_adm" align="center" style="padding-top:100px; padding-bottom:50px;">
		
	</div>
 
 <!-- ***********************************************************************	FIM CONTEUDO ADM ********************************************************************* -->

       </div>
       
 <!-- #include file="direita_menor.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->



</body>
</html>
