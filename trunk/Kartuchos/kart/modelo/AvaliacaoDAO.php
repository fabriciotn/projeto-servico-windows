<?php
require_once('conexao.php');

class AvaliacaoDAO{
	private $con;

	public function AvaliacaoDAO(){
		$this->con = new Conexao();
	}

	public function getAvaliacao($idOrdemServico){
       $sql = "SELECT
                pf.nome AS nomeCliente,
                date_format(o.dataCriacao,'%d/%m/%Y') AS dataCriacao,
                f.nome AS usuarioAbertura,
                o.observacoes,
                o.formapagamento as idFormaPagamento,
                fp.nome as formaPagamento,
                date_format(o.dataVencimento,'%d/%m/%Y') AS dataVencimento
                FROM ordemservico o
                INNER JOIN pessoafisica pf ON o.idCliente = pf.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                WHERE o.idOrdemServico = '$idOrdemServico'

                UNION

                SELECT
                pj.nomeFantasia AS nomeCliente,
                date_format(o.dataCriacao,'%d/%m/%Y') AS dataCriacao,
                f.nome AS usuarioAbertura,
                o.observacoes,
                o.formapagamento as idFormaPagamento,
                fp.nome as formaPagamento,
                date_format(o.dataVencimento,'%d/%m/%Y') AS dataVencimento
                FROM ordemservico o
                INNER JOIN pessoajuridica pj ON o.idCliente = pj.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                WHERE o.idOrdemServico = '$idOrdemServico'";

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
        
        public function getMateriaisAvaliacao($idOrdemServico){
       $sql = "SELECT 
                m.idMaterial,
                m.descricao,
                mos.qde,
                mos.preco                        	
                FROM materialordemservico mos                
                INNER JOIN material m ON mos.idMaterial = m.idMaterial
                WHERE mos.idOrdemServico = '$idOrdemServico'";

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
        
        public function getServicosAvaliacao($idOrdemServico){
       $sql = "SELECT 
                s.idServico,
                s.nome,
                sos.qde,
                sos.preco
                FROM servicoordemservico sos
                INNER JOIN servico s ON sos.idServico = s.idServico
                WHERE sos.idOrdemServico = '$idOrdemServico'";

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
        
        public function voltaStatusProducao($idOrdemServico){
                $sql = "UPDATE ordemservico SET idStatus = 6 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$sql = "UPDATE itemcoleta SET idSetor = 2 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;		
		$this->con->desconectar();
		return $result;
	}
	
}
