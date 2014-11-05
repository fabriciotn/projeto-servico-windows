<?php
require_once('conexao.php');

class ServicoDAO{
	private $con;

	public function ServicoDAO(){
		$this->con = new Conexao();
	}
	
	public function getServicos($idServico,$nome){
        $sql = "SELECT
                    idServico,
                    nome,
            		descricao,
            		preco,
            		situacao
        		FROM
                    servico
        		WHERE nome LIKE '%$nome%' ";

        if($idServico) $sql .= " and idServico = '$idServico' ";

        $sql .=" AND situacao NOT IN ('2','3')
                ORDER BY nome";
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

	public function getServico($idServico){
        $sql = "SELECT
                    idServico,
                    nome,
            		descricao,
            		preco,
            		situacao
        		FROM
                    servico
        		WHERE idServico = '$idServico'";
		
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
	

    public function inserirServico($nome,$descricao,$preco,$situacao){

        $sql = "insert into servico (nome,descricao,preco,situacao)
                values('$nome','$descricao','$preco','$situacao')";
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
	
	public function atualizarServico($idServico,$nome,$descricao,$preco,$situacao){
		$sql = "update servico set nome='$nome',descricao='$descricao',preco='$preco',situacao='$situacao'
                        where idServico = '$idServico'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerServico($idServico){
		$sql = "delete from servico where idServico = '$idServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
