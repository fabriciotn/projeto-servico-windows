<?php
require_once('conexao.php');

class FornecedorDAO{
	private $con;

	public function FornecedorDAO(){
		$this->con = new Conexao();
	}
	
	public function getFornecedores($nome){
        $sql = "SELECT
                c.idFornecedor,
        		c.idSituacao,
        		c.nomeFantasia AS nomeFantasia,
        		c.razaoSocial,
        		c.cnpj,
        		c.contato,
        		c.endereco,
        		c.bairro,
        		c.cidade,
        		c.cep,
        		c.estado AS idEstado,
        		e.nome as estado,
        		c.telefone1,
        		c.telefone2,
        		c.celular,
        		c.email1,
        		c.email2,
        		c.observacoes,
        		s.nome AS nomeSituacao,
        		e.nome AS nomeEstado
        		FROM
        		fornecedor c
        		INNER JOIN situacaocliente s ON c.idSituacao = s.idsituacaoCliente
        		INNER JOIN estado e ON c.estado = e.idEstado
        		WHERE c.nomeFantasia LIKE '%$nome%' AND c.idSituacao = '1'
                ORDER BY c.nomeFantasia";
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
	
	
	public function getFornecedor($idFornecedor){
        $sql = "SELECT
        		c.idFornecedor,
        		c.idSituacao,
        		c.nomeFantasia AS nomeFantasia,
        		c.razaoSocial,
        		c.cnpj,
        		c.contato,
        		c.endereco,
        		c.bairro,
        		c.cidade,
        		c.cep,
        		c.estado AS idEstado,
        		e.nome as estado,
        		c.telefone1,
        		c.telefone2,
        		c.celular,
        		c.email1,
        		c.email2,
        		c.observacoes,
        		s.nome AS nomeSituacao
        		FROM
        		fornecedor c
        		INNER JOIN situacaocliente s ON c.idSituacao = s.idsituacaoCliente
        		INNER JOIN estado e ON c.estado = e.idEstado
        		WHERE c.idFornecedor = '$idFornecedor' AND c.idSituacao = '1'";
		
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
	

    public function inserirFornecedor($nomeFantasia,$razaoSocial,$cnpj,$contato,$endereco,$bairro,
                                      $cidade,$estado,$cep,$telefone1,$telefone2,$celular,$email1,$email2,$observacoes){
        $sql = "insert into fornecedor (nomeFantasia,razaoSocial,cnpj,contato,endereco,bairro,
                                      cidade,estado,cep,telefone1,telefone2,celular,email1,email2,observacoes,idSituacao)
                values('$nomeFantasia','$razaoSocial','$cnpj','$contato','$endereco','$bairro',
                                      '$cidade','$estado','$cep','$telefone1','$telefone2','$celular','$email1','$email2','$observacoes',1)";
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
	
	public function atualizarFornecedor($idFornecedor,$nomeFantasia,$razaoSocial,$cnpj,$contato,$endereco,$bairro,
                                         $cidade,$estado,$cep,$telefone1,$telefone2,$celular,$email1,$email2,$observacoes){
		$sql = "update fornecedor set nomeFantasia='$nomeFantasia',razaoSocial='$razaoSocial',cnpj='$cnpj',contato='$contato',
                                      endereco='$endereco',bairro='$bairro',cidade='$cidade',estado='$estado',cep='$cep',
                                      telefone1='$telefone1',telefone2='$telefone2',celular='$celular',email1='$email1',
                                      email2='$email2',observacoes='$observacoes'
                        where idFornecedor = '$idFornecedor'";
		$this->con->query($sql) ? $result=true : $result=false;
  $this->con->desconectar();
		return $result;
	}
	public function removerFornecedor($idFornecedor){
		$sql = "delete from fornecedor where idFornecedor = '$idFornecedor'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
