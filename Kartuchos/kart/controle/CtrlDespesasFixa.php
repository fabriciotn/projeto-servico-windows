<?php
  require_once('../modelo/ParcelaDAO.php');

  function TabelaDespesasFixa(){
      $dao = new ParcelaDAO();

      $lista = $dao-> getDespesasFixas();

      if($lista)
      {
            $i=0;
             foreach($lista as $item){

             !($i % 2) ? $bgColor="bgColor='#ff8989'" : $bgColor="bgColor='#ff7676'";
                 $i++;
              $id = $item["idParcela"];
              $valorTotal += $item['valor'];
              echo "<input type='hidden' name='idParcela$i' id='idParcela$i' value='$id' />";
              echo '
                    <tr class="linhaParcelaPagar" style="border-bottom: 1px solid silver" '.$bgColor.'>  
                     <td  width="10px" align="center"><div class="form-campos2">'.$i.'</div></td>
                     <td  align="center"><div class="form-campos2">'.$item["idParcelaInicial"].'</div></td>    
                     <td   align="center"><div class="form-campos2">'.$item["descricao"].'</div></td>
                     <td align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="valor'.$i.'" id="valor'.$i.'" value="'.$item["valor"].'"/>
                        </div>
                     </td>
                     <td  align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="diaVencimento'.$i.'" id="diaVencimento'.$i.'" value="'.$item["diaVencimento"].'"/>
                        </div>
                     </td>
                     <td  align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="mesVencimento'.$i.'" id="mesVencimento'.$i.'" value="'.$item["mesVencimento"].'"/>
                        </div>
                     </td>
                     <td  align="center">
                        <div class="form-campos">
                        <input style="width:100px;" maxlength="100" type="text" name="anoInicio'.$i.'" id="anoInicio'.$i.'" value="'.$item["anoInicio"].'"/>
                        </div>
                     </td>                     
                     <td  align="center">
                        <div class="form-campos">
                        <select name="idContaBancaria'.$id.'" id="idContaBancaria'.$id.'">
                        <option value="'.$item["idContaBancaria"].'" selected="selected">'.$item["nomeContaBancaria"].'</option>';
                            comboContaBancaria();
                     echo ' </select>
                        </div>
                     </td> 
                     <td  align="center">
                        <div class="form-campos">
                        <select name="empresa'.$i.'" id="empresa'.$i.'">
                        <option value="'.$item["empresa"].'" selected="selected">'.$item["nomeEmpresa"].'</option>';
                            comboEmpresa();
                        echo ' </select>
                        </div>
                     </td> 
                     <td  align="center">
                        <div class="form-campos">
                               <select name="classe" id="classe">
                               <option value="'.$item["idClasse"].'" selected="selected">'.$item["classe"].'</option>';
                        comboClasse();
                        echo '</select>
                               </div>
                     </td> 
                     <td  align="center">
                         <div class="form-campos">
                               <select name="subClasse" id="subClasse">
                                     <option value="'.$item["idSubClasse"].'">'.$item["subClasse"].'</option>';
                        comboSubClasse();
                        echo '
                               </select>
                               </div>
                     </td> 
                     <td align="center">
                     <img onClick="confirmacao(\'Deseja realmente excluir a Despesa Fixa?\',\''.$PHP_SELF.'?idDespesaFixa='.$item["idDespesaFixa"].'&CRUD=deleteDespesaFixa\')" src="images/icons/excluir.png" alt="Editar"/>
                     </td>
                    </tr>';
             }
             echo '<input type="hidden" name="qtdParcelas" id="qtdParcelas" value="'.$i.'" />';
             return $valorTotal;
            }


     }

  function CRUDDespesaFixa(){

               $dao = new ParcelaDAO();
               if($_GET['CRUD'] == "deleteDespesaFixa")
               {
                     $dao -> removerDespesaFixa($_GET['idDespesaFixa']);
                     $_GET['idDespesaFixa'] = null;
                     echo '<span class="msg_crud">Despesa Fixa removida com sucesso!</span>';
               }
               $_GET['CRUD']= null;

          }


  

 ?>


