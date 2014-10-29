$.mask = {
	//Predefined character definitions
	definitions: {
		'9': "[0-9]",
		'a': "[A-Za-z]",
		'*': "[A-Za-z0-9]"
	},
	dataName: "rawMaskFn",
	placeholder: '_'
};

function pesquisarMasp(){
    alert("Pesquisar MASP");
}

function somenteNumeros(campo){
 var digits="0123456789";
 var campo_temp;
     for (var i=0;i<campo.value.length;i++){
         campo_temp=campo.value.substring(i,i+1);
         if (digits.indexOf(campo_temp)==-1){
             campo.value = campo.value.substring(0,i);
         }
     }
 }
 
 function somenteData(campo){
 var digits="0123456789/";
 var campo_temp;
     for (var i=0;i<campo.value.length;i++){
         campo_temp=campo.value.substring(i,i+1);
         if (digits.indexOf(campo_temp)==-1){
             campo.value = campo.value.substring(0,i);
         }
     }
 }
 
 function somenteValor(campo){
 var digits="0123456789.";
 var campo_temp;
     for (var i=0;i<campo.value.length;i++){
         campo_temp=campo.value.substring(i,i+1);
         if (digits.indexOf(campo_temp)==-1){
             campo.value = campo.value.substring(0,i);
         }
     }
 }

function data(src)
          {
           var mask = "##/##/####";
           var i = src.value.length;
           var saida = mask.substring(0,1);
           var texto = mask.substring(i);

           if (texto.substring(0,1) != saida)
           {
            src.value += texto.substring(0,1);
           }
}

function formatar(src, mask){
    var i = src.value.length;
    var saida = mask.substring(0,1);
    var texto = mask.substring(i)
    if (texto.substring(0,1) != saida)
    {
        src.value += texto.substring(0,1);
    //return true;
    }
}
function imprime() {
    window.print();
}

//Validação tela de Cadastrar Processo
//      Preenchimento de TODOS campos
//      Numero de Caracteres DATA
//      Check Box Processo Principal
//              Sim > PROCESSO deve ser igual PROCESSO PRINCIPAL
//              Nao > PROCESSO deve ser diferente PROCESSO PRINCIPAL
function validaProcesso(){
    if(document.form.codProcesso.value==""){
        window.alert("Campo Nº PROCESSO obrigatório!");
        document.form.codProcesso.focus();
        return false;
    }
    if(document.form.processoPrincipal.value==""){
        window.alert("Campo PROCESSO PRINCIPAL obrigatório!");
        document.form.processoPrincipal.focus();
        return false;
        }/* Retirada condição  que verificar se o Processo Principal é identico ao Numero de Processo
     
        else if(document.form.codProcesso.value == document.form.processoPrincipal.value &&
                 document.form.principalNao.checked == true){
              window.alert("O processo não sendo o principal não pode conter a mesma numeração");
              document.form.processoPrincipal.focus();
              return false;
              }else if(document.form.codProcesso.value != document.form.processoPrincipal.value &&
                       document.form.principalSim.checked == true){
                    window.alert("O processo sendo o principal deve conter a mesma numeração");
                    document.form.processoPrincipal.focus();
                    return false;
                    }*/
    if(document.form.data.value==""){
        window.alert("Campo DATA obrigatório!");
        document.form.data.focus();
        return false;
        }else if(document.form.data.value.length < 10){
              window.alert("Digite a data no formato dd/mm/aaaa");
              document.form.data.focus();
              return false;
        }
    if(document.form.vara.value==""){
        window.alert("Campo VARA obrigatório!");
        document.form.vara.focus();
        return false;
    }
    if(document.form.tipoAcao.value==""){
        window.alert("Campo TIPO DE AÇAO obrigatório!");
        document.form.tipoAcao.focus();
        return false;
    }
    if(document.form.valor.value==""){
        window.alert("Campo VALOR obrigatório!");
        document.form.valor.focus();
        return false;
    }else if(document.form.valor.value.indexOf(".") < (document.form.valor.value.length - 3)){
        window.alert("O ponto deve separar apenas os centavos!");
        document.form.valor.focus();
        return false;        
    }    
    if(document.form.advogado.value==""){
        window.alert("Campo ADVOGADO obrigatório!");
        document.form.advogado.focus();
        return false;
    }
    if(document.form.autor.value==""){
        window.alert("Campo AUTOR obrigatório!");
        document.form.autor.focus();
        return false;
    }
    return true;
}

//Valida tela de Pesquisar Processos > Formação das datas, caso sejam informadas
function validaPesquisaProcesso(){
    if(document.form.dataInicio.value != "" && document.form.dataInicio.value.length < 10){
        window.alert("Digite os campos de data no formato dd/mm/aaaa");
        document.form.dataInicio.focus();
        return false;
    }
    if(document.form.dataFim.value != "" && document.form.dataFim.value.length < 10){
        window.alert("Digite os campos de data no formato dd/mm/aaaa");
        document.form.dataFim.focus();
        return false;
    }
    return true;
}

