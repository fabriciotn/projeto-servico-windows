<?php

require_once('conexao.php');

class MaterialDAO {

    private $con;

    public function MaterialDAO() {
        $this->con = new Conexao();
    }

    public function getMateriais($idMaterial, $descricao) {

        $sql = "SELECT
        		m.idMaterial,
        		m.descricao,
        		m.qdeMinima,
        		m.precoVenda,
        		m.precoRevenda,
                        m.lucro,
                        m.lucro_minimo,
        		COALESCE((SELECT SUM(qdeComprada) FROM entradamaterial e WHERE e.idMaterial = m.idMaterial),0) AS qdeComprada,
        		COALESCE((SELECT SUM(qde) FROM materialordemservico mos WHERE mos.idMaterial = m.idMaterial),0) AS qdeUtilizada,
        		COALESCE((SELECT DATEDIFF(CURDATE(),(SELECT MIN(em.dataEntrada) FROM entradamaterial em WHERE em.idMaterial = m.idMaterial))),1) AS tempoEstoque
        		FROM
        		material m
        		WHERE m.situacao NOT IN ('2','3') and m.descricao LIKE '%$descricao%'";

        if ($idMaterial)
            $sql .= " and m.idMaterial = '$idMaterial' ";

        $sql .= " ORDER BY descricao";
        $this->con->conectar();
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getArrayResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    /* public function getMateriais($descricao){
      $sql = "SELECT * from material
      WHERE descricao LIKE '%$descricao%'";
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
      } */

    public function getMateriaisCliente($idCliente) {
        $sql = "SELECT
            	'Material' AS tipo,
            	mos.idMaterialOrdemServico,
            	m.descricao,
            	mos.qde,
            	mos.preco,
            	date_format(mos.dataRetirada, '%d/%m/%Y - %H:%i:%s') AS data,
            	s.idStatus,
            	s.nome AS nomeStatus
            	FROM materialordemservico mos
            	INNER JOIN ordemservico os ON mos.idOrdemServico = os.idOrdemServico
            	INNER JOIN material m ON mos.idMaterial = m.idMaterial
            	INNER JOIN status s ON mos.idStatus = s.idStatus
            	INNER JOIN cliente c ON os.idCliente = c.idCliente
            	WHERE os.idCliente = '$idCliente' AND c.idSituacao NOT IN (3)
            	ORDER BY s.idStatus, mos.dataRetirada desc
            	limit 0,15";
        $this->con->conectar();
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getArrayResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    public function getMaterial($idMaterial) {
        $sql = "SELECT * from material
        		WHERE idMaterial = $idMaterial";
        $this->con->conectar();
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getUniqResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    public function getUltimaEntradaMaterial($idMaterial) {
        $sql = "SELECT m.idMaterial, 
                    m.lucro,
                 m.lucro_minimo, 
                       em.idEntradaMaterial,
                       em.valorUnitarioPago
                from material m, entradaMaterial em
        		WHERE m.idMaterial = '$idMaterial' AND m.idMaterial=em.idMaterial
                        order by em.idEntradaMaterial desc LIMIT 1";
        $this->con->conectar();
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getUniqResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    public function getEntradasMaterial($idMaterial) {
        $sql = "SELECT
                em.idEntradaMaterial,
                em.idMaterial,
                em.idFornecedor,
                em.qdeComprada,
                em.valorUnitarioPago,
                date_format(em.dataEntrada, '%d/%m/%Y') AS dataEntrada,
                em.notaFiscalEntrada,
                m.descricao as descricao,
                f.nomeFantasia
                FROM entradamaterial em
                INNER JOIN material m ON em.idMaterial = m.idMaterial
                INNER JOIN fornecedor f ON em.idFornecedor = f.idFornecedor
                WHERE em.idMaterial = $idMaterial";
        $this->con->conectar();
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getArrayResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    public function getSaidasMaterial($idMaterial) {
        $sql = "SELECT
                mos.idMaterialOrdemServico,
                mos.idMaterial,
                mos.idOrdemServico,
                mos.qde,
                mos.preco,
                date_format(mos.dataRetirada, '%d/%m/%Y') AS dataRetirada,
                m.descricao
                FROM materialordemservico mos
                INNER JOIN material m ON mos.idMaterial = m.idMaterial
                WHERE mos.idMaterial = $idMaterial";
        $this->con->conectar();
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getArrayResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    public function getEntradaMaterial($idEntradaMaterial) {
        $sql = "SELECT
                em.idEntradaMaterial,
                em.idMaterial,
                em.idFornecedor,
                em.qdeComprada,
                em.valorUnitarioPago,
                date_format(em.dataEntrada, '%d/%m/%Y') AS dataEntrada,
                em.notaFiscalEntrada,
                m.descricao as descricao,
                f.nomeFantasia
                FROM entradamaterial em
                INNER JOIN material m ON em.idMaterial = m.idMaterial
                INNER JOIN fornecedor f ON em.idFornecedor = f.idFornecedor
                WHERE em.idEntradaMaterial = $idEntradaMaterial";
        if ($this->con->query($sql)) {
            if ($this->con->numRows() > 0) {
                $linhas = array();
                $linhas = $this->con->getUniqResult();
                return $linhas;
            } else
                return false;
        } else
            $this->con->getError();
    }

    public function inserirMaterial($descricao, $qdeMinima, $precoVenda, $precoRevenda, $lucro, $lucro_minimo, $situacao, $flgConsumo, $descricaoDetalhada) {
        $sql = "insert into material (descricao,qdeMinima,precoVenda,precoRevenda,lucro,lucro_minimo,situacao,flgConsumo,descricaoDetalhada)
                values('$descricao','$qdeMinima','$precoVenda','$precoRevenda','$lucro','$lucro_minimo','$situacao','$flgConsumo','$descricaoDetalhada')";
        $this->con->conectar();
        $this->con->query($sql) ? $result = true : $result = false;
        if ($result) {
            $sql = "SELECT LAST_INSERT_ID() as id";
            $this->con->query($sql);
            if ($this->con->numRows() == 1)
                return $this->con->getResult(0, 'id');
            else
                return false;
        }
        $this->con->desconectar();
        return $result;
    }

    public function atualizarMaterial($idMaterial, $descricao, $qdeMinima, $precoVenda, $precoRevenda, $lucro, $lucro_minimo, $situacao, $flgConsumo, $descricaoDetalhada) {
        $sql = "update material set descricao = '$descricao',qdeMinima = '$qdeMinima',precoVenda = '$precoVenda',precoRevenda = '$precoRevenda',
                                    lucro='$lucro',lucro_minimo='$lucro_minimo',situacao = '$situacao',flgConsumo = '$flgConsumo',descricaoDetalhada = '$descricaoDetalhada'
                        where idMaterial = '$idMaterial'";
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

    public function inserirEntradaMaterial($idMaterial, $fornecedor, $qdeComprada, $valorUnitarioPago, $notaFiscalEntrada) {
        $sql = "insert into entradaMaterial (idMaterial,idFornecedor,qdeComprada,valorUnitarioPago,notaFiscalEntrada,dataEntrada)
                values('$idMaterial','$fornecedor','$qdeComprada','$valorUnitarioPago','$notaFiscalEntrada',NOW())";
        $this->con->conectar();
        $this->con->query($sql) ? $result = true : $result = false;
        if ($result) {
            $sql = "SELECT LAST_INSERT_ID() as id";
            $this->con->query($sql);
            if ($this->con->numRows() == 1)
                return $this->con->getResult(0, 'id');
            else
                return false;
        }
        $this->con->desconectar();
        return $result;
    }

    public function inserirSaidaMaterial($idMaterial, $idOrdemServico, $qde, $preco, $usuario) {
        $sql = "insert into materialordemservico (idMaterial,idOrdemServico,qde,preco,usuarioCadastro,dataRetirada,idStatus)
                values('$idMaterial','$idOrdemServico','$qde','$preco','$usuarioCadastro',NOW(),6)";
        $this->con->conectar();
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

    public function atualizarEntradaMaterial($idEntradaMaterial, $idMaterial, $fornecedor, $qdeComprada, $valorUnitarioPago, $notaFiscalEntrada) {
        $sql = "update entradaMaterial set idFornecedor = '$fornecedor',qdeComprada = '$qdeComprada',
                                    valorUnitarioPago = '$valorUnitarioPago',notaFiscalEntrada = '$notaFiscalEntrada'
                        where idEntradaMaterial = '$idEntradaMaterial'";
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

    public function removerEntradaMaterial($idEntradaMaterial) {
        $sql = "delete from entradaMaterial where idEntradaMaterial = '$idEntradaMaterial'";
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

}
