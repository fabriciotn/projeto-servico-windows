<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>V Jornada de Pneumologia e Alergia em Pediatria</title>
<link href="css/estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>

<script type="text/javascript">

function mostravoto () {

document.getElementById("opiniao").style.display = 'inline-block' ;
document.getElementById("vota").style.display = 'none' ;
	
}

function computado () {

document.getElementById("opiniao").style.display = 'none' ;
document.getElementById("computado").style.display = 'inline-block' ;
	
}

</script>

<div class="centraliza">

<!--#include file="topo.asp"-->
        
        
<div id="interna">
      
        <p><img src="img/titulo_inscricoes.jpg" width="103" height="26" /></p>
    <p>O participante inscrito na Jornada terá direito a pasta com material do evento, coffee-breaks, certificado e simpósio satélite.</p>
    <p>Este evento conta pontos para revalidação do título de especialista.</p>
    <p>Estudantes, residentes e enfermeiros terão que apresentar documento comprobatório no ato do credenciamento, no dia do evento.    </p>
    <p>Valores:</p>
    <p><strong>IMPORTANTE: O participante tem a opção de se inscrever/participar somente no Simpósio Satélite.</strong></p>
    <h2>V Jornada</h2>
    <table width="100%" border="0" cellpadding="10" cellspacing="1" class="tabela_inscricao">
      <tr>
        <td width="276">&nbsp;</td>
        <td width="84" class="topo"><strong>ATÉ 30/06</strong></td>
        <td width="108" class="topo"><strong>APÓS 30/06 </strong></td>
      </tr>
      <tr>
        <td width="276" class="categoria"><strong>Médicos </strong></td>
        <td width="84" class="valores"><strong>R$200,00</strong></td>
        <td width="108" class="valores"><strong>R$250,00</strong></td>
      </tr>
      <tr>
        <td width="276" class="categoria"><strong>Residentes / Estudantes / Enfermeiros / Fisioterapeutas</strong></td>
        <td width="84" class="valores"><strong>R$120,00</strong></td>
        <td width="108" class="valores"><strong>R$150,00</strong></td>
      </tr>
    </table>
    <p></p>
    <h2>Simpósio Satélite</h2>
    <table width="100%" border="0" cellpadding="10" cellspacing="1" class="tabela_inscricao">
      <tr>
        <td width="276">&nbsp;</td>
        <td width="84" class="topo"><strong>&nbsp;ATÉ 30/06</strong></td>
        <td width="108" class="topo"><strong>APÓS 30/06</strong></td>
      </tr>
      <tr>
        <td width="276" class="categoria"><strong>Médicos / Fisioterapeutas</strong></td>
        <td width="84" class="valores"><strong>R$80,00</strong></td>
        <td width="108" class="valores"><strong>R$100,00</strong></td>
      </tr>
      <tr>
        <td width="276" class="categoria"><strong>Residentes / Estudantes / Enfermeiros</strong></td>
        <td width="84" class="valores"><strong>R$60,00</strong></td>
        <td width="108" class="valores"><strong>R$80,00</strong></td>
      </tr>
    </table>
    <p><br />
    </p>
    <h3><a href="inscricoes_form.asp"><img src="img/bt_inscrevase.jpg" width="154" height="41" border="0" align="right" /></a></h3>
    <p>&nbsp;</p>
    <p>&nbsp;</p>    
    <h3><a href="inscricoes_inscrito.asp"><img src="img/bt_inscrito.jpg" width="131" height="37" border="0" align="right" /></a></h3>    
    <p>&nbsp;</p>
  </div>
      
      
      <div id="lateral">
      
        <p>&nbsp;</p>
        <div id="opiniao">
        <p><img src="img/voto_computado.jpg" height="67" /></p>
        <p>Opcional: Deixe uma observação nos dizendo o por quê de sua resposta.</p>
        <form id="form2" name="form2" method="post" action="" onsubmit="return false">
          <p>
            <label for="textarea"></label>
            <textarea name="textarea" id="textarea" cols="20" rows="5"></textarea>
          </p>
          <p align="right">
            <input type="submit" name="button2" id="envia" value="Enviar" onclick="computado()" />
          </p>
        </form>
        </div>
        
        <div id="computado">
        <p><img src="img/comentario_computado.jpg" width="187" height="67" /></p>
        </div>
        
      </div>
      
      
</div>
      
</div>



<!--#include file="rodape.asp" -->


</body>
</html>
