<?php
require_once('conexao.php');

class BancoDAO{
	private $con;

	public function BancoDAO(){
		$this->con = new Conexao();
	}
	
	public function getBancos($nome){
       $sql = "SELECT
                    idBanco,
                    numero,
                    nome
        		FROM
                    banco
        		WHERE nome LIKE '%$nome%' AND situacao = '1'
                ORDER BY nome";

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
	
	
	public function getBanco($idBanco){
        $sql = "SELECT
                    idBanco,
                    numero,
                    nome
        		FROM
                    banco
        		WHERE idBanco='$idBanco'";
		
        $this->con->conectar();
		if($this->con->query($sql))
		{
		 if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getUniqResult();
			return $linhas;
		 }
		 else return false;
		}else $this->con->getError();
	}
	

    public function inserirBanco($nome,$numero){

        $sql = "insert into banco (nome,numero,situacao)
                values('$nome','$numero',1)";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;

        if($result)
        {
            $sql = "SELECT LAST_INSERT_ID() as id";
            $this->con->query($sql);
            if($this->con->numRows()==1)
             return $this->con->getResult(0,'id');
            else return false;
		}
		$this->con->desconectar();
		return $result;
	}
	
	public function atualizarBanco($idBanco,$nome,$numero){
		$sql = "update banco set nome='$nome',numero='$numero'
                        where idBanco = '$idBanco'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerBanco($idBanco){
		$sql = "delete from banco where idLoja = '$idBanco'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
