<?php
require_once('conexao.php');

class ExpedicaoDAO{
	private $con;

	public function ExpedicaoDAO(){
		$this->con = new Conexao();
	}

    public function getOrdemServicoExpedicao($idOrdemServico){
        $sql = "SELECT
                pf.nome AS nomeCliente,
                'CPF' AS tipoDocumento,
                pf.cpf AS documento,
                concat(c.endereco,' - ',c.bairro,' - ',c.cidade) AS endereco,
                c.telefone,
                c.celular,
                c.email,
                null as retencaoISS,
                date_format(o.dataCriacao,'%d/%m/%Y') AS dataCriacao,
                f.nome AS usuarioAbertura,
                o.observacoes,
                fp.nome as formaPagamento,
                o.idMotoboyColeta,
                o.tipoVenda,
                mc.nome AS motoboyColeta,
                o.idMotoboyEntrega,
                me.nome AS motoboyEntrega,
                s.idStatus,
                s.nome AS nomeStatus
                FROM ordemservico o
                INNER JOIN cliente c ON o.idCliente = c.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                INNER JOIN status s ON o.idStatus = s.idStatus
                LEFT JOIN motoboy mc ON o.idMotoboyColeta = mc.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy
                WHERE o.idOrdemServico = '$idOrdemServico'

                UNION

                SELECT
                pj.nomeFantasia AS nomeCliente,
                'CNPJ' AS tipoDocumento,
                pj.cnpj AS documento,
                concat(c.endereco,' - ',c.bairro,' - ',c.cidade) AS endereco,
                c.telefone,
                c.celular,
                c.email,
                 pj.retencaoISS as retencaoISS,
                date_format(o.dataCriacao,'%d/%m/%Y') AS dataCriacao,
                f.nome AS usuarioAbertura,
                o.observacoes,
                fp.nome as formaPagamento,
                o.idMotoboyColeta,
                o.tipoVenda,
                mc.nome AS motoboyColeta,
                o.idMotoboyEntrega,
                me.nome AS motoboyEntrega,
                s.idStatus,
                s.nome AS nomeStatus
                FROM ordemservico o
                INNER JOIN cliente c ON o.idCliente = c.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                INNER JOIN status s ON o.idStatus = s.idStatus
                LEFT JOIN motoboy mc ON o.idMotoboyColeta = mc.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy
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

	
	public function voltaStatusFaturamento($idOrdemServico){
        $sql = "UPDATE ordemservico SET idStatus = 4 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$sql = "UPDATE itemcoleta SET idSetor = 7 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$sql = "UPDATE materialordemservico SET idStatus = 4 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$sql = "UPDATE servicoordemservico SET idStatus = 4 WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}

	
}
