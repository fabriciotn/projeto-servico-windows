<?php
require_once('conexao.php');

class ProducaoDAO{
	private $con;

	public function ProducaoDAO(){
		$this->con = new Conexao();
	}


	public function getTiposProducao(){
        $sql = "SELECT * FROM tipoProducao";
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
	
	public function atualizarItemColetaProducao($idItemColeta,$servicoExecutado,$observacoes,$usuario,$qdeRecargas,$idTipoProducao){
        $sql = "UPDATE itemcoleta SET  servicoExecutado = '$servicoExecutado',observacoes = '$observacoes',funcionarioProducao = '$usuario'
				                       ,dataProducao = NOW(),qdeRecargas = '$qdeRecargas',idTipoProducao = '$idTipoProducao'
			    WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function encerrarItemColetaProducao($idItemColeta,$idSetor,$usuario){
        $sql = "UPDATE itemcoleta SET  idSetor = '$idSetor',funcionarioProducao = '$usuario',dataProducao = NOW()
			    WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function voltaStatusItemProducao($idItemColeta,$idSetor,$idOrdemServico){
        $sql = "UPDATE itemcoleta SET idSetor = 1 WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$sql = "UPDATE ordemservico SET idStatus = 1 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function cancelarItem($idItemColeta,$idSetor){
		$sql = "UPDATE itemcoleta SET idSetor = 7 WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}

	
}
