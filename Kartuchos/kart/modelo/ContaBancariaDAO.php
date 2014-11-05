<?php
require_once('conexao.php');

class ContaBancariaDAO{
	private $con;

	public function ContaBancariaDAO(){
		$this->con = new Conexao();
	}
	
	public function getContaBancarias($nome){
       $sql = "SELECT
                    cb.idContaBancaria,
                    cb.nome,
                    cb.conta,
                    cb.agencia,
                    cb.observacoes,
                    cb.idSituacao,
                    cb.banco as idBanco,
                    e.idLoja as idEmpresa,
                    b.nome as nomeBanco,
                    e.nome as nomeEmpresa
        		FROM
                    ContaBancaria cb
                    LEFT JOIN banco b ON cb.banco = b.idBanco
                    LEFT JOIN loja e ON cb.empresa = e.idLoja
        		WHERE cb.nome LIKE '%$nome%' AND cb.idSituacao = '1'
                ORDER BY cb.nome";

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
	
	
	public function getContaBancaria($idContaBancaria){
        $sql = "SELECT
                    cb.idContaBancaria,
                    cb.nome,
                    cb.conta,
                    cb.agencia,
                    cb.observacoes,
                    cb.idSituacao,
                    cb.banco as idBanco,
                    e.idLoja as idEmpresa,
                    b.nome as nomeBanco,
                    e.nome as nomeEmpresa
        		FROM
                    ContaBancaria cb
                    LEFT JOIN banco b ON cb.banco = b.idBanco
                    LEFT JOIN loja e ON cb.empresa = e.idLoja
        		WHERE cb.idContaBancaria='$idContaBancaria'";
		
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
	

    public function inserirContaBancaria($nome,$conta,$agencia,$observacoes,$idSituacao,$banco,$empresa){

        $sql = "insert into ContaBancaria (nome,conta,agencia,observacoes,idSituacao,banco,empresa)
                values('$nome','$conta','$agencia','$observacoes','$idSituacao','$banco','$empresa')";
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
	
	public function atualizarContaBancaria($idContaBancaria,$nome,$conta,$agencia,$observacoes,$idSituacao,$banco,$empresa){
		$sql = "update ContaBancaria set nome='$nome',conta='$conta',agencia='$agencia',observacoes='$observacoes',
                                         idSituacao='$idSituacao',banco='$banco',empresa='$empresa'
                        where idContaBancaria = '$idContaBancaria'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerContaBancaria($idContaBancaria){
		$sql = "delete from ContaBancaria where idContaBancaria = '$idContaBancaria'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
