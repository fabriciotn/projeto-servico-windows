<?php
require_once('conexao.php');

class ClasseDAO{
	private $con;

	public function ClasseDAO(){
		$this->con = new Conexao();
	}
	
	public function getClasses($descricao){
       $sql = "SELECT
                    idClasse,
                    descricao
        		FROM
                    Classe
        		WHERE descricao LIKE '%$descricao%'
                ORDER BY descricao";

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
	
	
	public function getClasse($idClasse){
        $sql = "SELECT
                    idClasse,
                    descricao
        		FROM
                    Classe
        		WHERE idClasse='$idClasse'";
		
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
	

    public function inserirClasse($descricao){

        $sql = "insert into Classe (descricao)
                values('$descricao')";
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
	
	public function atualizarClasse($idClasse,$descricao){
		$sql = "update Classe set descricao='$descricao'
                        where idClasse = '$idClasse'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerClasse($idClasse){
		$sql = "delete from Classe where idLoja = '$idClasse'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
