function Envia(link)
{
        document.getElementById("form").action = link;
        document.getElementById("form").submit();

}

function submitEnter(evt,link)
{
    var key_code = evt.keyCode  ? evt.keyCode  :
                       evt.charCode ? evt.charCode :
                       evt.which    ? evt.which    : void 0;


    if (key_code == 13)
    {
        Envia(link);
        //Envia(link);

    }
}
function confirmacao(frase,url) {
    var resposta= confirm(frase);
	if (resposta){
        Envia(url);
	}
}
function UR_Start()
{
 UR_Nu = new Date;
	UR_Indhold = showFilled(UR_Nu.getHours()) + ":" + showFilled(UR_Nu.getMinutes()) + ":" + showFilled(UR_Nu.getSeconds());
	document.getElementById("ur").innerHTML = UR_Indhold;
	setTimeout("UR_Start()",1000);
}

function EnviaPopUp(id,tipo){
        window.close();
        window.opener.refreshPagina(id,tipo);

      }
function showFilled(Value)
{
	return (Value > 9) ? "" + Value : "0" + Value;
}

    function Oculta(img,body) {

		if(img.src.indexOf("up") > -1)
		{
			img.src="../img/arrow_down.gif";
			img.value = " + "
			document.getElementById(body).style.display = "none";
		}
		else
		{
			img.src="../img/arrow_up.gif";
			img.value = " - "
			document.getElementById(body).style.display = "table";
		}

	}

	function exibe(body) {
			var status = document.getElementById(body).style.display;
			if(status == "none")
                document.getElementById(body).style.display = "table";
            else
                document.getElementById(body).style.display = "none";
	}

	function retira(body) {
                document.getElementById(body).style.display = "none";
	}

	function Oculta_2(img) {

		if(img.src.indexOf("up") > -1)
		{
			img.src="../img/arrow_down.gif";
			document.getElementById("Anamnese").style.display = "none";
		}
		else
		{
			img.src="../img/arrow_up.gif";
			document.getElementById("Anamnese").style.display = "block";
		}

	}

//FUNÇÃO PARA ABRIR UM POPUP DE FORMA MODAL EM TODOS OS NAVEGADORES -----------------------
function openModalWindow(strURL, strArgument, intWidth, intHeight){
	var intTop = ((screen.height - intHeight) / 2);
	var intLeft = ((screen.width - intWidth) / 2);
	var strEnderec=strURL;
	var strAjustesIE='status=0; help=0; center:yes; dialogWidth:'+intWidth+'px; dialogHeight:'+intHeight+'px';
	var strAjustesNS='width='+intWidth+', height='+intHeight+', status=0, scrollbars=1, menubar=0, dependent=1, left='+intLeft+', top='+intTop;

	with (window.navigator){
		switch (appName){

			case 'Microsoft Internet Explorer':
			var x = window.showModalDialog(strEnderec, strArgument ,strAjustesIE);
			break;

			case 'Netscape':
			var x = window.open(strEnderec, 'Default', strAjustesNS);
			break;
		}
	}
}

