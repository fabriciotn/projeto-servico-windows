<?php
  require_once('../modelo/RelatorioDAO.php');
  require_once('../modelo/ProducaoDAO.php');


  function RelatorioVendas(){
      $dao = new RelatorioDAO();

        $funcionario = $_POST["vendedor"];
        $cliente = $_POST["cliente"];
        $codigoBarras = $_POST["codigoBarras"];

        if($codigoBarras != ""){
        	$complemento = "AND mos.codigoBarras LIKE '$codigoBarras%'";
        }

        if($_POST["dataInicio"]) $dataInicio = $_POST["dataInicio"]; else $dataInicio = date("d/m/Y");
        $dataInicio = split("/", $dataInicio);
        $dataInicio = $dataInicio[2]."-".$dataInicio[1]."-".$dataInicio[0];
        
        if($_POST["dataTermino"]) $dataTermino = $_POST["dataTermino"]; else $dataTermino = date("d/m/Y");
        $dataTermino = split("/", $dataTermino);
        $dataTermino = $dataTermino[2]."-".$dataTermino[1]."-".$dataTermino[0];

        $lista = $dao-> getRelatorioVendas($dataInicio,$dataTermino,$funcionario,$cliente,$codigoBarras,null);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $dadosCliente = $dao-> getCliente($item["idCliente"],$cliente);
             if($dadosCliente)
             {
             $html .= '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
                     <td>'.$item["idOrdemServico"].'</td>
                     <td>'.$dadosCliente["nome"].'</td>
                     <td>'.$item["descricao"].'</td>';
                     $codigoBarras = str_replace(";"," ",$item["codigoBarras"]);
                     $codigoBarras = str_replace("/"," ",$codigoBarras);
                     $codigoBarras = str_replace(","," ",$codigoBarras);
              $html .= '<td>'.$codigoBarras.'</td>
                     <td>'.$item["qde"].'</td>
                     <td>'.number_format($item["preco"],2,",",".").'</td>
                     <td>'.number_format(($item["qde"]*$item["preco"]),2,",",".").'</td>
                     <td>'.$item["nomeVendedor"].'</td>
                     <td>'.$item["data"].'</td>
                     <td>'.$item["formaPagamento"].'</td>';

                     $dadosParcela = $dao-> getParcela($item["idOrdemServico"]);
                     
             $html .= '<td>'.$dadosParcela["notafiscal"].'</td>
                       <td>'.$dadosParcela['descricao']." | ".$dadosParcela['dataVencimento'].'</td>
                     <td>'.$item["nomeLoja"].'</td>
					</tr>';

             }
             }
            }
        return $html;
  }
  
  function RelatorioVendas2(){
      $dao = new RelatorioDAO();

        $funcionario = $_POST["vendedor"];
        $cliente = $_POST["cliente"];
        $codigoBarras = $_POST["codigoBarras"];

        if($codigoBarras != ""){
        	$complemento = "AND mos.codigoBarras LIKE '$codigoBarras%'";
        }

        if($_POST["dataInicio"]) $dataInicio = $_POST["dataInicio"]; else $dataInicio = date("d/m/Y");
        $dataInicio = split("/", $dataInicio);
        $dataInicio = $dataInicio[2]."-".$dataInicio[1]."-".$dataInicio[0];

        if($_POST["dataTermino"]) $dataTermino = $_POST["dataTermino"]; else $dataTermino = date("d/m/Y");
        $dataTermino = split("/", $dataTermino);
        $dataTermino = $dataTermino[2]."-".$dataTermino[1]."-".$dataTermino[0];

        $lista = $dao-> getRelatorioVendas($dataInicio,$dataTermino,$funcionario,$cliente,$codigoBarras,$_POST["tipoVenda"]);

        $html = null;
        if($lista)
            {
             $i=0;
             $valorTotal = 0;
		     $valorTotalMaterial = 0;
		     $valorTotalServico = 0;
             $descontoTotal = 0;
             $descontoMaterial = 0;
             $descontoServico = 0;
             $totalMaterial = 0;
             $totalServico = 0;

             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $dadosCliente = $dao-> getCliente($item["idCliente"],$cliente);
             if($dadosCliente)
             {
             $html .= '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
                     <td>'.$item["idOrdemServico"].'</td>
                     <td>'.$dadosCliente["nome"].'</td>
                     <td>'.$item["descricao"].'</td>';
                     $codigoBarras = str_replace(";"," ",$item["codigoBarras"]);
                     $codigoBarras = str_replace("/"," ",$codigoBarras);
                     $codigoBarras = str_replace(","," ",$codigoBarras);
              $html .= '<td>'.$codigoBarras.'</td>
                     <td>'.$item["qde"].'</td>
                     <td>'.number_format($item["preco"],2,",",".").'</td>
                     <td>'.number_format(($item["qde"]*$item["preco"]),2,",",".").'</td>';
                     $desconto = number_format(($item["qde"]*($item["preco"]-$item["precoOriginal"])),2,",",".");
                     $descontoTotal = $descontoTotal + $desconto;
                     if($item["tipo"] == "Material")
                     {                      
                      $totalMaterial++;
                      $valorTotalMaterial = $valorTotalMaterial + ($item["qde"]*$item["preco"]);
                     }else{                            
                            $totalServico++;
                            $valorTotalServico = $valorTotalServico + ($item["qde"]*$item["preco"]);
                            }
                     

           $html .= '
                     <td>'.$item["nomeVendedor"].'</td>
                     <td>'.$item["data"].'</td>
                     <td>'.$item["formaPagamento"].'</td>';

                     $dadosParcela = $dao-> getParcela($item["idOrdemServico"]);
                         $html .= '<td>'.$dadosParcela["notafiscal"].'</td>
                            <td>'.$dadosParcela['descricao']." | ".$dadosParcela['dataVencimento'].'</td>
                            <td>'.$item["nomeLoja"].'</td>
					</tr>';

             }

            }            

            $totalTotal = $totalMaterial + $totalServico;
            $valorTotal = $valorTotalMaterial + $valorTotalServico;

            !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
            $html .= '</table><table width="100%" align="right">
                   <tr '.$bgColor.'>
                       <td align="right"><strong>TOTAL</strong></td>
                       <td align="right">Quantidade Total: </td><td><strong>'.$totalTotal.'</strong></td>
                       <td align="right"><strong>MATERIAL</strong></td>
                       <td align="right">Quantidade Total: </td><td>'.$totalMaterial.'</td>
                       <td align="right"><strong>SERVIÇO</strong></td>
                       <td align="right">Quantidade Total: </td><td>'.$totalServico.'</td>
                   </tr>
                   <tr '.$bgColor.'>
                       <td><td align="right">Valor Total:</td><td><strong>R$ '.number_format($valorTotal,2,",",".").'</strong></td></td>
                       <td></td>
                       <td align="right">Valor Total: </td><td>R$ '.number_format($valorTotalMaterial,2,",",".").'</td>
                       <td></td>
                       <td align="right">Valor Total: </td><td>R$ '.number_format($valorTotalServico,2,",",".").'</td>
                   </tr></table>';
           }
        return $html;
  }
  
  function RelatorioVendasADM(){
      $dao = new RelatorioDAO();

        $funcionario = $_POST["vendedor"];
        $cliente = $_POST["cliente"];
        $codigoBarras = $_POST["codigoBarras"];

        if($codigoBarras != ""){
        	$complemento = "AND mos.codigoBarras LIKE '$codigoBarras%'";
        }

        if($_POST["dataInicio"]) $dataInicio = $_POST["dataInicio"]; else $dataInicio = date("d/m/Y");
        $dataInicio = split("/", $dataInicio);
        $dataInicio = $dataInicio[2]."-".$dataInicio[1]."-".$dataInicio[0];

        if($_POST["dataTermino"]) $dataTermino = $_POST["dataTermino"]; else $dataTermino = date("d/m/Y");
        $dataTermino = split("/", $dataTermino);
        $dataTermino = $dataTermino[2]."-".$dataTermino[1]."-".$dataTermino[0];

        $lista = $dao-> getRelatorioVendas($dataInicio,$dataTermino,$funcionario,$cliente,$codigoBarras,$_POST["tipoVenda"]);

        $html = null;
        if($lista)
            {
             $i=0;
             $valorTotal = 0;
		     $valorTotalMaterial = 0;
		     $valorTotalServico = 0;
             $descontoTotal = 0;
             $descontoMaterial = 0;
             $descontoServico = 0;
             $totalMaterial = 0;
             $totalServico = 0;

             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $dadosCliente = $dao-> getCliente($item["idCliente"],$cliente);
             if($dadosCliente)
             {
             $html .= '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
                     <td>'.$item["idOrdemServico"].'</td>
                     <td>'.$dadosCliente["nome"].'</td>
                     <td>'.$item["descricao"].'</td>';
                     $codigoBarras = str_replace(";"," ",$item["codigoBarras"]);
                     $codigoBarras = str_replace("/"," ",$codigoBarras);
                     $codigoBarras = str_replace(","," ",$codigoBarras);
              $html .= '<td>'.$codigoBarras.'</td>
                     <td>'.$item["qde"].'</td>
                     <td>'.number_format($item["preco"],2,",",".").'</td>
                     <td>'.number_format(($item["qde"]*$item["preco"]),2,",",".").'</td>
                     <td>'.$item["tipo"].'</td>';
                     $desconto = number_format(($item["qde"]*($item["preco"]-$item["precoOriginal"])),2,",",".");
                     if($item["tipoVenda"]==1)
                         $desconto = 0;
                     $descontoTotal = $descontoTotal + $desconto;
                     if($item["tipo"] == "Material")
                     {
                      $descontoMaterial = $descontoMaterial + $desconto;
                      $totalMaterial++;
                      $valorTotalMaterial = $valorTotalMaterial + ($item["qde"]*$item["preco"]);
                     }else{
                            $descontoServico = $descontoServico + $desconto;
                            $totalServico++;
                            $valorTotalServico = $valorTotalServico + ($item["qde"]*$item["preco"]);
                            }

                      if($desconto<0)
                             $desconto = '<font color="red">'.$desconto.'</font>';
                      else if($desconto>0)
                             $desconto = '<font color="green">'.$desconto.'</font>';

           $html .= '<td>'.$desconto.'</td>
                     <td>'.$item["nomeVendedor"].'</td>
                     <td>'.$item["data"].'</td>
                     <td>'.$item["formaPagamento"].'</td>';

                     $dadosParcela = $dao-> getParcela($item["idOrdemServico"]);

             $html .= '<td>'.$dadosParcela["notafiscal"].'</td>
                       <td>'.$dadosParcela['descricao']." | ".$dadosParcela['dataVencimento'].'</td>
                     <td>'.$item["nomeLoja"].'</td>
					</tr>';

             }

            }
            
            $descontoTotal = number_format($descontoTotal,2,",",".");
            if($descontoTotal<0)
            $descontoTotal = '<font color="red">R$ '.$descontoTotal.'</font>';
            else if($descontoTotal>0)
            $descontoTotal = '<font color="green">R$ '.$descontoTotal.'</font>';


            $descontoMaterial = number_format($descontoMaterial,2,",",".");
            if($descontoMaterial<0)
            $descontoMaterial = '<font color="red">R$ '.$descontoMaterial.'</font>';
            else if($descontoMaterial>0)
            $descontoMaterial = '<font color="green">R$ '.$descontoMaterial.'</font>';


            $descontoServico = number_format($descontoServico,2,",",".");
            if($descontoServico<0)
            $descontoServico = '<font color="red">R$ '.$descontoServico.'</font>';
            else if($descontoServico>0)
            $descontoServico = '<font color="green">R$ '.$descontoServico.'</font>';

            $totalTotal = $totalMaterial + $totalServico;

            !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
            $html .= '</table><table width="100%" align="right">
                   <tr '.$bgColor.'>
                       <td align="right"><strong>TOTAL</strong></td>
                       <td align="right">Quantidade Total: </td><td><strong>'.$totalTotal.'</strong></td>
                       <td align="right"><strong>MATERIAL</strong></td>
                       <td align="right">Quantidade Total: </td><td>'.$totalMaterial.'</td>
                       <td align="right"><strong>SERVIÇO</strong></td>
                       <td align="right">Quantidade Total: </td><td>'.$totalServico.'</td>
                   </tr>
                   <tr '.$bgColor.'>
                       <td><td align="right">Valor Total:</td><td><strong>R$ '.number_format($valorTotal,2,",",".").'</strong></td></td>
                       <td></td>
                       <td align="right">Valor Total: </td><td>R$ '.number_format($valorTotalMaterial,2,",",".").'</td>
                       <td></td>
                       <td align="right">Valor Total: </td><td>R$ '.number_format($valorTotalServico,2,",",".").'</td>
                   </tr>
                   <tr '.$bgColor.'>
                       <td></td>
                       <td align="right">Desconto Total:</td><td><strong>'.$descontoTotal.'</strong></td>
                       <td></td>
                       <td align="right">Desconto: </td><td>'.$descontoMaterial.'</td>
                       <td></td>
                       <td align="right">Desconto: </td><td>'.$descontoServico.'</td>
                   </tr></table>';
           }
        return $html;
  }
  
  function RelatorioProducao(){
      $dao = new RelatorioDAO();

        $funcionario = $_POST["vendedor"];
        $cliente = $_POST["cliente"];
        $codigoBarras = $_POST["codigoBarras"];
        $item = $_POST["item"];
        $servicoExecutado = $_POST["servicoExecutado"];
        $idTipoProducao = $_POST["idTipoProducao"];

        if($_POST["dataInicio"]) $dataInicio = $_POST["dataInicio"]; else $dataInicio = date("d/m/Y");
        $dataInicio = split("/", $dataInicio);
        $dataInicio = $dataInicio[2]."-".$dataInicio[1]."-".$dataInicio[0];

        if($_POST["dataTermino"]) $dataTermino = $_POST["dataTermino"]; else $dataTermino = date("d/m/Y");
        $dataTermino = split("/", $dataTermino);
        $dataTermino = $dataTermino[2]."-".$dataTermino[1]."-".$dataTermino[0];

        $lista = $dao-> getRelatorioProducao($dataInicio,$dataTermino,$vendedor,$item,$servicoExecutado,$codigoBarras,$idTipoProducao);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $html .= '<tr '.$bgColor.'>
			  	     <td>'.$i.'</td>
                     <td>'.$item["idOrdemServico"].'</td>';
                     $codigoBarras = str_replace(";"," ",$item["codigoBarras"]);
                     $codigoBarras = str_replace("/"," ",$codigoBarras);
                     $codigoBarras = str_replace(","," ",$codigoBarras);

              $html .= '<td>'.$codigoBarras.'</td>
                     <td>'.$item["descricao"].'</td>
                     <td>'.$item["servicoExecutado"].'</td>
                     <td>'.$item["nomeFuncionario"].'</td>
                     <td>'.$item["dataProducao"].'</td>
                     <td>'.$item["nomeLoja"].'</td>
					</tr>';

             }

            }
        return $html;
  }
  
  function RelatorioEstoque(){
      $dao = new RelatorioDAO();

        $material = $_POST["material"];
        $flgConsumo = $_POST["flgConsumo"];

        $lista = $dao-> getRelatorioEstoque($material,$flgConsumo);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $html .= '<tr '.$bgColor.'>
                        <td align="center" >'.$i.'</td>
                        <td align="center" >'.$item["idMaterial"].'</td>
                        <td align="left" >'.$item["descricao"].'</td>
                        <td align="center" >'.number_format($item["precoVenda"],2,",","").'</td>
                        <td align="center" >'.number_format($item["precoRevenda"],2,",","").'</td>
                        <td align="center" >'.number_format($item["qdeComprada"],2,",","").'</td>
                        <td align="center" >'.number_format($item["qdeUtilizada"],2,",","").'</td>
                        <td align="center" >'.number_format(($item["qdeComprada"]-$item["qdeUtilizada"]),2,",","").'</td>
                        <td align="center" >'.number_format($item["qdeMinima"],2,",","").'</td>';
                 $tempoEstoque = $item["tempoEstoque"]; if($tempoEstoque == "0" || $tempoEstoque == "")$tempoEstoque = 1;
               $html .= '<td align="center" >'.number_format(($item["qdeUtilizada"]/$tempoEstoque),2,",","").'</td>
					</tr>';

             }

            }
        return $html;
  }
  
  function RelatorioEstoqueBaixo(){
      $dao = new RelatorioDAO();

        $material = $_POST["material"];
        $flgConsumo = $_POST["flgConsumo"];

        $lista = $dao-> getRelatorioEstoque($material,$flgConsumo);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";

             $saldo = $item["qdeComprada"]-$item["qdeUtilizada"];
             if($saldo < $item["qdeMinima"]){
             $i++;
             
             $html .= '<tr '.$bgColor.'>
                        <td align="center" >'.$i.'</td>
                        <td align="center" >'.$item["idMaterial"].'</td>
                        <td align="left" >'.$item["descricao"].'</td>
                        <td align="center" >'.number_format($item["precoVenda"],2,",","").'</td>
                        <td align="center" >'.number_format($item["precoRevenda"],2,",","").'</td>
                        <td align="center" >'.number_format($item["qdeComprada"],2,",","").'</td>
                        <td align="center" >'.number_format($item["qdeUtilizada"],2,",","").'</td>
                        <td align="center" >'.number_format($saldo,2,",","").'</td>
                        <td align="center" >'.number_format($item["qdeMinima"],2,",","").'</td>';
                 $tempoEstoque = $item["tempoEstoque"]; if($tempoEstoque == "0" || $tempoEstoque == "")$tempoEstoque = 1;
               $html .= '<td align="center" >'.number_format(($item["qdeUtilizada"]/$tempoEstoque),2,",","").'</td>
					</tr>';

             }

             }

            }
        return $html;
  }
  
  function RelatorioPreco(){
      $dao = new RelatorioDAO();

        $material = $_POST["material"];
        $servico = $_POST["servico"];

        $lista = $dao-> getRelatorioPreco($material,$servico);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             if($item["tipo"] == "Material")
              { 
               $saldo = $item["qdeComprada"]-$item["qdeUtilizada"];
               if(!$saldo)
                  $bgColor .= ' style="color:red;" ';
              } 
                 
             $html .= '<tr '.$bgColor.'>
                        <td align="center" >'.$i.'</td>
                        <td align="center" >'.$item["tipo"].'</td>
                        <td align="center" >'.$item["id"].'</td>
                        <td align="left" >'.$item["descricao"].'</td>
                        <td align="left" >'.$item["observacao"].'</td>
                        <td align="center" >'.@number_format($item["precoVenda"],2,",","").'</td>';
              if($item["tipo"] == "Material")
              {
              $html .= '<td align="center" >'.@number_format($item["precoRevenda"],2,",","").'</td>
                        <td align="center" >'.$saldo.'</td></tr>';
              }else
                    $html .='<td></td><td></td></tr>';

             }

            }
        return $html;
  }
  
  function RelatorioPedido(){
      $dao = new RelatorioDAO();

        $cliente = $_POST["cliente"];
        $vendedor = $_POST["vendedor"];

        $lista = $dao-> getRelatorioPedido($cliente,$vendedor);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

             $html .= '<tr '.$bgColor.'>
                        <td align="center" >'.$i.'</td>
                        <td align="center" >'.$item["nomeVendedor"].'</td>
                        <td align="center" >'.$item["nomeCliente"].'</td>
                        <td align="left" >'.$item["idOrdemServico"].'</td>
                        <td align="left" >'.$item["tipo"].'</td>
                        <td align="left" >'.$item["descricao"].'</td>
                        <td align="left" >'.$item["qde"].'</td>
                        <td align="left" >'.$item["data"].'</td>
                        <td align="left" >'.$item["nomeStatus"].'</td>
                      </tr>';

            }
           }
        return $html;
  }
  
  function RelatorioCodigoBarras(){
      $dao = new RelatorioDAO();

        $codigoBarras = $_POST["codigoBarras"];
        $html = null;
        if($codigoBarras)
        {    
        $lista = $dao-> getRelatorioCodigoBarras($codigoBarras);

        
        if($lista)
            {
             $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             $dadosCliente = $dao-> getCliente($item["idCliente"],$cliente);
             $html .= '<tr '.$bgColor.'>
                        <td align="center" >'.$i.'</td>
                        <td align="center" >'.$item["idOrdemServico"].'</td>
                        <td align="center" >'.$item["nomeVendedor"].'</td>
                        <td align="center" >'.$dadosCliente["nome"].'</td>
                        <td align="left" >'.$item["descricao"].'</td>';
                        $codigoBarras = str_replace(";"," ",$item["codigoBarras"]);
                        $codigoBarras = str_replace("/"," ",$codigoBarras);
                        $codigoBarras = str_replace(","," ",$codigoBarras);
              $html .= '<td align="left" >'.$codigoBarras.'</td>
                        <td align="left" >'.$item["qde"].'</td>
                        <td align="left" >'.number_format($item["preco"],2,",","").'</td>
                        <td align="left" >'.number_format(($item["qde"]*$item["preco"]),2,",","").'</td>
                        <td align="left" >'.$item["nomeFuncionario"].'</td>
                        <td align="left" >'.$item["data"].'</td>
                        <td align="left" >'.$item["nomeStatus"].'</td>
                      </tr>';

            }
           }
        }
        return $html;
  }
  
  function comboTipoProducao(){
      $dao = new ProducaoDAO();
      $lista = $dao-> getTiposProducao();
      $html = null;
      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $html.= '<option value="'.$item["idTipoProducao"].'">'.$item["nome"].'</option>';
             }
            }
      return $html;
  }
  
  function RelatorioEntregaMotoboy(){
      $dao = new RelatorioDAO();

        $motoboy = $_POST["motoboy"];       

        if($_POST["dataInicio"]) $dataInicio = $_POST["dataInicio"]; else $dataInicio = date("d/m/Y");
        $dataInicio = split("/", $dataInicio);
        $dataInicio = $dataInicio[2]."-".$dataInicio[1]."-".$dataInicio[0];
        
        if($_POST["dataTermino"]) $dataTermino = $_POST["dataTermino"]; else $dataTermino = date("d/m/Y");
        $dataTermino = split("/", $dataTermino);
        $dataTermino = $dataTermino[2]."-".$dataTermino[1]."-".$dataTermino[0];

        $lista = $dao-> getRelatorioEntregaMotoboy($dataInicio,$dataTermino,$motoboy);

        $html = null;
        if($lista)
            {
             $i=0;
             foreach($lista as $item){
             !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             $html .= '<tr '.$bgColor.'>			  	                            			  	     
                       <td align="center">'.$i.'</td>
                       <td align="center">'.$item["idordemServico"].'</td>
                       <td align="center">'.$item["nomeCliente"].'</td>
                       <td width="300px" align="center">'.$item["observacoes"].'</td>
                       <td align="center">'.$item["formaPagamento"].'</td>
                       <td align="center">'.$item["dataEntrega"].'</td> 
                       <td width="150px" align="center">'.$item["motoboyColeta"].'</td>
                       <td width="150px" align="center">'.$item["motoboyEntrega"].'</td>   
                       <td align="center">'.$item["nomeStatus"].'</td>                                            
                   </tr>';					

             }
             
            }
        return $html;
  }
?>
             

