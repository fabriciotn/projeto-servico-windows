<?php
require_once('conexao.php');

class EmpresaDAO{
	private $con;

	public function EmpresaDAO(){
		$this->con = new Conexao();
	}
	
	public function getEmpresas($nome){
       $sql = "SELECT
                    f.idLoja as idEmpresa,
            		f.situacao,
            		f.nome,
            		f.endereco,
            		f.bairro,
            		f.cidade,
            		f.cep,
            		f.estado AS idEstado,
            		f.telefone,
            		f.celular,
            		f.observacoes,
            		e.nome AS nomeEstado
        		FROM
        		    loja f
        		INNER JOIN estado e ON f.estado = e.idEstado
        		WHERE f.nome LIKE '%$nome%' AND f.situacao = '1'";

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
	
	
	public function getEmpresa($idEmpresa){
        $sql = "SELECT
                f.idLoja as idEmpresa,
        		f.situacao,
        		f.nome,
        		f.endereco,
        		f.bairro,
        		f.cidade,
        		f.cep,
        		f.estado AS idEstado,
        		f.telefone,
        		f.celular,
        		f.observacoes,
        		e.nome AS nomeEstado
        		FROM
        		loja f
        		INNER JOIN estado e ON f.estado = e.idEstado
        		WHERE f.idLoja = '$idEmpresa' AND f.situacao = '1'";
		
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
	

    public function inserirEmpresa($nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$situacao,$observacoes){

        $sql = "insert into loja (nome,endereco,bairro,cidade,estado,cep,telefone,celular,situacao,observacoes)
                values('$nome','$endereco','$bairro','$cidade','$estado','$cep','$telefone','$celular','$situacao','$observacoes')";
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
	
	public function atualizarEmpresa($idEmpresa,$nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$situacao,$observacoes){
		$sql = "update loja set nome='$nome',endereco='$endereco',bairro='$bairro',cidade='$cidade',estado='$estado',cep='$cep'
                                   ,telefone='$telefone',celular='$celular',situacao='$situacao',observacoes='$observacoes'
                        where idLoja = '$idEmpresa'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerEmpresa($idEmpresa){
		$sql = "delete from loja where idLoja = '$idEmpresa'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