function abrir(URL) {

	var x = parseInt((screen.width-1024)/2);
	var y = parseInt((screen.height-768)/2);

	var width = 1024;
	var height = 768;

	var left = 00;
	var top = 00;

	var win = open(URL,'janela', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=yes, fullscreen=no');

	win.moveTo(x, y);
	win.focus();

}

function abrirImprimir(URL) {

	if(URL == "") {
		alert("Favor selecionar um nome");
	}
	else {
		var x = parseInt((screen.width-800)/2);
		var y = parseInt((screen.height-600)/2);

		var width = 800;
		var height = 600;

		var left = 00;
		var top = 00;

		var win = window.open(URL,'janela', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=yes, fullscreen=no');

		win.moveTo(x, y);
		win.focus();
	}

}

function trocarFuncionarioEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaFuncionario(matricula);
	window.close();
}

function CarregaFuncionario(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosFuncionario.location = '../Forms/DadosFuncionario.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}
function trocarAcessoExternoEditar(matricula){

    //window.opener.document.getElementById("Matricula").value=matricula;

    window.opener.CarregaAcessoExterno(matricula);
	window.close();
}

function CarregaAcessoExterno(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("idAcessoExterno").value=matricula;
	DadosAcessoExterno.location = '../Forms/DadosAcessoExterno.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarLocacaoEditar(matricula){

    //window.opener.document.getElementById("Matricula").value=matricula;

    window.opener.CarregaLocacao(matricula);
	window.close();
}

function CarregaLocacao(matricula) {
    document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("idAcessoExterno").value=matricula;
	DadosLocacao.location = '../Forms/DadosLocacao.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function CarregaDadosMensaisLocacao(matricula) {
    document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("idAcessoExterno").value=matricula;
	DadosMensaisLocacao.location = '../Forms/DadosMensaisLocacao.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarDadosMensaisLocacaoEditar(matricula){

    window.opener.document.getElementById("idAcessoExterno").value=matricula;
    window.close();
    window.opener.CarregaDadosMensaisLocacao(matricula);
	window.close();
}

function CarregaDadosMensaisLocacao(matricula) {
    document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("idAcessoExterno").value=matricula;
	DadosDadosMensaisLocacao.location = '../Forms/DadosDadosMensaisLocacao.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function NovoAcessoExterno() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosAcessoExterno.location='DadosAcessoExterno.php';
}

function NovoFuncionario() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosFuncionario.location='CadastrarFuncionario.php';
	document.getElementById("Matricula").value='';
}

function NovoImpressora() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosImpressora.location='CadastrarImpressora.php';
	document.getElementById("Matricula").value='';
}


function NovoCliente() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosCliente.location='CadastrarCliente.php';
	HistoricoCliente.location='HistoricoCliente.php';
	document.getElementById("Matricula").value='';
}

function CarregaCliente(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosCliente.location = '../Forms/DadosCliente.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function CarregaClienteEditarOrdemServico(matricula,locacao) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosCliente.location = '../Forms/DadosCliente.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
	EscolhaAtendimento.location = '../Forms/EscolhaAtendimento.php?codigo=' + matricula + '&locacao='+locacao+'&Hora=' + new Date().getTime();
	HistoricoCliente.location = '../Forms/HistoricoCliente.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarClienteOrdemServicoEditar(matricula,locacao){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaClienteEditarOrdemServico(matricula,locacao);
	window.close();
}

function NovoClienteJuridica() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosCliente.location='CadastrarClienteJuridica.php';
	HistoricoCliente.location='HistoricoCliente.php';
	document.getElementById("Matricula").value='';
}

function trocarClienteEditar(matricula){
    window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaCliente(matricula);
	window.close();
}

function trocarClienteAcessoExterno(matricula,cpfCnpj,nome){
    window.opener.document.getElementById("nomeCliente").value=nome;
    window.opener.document.getElementById("cpfCnpj").value=cpfCnpj;
    window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.adicionarLinhaAcessoExterno(matricula,cpfCnpj,nome);
	//window.close();
}

function trocarImpressoraLocacao(matricula,marca,modelo){
    window.opener.document.getElementById("marca").value=marca;
    window.opener.document.getElementById("modelo").value=modelo;
    window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.adicionarLinhaImpressora(matricula,marca,modelo);
	//window.close();
}

function NovoFornecedor() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosFornecedor.location='CadastrarFornecedor.php';
	//document.getElementById("Matricula").value='';
}

function NovoChamado() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosSuporte.location='EditarChamado.php?flagChamado=1';
	//document.getElementById("Matricula").value='';
}

function ExibeChamado(status) {
	document.getElementById('carregando').style.visibility = "visible";
	DadosSuporte.location='DadosSuporte.php?status='+status;
	//document.getElementById("Matricula").value='';
}


function CarregaFornecedor(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosFornecedor.location = '../Forms/DadosFornecedor.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarFornecedorEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
    window.close();
    window.opener.CarregaFornecedor(matricula);
	window.close();
}

function NovoMaterial() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosMaterial.location='CadastrarMaterial.php';
	document.getElementById("Matricula").value='';
}

