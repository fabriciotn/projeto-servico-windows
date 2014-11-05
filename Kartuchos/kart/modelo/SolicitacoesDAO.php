<?php
require_once('conexao.php');

class SolicitacoesDAO{
	private $con;

	public function SolicitacoesDAO(){
		$this->con = new Conexao();
	}


	public function getClientesSolicitacoes($cliente,$complemento){

    //$complemento.= ",1,14,2,3,4,5,12,13,8,9,10";
         $sql = "
	       SELECT DISTINCT
	       c.idCliente,
	       os.tipoVenda
	       FROM materialordemservico mos
	       INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
	       INNER JOIN material m ON mos.idMaterial = m.idMaterial
	       INNER JOIN status s ON mos.idStatus = s.idStatus
	       INNER JOIN cliente c ON os.idCliente = c.idCliente
	       LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
	       LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
	       WHERE c.idSituacao NOT IN (6,7) AND s.idStatus IN (100".$complemento.")
	       AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')

	       UNION

	       SELECT DISTINCT
	       c.idCliente,
	       os.tipoVenda
	       FROM servicoordemservico sos
	       INNER JOIN ordemservico os ON sos.idOrdemServico = os.idOrdemServico
	       INNER JOIN servico se ON sos.idServico = se.idServico
	       INNER JOIN status s ON sos.idStatus = s.idStatus
	       INNER JOIN cliente c ON os.idCliente = c.idCliente
	       LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
	       LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
	       WHERE c.idSituacao NOT IN (6,7) AND s.idStatus IN (100".$complemento.")
	       AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')

	       UNION

	       SELECT DISTINCT
	       c.idCliente,
	       os.tipoVenda
	       FROM itemcoleta i
	       INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
	       INNER JOIN status s ON i.idSetor = s.idStatus
	       INNER JOIN cliente c ON os.idCliente = c.idCliente
	       LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
	       LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
	       WHERE c.idSituacao NOT IN (6,7) AND s.idStatus IN (100".$complemento.")
	       AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')

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
	
	public function getItensSolicitacoes($idCliente,$complemento){

    //$complemento.= ",1,14,2,3,4,5,12,13,8,9,10";
    //$idCliente = "1801";
    $sql = "

	       SELECT DISTINCT
            c.idCliente,
            os.idOrdemServico,
            'Material' AS tipo,
        	mos.idMaterialOrdemServico as id,
        	m.descricao,
        	mos.qde,
            os.dataCriacao,
            mos.dataRetirada,
        	date_format(mos.dataRetirada, '%d/%m/%Y %H:%i:%s') AS data,
        	s.idStatus,
        	s.nome AS nomeStatus,
                os.observacoes
	       FROM materialordemservico mos
	       INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
	       INNER JOIN material m ON mos.idMaterial = m.idMaterial
	       INNER JOIN status s ON mos.idStatus = s.idStatus
	       INNER JOIN cliente c ON os.idCliente = c.idCliente
	       LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
	       LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
	       WHERE c.idCliente = ".$idCliente." AND c.idSituacao NOT IN (6,7) AND s.idStatus IN (100".$complemento.")

	       UNION

	       SELECT DISTINCT
            c.idCliente,
	        os.idOrdemServico,
        	'Serviço' AS tipo,
        	sos.idServicoOrdemServico as id,
        	se.nome,
        	sos.qde,
            os.dataCriacao,
            sos.data,
        	date_format(sos.data, '%d/%m/%Y %H:%i:%s') AS data,
        	s.idStatus,
        	s.nome AS nomeStatus,
                os.observacoes
	       FROM servicoordemservico sos
	       INNER JOIN ordemservico os ON sos.idOrdemServico = os.idOrdemServico
	       INNER JOIN servico se ON sos.idServico = se.idServico
	       INNER JOIN status s ON sos.idStatus = s.idStatus
	       INNER JOIN cliente c ON os.idCliente = c.idCliente
	       LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
	       LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
	       WHERE c.idCliente = ".$idCliente." AND c.idSituacao NOT IN (6,7) AND s.idStatus IN (100".$complemento.")

	       UNION

	       SELECT DISTINCT
            c.idCliente,
            os.idOrdemServico,
        	'Coleta' AS tipo,
        	i.idItemColeta as id,
        	i.descricao,
        	'' AS qde,
        	os.dataCriacao,
        	os.dataColeta,
        	date_format(os.dataColeta, '%d/%m/%Y %H:%i:%s') AS data,
        	s.idStatus,
        	s.nome AS nomeStatus,
                os.observacoes
	       FROM itemcoleta i
	       INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
	       INNER JOIN status s ON i.idSetor = s.idStatus
	       INNER JOIN cliente c ON os.idCliente = c.idCliente
	       LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
	       LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
	       WHERE c.idCliente = ".$idCliente." AND c.idSituacao NOT IN (6,7) AND s.idStatus IN (100".$complemento.")

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
	
	public function getSolicitacoesProducao($codigoBarras,$complemento){


       $sql = "
            SELECT
            c.idCliente,
            pf.nome AS nomeCliente,
            os.idOrdemServico,
            i.idItemColeta as id,
            i.descricao,
            i.codigoBarras,
            os.dataColeta,
            os.tipoVenda,
            date_format(os.dataColeta, '%d/%m/%Y %H:%i:%s') AS data,
            s.idStatus,
            s.nome AS nomeStatus
            FROM itemcoleta i
            INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
            INNER JOIN status s ON i.idSetor = s.idStatus
            INNER JOIN cliente c ON os.idCliente = c.idCliente
            INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
            WHERE s.idStatus IN (2,9,10) AND (i.codigoBarras LIKE '$codigoBarras%' OR i.codigoBarras IS NULL)
            $complemento

            UNION

            SELECT
            c.idCliente,
            pj.nomeFantasia AS nomeCliente,
            os.idOrdemServico,
            i.idItemColeta as id,
            i.descricao,
            i.codigoBarras,
            os.dataColeta,
            os.tipoVenda,
            date_format(os.dataColeta, '%d/%m/%Y %H:%i:%s') AS data,
            s.idStatus,
            s.nome AS nomeStatus
            FROM itemcoleta i
            INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
            INNER JOIN status s ON i.idSetor = s.idStatus
            INNER JOIN cliente c ON os.idCliente = c.idCliente
            INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
            WHERE s.idStatus IN (2,9,10) AND (i.codigoBarras LIKE '$codigoBarras%' OR i.codigoBarras IS NULL)
            $complemento

            ORDER BY dataColeta ,2,5
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
	
	public function getSolicitacoesAvaliacao($cliente){


       $sql = " SELECT
                c.idCliente,
                pf.nome AS nomeCliente,
                os.idOrdemServico,
                os.idOrdemServico as id,
                i.idItemColeta,
                i.descricao,
                i.codigoBarras,
                i.dataProducao,
                os.tipoVenda,
                date_format(i.dataProducao, '%d/%m/%Y %H:%i:%s') AS data,
                s.idStatus,
                s.nome AS nomeStatus
                FROM itemcoleta i
                INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
                INNER JOIN status s ON i.idSetor = s.idStatus
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                WHERE s.idStatus IN (3) AND pf.nome LIKE '$cliente%'

                UNION

                SELECT
                c.idCliente,
                pj.nomeFantasia AS nomeCliente,
                os.idOrdemServico,
                os.idOrdemServico as id,
                i.idItemColeta,
                i.descricao,
                i.codigoBarras,
                i.dataProducao,
                os.tipoVenda,
                date_format(i.dataProducao, '%d/%m/%Y %H:%i:%s') AS data,
                s.idStatus,
                s.nome AS nomeStatus
                FROM itemcoleta i
                INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
                INNER JOIN status s ON i.idSetor = s.idStatus
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                WHERE s.idStatus IN (3) AND pj.nomeFantasia LIKE '$cliente%'

                ORDER BY dataProducao ,2,5
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
	
	public function getSolicitacoesAprovacao($cliente){


       $sql = "SELECT
                c.idCliente,
                pf.nome AS nomeCliente,
                os.idOrdemServico,
                i.idItemColeta as id,
                i.descricao,
                i.codigoBarras,
                i.dataProducao,
                os.tipoVenda,
                date_format(i.dataProducao, '%d/%m/%Y %H:%i:%s') AS data,
                s.idStatus,
                s.nome AS nomeStatus
                FROM itemcoleta i
                INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
                INNER JOIN status s ON i.idSetor = s.idStatus
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                WHERE s.idStatus IN (8) AND pf.nome LIKE '$cliente%'

                UNION

                SELECT
                c.idCliente,
                pj.nomeFantasia AS nomeCliente,
                os.idOrdemServico,
                i.idItemColeta as id,
                i.descricao,
                i.codigoBarras,
                i.dataProducao,
                os.tipoVenda,
                date_format(i.dataProducao, '%d/%m/%Y %H:%i:%s') AS data,
                s.idStatus,
                s.nome AS nomeStatus
                FROM itemcoleta i
                INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
                INNER JOIN status s ON i.idSetor = s.idStatus
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                WHERE s.idStatus IN (8) AND pj.nomeFantasia LIKE '$cliente%'

                ORDER BY dataProducao ,2,5";

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
	
	public function getSolicitacoesFaturamento($cliente){


       $sql = " SELECT
                c.idCliente,
                os.idOrdemServico,
                os.idOrdemServico as id,
                'Material' AS tipo,
                mos.idMaterialOrdemServico,
                m.descricao,
                mos.qde,
                pf.nome as nomeCliente,
                pj.nomeFantasia as nomeCliente,
                mos.dataRetirada,
                os.tipoVenda,
                date_format(mos.dataRetirada, '%d/%m/%Y %H:%i:%s') AS data,
                s.idStatus,
                s.nome AS nomeStatus
                FROM materialordemservico mos
                INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
                INNER JOIN material m ON mos.idMaterial = m.idMaterial
                INNER JOIN status s ON mos.idStatus = s.idStatus
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                WHERE c.idSituacao NOT IN (3) AND s.idStatus IN (4)
                AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')

                UNION

                SELECT
                c.idCliente,
                os.idOrdemServico,
                os.idOrdemServico as id,
                'Serviço' AS tipo,
                sos.idServicoOrdemServico,
                se.nome,
                sos.qde,
                pf.nome as nomeCliente,
                pj.nomeFantasia as nomeCliente,
                sos.data,
                os.tipoVenda,
                date_format(sos.data, '%d/%m/%Y %H:%i:%s') AS data,
                s.idStatus,
                s.nome AS nomeStatus
                FROM servicoordemservico sos
                INNER JOIN ordemservico os ON sos.idOrdemServico = os.idOrdemServico
                INNER JOIN servico se ON sos.idServico = se.idServico
                INNER JOIN status s ON sos.idStatus = s.idStatus
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                WHERE c.idSituacao NOT IN (3) AND s.idStatus IN (4)
                AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')

                ORDER BY 1,2,3";

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
	
	public function getSolicitacoesExpedicao($cliente){


      $sql = "  SELECT
                c.idCliente,
                os.idOrdemServico,
    			os.idOrdemServico as id,
    			'Coleta' AS tipo,
    			i.idItemColeta,
    			i.descricao,
    			'' AS qde,
    			pf.nome as nomeCliente,
                pj.nomeFantasia as nomeCliente,
    			os.dataColeta,
    			os.tipoVenda,
    			date_format(os.dataColeta, '%d/%m/%Y %H:%i:%s') AS data,
    			s.idStatus,
    			s.nome AS nomeStatus
    			FROM itemcoleta i
    			INNER JOIN ordemservico os ON i.idOrdemServico = os.idOrdemServico
    			INNER JOIN status s ON i.idSetor = s.idStatus
    			INNER JOIN cliente c ON os.idCliente = c.idCliente
    			LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
    			LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
    			WHERE c.idSituacao NOT IN (3) AND s.idStatus IN (5,10,12)
    			AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')


                UNION

                SELECT
    			c.idCliente,
    			os.idOrdemServico,
    			os.idOrdemServico as id,
    			'Material' AS tipo,
    			mos.idMaterialOrdemServico,
    			m.descricao,
    			mos.qde,
    			pf.nome as nomeCliente,
                pj.nomeFantasia as nomeCliente,
    			mos.dataRetirada,
    			os.tipoVenda,
    			date_format(mos.dataRetirada, '%d/%m/%Y %H:%i:%s') AS data,
    			s.idStatus,
    			s.nome AS nomeStatus
    			FROM materialordemservico mos
    			INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
    			INNER JOIN material m ON mos.idMaterial = m.idMaterial
    			INNER JOIN status s ON mos.idStatus = s.idStatus
    			INNER JOIN cliente c ON os.idCliente = c.idCliente
    			LEFT JOIN pessoafisica pf ON c.idCliente = pf.idCliente
    			LEFT JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
    			WHERE c.idSituacao NOT IN (3) AND s.idStatus IN (5,10,12)
    			AND (pf.nome LIKE '".$cliente."%' OR pj.nomeFantasia LIKE '".$cliente."%')

    			ORDER BY data, 1,2,3";

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
	
	public function atualizarSenha($cod,$senhaNova){
        $sql = "update funcionario set senha='$senhaNova' where idFuncionario='$cod'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
