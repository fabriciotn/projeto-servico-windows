<?php
  require_once('../modelo/ClienteDAO.php');

  function TabelaClientes(){
      $dao = new ClienteDAO();
      $lista = $dao-> getClientes($_POST['cliente']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idCliente = $item["idCliente"];
                 $nome = $item["nome"];
                 $tipoCliente = $item["tipoCliente"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;
             
                 echo '<tr '.$bgColor.'>
                           <td>'.$idCliente.'</td>
                           <td align="center"><img onClick="Envia(\''.$PHP_SELF.'?acao=dados'.$tipoCliente.'&idCliente='.$idCliente.'\')"
                                                                            src="images/icons/user_edit.png" alt="Editar"/></td>
                           <td><a onClick="Envia(\''.$PHP_SELF.'?acao=dados'.$tipoCliente.'&idCliente='.$idCliente.'\')" href="#">'.$nome.'</a></td>
                           <td>';
                 if($tipoCliente == "PF") $exibeTipo = "Pessoa Física"; else $exibeTipo = "Pessoa Jurídica";
                      echo $exibeTipo.'</td>
                      <td align="center"><img onClick="EnviaPopUp(\''.$idCliente.'\',\''.$tipoCliente.'\')"
                                                                            src="images/icons/select.gif" alt="Selecionar"/></td>
                           
                   </tr>';

             }
            }
  }
  
  function TabelaClientesLocacao(){
      $dao = new ClienteDAO();
      $lista = $dao-> getClientesLocacao($_POST['cliente']);

      if($lista)
            {
             $i=0;
             foreach($lista as $item){
                 $idCliente = $item["idCliente"];
                 $nome = $item["nome"];
                 $tipoCliente = $item["tipoCliente"];

                 !($i % 2) ? $bgColor="bgColor='#B0C4DE'" : $bgColor="bgColor='#F7F7F7'";
                 $i++;

                 echo '<tr '.$bgColor.'>
                           <td>'.$idCliente.'</td>
                           <td> - </td>
                           <td>'.$nome.'</td>
                           <td>';
                 if($tipoCliente == "PF") $exibeTipo = "Pessoa Física"; else $exibeTipo = "Pessoa Jurídica";
                      echo $exibeTipo.'</td>
                      <td align="center"><img onClick="EnviaPopUp(\''.$idCliente.'\',\''.$tipoCliente.'\')"
                                                                            src="images/icons/select.gif" alt="Selecionar"/></td>

                   </tr>';

             }
            }
  }
  

  
  function obtemClientePF($idCliente){
      $dao = new ClienteDAO();
      return $dados = $dao-> getClientePF($idCliente);

  }
  
  function obtemClientePJ($idCliente){
      $dao = new ClienteDAO();
      return $dados = $dao-> getClientePJ($idCliente);

  }
  
  function moeda($get_valor) {
                            $source = array('.', ',');
                            $replace = array('', '.');
                            $valor = str_replace($source, $replace, $get_valor); //remove os pontos e substitui a virgula pelo ponto
                            return $valor; //retorna o valor formatado para gravar no banco
                }

  function CRUDCliente(){

               $dao = new ClienteDAO();
               if($_GET['CRUD'] == "savePF")
               {
               $nome = $_POST['nome'];
               $cpf = $_POST['cpf'];
               $endereco = $_POST['endereco'];
               $bairro = $_POST['bairro'];
               $cidade = $_POST['cidade'];
               $estado = $_POST['estado'];
               $cep = $_POST['cep'];
               $telefone = $_POST['telefone'];
               $celular = $_POST['celular'];
               $email = $_POST['email'];
               $vendedor = $_POST['vendedor'];
               $situacao = $_POST['situacao'];
               $observacoes = $_POST['observacoes'];

                if($_GET['idCliente']){
                    $dao -> atualizarCliente($_GET['idCliente'],$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$vendedor,$situacao,$observacoes);
                    $dao -> atualizarPessoaFisica($_GET['idCliente'],$nome,$cpf);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }else{
                      $_GET['idCliente'] =$dao -> inserirCliente($endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$vendedor,$situacao,$observacoes);
                      $dao -> inserirPessoaFisica($_GET['idCliente'],$nome,$cpf);
                      $_GET['acao'] = "dadosPF";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
               }
               else if($_GET['CRUD'] == "savePJ")
               {
                $nomeFantasia = $_POST["nomeFantasia"];
            	$razaoSocial = $_POST["razaoSocial"];
            	$cnpj = $_POST["cnpj"];
            	$responsavel = $_POST["responsavel"];
            	$endereco = $_POST["endereco"];
            	$bairro = $_POST["bairro"];
            	$cidade = $_POST["cidade"];
            	$estado = $_POST["estado"];
            	$cep = $_POST["cep"];
            	$telefone = $_POST["telefone"];
            	$celular = $_POST["celular"];
            	$email = $_POST["email"];
            	$situacao = $_POST["situacao"];
            	$observacoes = $_POST["observacoes"];
            	$vendedor = $_POST["vendedor"];
                $inscricaoMunicipal = $_POST["inscricaoMunicipal"];
            	$inscricaoEstadual = $_POST["inscricaoEstadual"];
                $retencaoISS = $_POST["retencaoISS"];


                //Chamada da função
                $limiteCredito = moeda($_POST['limiteCredito']);

                if($_GET['idCliente']){
                    $dao -> atualizarCliente($_GET['idCliente'],$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$vendedor,$situacao,$observacoes);
                    $dao -> atualizarPessoaJuridica($_GET['idCliente'],$nomeFantasia,$cnpj,$razaoSocial,$responsavel,$inscricaoMunicipal,$inscricaoEstadual,$retencaoISS,$limiteCredito);
                    echo '<span class="msg_crud">Atualizado com sucesso!</span>';
                }else{
                      $_GET['idCliente'] =$dao -> inserirCliente($endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$vendedor,$situacao,$observacoes);
                      $dao -> inserirPessoaJuridica($_GET['idCliente'],$nomeFantasia,$cnpj,$razaoSocial,$responsavel,$inscricaoMunicipal,$inscricaoEstadual,$retencaoISS,$limiteCredito);
                      $_GET['acao'] = "dadosPJ";
                      echo '<span class="msg_crud">Inserido com sucesso!</span>';
                     }
               }
               $_GET['CRUD']= null;

          }


  
?>
             

