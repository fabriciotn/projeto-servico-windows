<?php
require_once('conexao.php');

class ParametroDAO{
	private $con;

	public function ParametroDAO(){
		$this->con = new Conexao();
	}
	
    public function getSubClasseAjax($idClasse){

        $sql = "SELECT idSubClasse,descricao FROM SubClasse WHERE idClasse='$idClasse'";
        $this->con->conectar();
        if($this->con->query($sql))
		{
		 if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		 }
		 else return false;
		}else $this->con->getError();
	}

    public function getFormaPagamento(){
        $sql = "SELECT * FROM formaPagamento WHERE situacao = '1' ORDER BY nome";
           $this->con->conectar();
		if($this->con->query($sql))
		{
		 if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		 }
		 else return false;
		}else $this->con->getError();
	}
	
	public function getContaBancaria(){
        $sql = "SELECT * FROM contabancaria WHERE idSituacao = '1' ORDER BY nome";
           $this->con->conectar();
		if($this->con->query($sql))
		{
		 if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		 }
		 else return false;
		}else $this->con->getError();
	}
	
	public function getMotoboy(){
        $sql = "SELECT * FROM motoboy ORDER BY nome";
           $this->con->conectar();
		if($this->con->query($sql))
		{
		 if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		 }
		 else return false;
		}else $this->con->getError();
	}
	
	public function getSituacaoParcela(){
        $sql = "SELECT * FROM situacaoparcela WHERE situacao = '1' ORDER BY nome";
           $this->con->conectar();
		if($this->con->query($sql))
		{
		 if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		 }
		 else return false;
		}else $this->con->getError();
	}
}