//Valida tela de Cadastrar Usuarios > Todos campos obrigatorios
function validaCadastroUsuario(){
    if(document.form.maspUsuario.value == ""){
        window.alert("Campo MASP obrigatório!");
        document.form.maspUsuario.focus();
        return false;
    }
    if(document.form.nomeUsuario.value == ""){
        window.alert("Campo NOME COMPLETO obrigatório!");
        document.form.nomeUsuario.focus();
        return false;
    }
    if(document.form.statusUsuario.value == ""){
        window.alert("Campo Status obrigatório!");
        document.form.nomeUsuario.focus();
        return false;
    }
    if(document.form.permissaoUsuario.value == ""){
        window.alert("Campo PERMISSAO obrigatório!");
        document.form.permissaoUsuario.focus();
        return false;
    }
    return true;
} 

//Valida tela de Inserir Movimentação > Todos campos obrigatorios
function validaMovimentacao(){
    if(document.form.codProcesso.value == ""){
        window.alert("Campo Nº PROCESSO obrigatório!");
        document.form.codProcesso.focus();
        return false;
    }
    if(document.form.data.value == ""){
        window.alert("Campo DATA obrigatório!");
        document.form.data.focus();
        return false;
    }
    if(document.form.descricaoMovimentacao.value == ""){
        window.alert("Campo DESCRIÇÃO MOVIMENTACAO obrigatório!");
        document.form.descricaoMovimentacao.focus();
        return false;
    }
    return true;
} 

function upperUni() {
    var field = document.form.unidade;
    var upperCaseVersion = field.value.toUpperCase();
    field.value = upperCaseVersion;
}

function upperTipo() {
    var field = document.form.tipo;
    var upperCaseVersion = field.value.toUpperCase();
    field.value = upperCaseVersion;
}

function link(url) {
    window.location.href = url;
}

function mascaraNumProc(str){
    var string = str.substring(0,7) + "." + str.substring(7,9) + "." + str.substring(9,13) + "." + str.substring(13,14) + "." + str.substring(14,16) + "." + str.substring(16,20);
    return string;
    }
    
function LimiteTextArea()
{
    var objeto = form.descricaoMovimentacao.value

    if(objeto.length > 255){
        alert("O objeto DESCRICAO aceita somente 255 caracteres");
    return(false)
 }

}

function LimiteTextArea2()
{
    var objeto = form.observacao.value

    if(objeto.length > 255){
        alert("O objeto DESCRICAO aceita somente 255 caracteres");
    return(false)
 }

}

function naoPermiteAcento(obj)
{
    var str = new String(obj.value);
    var acentos =   new String('ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõöøùúûıışÿRr');
    var SemAcento = new String('aaaaaaaceeeeiiiidnoooooouuuuybsaaaaaaaceeeeiiiidnoooooouuuyybyRr');

    var c = new String();
    var i = new Number();
    var x = new Number();
    var res = '';

    for (i = 0; i<str.length; i++){
        c = str.substring(i,i+1);
        for (x=0; x< acentos.length; x++){
            if (acentos.substring(x,x+1) == c){
                c = SemAcento.substring(x,x+1);
            }
        }
        res += c;
    }
    obj.value = res.toUpperCase();
}


function maiuscula(id) {
    /*
     * Função transforma as primeiras letras de cada palavra digitada em Maiúscula
     */
    var palavras = document.getElementById(id).value; //pega o valor do input
    // var palavras =  $(id).getValue();
    palavras = palavras.split(""); //separa o mesmo em palavras
    var tmp = "";

    //altera o vetor de palavras
    for (i = 0; i < palavras.length; i++) {
        //percore as palavras
        if (palavras[i - 1]) {
            if (palavras[i - 1] == " ") {
                palavras[i] = palavras[i].replace(palavras[i], palavras[i].toUpperCase());
            }
            else {
                palavras[i] = palavras[i].replace(palavras[i], palavras[i].toLowerCase());
            }
        }
        else {
            palavras[i] = palavras[i].replace(palavras[i], palavras[i].toUpperCase());
        }
        tmp += palavras[i];
    }
    tmp = tmp.replace(' Da ', ' da ');
    tmp = tmp.replace(' De ', ' de ');
    tmp = tmp.replace(' Di ', ' di ');
    tmp = tmp.replace(' Do ', ' do ');

    tmp = tmp.replace(' Das ', ' das ');
    tmp = tmp.replace(' Des ', ' des ');
    tmp = tmp.replace(' Dis ', ' dis ');
    tmp = tmp.replace(' Dos ', ' dos ');

    tmp = tmp.replace(' A ', ' a ');
    tmp = tmp.replace(' E ', ' e ');
    tmp = tmp.replace(' I ', ' i ');
    tmp = tmp.replace(' O ', ' o ');
    tmp = tmp.replace(' U ', ' u ');

    document.getElementById(id).value = tmp;
    //$(id).setValue(tmp);
}