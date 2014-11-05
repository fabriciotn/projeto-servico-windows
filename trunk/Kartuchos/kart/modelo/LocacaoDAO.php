<?php

require_once('conexao.php');

class LocacaoDAO {

    private $con;

    public function LocacaoDAO() {
        $this->con = new Conexao();
    }

    public function getLocacaos($marca) {
        $sql = "SELECT * FROM Locacao WHERE marca LIKE '%$marca%'
                ORDER BY marca";

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

    public function getLocacao($idLocacao) {
        $sql = "SELECT
             *,date_format(data, '%d/%m/%Y') AS data,
               date_format(data_final_contrato, '%d/%m/%Y') AS data_final_contrato
		     FROM
             locacao
		     WHERE idLocacao = '$idLocacao'";

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

    public function inserirLocacao($idLocacao, $franquia_compartilhada,$franquia_colorida, $valor, $valor_copia_excedente, 
                                   $valor_digit_excedente, $bonus, $valor_colorida, $observacoes, $data,$data_afericao,$data_final_contrato,$emailFaturamento,$empresa,$prazo_pagamento_dias) {

        $sql = "insert into locacao (idLocacao,idAcessoExterno,franquia_compartilhada,franquia_colorida,valor,valor_copia_excedente,valor_digit_excedente,
                                     bonus,valor_colorida,observacoes,data,data_afericao,data_final_contrato,emailFaturamento,empresa,prazo_pagamento_dias)
                values('$idLocacao','$idLocacao','$franquia_compartilhada','$franquia_colorida','$valor','$valor_copia_excedente','$valor_digit_excedente',
                       '$bonus','$valor_colorida','$observacoes','$data','$data_afericao','$data_final_contrato','$emailFaturamento','$empresa','$prazo_pagamento_dias')";
        $this->con->conectar();
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

    public function atualizarLocacao($idLocacao, $franquia_compartilhada, $franquia_colorida,$valor, $valor_copia_excedente, 
                                     $valor_digit_excedente, $bonus, $valor_colorida, $observacoes, $data,$data_afericao,$data_final_contrato,$emailFaturamento,$empresa,$prazo_pagamento_dias) {
        $sql = "update locacao set franquia_compartilhada='$franquia_compartilhada',franquia_colorida='$franquia_colorida',valor='$valor',
                                      valor_copia_excedente='$valor_copia_excedente',
                                      valor_digit_excedente='$valor_digit_excedente',bonus='$bonus',
                                      valor_colorida='$valor_colorida',observacoes='$observacoes',data='$data',
                                      data_afericao='$data_afericao', data_final_contrato='$data_final_contrato',emailFaturamento='$emailFaturamento',
                                      empresa = '$empresa', prazo_pagamento_dias= '$prazo_pagamento_dias'
                        where idLocacao = '$idLocacao'";
        $this->con->conectar();
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

    public function removerLocacao($idLocacao) {
        $sql = "delete from Locacao where idLocacao = '$idLocacao'";
        $this->con->conectar();
        $this->con->query($sql) ? $result = true : $result = false;
        $this->con->desconectar();
        return $result;
    }

}
