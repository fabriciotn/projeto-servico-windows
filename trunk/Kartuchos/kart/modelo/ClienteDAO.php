<?php
require_once('conexao.php');

class ClienteDAO{
	private $con;

	public function ClienteDAO(){
		$this->con = new Conexao();
	}

    public function getClientes($nome){
        $sql = "
                SELECT nome, c.idCliente, @tipoCliente:='PF' as tipoCliente
	            FROM cliente c
	            INNER JOIN pessoafisica pf on c.idCliente = pf.idCliente
	            WHERE nome LIKE '%$nome%'

                UNION

                SELECT nomeFantasia as nome, c.idCliente,  @tipoCliente:='PJ' as tipoCliente
                FROM cliente c
                INNER JOIN pessoajuridica pj on c.idCliente = pj.idCliente
                WHERE nomeFantasia LIKE '%$nome%'
                ORDER BY nome
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
	
	public function getClientesLocacao($nome){
        $sql = "select
                c.idCliente,
                pf.nome,
                @tipoCliente:='PF' as tipoCliente
                from cliente c
                inner join pessoafisica pf on c.idCliente = pf.idCliente
                inner join locacao l on c.idCliente = l.idLocacao
                where pf.nome like '%$nome%' and c.idSituacao = '1'

                union

		        select
                c.idCliente,
                pj.nomeFantasia AS nome,
                @tipoCliente:='PJ' as tipoCliente
                from cliente c
                inner join pessoajuridica pj on c.idCliente = pj.idCliente
                inner join locacao l on c.idCliente = l.idLocacao
                where pj.nomeFantasia like '%$nome%' and c.idSituacao NOT IN ('3')
                order by nome";
                
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
	
	public function getNome($idCliente){
        $sql = "
                SELECT nome
	            FROM cliente c
	            INNER JOIN pessoafisica pf on c.idCliente = pf.idCliente
	            WHERE c.idCliente = $idCliente

                UNION

                SELECT nomeFantasia as nome
                FROM cliente c
                INNER JOIN pessoajuridica pj on c.idCliente = pj.idCliente
                WHERE c.idCliente = $idCliente
               ";
            $this->con->conectar();
            $this->con->query($sql);
            if($this->con->numRows()==1)
             return $this->con->getResult(0,'nome');
            else return false;
	}

    public function getClientePF($idCliente){
        $sql = "
                SELECT
                c.idCliente,
        		c.idSituacao as situacao,
        		pf.nome AS nome,
        		pf.cpf,
        		c.endereco,
        		c.bairro,
        		c.cidade,
        		c.cep,
        		c.estado AS idEstado,
        		c.telefone,
        		c.celular,
        		c.email,
        		c.observacoes,
        		s.nome AS nomeSituacao,
        		e.nome AS estado,
        		f.idFuncionario AS idVendedor,
        		f.nome AS vendedor
        		FROM
        		cliente c
        		INNER JOIN pessoafisica pf ON pf.idCliente = c.idCliente
        		INNER JOIN situacaocliente s ON c.idSituacao = s.idsituacaoCliente
        		INNER JOIN estado e ON c.estado = e.idEstado
        		LEFT JOIN funcionario f ON c.idvendedor = f.idFuncionario
        		WHERE c.idCliente = '$idCliente'

               ";
		$this->con->conectar();
		$this->con->query($sql);
        if($this->con->numRows()==1){
            return $this->con->getUniqResult();
		}
		else return false;
	}
	
	public function getClientePJ($idCliente){
        $sql = "
                SELECT
        		c.idCliente,
        		c.idSituacao as situacao,
        		pf.nomeFantasia AS nomeFantasia,
        		pf.razaoSocial,
        		pf.cnpj,
        		pf.responsavel,
                        pf.inscricaoMunicipal,
        		pf.inscricaoEstadual,
        		pf.retencaoISS,
        		pf.limiteCredito,
        		c.endereco,
        		c.bairro,
        		c.cidade,
        		c.cep,
        		c.estado AS idEstado,
        		c.telefone,
        		c.celular,
        		c.email,
        		c.observacoes,
        		s.nome AS nomeSituacao,
        		e.nome AS estado,
        		f.idFuncionario AS idVendedor,
        		f.nome AS vendedor
        		FROM
        		cliente c
        		INNER JOIN pessoajuridica pf ON pf.idCliente = c.idCliente
        		INNER JOIN situacaocliente s ON c.idSituacao = s.idsituacaoCliente
        		INNER JOIN estado e ON c.estado = e.idEstado
        		LEFT JOIN funcionario f ON c.idvendedor = f.idFuncionario
        		WHERE c.idCliente = '$idCliente'

               ";
		$this->con->conectar();
		$this->con->query($sql);
        if($this->con->numRows()==1){
            return $this->con->getUniqResult();
		}
		else return false;
	}
	
	
	public function atualizarCliente($idCliente,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$vendedor,$situacao,$observacoes){
		$sql = "UPDATE cliente SET endereco = '$endereco',bairro = '$bairro',cidade = '$cidade',estado = '$estado',cep = '$cep',telefone = '$telefone'
                                   ,celular = '$celular',email = '$email',idSituacao = '$situacao',observacoes = '$observacoes',idVendedor = '$vendedor'
		        WHERE idCliente = '$idCliente'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}

	public function inserirCliente($endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,$vendedor,$situacao,$observacoes){
		$sql = "INSERT INTO cliente(endereco,bairro,cidade,estado,cep,telefone,celular,email,idSituacao,observacoes,idVendedor)
                VALUES('$endereco','$bairro','$cidade','$estado','$cep','$telefone','$celular','$email','$situacao','$observacoes','$vendedor')";
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
	
	public function atualizarPessoaFisica($idCliente,$nome,$cpf){
		$sql = "UPDATE pessoafisica SET nome = '$nome', cpf = '$cpf' WHERE idCliente = '$idCliente'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function atualizarPessoaJuridica($idCliente,$nomeFantasia,$cnpj,$razaoSocial,$responsavel,$inscricaoMunicipal,$inscricaoEstadual,$retencaoISS,$limiteCredito){
		$sql = "UPDATE pessoajuridica SET nomeFantasia = '$nomeFantasia', cnpj = '$cnpj',
		               razaoSocial = '$razaoSocial', responsavel = '$responsavel',
                       inscricaoMunicipal = '$inscricaoMunicipal', inscricaoEstadual = '$inscricaoEstadual',retencaoISS = '$retencaoISS',limiteCredito = '$limiteCredito'
                WHERE idCliente = '$idCliente'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function inserirPessoaFisica($idCliente,$nome,$cpf){
		$sql = "INSERT INTO pessoafisica (idCliente, cpf, nome) VALUES ('$idCliente', '$cpf', '$nome')";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}

	public function inserirPessoaJuridica($idCliente,$nomeFantasia,$cnpj,$razaoSocial,$responsavel,$inscricaoMunicipal,$inscricaoEstadual,$retencaoISS,$limiteCredito){
		$sql = "INSERT INTO pessoajuridica (idCliente, cnpj, nomeFantasia, razaoSocial, responsavel,inscricaoMunicipal,inscricaoEstadual,retencaoISS,limiteCredito)
		        VALUES ('$idCliente', '$cnpj', '$nomeFantasia', '$razaoSocial', '$responsavel' ,'$inscricaoMunicipal','$inscricaoEstadual','$retencaoISS','$limiteCredito')";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
}
