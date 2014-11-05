<?php

require_once('conexao.php');

class SuporteDAO {

    private $con;

    public function SuporteDAO() {
        $this->con = new Conexao();
    }

    public function getSuportes($dataInicio, $dataTermino, $status) {
        if ($dataInicio and $dataTermino)
            $pData = " AND a.data_abertura BETWEEN '$dataInicio' AND '$dataTermino' ";
        else if ($dataInicio)
            $pData = " AND a.data_abertura > '$dataInicio' ";
        else if ($dataTermino)
            $pData = " AND a.data_abertura < '$dataTermino' ";
        else
            $pData = "";


        $sql = "select a.idChamado,
                            a.responsavel,
                            a.garantia,
                            a.tecnico, 
                            a.data_abertura as data,
                            date_format(a.data_abertura,'%d/%m/%Y %H:%i:%s') AS data_abertura, 
                            a.defeito_alegado,
                            date_format(a.data_atendimento,'%d/%m/%Y %H:%i:%s') AS data_atendimento, 
                            a.defeito_constatado,
                            date_format(a.data_fechamento,'%d/%m/%Y %H:%i:%s') AS data_fechamento, 
                            a.status,
                            a.solucao, 
                            c.idCliente, 
                            a.equipamento,
                            a.patrimonio,
                            fu.nome as funcionario, 
                            pf.nome AS nomeCliente,
                            @tipoCliente:='PF' as tipoCliente
                     from chamados a
                          INNER JOIN cliente c ON a.idFornecedor = c.idCliente 
                          INNER JOIN pessoafisica pf ON c.idCliente = pf.idCliente                          
                          INNER JOIN funcionario fu ON a.idFuncionario=fu.idFuncionario 
                     where 1=1 " . $status . $pData . "                    
                     
                     UNION
                     
                     select a.idChamado,
                            a.responsavel,
                            a.garantia,
                            a.tecnico, 
                            a.data_abertura as data,
                            date_format(a.data_abertura,'%d/%m/%Y %H:%i:%s') AS data_abertura, 
                            a.defeito_alegado,
                            date_format(a.data_atendimento,'%d/%m/%Y %H:%i:%s') AS data_atendimento, 
                            a.defeito_constatado,
                            date_format(a.data_fechamento,'%d/%m/%Y %H:%i:%s') AS data_fechamento, 
                            a.status,
                            a.solucao, 
                            c.idCliente, 
                            a.equipamento,
                            a.patrimonio, 
                            fu.nome as funcionario, 
                            pj.nomeFantasia AS nomeCliente,
                            @tipoCliente:='PJ' as tipoCliente
                     from chamados a
                          INNER JOIN cliente c ON a.idFornecedor = c.idCliente 
                          INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente                          
                          INNER JOIN funcionario fu ON a.idFuncionario=fu.idFuncionario 
                     where 1=1 " . $status . $pData . "
                     ORDER BY data ";

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

    public function getHistoricoSuportes($idCliente) {
        $sql = "select a.idChamado,
                            a.responsavel,
                            a.garantia,
                            a.tecnico, 
                            a.data_abertura as data,
                            date_format(a.data_abertura,'%d/%m/%Y %H:%i:%s') AS data_abertura, 
                            a.defeito_alegado,
                            date_format(a.data_atendimento,'%d/%m/%Y %H:%i:%s') AS data_atendimento, 
                            a.defeito_constatado,
                            date_format(a.data_fechamento,'%d/%m/%Y %H:%i:%s') AS data_fechamento, 
                            a.status,
                            a.solucao,                             
                            a.equipamento,
                            a.patrimonio,
                            fu.nome as funcionario                           
                     from chamados a                                                    
                          LEFT JOIN funcionario fu ON a.idFuncionario=fu.idFuncionario  
                     where a.idFornecedor='$idCliente'
                     ORDER BY data ";

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

    public function getSuporte($idSuporte) {
        $sql = "SELECT
                       a.idChamado,
                       date_format(a.data_abertura,'%d/%m/%Y %H:%i:%s') AS data_abertura, 
                       a.responsavel,
                       a.tecnico,
                       a.garantia,
                       a.defeito_constatado,
                       a.solucao,
                       a.status,
                       a.equipamento,
                       a.patrimonio,
                       a.defeito_alegado
              FROM
                    chamados a                    
              WHERE idChamado='$idSuporte'";

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

    public function inserirSuporte($idFuncionario, $idFornecedor, $responsavel, $equipamento,$patrimonio, $defeito_alegado) {

        $sql = "INSERT INTO chamados (idFuncionario,idFornecedor,responsavel,equipamento,patrimonio,defeito_alegado,data_abertura,status)
                        values('$idFuncionario','$idFornecedor','$responsavel','$equipamento','$patrimonio','$defeito_alegado',NOW(),1)";
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

    public function atualizarSuporte($idChamado, $tecnico, $defeito_constatado, $data_atendimento, $garantia, $solucao, $status, $data_conclusao) {
        $sql = "UPDATE chamados SET tecnico = '$tecnico',defeito_constatado = '$defeito_constatado' " . $data_atendimento . ",
                               garantia = '$garantia', solucao = '$solucao', status='$status' " . $data_conclusao . "
			       WHERE idChamado = '$idChamado'";
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

    public function removerSuporte($idSuporte) {
        $sql = "delete from banco where idLoja = '$idSuporte'";
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

}