function CarregaMaterial(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosMaterial.location = '../Forms/DadosMaterial.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarMaterialEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaMaterial(matricula);
	window.close();
}

function NovoServico() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosServico.location='CadastrarServico.php';
	document.getElementById("Matricula").value='';
}

function CarregaServico(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosServico.location = '../Forms/DadosServico.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarServicoEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaServico(matricula);
	window.close();
}

function NovoMotoboy() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosMotoboy.location='CadastrarMotoboy.php';
	document.getElementById("Matricula").value='';
}

function CarregaMotoboy(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosMotoboy.location = '../Forms/DadosMotoboy.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarMotoboyEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaMotoboy(matricula);
	window.close();
}

function NovoLoja() {
	document.getElementById('carregando').style.visibility = "visible";
	DadosLoja.location='CadastrarLoja.php';
	document.getElementById("Matricula").value='';
}

function CarregaLoja(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosLoja.location = '../Forms/DadosLoja.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function CarregaImpressora(matricula) {
	document.getElementById('carregando').style.visibility = "visible";
	document.getElementById("Matricula").value=matricula;
	DadosImpressora.location = '../Forms/DadosImpressora.php?codigo=' + matricula + '&Hora=' + new Date().getTime();
}

function trocarLojaEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaLoja(matricula);
	window.close();
}

function trocarImpressoraEditar(matricula){

	window.opener.document.getElementById("Matricula").value=matricula;
	window.opener.CarregaImpressora(matricula);
	window.close();
}

function arredonda( valor , casas ){

   var novo = Math.round( valor * Math.pow( 10 , casas ) ) / Math.pow( 10 , casas );
   return( novo );

}

function calculaTotalMateriais(){

	valorTotal = parseFloat(document.FormAtendimento.qde1.value) * parseFloat(document.FormAtendimento.preco1.value) +
				parseFloat(document.FormAtendimento.qde2.value) * parseFloat(document.FormAtendimento.preco2.value) +
				parseFloat(document.FormAtendimento.qde3.value) * parseFloat(document.FormAtendimento.preco3.value) +
				parseFloat(document.FormAtendimento.qde4.value) * parseFloat(document.FormAtendimento.preco4.value) +
				parseFloat(document.FormAtendimento.qde5.value) * parseFloat(document.FormAtendimento.preco5.value) +
				parseFloat(document.FormAtendimento.qde6.value) * parseFloat(document.FormAtendimento.preco6.value) +
				parseFloat(document.FormAtendimento.qde7.value) * parseFloat(document.FormAtendimento.preco7.value) +
				parseFloat(document.FormAtendimento.qde8.value) * parseFloat(document.FormAtendimento.preco8.value) +
				parseFloat(document.FormAtendimento.qde9.value) * parseFloat(document.FormAtendimento.preco9.value) +
				parseFloat(document.FormAtendimento.qde10.value) * parseFloat(document.FormAtendimento.preco10.value);
	document.FormAtendimento.valorTotal.value = arredonda(valorTotal, 2);
}

function calculaTotalMateriaisAvaliacao(){

	valorTotal = parseFloat(document.FormAtendimento.qdeMaterial1.value) * parseFloat(document.FormAtendimento.precoMaterial1.value) +
				parseFloat(document.FormAtendimento.qdeMaterial2.value) * parseFloat(document.FormAtendimento.precoMaterial2.value) +
				parseFloat(document.FormAtendimento.qdeMaterial3.value) * parseFloat(document.FormAtendimento.precoMaterial3.value) +
				parseFloat(document.FormAtendimento.qdeMaterial4.value) * parseFloat(document.FormAtendimento.precoMaterial4.value) +
				parseFloat(document.FormAtendimento.qdeMaterial5.value) * parseFloat(document.FormAtendimento.precoMaterial5.value) +
				parseFloat(document.FormAtendimento.qdeMaterial6.value) * parseFloat(document.FormAtendimento.precoMaterial6.value) +
				parseFloat(document.FormAtendimento.qdeMaterial7.value) * parseFloat(document.FormAtendimento.precoMaterial7.value) +
				parseFloat(document.FormAtendimento.qdeMaterial8.value) * parseFloat(document.FormAtendimento.precoMaterial8.value) +
				parseFloat(document.FormAtendimento.qdeMaterial9.value) * parseFloat(document.FormAtendimento.precoMaterial9.value) +
				parseFloat(document.FormAtendimento.qdeMaterial10.value) * parseFloat(document.FormAtendimento.precoMaterial10.value);
	document.FormAtendimento.totalPreco.value = valorTotal.toFixed(2);
}

