<?php

require_once('../modelo/ParametroDAO.php');
require_once('../modelo/MaterialDAO.php');

if($_GET['ajax'] == "classe")
{

$idClasse = $_GET["classe"];

$dao = new ParametroDAO();
$lista = $dao->getSubClasseAjax($idClasse);

if($lista)
foreach($lista as $item)
echo '<option value="'.$item["idSubClasse"].'">'.$item["descricao"].'</option>';
else
echo '<option value="">Escolha a Classe ...</option>';
}

if($_GET['ajax'] == "getMaterial")
{

$idMaterial = $_GET["idMaterial"];
$preco = $_GET["preco"];

$dao = new MaterialDAO();
$dados = $dao->getUltimaEntradaMaterial($idMaterial);

//echo $dados["valorUnitarioPago"];
$lucro_obtido = (($preco * 100)/$dados["valorUnitarioPago"])-100;
$lucro = $dados["lucro"];
$lucro_minimo = $dados["lucro_minimo"];

if($lucro_obtido < $lucro_minimo)
{
//vermelho
    echo "#FFC1C1";
}else if($lucro_obtido > $lucro)
{
//azul
    echo "#8FBC8F";
}else
{
//normal
    echo "white";
}
}




?>


