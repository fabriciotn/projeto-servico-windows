<?php
require_once('conexao.php');

class RelatorioDAO{
	private $con;

	public function RelatorioDAO(){
		$this->con = new Conexao();
	}
	
    public function getCliente($idCliente,$cliente){
        $sql = "SELECT nome FROM pessoafisica
                WHERE idCliente = '".$idCliente."' AND nome LIKE '$cliente%'

                UNION

                SELECT nomeFantasia AS nome FROM pessoajuridica
                WHERE idCliente = '".$idCliente."' AND nomeFantasia LIKE '$cliente%'";
		$this->con->conectar();
		$this->con->query($sql);
        if($this->con->numRows()==1){
            return $this->con->getUniqResult();
		}
		else return false;
	}
	
	public function getParcela($idOrdemServico){
        $sql = "SELECT descricao, notafiscal, date_format(dataPrevistaPagamento, '%d/%m/%Y') AS dataVencimento FROM parcela
                WHERE idOrdemServico = '".$idOrdemServico."' LIMIT 1  ";
		$this->con->conectar();
		$this->con->query($sql);
        if($this->con->numRows()==1){
            return $this->con->getUniqResult();
		}
		else return false;
	}

    public function getRelatorioVendas($dataInicio,$dataTermino,$vendedor,$cliente,$codigoBarras,$tipoVenda){
        if($tipoVenda)
           $complemento2 =" AND os.tipoVenda='".$tipoVenda."' ";
        //else
        //   $complemento2 =" AND os.tipoVenda='0' ";

        $sql = "
		SELECT
		c.idCliente,
		os.idOrdemServico,
		'Material' AS tipo,
		mos.idMaterialOrdemServico,
		m.descricao,
		m.precoVenda as precoOriginal,
		mos.qde,
		mos.preco,
		mos.codigoBarras,
		date_format(os.dataEntrega, '%d/%m/%Y') AS data,
		s.idStatus,
		s.nome AS nomeStatus,
        f.nome AS nomeFuncionario,
		fu.nome AS nomeVendedor,
        fp.nome as formaPagamento,
		l.nome as nomeLoja,
                os.tipoVenda
		FROM materialordemservico mos
		INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
		INNER JOIN formapagamento fp ON os.formapagamento = fp.idFormaPagamento
		INNER JOIN material m ON mos.idMaterial = m.idMaterial
		INNER JOIN status s ON mos.idStatus = s.idStatus
		INNER JOIN cliente c ON os.idCliente = c.idCliente
        INNER JOIN funcionario f ON mos.usuarioCadastro = f.idFuncionario
		INNER JOIN funcionario fu ON c.idVendedor = fu.idFuncionario
		INNER JOIN loja l ON fu.idLoja = l.idLoja
		WHERE s.idStatus IN (6)
		AND DATEDIFF(os.dataEntrega,'$dataInicio') >= 0
		AND DATEDIFF(os.dataEntrega,'$dataTermino') <= 0
		AND fu.nome LIKE '%$vendedor%'
		$complemento
        $complemento2
        ";

	if($codigoBarras == ""){
		$sql = $sql."
		UNION

		SELECT
		c.idCliente,
		os.idOrdemServico,
		'Serviço' AS tipo,
		sos.idServicoOrdemServico,
		se.nome,
		sos.qde,
		sos.preco,
		se.preco as precoOriginal,
		'' AS codigoBarras,
		date_format(os.dataEntrega, '%d/%m/%Y') AS data,
		s.idStatus,
		s.nome AS nomeStatus,
                f.nome AS nomeFuncionario,
		fu.nome AS nomeVendedor,
        fp.nome as formaPagamento,
        l.nome as nomeLoja,
        os.tipoVenda
		FROM servicoordemservico sos
		INNER JOIN ordemservico os ON sos.idOrdemServico = os.idOrdemServico
		INNER JOIN formapagamento fp ON os.formapagamento = fp.idFormaPagamento
		INNER JOIN servico se ON sos.idServico = se.idServico
		INNER JOIN status s ON sos.idStatus = s.idStatus
		INNER JOIN cliente c ON os.idCliente = c.idCliente
        INNER JOIN funcionario f ON sos.idFuncionario = f.idFuncionario
		INNER JOIN funcionario fu ON c.idVendedor = fu.idFuncionario
        INNER JOIN loja l ON fu.idLoja = l.idLoja
		WHERE s.idStatus IN (6)
		AND DATEDIFF(os.dataEntrega,'$dataInicio') >= 0
		AND DATEDIFF(os.dataEntrega,'$dataTermino') <= 0
		AND fu.nome LIKE '%$vendedor%'
        $complemento2";

		}

		$sql .="ORDER BY data";
		
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
	
	public function getRelatorioProducao($dataInicio,$dataTermino,$vendedor,$item,$servicoExecutado,$codigoBarras,$idTipoProducao){
        $sql = "SELECT
        		i.idOrdemServico,
        		i.codigoBarras,
        		i.descricao,
        		i.servicoExecutado,
        		DATE_FORMAT(i.dataProducao, '%d/%m/%Y') AS dataProducao,
        		f.nome AS nomeFuncionario,
                        l.nome AS nomeLoja
        		FROM
        		itemcoleta i
        		INNER JOIN funcionario f ON i.funcionarioProducao = f.idFuncionario
                        INNER JOIN loja l ON f.idloja = l.idloja
        		WHERE DATEDIFF(i.dataProducao,'$dataInicio') >= 0
        		AND DATEDIFF(i.dataProducao,'$dataTermino') <= 0
        		AND f.nome LIKE '$vendedor%'
        		AND i.descricao LIKE '%$item%'
        		AND i.servicoExecutado LIKE '%$servicoExecutado%'
        		AND i.codigoBarras LIKE '%$codigoBarras%'
        		AND i.idTipoProducao LIKE '%$idTipoProducao%'
        		ORDER BY i.dataProducao";

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

    public function getRelatorioEstoque($material,$flgConsumo,$loja){
                $sql = "SELECT        		
                        m.idMaterial,
        		m.descricao,
        		m.qdeMinima,
        		m.precoVenda,
        		m.precoRevenda,
                        em.idLoja,
                        l.nome as loja,                       
                        COALESCE((SELECT SUM(qdeComprada) FROM entradamaterial e WHERE e.idMaterial = m.idMaterial),0) AS qdeComprada,
        		COALESCE((SELECT SUM(qde) FROM materialordemservico mos WHERE mos.idMaterial = m.idMaterial),0) AS qdeUtilizada,
        		COALESCE((SELECT DATEDIFF(CURDATE(),(SELECT MIN(em.dataEntrada) FROM entradamaterial em WHERE em.idMaterial = m.idMaterial))),1) AS tempoEstoque
        		FROM
        		material m, entradaMaterial em, loja l                                   
        		WHERE descricao LIKE '$material%' AND flgConsumo LIKE '$flgConsumo%' and m.situacao NOT IN ('2','3') 
                              AND m.idMaterial = em.idMaterial AND em.idLoja=l.idLoja
        		ORDER BY descricao";
        		
        		$sql = "SELECT
        		m.idMaterial,
        		m.descricao,
        		m.qdeMinima,
        		m.precoVenda,
        		m.precoRevenda,
        		COALESCE((SELECT SUM(qdeComprada) FROM entradamaterial e WHERE e.idMaterial = m.idMaterial),0) AS qdeComprada,
        		COALESCE((SELECT SUM(qde) FROM materialordemservico mos WHERE mos.idMaterial = m.idMaterial),0) AS qdeUtilizada,
        		COALESCE((SELECT DATEDIFF(CURDATE(),(SELECT MIN(em.dataEntrada) FROM entradamaterial em WHERE em.idMaterial = m.idMaterial))),1) AS tempoEstoque
        		FROM
        		material m
        		WHERE descricao LIKE '$material%' AND flgConsumo LIKE '$flgConsumo%' and m.situacao NOT IN ('2','3')
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
        
        public function getRelatorioEstoqueBackup($material,$flgConsumo){
        $sql = "SELECT
        		m.idMaterial,
        		m.descricao,
        		m.qdeMinima,
        		m.precoVenda,
        		m.precoRevenda,
        		COALESCE((SELECT SUM(qdeComprada) FROM entradamaterial e WHERE e.idMaterial = m.idMaterial),0) AS qdeComprada,
        		COALESCE((SELECT SUM(qde) FROM materialordemservico mos WHERE mos.idMaterial = m.idMaterial),0) AS qdeUtilizada,
        		COALESCE((SELECT DATEDIFF(CURDATE(),(SELECT MIN(em.dataEntrada) FROM entradamaterial em WHERE em.idMaterial = m.idMaterial))),1) AS tempoEstoque
        		FROM
        		material m
        		WHERE descricao LIKE '$material%' AND flgConsumo LIKE '$flgConsumo%' and m.situacao NOT IN ('2','3')
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
	
	public function getRelatorioPreco($material,$servico){
        $sql = "SELECT
		        m.idMaterial as id,
		        'Material' as tipo,
		        m.descricao as descricao,
		        m.descricaoDetalhada as observacao,
		        m.qdeMinima,
		        m.precoVenda,
		        m.precoRevenda,
		        COALESCE((SELECT SUM(qdeComprada) FROM entradamaterial e WHERE e.idMaterial = m.idMaterial),0) AS qdeComprada,
		        COALESCE((SELECT SUM(qde) FROM materialordemservico mos WHERE mos.idMaterial = m.idMaterial),0) AS qdeUtilizada,
		        COALESCE((SELECT DATEDIFF(CURDATE(),(SELECT MIN(em.dataEntrada) FROM entradamaterial em WHERE em.idMaterial = m.idMaterial))),1) AS tempoEstoque
		        FROM
		        material m
		        WHERE m.descricao LIKE '$material%' and m.situacao NOT IN ('2','3')

                UNION

                SELECT
		        s.idServico as id,
		        'Serviço' as tipo,
                s.nome as descricao,
		        s.descricao  as observacao,
		        '' as qdeMinima,
		        s.preco as precoVenda,
		        s.preco as precoRevenda,
		        '' as qdeComprada,
		        '' as qdeUtilizada,
		        '' as tempoEstoque
                FROM
		        servico s
		        WHERE s.nome LIKE '$servico%' AND s.situacao NOT IN ('2','3')
		        ORDER BY descricao
                ";

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
	
	public function getRelatorioPedido($cliente,$vendedor){
        $sql = "SELECT
    			c.idCliente,
    			COALESCE(pf.nome,pj.nomeFantasia) AS nomeCliente,
    			os.idOrdemServico,
    			'Material' AS tipo,
    			mos.idMaterialOrdemServico,
    			m.descricao,
    			mos.qde,
    			date_format(mos.dataRetirada, '%d/%m/%Y') AS data,
    			s.idStatus,
    			s.nome AS nomeStatus,
    			f.nome AS nomeVendedor
    			FROM materialordemservico mos
    			INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
    			INNER JOIN material m ON mos.idMaterial = m.idMaterial
    			INNER JOIN status s ON mos.idStatus = s.idStatus
    			INNER JOIN cliente c ON os.idCliente = c.idCliente
    			INNER JOIN funcionario f ON c.idVendedor = f.idFuncionario
    			LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
    			LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
    			WHERE c.idSituacao NOT IN (3) AND s.idStatus NOT IN (6,7)
    			AND (pf.nome LIKE '$cliente%' OR pj.nomeFantasia LIKE '$cliente%')
    			AND f.nome LIKE '$vendedor%'

    			UNION

    			SELECT
    			c.idCliente,
    			COALESCE(pf.nome,pj.nomeFantasia) AS nomeCliente,
    			os.idOrdemServico,
    			'Serviço' AS tipo,
    			sos.idServicoOrdemServico,
    			se.nome,
    			sos.qde,
    			date_format(sos.data, '%d/%m/%Y') AS data,
    			s.idStatus,
    			s.nome AS nomeStatus,
    			f.nome AS nomeVendedor
    			FROM servicoordemservico sos
    			INNER JOIN ordemservico os ON sos.idOrdemServico = os.idOrdemServico
    			INNER JOIN servico se ON sos.idServico = se.idServico
    			INNER JOIN status s ON sos.idStatus = s.idStatus
    			INNER JOIN cliente c ON os.idCliente = c.idCliente
    			INNER JOIN funcionario f ON c.idVendedor = f.idFuncionario
    			LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
    			LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
    			WHERE c.idSituacao NOT IN (3) AND s.idStatus NOT IN (6,7)
    			AND (pf.nome LIKE '$cliente%' OR pj.nomeFantasia LIKE '$cliente%')
    			AND f.nome LIKE '$vendedor%'

    			UNION

    			SELECT
    			c.idCliente,
    			COALESCE(pf.nome,pj.nomeFantasia) AS nomeCliente,
    			os.idOrdemServico,
    			'Coleta' AS tipo,
    			i.idItemColeta,
    			i.descricao,
    			'' AS qde,
    			date_format(os.dataColeta, '%d/%m/%Y') AS data,
    			s.idStatus,
    			s.nome AS nomeStatus,
    			f.nome AS nomeVendedor
    			FROM itemcoleta i
    			INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
    			INNER JOIN status s ON i.idSetor = s.idStatus
    			INNER JOIN cliente c ON os.idCliente = c.idCliente
    			INNER JOIN funcionario f ON c.idVendedor = f.idFuncionario
    			LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
    			LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
    			WHERE c.idSituacao NOT IN (3) AND s.idStatus NOT IN (6,7)
    			AND (pf.nome LIKE '$cliente%' OR pj.nomeFantasia LIKE '$cliente%')
    			AND f.nome LIKE '$vendedor%'

    			ORDER BY 8,1,2,3";

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
	
	public function getRelatorioCodigoBarras($codigoBarras){
        $sql = "SELECT
        		c.idCliente,
        		os.idOrdemServico,
        		'Material' AS tipo,
        		mos.idMaterialOrdemServico,
        		m.descricao,
        		mos.qde,
        		mos.preco,
        		mos.codigoBarras,
        		date_format(os.dataEntrega, '%d/%m/%Y') AS data,
        		s.idStatus,
        		s.nome AS nomeStatus,
                f.nome AS nomeFuncionario,
        		fu.nome AS nomeVendedor
        		FROM materialordemservico mos
        		INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
        		INNER JOIN material m ON mos.idMaterial = m.idMaterial
        		INNER JOIN status s ON mos.idStatus = s.idStatus
        		INNER JOIN cliente c ON os.idCliente = c.idCliente
                        INNER JOIN funcionario f ON mos.usuarioCadastro = f.idFuncionario
        		INNER JOIN funcionario fu ON c.idVendedor = fu.idFuncionario";
        if($codigoBarras)
        {
        $codigoBarras = str_replace(",", "','", $codigoBarras);
        $sql .= " WHERE mos.codigoBarras IN ('$codigoBarras')";
        }

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
        
        public function getRelatorioEntregaMotoboy($dataInicio,$dataTermino,$motoboy){
        $sql = "SELECT
                o.idordemServico,
                pf.nome AS nomeCliente,
                o.observacoes,
                fp.nome as formaPagamento,
                o.idMotoboyColeta,
                mc.nome AS motoboyColeta,
                o.idMotoboyEntrega,
                me.nome AS motoboyEntrega,
                s.idStatus,
                s.nome AS nomeStatus,
                date_format(o.dataEntrega, '%d/%m/%Y') AS dataEntrega
                FROM ordemservico o
                INNER JOIN cliente c ON o.idCliente = c.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                INNER JOIN status s ON o.idStatus = s.idStatus
                LEFT JOIN motoboy mc ON o.idMotoboyColeta = mc.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy 
                WHERE me.nome LIKE '%$motoboy%'
                    AND DATEDIFF(o.dataEntrega,'$dataInicio') >= 0
		AND DATEDIFF(o.dataEntrega,'$dataTermino') <= 0

                UNION

                SELECT
                o.idordemServico,
                pj.nomeFantasia AS nomeCliente,
                o.observacoes,
                fp.nome as formaPagamento,
                o.idMotoboyColeta,
                mc.nome AS motoboyColeta,
                o.idMotoboyEntrega,
                me.nome AS motoboyEntrega,
                s.idStatus,
                s.nome AS nomeStatus,
                date_format(o.dataEntrega, '%d/%m/%Y') AS dataEntrega
                FROM ordemservico o
                INNER JOIN cliente c ON o.idCliente = c.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                INNER JOIN status s ON o.idStatus = s.idStatus
                LEFT JOIN motoboy mc ON o.idMotoboyColeta = mc.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy
                WHERE me.nome LIKE '%$motoboy%'"
                . "AND DATEDIFF(o.dataEntrega,'$dataInicio') >= 0
		AND DATEDIFF(o.dataEntrega,'$dataTermino') <= 0";
       

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