function calculaTotalServicosAvaliacao(){

	valorTotal = parseFloat(document.FormAtendimento.qdeServico1.value) * parseFloat(document.FormAtendimento.precoServico1.value) +
				parseFloat(document.FormAtendimento.qdeServico2.value) * parseFloat(document.FormAtendimento.precoServico2.value) +
				parseFloat(document.FormAtendimento.qdeServico3.value) * parseFloat(document.FormAtendimento.precoServico3.value) +
				parseFloat(document.FormAtendimento.qdeServico4.value) * parseFloat(document.FormAtendimento.precoServico4.value) +
				parseFloat(document.FormAtendimento.qdeServico5.value) * parseFloat(document.FormAtendimento.precoServico5.value) +
				parseFloat(document.FormAtendimento.qdeServico6.value) * parseFloat(document.FormAtendimento.precoServico6.value) +
				parseFloat(document.FormAtendimento.qdeServico7.value) * parseFloat(document.FormAtendimento.precoServico7.value) +
				parseFloat(document.FormAtendimento.qdeServico8.value) * parseFloat(document.FormAtendimento.precoServico8.value) +
				parseFloat(document.FormAtendimento.qdeServico9.value) * parseFloat(document.FormAtendimento.precoServico9.value) +
				parseFloat(document.FormAtendimento.qdeServico10.value) * parseFloat(document.FormAtendimento.precoServico10.value);
	document.FormAtendimento.totalPrecoServicos.value = valorTotal;
}

function calculaTotalParcelas(){

	valorTotal = parseFloat(document.FormAtendimento.valorBase1.value) +
				parseFloat(document.FormAtendimento.valorBase2.value) +
				parseFloat(document.FormAtendimento.valorBase3.value) +
				parseFloat(document.FormAtendimento.valorBase4.value) +
				parseFloat(document.FormAtendimento.valorBase5.value) +
				parseFloat(document.FormAtendimento.valorBase6.value) +
				parseFloat(document.FormAtendimento.valorBase7.value) +
				parseFloat(document.FormAtendimento.valorBase8.value) +
				parseFloat(document.FormAtendimento.valorBase9.value) +
				parseFloat(document.FormAtendimento.valorBase10.value);
	document.FormAtendimento.valorTotalParcelas.value = valorTotal;
}

function sobre(){
	alert('Sistema de Gerenciamento Kartuchos 2.0' +
		  '\n\nDesenvolvido por JuntaWeb Solu��es' +
		  '\n\nContato de Suporte:' +
		  '\n\n Eduardo Captein' +
		  '\n\tTelefone: (31) 9922-9494' +
		  '\n\tEmail: ecaptein@gmail.com' +
		  '\n\nAgosto 2013 - Belo Horizonte - MG');
}

function CarregaListaPendencias() {
	document.getElementById('carregando').style.visibility = "visible";
	codigo = document.getElementById('matricula').value;
	if(document.getElementById('coleta').checked){
		flgColeta = '1';
	}
	else{
		flgColeta = '0';
	}
	if(document.getElementById('producao').checked){
		flgProducao = '1';
	}
	else{
		flgProducao = '0';
	}
	if(document.getElementById('vendas').checked){
		flgVendas = '1';
	}
	else{
		flgVendas = '0';
	}
	if(document.getElementById('faturamento').checked){
		flgFaturamento = '1';
	}
	else{
		flgFaturamento = '0';
	}
	if(document.getElementById('expedicao').checked){
		flgExpedicao = '1';
	}
	else{
		flgExpedicao = '0';
	}
	if(document.getElementById('aprovacao').checked){
		flgAprovacao = '1';
	}
	else{
		flgAprovacao = '0';
	}
	if(document.getElementById('aprovado').checked){
		flgAprovado = '1';
	}
	else{
		flgAprovado = '0';
	}
	if(document.getElementById('reprovado').checked){
		flgReprovado = '1';
	}
	else{
		flgReprovado = '0';
	}

	ListaPendencias.location = '../Forms/ListaPendencias.php?codigo=' + codigo + '&coleta=' + flgColeta + '&producao=' + flgProducao + '&vendas=' + flgVendas + '&faturamento=' + flgFaturamento + '&expedicao=' + flgExpedicao + '&aprovacao=' + flgAprovacao + '&aprovado=' + flgAprovado + '&reprovado=' + flgReprovado + '&Hora=' + new Date().getTime();
}

