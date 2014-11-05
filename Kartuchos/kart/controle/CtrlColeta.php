<?php
  require_once('../modelo/ColetaDAO.php');
  require_once('../modelo/OrdemServicoDAO.php');

  function obtemColeta($idOrdemServico){
      $dao = new OrdemServicoDAO();
      return $dados = $dao-> getOrdemServicoColeta($idOrdemServico);
  }
  
  function obtemItensColeta($idOrdemServico){
      $dao = new ColetaDAO();
      $lista = $dao-> getItensColeta($idOrdemServico);
      $i = 0;
      if($lista)
            {
              foreach($lista as $item){
              $i++;
              echo ' <table>
                          <tr>
                            <td>
                               <div class="form-rotulo">Código do Item:</div>
        	                   <div class="form-campos">
                                '.$item["idItemColeta"].'
                                <input type="hidden" id="'.$i.'" name="'.$i.'" value="'.$item["idItemColeta"].'"/>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Data Cadastro:</div>
        	                   <div class="form-campos">
                                '.$item["dataCadastro"].'
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Usuário:</div>
        	                   <div class="form-campos">
                                '.$item["nomeFuncionario"].'
                               </div>
                            </td>
                          </tr>
                          <tr>
                            <td></td>
                            <td>
                               <div class="form-rotulo">Data Alteração:</div>
        	                   <div class="form-campos">
                                '.$item["dataAlteracao"].'
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Usuário:</div>
        	                   <div class="form-campos">
                                '.$item["nomeFuncionarioAlteracao"].'
                               </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                               <div class="form-rotulo">Descrição:</div>
        	                   <div class="form-campos">
                                <input style="width:350px;" maxlength="100" type="text" name="descricao'.$i.'" id="descricao'.$i.'" value="'.$item["descricao"].'" />
                               </div>
                            </td>
                            <td colspan="2">
                               <div class="form-rotulo">Acessórios:</div>
        	                   <div class="form-campos">
                                <input style="width:350px;" maxlength="100" type="text" name="acessorios'.$i.'" id="acessorios'.$i.'" value="'.$item["acessorios"].'"/>
                               </div>
                            </td>
                          </tr>
                          <tr>
                              <td colspan="10">
                              <div class="form-rotulo">Defeito Relatado:</div>
		                      <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="defeitoRelatado'.$i.'" id="defeitoRelatado'.$i.'">'.$item["defeitoRelatado"].'</textarea>
                              </div>
                              </td>
                          </tr>
                          <tr>
                            <td>
                               <div class="form-rotulo">Código de Barras:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="codigoBarras'.$i.'" id="codigoBarras'.$i.'" value="'.$item["codigoBarras"].'"/>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Número de Série:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="numeroSerie'.$i.'" id="numeroSerie'.$i.'" value="'.$item["numeroSerie"].'"/>
                               </div>
                            </td>
                            <td>
                               <div class="form-rotulo">Quantidade Recargas:</div>
        	                   <div class="form-campos">
                                  <input style="width:100px;" maxlength="100" type="text" name="qdeRecargas'.$i.'" id="qdeRecargas'.$i.'" value="'.$item["qdeRecargas"].'"/>
                               </div>
                            </td>
                          </tr>
                          <tr>
                              <td colspan="10">
                              <div class="form-rotulo">Observações:</div>
		                      <div class="form-campos">
                               <textarea style="width:700px;height:50px;" name="observacoes'.$i.'" id="observacoes'.$i.'">'.$item["observacoes"].'</textarea>
                              </div>
                              </td>
                          </tr>
                          <tr>                              
                              <td colspan="10">
                              <input onClick="confirmacao(\'Deseja realmente excluir este item?\',\''.$PHP_SELF.'?id='.$_GET['idOrdemServico'].'&idItemColeta='.$item['idItemColeta'].'&CRUD=removerItemColeta\')"
                              style="border: 1px solid black;" class="botao" type="button" value="  Excluir  "
                              />
                              </td>
                          </tr>
                          </table><br><hr>';
              }
            
            }
            
            return $i;
  }
  

  function CRUDItemColeta(){

               $dao = new ColetaDAO();


               if($_GET['CRUD'] == "saveColeta")
               {

                 $idOrdemServico = $_GET["id"];
	             $motoboyColeta = $_POST["motoboyColeta"];
	             $motoboyEntrega = $_POST["motoboyEntrega"];
	             $status = $_POST["status"];
                 
                 $dao -> atualizarColeta($idOrdemServico,$motoboyColeta,$motoboyEntrega,$status);

                 echo '<span class="msg_crud">Atualizado com sucesso!</span>';

               }else if($_GET['CRUD'] == "saveItensColeta")
               {
                for($i = 1; $i <= $_GET["qtdItens"]; $i++)
                {
                 $idItemColeta = $_POST["$i"];
                 $descricao = $_POST["descricao$i"];
                 $acessorios = $_POST["acessorios$i"];
                 $defeitoRelatado = $_POST["defeitoRelatado$i"];
                 $codigoBarras = $_POST["codigoBarras$i"];
                 $numeroSerie = $_POST["numeroSerie$i"];
                 $observacoes = $_POST["observacoes$i"];
	         $qdeRecargas = $_POST["qdeRecargas$i"];

                 $dao -> atualizarItemColeta($idItemColeta,$descricao,$acessorios,$defeitoRelatado,$codigoBarras,
                                             $numeroSerie,$observacoes,$qdeRecargas);
                }
                 echo '<span class="msg_crud">Iten(s) atualizado(s) com sucesso!</span>';

               }else if($_GET['CRUD'] == "removerItemColeta")
               {
                $dao -> removerItemColeta($_GET['idItemColeta']);
                echo '<span class="msg_crud">Item removido com sucesso!</span>';

               }else if($_GET['CRUD'] == "novoItem"){

                 $idOrdemServico = $_GET["id"];
                 $descricao = $_POST["descricao"];
                 $acessorios = $_POST["acessorios"];
                 $defeitoRelatado = $_POST["defeitoRelatado"];
                 $codigoBarras = $_POST["codigoBarras"];
                 $numeroSerie = $_POST["numeroSerie"];
                 $observacoes = $_POST["observacoes"];
	             $qdeRecargas = $_POST["qdeRecargas"];
	             $usuario = $_SESSION['cod'];

                 $dao -> inserirItemColeta($idOrdemServico,$descricao,$acessorios,$defeitoRelatado,$codigoBarras,
                                             $numeroSerie,$observacoes,$qdeRecargas,$usuario);

                 echo '<span class="msg_crud">Item inserido com sucesso!</span>';

               }


               $_GET['CRUD']= null;
  }
  
?>
             

