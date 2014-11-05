<?php
  require_once('../modelo/ImpressoraDAO.php');

  function TabelaImpressoras(){
      $dao = new ImpressoraDAO();
      $lista = $dao-> getImpressoras($_POST['Impressora'],"",null);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idImpressora = $item["idImpressora"];
                 $marca = $item["marca"];
                 $modelo = $item["modelo"];
                 $patrimonio = $item["patrimonio"];
                 $numSerie = $item["numSerie"];
                 $tipo = $item["tipo"];
                 $tipo_impressao = $item["tipo_impressao"];
                 $situacao = $item["situacao"];
                 $setor = $item["setor"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idImpressora.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados&idImpressora='.$idImpressora.'\')"
                               src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idImpressora='.$idImpressora.'\')" href="#">'.$marca.'</a></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados&idImpressora='.$idImpressora.'\')" href="#">'.$modelo.'</a></td>
                           <td>'.$patrimonio.'</td>
                           <td>'.$numSerie.'</td>
                           <td>'.$tipo.'</td>
                           <td>'.$tipo_impressao.'</td>
                           <td>'.$situacao.'</td>';
                   if($situacao == "Alugada") echo '<td>'.$setor.'</td>'; else echo '<td>NA</td>';
                   echo '</tr>';


             }
            }
  }
  
  function ComboImpressorasSubstituicao(){
      
      $dao = new ImpressoraDAO();
      $lista = $dao-> getImpressoras("","",1);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idImpressora = $item["idImpressora"];
                 $marca = $item["marca"];
                 $modelo = $item["modelo"];
                 $patrimonio = $item["patrimonio"];
                 echo '<option value="'.$idImpressora.'">'.$marca.' / '.$modelo.' ( '.$patrimonio.' )</option>';
             }
             return true;
            }else{return false;}
                    
  }
  
  function TabelaSelecionarImpressoras(){
      $dao = new ImpressoraDAO();
      $lista = $dao-> getImpressoras($_POST['Impressora'],$_POST['seachPatrimonio'],1);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idImpressora = $item["idImpressora"];
                 $marca = $item["marca"];
                 $modelo = $item["modelo"];
                 $patrimonio = $item["patrimonio"];
                 $numSerie = $item["numSerie"];
                 $tipo = $item["tipo"];
                 $tipo_impressao = $item["tipo_impressao"];
                 $situacao = $item["situacao"];
                 $setor = $item["setor"];
                 $observacoes = $item["observacoes"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td><input type="checkbox" name="idImpressora[]" id="idImpressora[]" value="'.$item["idImpressora"].'"></td>
                           <td>'.$idImpressora.'</td>
                           <td>'.$marca.'</td>
                           <td>'.$modelo.'</td>
                           <td>'.$patrimonio.'</td>
                           <td>'.$numSerie.'</td>
                           <td>'.$tipo.'</td>
                           <td>'.$tipo_impressao.'</td>
                           <td>'.$observacoes.'</td>
                   </tr>';


             }
            }
  }

  function obtemImpressora($idImpressora){
      $dao = new ImpressoraDAO();
      return $dados = $dao-> getImpressora($idImpressora);
  }
  
  function obtemClienteImpressora($idImpressora){
      $dao = new ImpressoraDAO();
      
      return $dados = $dao-> getClienteImpressora($idImpressora);
  }

  function CRUDImpressora(){

               $dao = new ImpressoraDAO();

               $marca = $_POST["marca"];
               $modelo = $_POST["modelo"];
               $patrimonio = $_POST["patrimonio"];
               $numSerie = $_POST["numSerie"];
               $num_copias_inicial = $_POST["num_copias_inicial"];
               $num_digit_Inicial = $_POST["num_digit_Inicial"];
               $tipo = $_POST["tipo"];
               $tipo_impressao = $_POST["tipo_impressao"];
               $situacao = $_POST["situacao"];
               $setor = $_POST["setor"];
               $observacoes = $_POST["observacoes"];


               if($_GET['CRUD'] == "save")
               {
                if($_GET['idImpressora']){
                    $dao -> atualizarImpressora($_GET['idImpressora'],$marca,$modelo,$patrimonio,$numSerie,$num_copias_inicial,
                                                $num_digit_Inicial,$tipo,$tipo_impressao,$situacao,$setor,$observacoes);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }
                else{
                      $_GET['idImpressora'] = $dao -> inserirImpressora($marca,$modelo,$patrimonio,$numSerie,$num_copias_inicial,
                                                                        $num_digit_Inicial,$tipo,$tipo_impressao,$situacao,$setor,$observacoes);
                                                                        
                      $_GET['acao'] = "dados";
                      if($_GET['idImpressora'])
                         echo '<span class="msg_crud">Inserido com sucesso!</span>';
                      else
                         echo '<span class="msg_crud_erro">Erro ao inserir impressora!</span>';
                     }
              }else if($_GET['CRUD'] == "vincular") {
                     if(isset($_POST["idImpressora"]))
                     {
                       for($i = 0; $i < count($_POST["idImpressora"]); $i++) {
                       $idImpressora = $_POST["idImpressora"][$i];
                        //insere impressora na locacao
                       $dao -> inserirImpressoraLocacao($idImpressora,$_GET['idCliente']);
                        //atualiza status da impressora
                       $dao -> atualizarStatus($idImpressora,"Alugada");
                       }
                     ?><script>alert("Impressoras vinculadas com sucesso!");</script><?php
                     echo '<span class="msg_crud">Impressoras vinculadas com sucesso!</span>';
                     ?><script>window.close();window.opener.refreshImpressora();</script><?php
                     }else{
                           echo '<span class="msg_crud_erro">Favor Selecionar pelo menos uma impressora!</span>';
                           $_GET['acao'] = "lista";
                          }

              }else if($_GET['CRUD'] == "delete") {
                     deleteImpressora($_GET['idImpressora']);
                     echo '<span class="msg_crud">Removido com sucesso!</span>';
                    }

               $_GET['CRUD']= null;

          }

     function comboImpressora(){
      $dao = new ImpressoraDAO();
      $lista = $dao-> getImpressoras("","",0);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idImpressora = $item["idImpressora"];
                 $descricaoImpressora = $item["marca"]." / ".$item["modelo"]." / ".$item["numSerie"];
                 echo '<option value="'.$idImpressora.'">'.$descricaoImpressora.'</option>';
             }
            }
  }


  
?>
             