function CarregaListaProducao() {
	document.getElementById('carregando').style.visibility = "visible";
	//codigoBarras = document.getElementById('codigoBarras').value;
	if(document.getElementById('impressoras').checked){
		flgImpressoras = '1';
	}
	else{
		flgImpressoras = '0';
	}
	if(document.getElementById('cartuchos').checked){
		flgCartuchos = '1';
	}
	else{
		flgCartuchos = '0';
	}
	if(document.getElementById('toners').checked){
		flgToners = '1';
	}
	else{
		flgToners = '0';
	}

	ListaProducao.location = '../Forms/ListaProducao.php?codigoBarras=' + document.getElementById('codigoBarras').value + '&impressoras=' + flgImpressoras + '&cartuchos=' + flgCartuchos + '&toners=' + flgToners + '&Hora=' + new Date().getTime();
}

function ValidaFormulario(){
	var Pendencias = "";

	if(document.FormAtendimento.CodigoPaciente.value == ""){
		Pendencias = Pendencias + "Paciente inválido.\n";
	}

	if(document.FormAtendimento.TipoAtendimento.value == ""){
		Pendencias = Pendencias + "Tipo de Atendimento inválido.\n";
	}

	if(document.FormAtendimento.AreaConcentracao.value == ""){
		Pendencias = Pendencias + "Área de Concentracao inválida.\n";
	}

	if(document.FormAtendimento.Especialidade.value == ""){
		Pendencias = Pendencias + "Especialidade inválida.\n";
	}

	if(document.FormAtendimento.Sala.value == ""){
		Pendencias = Pendencias + "Sala inválida.\n";
	}

	if(document.FormAtendimento.Data1.value == ""){
		Pendencias = Pendencias + "Data inválida.\n";
	}

	if(document.FormAtendimento.Profissional.value == ""){
		Pendencias = Pendencias + "Favor selecionar um horário.\n";
	}

	if(Pendencias == ""){
		return true;
	}
	else{
		alert("Pendências: \n\n"+Pendencias)
		return false;
	}

}

//VALIDAÇÃO DA DATA
function VerificaData(digData)
{
        var bissexto = 0;
        var data = digData;
        var tam = data.length;
        if (tam == 10)
        {
                var dia = data.substr(0,2)
                var mes = data.substr(3,2)
                var ano = data.substr(6,4)
                if ((ano > 1900)||(ano < 2100))
                {
                        switch (mes)
                        {
                                case '01':
                                case '03':
                                case '05':
                                case '07':
                                case '08':
                                case '10':
                                case '12':
                                        if  (dia <= 31)
                                        {
                                                return true;
                                        }
                                        break

                                case '04':
                                case '06':
                                case '09':
                                case '11':
                                        if  (dia <= 30)
                                        {
                                                return true;
                                        }
                                        break
                                case '02':
                                        /* Validando ano Bissexto / fevereiro / dia */
                                        if ((ano % 4 == 0) || (ano % 100 == 0) || (ano % 400 == 0))
                                        {
                                                bissexto = 1;
                                        }
                                        if ((bissexto == 1) && (dia <= 29))
                                        {
                                                return true;
                                        }
                                        if ((bissexto != 1) && (dia <= 28))
                                        {
                                                return true;
                                        }
                                        break
                        }
                }
        }
        alert("A Data "+data+" é inválida!");
        return false;
}








