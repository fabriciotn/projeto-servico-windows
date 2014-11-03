
function Trim(str){return str.replace(/^\s+|\s+$/g,"");}

var buscaCep = function($cep){
	
		$.ajax({
		   type: 'GET',
		   url: 'cep_localiza.asp?cep=' +  $cep.val(),
		   dataType: 'xml',
		   success: function(xml) {
			 $('cep',xml).each(function(){
			  var endereco =  $('endereco', this).text();
			  var bairro =  $('bairro', this).text();
			  var cidade =  $('cidade', this).text();
			  var uf =  $('uf', this).text();
			  
			  	 $('#rua').val(endereco);
				 $('#bairro').val(bairro);
				 $('#cidade').val(cidade);
				 $('#uf').val(uf);
				 $('#numero').focus();
				 
			});
		   }
		  });

	}
	
	
	var buscaCPF = function($cpf){
	
		var cpf = $cpf.val();

		if(cpf=='00000000000'  || cpf=='11111111111'  || cpf=='22222222222'  || cpf=='33333333333'  || cpf=='44444444444'  || cpf=='55555555555'  || cpf=='66666666666'  || cpf=='77777777777'  || cpf=='88888888888'  || cpf=='99999999999')
		{
					alert('CPF inválido. Preencha corretamente!');
					$('#cpf').val('').focus();
		}		
		else
		{
		
			$.post('procura_cpf.asp',{ 
				 cpf: cpf
			},function(response){
				if(response=="invalido"){
					alert('CPF inválido. Preencha corretamente!');
					$('#cpf').val('').focus();
				}else if(response!="nao_cadastrado" && response!="socio_n_quite"){
					alert('Sua inscrição já foi realizada anteriormente.\nPara visualizar as informações, clique no botão abaixo.');
					window.location = "confirmaEmail.asp?cod="+response;
				}
			});
	
		}
		
		return false;
	
	}
