<?php
require_once('conexao.php');

class SubClasseDAO{
	private $con;

	public function SubClasseDAO(){
		$this->con = new Conexao();
	}
	
	public function getSubClasses($descricao){
       $sql = "SELECT
                    sb.idSubClasse,
                    sb.descricao,
                    sb.idClasse,
                    c.descricao as descricaoClasse
        		FROM
                    SubClasse sb
                    LEFT JOIN classe c ON sb.idClasse = c.idClasse
        		WHERE sb.descricao LIKE '%$descricao%'
                ORDER BY c.descricao,sb.descricao";

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
	
	
	public function getSubClasse($idSubClasse){
        $sql = "SELECT
                    sb.idSubClasse,
                    sb.descricao,
                    sb.idClasse,
                    c.descricao as descricaoClasse
        		FROM
                    SubClasse sb
                    LEFT JOIN classe c ON sb.idClasse = c.idClasse
        		WHERE sb.idSubClasse='$idSubClasse'";
		
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
	

    public function inserirSubClasse($idClasse,$descricao){

        $sql = "insert into SubClasse (idClasse,descricao)
                values('$idClasse','$descricao')";
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
	
	public function atualizarSubClasse($idSubClasse,$idClasse,$descricao){
		$sql = "update SubClasse set idClasse='$idClasse', descricao='$descricao'
                        where idSubClasse = '$idSubClasse'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerSubClasse($idSubClasse){
		$sql = "delete from SubClasse where idLoja = '$idSubClasse'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
