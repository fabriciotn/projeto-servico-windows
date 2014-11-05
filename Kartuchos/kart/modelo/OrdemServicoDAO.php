<?php
require_once('conexao.php');

class OrdemServicoDAO{
	private $con;

	public function OrdemServicoDAO(){
		$this->con = new Conexao();
	}

	
    public function getOrdemServico($idOrdemServico){
        $sql = "SELECT * from ordemservico
        		WHERE idOrdemServico = $idOrdemServico";
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

    public function getOrdemServicoColeta($idOrdemServico){
        $sql = "SELECT
                pf.nome AS nomeCliente,
                os.idMotoboyColeta,
                m.nome AS motoboyColeta,
                os.idMotoboyEntrega,
                mb.nome AS motoboyEntrega,
                s.idStatus,
                s.nome AS nomeStatus
                FROM ordemservico os
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                INNER JOIN status s ON os.idStatus = s.idStatus
                LEFT JOIN motoboy m ON os.idMotoboyColeta = m.idMotoboy
                LEFT JOIN motoboy mb ON os.idMotoboyEntrega= mb.idMotoboy
                WHERE os.idOrdemServico = '$idOrdemServico'

                UNION

                SELECT
                pj.nomeFantasia AS nomeCliente,
                os.idMotoboyColeta,
                m.nome AS motoboyColeta,
                os.idMotoboyEntrega,
                mb.nome AS motoboyEntrega,
                s.idStatus,
                s.nome AS nomeStatus
                FROM ordemservico os
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                INNER JOIN status s ON os.idStatus = s.idStatus
                LEFT JOIN motoboy m ON os.idMotoboyColeta = m.idMotoboy
                LEFT JOIN motoboy mb ON os.idMotoboyEntrega= mb.idMotoboy
                WHERE os.idOrdemServico = '$idOrdemServico'";
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
	

    public function getServicosCliente($idCliente){
        $sql = "SELECT
                'Serviço' AS tipo,
            	sos.idServicoOrdemServico,
            	se.nome as descricao,
            	sos.preco,
            	sos.qde,
            	date_format(sos.data, '%d/%m/%Y - %H:%i:%s') AS data,
            	s.idStatus,
            	s.nome AS nomeStatus
            	FROM servicoordemservico sos
            	INNER JOIN ordemservico os ON sos.idOrdemServico = os.idOrdemServico
            	INNER JOIN servico se ON sos.idServico = se.idServico
            	INNER JOIN status s ON sos.idStatus = s.idStatus
            	INNER JOIN cliente c ON os.idCliente = c.idCliente
            	WHERE os.idCliente = '$idCliente' AND c.idSituacao NOT IN (3)
            	ORDER BY s.idStatus, sos.data desc
            	limit 0,15";
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
                o.idOrdemServico,
                i.idItemColeta,
                i.descricao,
                i.servicoExecutado,
                i.funcionarioProducao,
                i.codigoBarras,
                f.nome AS nomeFuncionario,
                date_format(i.dataProducao,'%d/%m/%Y') AS dataProducao,
                s.idStatus,
                s.nome AS nomeStatus
                FROM itemColeta i
                INNER JOIN ordemservico o ON o.idOrdemServico = i.idOrdemServico
                INNER JOIN status s ON i.idSetor = s.idStatus
                LEFT JOIN funcionario f ON i.funcionarioProducao = f.idFuncionario
                WHERE o.idOrdemServico = '$idOrdemServico'";
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
	
	public function getItensOS($idOrdemServico){
        $sql = "SELECT
                o.idOrdemServico,
                i.idItemColeta,
                i.descricao,
                i.servicoExecutado,
                i.funcionarioProducao,
                i.qdeRecargas,
                i.codigoBarras,
                f.nome AS nomeFuncionario,
                date_format(i.dataProducao,'%d/%m/%Y') AS dataProducao,
                s.nome AS nomeStatus
                FROM itemColeta i
                INNER JOIN ordemservico o ON o.idOrdemServico = i.idOrdemServico
                INNER JOIN status s ON i.idSetor = s.idStatus
                LEFT JOIN funcionario f ON i.funcionarioProducao = f.idFuncionario
                WHERE o.idOrdemServico = '$idOrdemServico'";
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
	
	public function getMateriaisOS($idOrdemServico){
        $sql = "SELECT
                m.idMaterial,
                mos.idMaterialOrdemServico,
                m.descricao,
                mos.qde,
                mos.preco,
                mos.codigoBarras,
                mos.idMaterialOrdemServico
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
	
	public function getServicosOS($idOrdemServico){
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

    public function getItemColeta($idItemColeta){
        $sql = "SELECT
                pf.nome AS nomeCliente,
                o.idOrdemServico,
                i.idItemColeta,
                date_format(i.dataCadastro,'%d/%m/%Y') AS dataCadastro,
                i.usuarioCadastro,
                date_format(i.dataAlteracao,'%d/%m/%Y') AS dataAlteracao,
                i.usuarioAlteracao,
                i.descricao,
                i.acessorios,
                i.defeitoRelatado,
                i.codigoBarras,
                i.numeroSerie,
                i.observacoes,
                i.servicoExecutado,
                i.funcionarioProducao,
                i.idSetor,
                i.qdeRecargas,
                i.idTipoProducao,
                t.nome as nomeProducao,
                f.nome AS nomeFuncionario,
                fa.nome AS nomeFuncionarioAlteracao,
                date_format(i.dataProducao,'%d/%m/%Y') AS dataProducao,
                m.idMotoboy AS idMotoboyColeta,
                m.nome AS nomeMotoboyColeta,
                me.idMotoboy AS idMotoboyEntrega,
                me.nome AS nomeMotoboyEntrega
                FROM itemColeta i
                INNER JOIN funcionario f ON i.usuarioCadastro = f.idFuncionario
                INNER JOIN ordemservico o ON o.idOrdemServico = i.idOrdemServico
                INNER JOIN pessoafisica pf ON o.idCliente = pf.idCliente
                LEFT JOIN funcionario fa ON i.usuarioAlteracao = fa.idFuncionario
                LEFT JOIN tipoProducao t ON i.idTipoProducao = t.idTipoProducao
                LEFT JOIN motoboy m ON o.idMotoboyColeta = m.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy
                WHERE i.idItemColeta = '$idItemColeta'

                UNION

                SELECT
                pj.nomeFantasia AS nomeCliente,
                o.idOrdemServico,
                i.idItemColeta,
                date_format(i.dataCadastro,'%d/%m/%Y') AS dataCadastro,
                i.usuarioCadastro,
                date_format(i.dataAlteracao,'%d/%m/%Y') AS dataAlteracao,
                i.usuarioAlteracao,
                i.descricao,
                i.acessorios,
                i.defeitoRelatado,
                i.codigoBarras,
                i.numeroSerie,
                i.observacoes,
                i.servicoExecutado,
                i.funcionarioProducao,
                i.idSetor,
                i.qdeRecargas,
                i.idTipoProducao,
                t.nome as nomeProducao,
                f.nome AS nomeFuncionario,
                fa.nome AS nomeFuncionarioAlteracao,
                date_format(i.dataProducao,'%d/%m/%Y') AS dataProducao,
                m.idMotoboy AS idMotoboyColeta,
                m.nome AS nomeMotoboyColeta,
                me.idMotoboy AS idMotoboyEntrega,
                me.nome AS nomeMotoboyEntrega
                FROM itemColeta i
                INNER JOIN funcionario f ON i.usuarioCadastro = f.idFuncionario
                INNER JOIN ordemservico o ON o.idOrdemServico = i.idOrdemServico
                INNER JOIN pessoajuridica pj ON o.idCliente = pj.idCliente
                LEFT JOIN funcionario fa ON i.usuarioAlteracao = fa.idFuncionario
                LEFT JOIN tipoProducao t ON i.idTipoProducao = t.idTipoProducao
                LEFT JOIN motoboy m ON o.idMotoboyColeta = m.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy
                WHERE i.idItemColeta = '$idItemColeta'";
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
	
	public function getColetasCliente($idCliente){
        $sql = "SELECT
            	'Coleta' AS tipo,
            	i.idItemColeta,
            	i.descricao,
            	i.codigoBarras,
            	i.defeitoRelatado,
            	i.servicoExecutado,
            	date_format(os.dataColeta, '%d/%m/%Y - %H:%i:%s') AS dataColeta,
            	s.idStatus,
            	s.nome AS nomeStatus
            	FROM itemcoleta i
            	INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
            	INNER JOIN status s ON os.idStatus = s.idStatus
            	INNER JOIN cliente c ON os.idCliente = c.idCliente
            	WHERE os.idCliente = '$idCliente' AND c.idSituacao NOT IN (3)
            	ORDER BY s.idStatus, os.dataColeta desc
            	limit 0,15";
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
	
	public function getParcelasOS($idOrdemServico){
        $sql = "SELECT
                os.idOrdemServico,
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.notaFiscal,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                sp.nome AS nomeSituacaoParcela
                FROM parcela p
                INNER JOIN ordemservico os ON os.idOrdemServico = p.idOrdemServico
                INNER JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                WHERE os.idOrdemServico = '$idOrdemServico'
                ORDER BY idParcela";
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

	public function inserirOrdemServico($idStatus, $idCliente, $idUsuarioAbertura, $idMotoboyColeta, $idMotoboyEntrega, $dataCriacao,
                                        $dataColeta, $dataOrcamento, $dataAprovacao, $dataEntrega, $observacoes, $formaPagamento,
                                        $dataVencimento, $tipoVenda){
        if($dataCriacao) $dataCriacao="NOW()"; else $dataCriacao="null";
        if($dataColeta) $dataColeta="NOW()";  else $dataColeta="null";
        if($dataOrcamento) $dataOrcamento="NOW()"; else $dataOrcamento="null";
        if($dataAprovacao) $dataAprovacao="NOW()"; else $dataAprovacao="null";
        if($dataEntrega) $dataEntrega="NOW()"; else $dataEntrega="null";
        
        $sql = "insert into ordemservico (idStatus, idCliente, idUsuarioAbertura, idMotoboyColeta, idMotoboyEntrega, dataCriacao,
                                        dataColeta, dataOrcamento, dataAprovacao, dataEntrega, observacoes, formaPagamento,
                                        dataVencimento, tipoVenda)
                values('$idStatus', '$idCliente', '$idUsuarioAbertura', '$idMotoboyColeta', '$idMotoboyEntrega', $dataCriacao,
                                        $dataColeta, $dataOrcamento, $dataAprovacao, $dataEntrega, '$observacoes', '$formaPagamento',
                                        '$dataVencimento', '$tipoVenda')";
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

    public function inserirItemColeta($idOrdemServico, $item, $usuario, $dataCadastro, $defeito){
        if($dataCadastro) $dataCadastro="NOW()";else $dataCadastro="null";
        $sql = "INSERT INTO itemcoleta (idOrdemServico, descricao, usuarioCadastro, dataCadastro, defeitoRelatado)
				VALUES ('$idOrdemServico', '$item', '$usuario', $dataCadastro, '$defeito')";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function atualizarOrdemServicoAvaliacao($idOrdemServico,$observacoes,$formaPagamento,$dataVencimento){
        $sql = "UPDATE ordemservico SET observacoes = '$observacoes', formaPagamento = '$formaPagamento' , dataVencimento = '$dataVencimento'
                WHERE idOrdemservico = '$idOrdemServico'";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function atualizarOrdemServicoFaturamento($idOrdemServico,$observacoes,$formaPagamento){
        $sql = "UPDATE ordemservico SET observacoes = '$observacoes', formaPagamento = '$formaPagamento'
                WHERE idOrdemservico = '$idOrdemServico'";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function atualizarCodigoBarras($idMaterialOrdemServico,$codigoBarras){
        $sql = "UPDATE materialordemservico SET codigoBarras = '$codigoBarras' WHERE idMaterialOrdemServico = '$idMaterialOrdemServico'";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function inserirMaterialOrdemServico($idMaterial,$idOrdemServico,$qde,$preco,$usuario,$dataRetirada,$idStatus){
        $sql = "INSERT INTO materialordemservico(idMaterial, idOrdemServico, qde, preco, usuarioCadastro, dataRetirada, idStatus)
				     VALUES ('$idMaterial', '$idOrdemServico', '$qde', '$preco', '$usuario', NOW(), '$idStatus')";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function inserirServicoOrdemServico($idServico,$idOrdemServico,$qde,$preco,$usuario,$dataRetirada,$idStatus){
                $sql = "INSERT INTO servicoordemservico(idServico, idOrdemServico, qde, preco, idFuncionario, data, idStatus)
				     VALUES ('$idServico', '$idOrdemServico', '$qde', '$preco', '$usuario', NOW(), '$idStatus')";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function inserirParcelaOrdemServico($idOrdemServico,$usuario,$idFormaPagamento,$descricao,$valorBase,
                                                      $dataPrevistaPagamento,$numBoleto,$notaFiscal,$idSituacaoParcela,
                                                      $observacoes,$idContaBancaria,$empresa){
        $sql = "INSERT INTO parcela (idOrdemServico, idUsuarioCriacao, idFormaPagamento, dataCriacao, descricao, valorBase,
                                 dataPrevistaPagamento, numBoleto, notaFiscal, idSituacaoParcela, observacoes, idContaBancaria, empresa)
			VALUES ('$idOrdemServico', '$usuario', '$idFormaPagamento', now(), '$descricao', '$valorBase', '$dataPrevistaPagamento',
                    '$numBoleto', '$notaFiscal', '$idSituacaoParcela', '$observacoes', '$idContaBancaria', '$empresa')";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function removerMaterialOrdemServico($idOrdemServico){
		$sql = "delete from materialordemservico where idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function removerServicoOrdemServico($idOrdemServico){
		$sql = "delete from servicoordemservico where idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function removerParcelaOrdemServico($idOrdemServico){
		$sql = "delete from parcela where idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
        
        public function removerParcela($idParcela){
		$sql = "delete from parcela where idParcela = '$idParcela'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function encerrarAvaliacao($idOrdemServico,$usuario){
        $sql = "UPDATE itemcoleta SET  idSetor = '4',usuarioAlteracao = '$usuario',dataAlteracao = NOW()
			    WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE materialordemservico SET  idStatus = '4' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

	    $sql = "UPDATE servicoordemservico SET  idStatus = '4' WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;

        $this->con->desconectar();
		return $result;
	}
	
	public function encerrarFaturamento($idOrdemServico,$usuario){
        $sql = "UPDATE ordemservico SET  idStatus = '5' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;
        
        $sql = "UPDATE itemcoleta SET  idSetor = '5',usuarioAlteracao = '$usuario',dataAlteracao = NOW()
			    WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE materialordemservico SET  idStatus = '5' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

	    $sql = "UPDATE servicoordemservico SET  idStatus = '5' WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;

        $this->con->desconectar();
		return $result;
	}
	
	public function atualizarExpedicao($idOrdemServico,$motoboyEntrega,$status){
        $sql = "UPDATE ordemservico SET  idMotoboyEntrega = '$motoboyEntrega',idStatus = '$status',dataEntrega = NOW()
			    WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE itemcoleta SET idSetor = '$status' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE materialordemservico SET idStatus = '$status' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE servicoordemservico SET idStatus = '$status' WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;

        $this->con->desconectar();
		return $result;
	}
	
	public function excluirPedidoFaturamento($idOrdemServico){
        $sql = "UPDATE ordemservico SET  idStatus = '7' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE itemcoleta SET  idSetor = '7' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

        $sql = "UPDATE materialordemservico SET  idStatus = '7' WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result=true : $result=false;

	    $sql = "UPDATE servicoordemservico SET  idStatus = '7' WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		
		$sql = "UPDATE parcela SET idSituacaoParcela = '3' WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;

        $this->con->desconectar();
		return $result;
	}
	
	public function enviarEntrega($idItemColeta,$usuario){
        $sql = "UPDATE itemcoleta SET  idSetor = '11',usuarioAlteracao = '$usuario',dataAlteracao = NOW()
			    WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;

        $this->con->desconectar();
		return $result;
	}
	
}
