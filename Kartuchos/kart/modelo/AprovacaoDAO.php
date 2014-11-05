<?php
require_once('conexao.php');

class AprovacaoDAO{
	private $con;

	public function AprovacaoDAO(){
		$this->con = new Conexao();
	}

	
	public function atualizarItemColetaAprovacao($idItemColeta,$servicoExecutado,$observacoes,$usuario){
        $sql = "UPDATE itemcoleta SET  servicoExecutado = '$servicoExecutado',observacoes = '$observacoes',funcionarioProducao = '$usuario'
				                       ,dataProducao = NOW()
			    WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function encerrarItemColetaAprovacao($idItemColeta,$idSetor,$usuario){
        //$sql = "UPDATE itemcoleta SET  idSetor = '$idSetor',funcionarioProducao = '$usuario',dataProducao = NOW()
	//		    WHERE idItemColeta = '$idItemColeta'";
	//	$this->con->query($sql) ? $result=true : $result=false;
        $sql = "UPDATE itemcoleta SET  idSetor = '$idSetor',funcionarioProducao = '$usuario',dataProducao = NOW()
			    WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
}
