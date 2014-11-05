<?php
require_once('conexao.php');

class EstadoDAO{
	private $con;

	public function EstadoDAO(){
		$this->con = new Conexao();
	}
	
	public function getEstados(){
        $sql = "SELECT idEstado, nome from estado order by nome";
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
