<?php

require_once('conexao.php');

class FaturamentoDAO {

    private $con;

    public function FaturamentoDAO() {
        $this->con = new Conexao();
    }

    public function getOrdemServicoFaturamento($idOrdemServico) {
        $sql = "SELECT
                o.idOrdemServico,
                pf.nome AS nomeCliente,
                'CPF' AS tipoDocumento,
                pf.cpf AS documento,
                concat(c.endereco,' - ',c.bairro,' - ',c.cidade) AS endereco,
                c.telefone,
                c.celular,
                pf.nome AS responsavel,
                null as retencaoISS,
                date_format(o.dataCriacao,'%d/%m/%Y') AS dataCriacao,
                f.nome AS usuarioAbertura,
                o.observacoes,
                o.formapagamento as idFormaPagamento,
                fp.nome as formaPagamento,
                date_format(o.dataVencimento,'%d/%m/%Y') AS dataVencimento
                FROM ordemservico o
                INNER JOIN cliente c ON o.idCliente = c.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                WHERE o.idOrdemServico = '$idOrdemServico'

                UNION

                SELECT
                o.idOrdemServico,
                pj.nomeFantasia AS nomeCliente,
                'CNPJ' AS tipoDocumento,
                pj.cnpj AS documento,
                concat(c.endereco,' - ',c.bairro,' - ',c.cidade) AS endereco,
                c.telefone,
                c.celular,
                pj.responsavel AS responsavel,
                pj.retencaoISS as retencaoISS,
                date_format(o.dataCriacao,'%d/%m/%Y') AS dataCriacao,
                f.nome AS usuarioAbertura,
                o.observacoes,
                o.formapagamento as idFormaPagamento,
                fp.nome as formaPagamento,
                date_format(o.dataVencimento,'%d/%m/%Y') AS dataVencimento
                FROM ordemservico o
                INNER JOIN cliente c ON o.idCliente = c.idCliente
                INNER JOIN formapagamento fp ON o.formapagamento = fp.idFormaPagamento
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                INNER JOIN funcionario f ON o.idusuarioAbertura = f.idFuncionario
                WHERE o.idOrdemServico = '$idOrdemServico'";
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

    public function getParcelasFaturamento($idOrdemServico) {
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

    public function voltaStatusAvaliacao($idOrdemServico) {
        //$sql = "UPDATE ordemservico SET idStatus = 4 WHERE idOrdemServico = '$idOrdemServico'";
        //$this->con->query($sql) ? $result = true : $result = false;
        $sql = "UPDATE itemcoleta SET idSetor = 3 WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result = true : $result = false;
        $sql = "UPDATE materialordemservico SET idStatus = 4 WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result = true : $result = false;
        $sql = "UPDATE servicoordemservico SET idStatus = 4 WHERE idOrdemServico = '$idOrdemServico'";
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

}
