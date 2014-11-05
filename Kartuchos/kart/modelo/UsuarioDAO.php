<?php
require_once('conexao.php');

class UsuarioDAO{
	private $con;

	public function UsuarioDAO(){
		$this->con = new Conexao();
	}
    public function verificarLogin($login,$senha){
        $senha = md5($senha);
        $sql = "SELECT * from funcionario where usuario='$login' and senha='$senha';";
		$this->con->conectar();
		$this->con->query($sql);
		if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		}
		else return false;
	}

    public function getSenha($cod){
        $senha = md5($senha);
        $sql = "SELECT senha from funcionario where idFuncinario='$cod'";
		$this->con->conectar();
		$this->con->query($sql);
		if($this->con->numRows()==1){
             return $this->con->getResult(0,'senha');
		}
		else return false;
	}
	
	public function getItemUsuario($idFuncionario){
        $sql = "select                         		c.idCliente,
                    		pf.nome,
                    		pf.cpf AS cpfCnpj
                    	  from cliente c
                    		inner join pessoafisica pf on c.idCliente = pf.idCliente
                            inner join Usuarioitemcliente aei on c.idCliente=aei.idCliente
                    	  where

                          aei.idFuncionario='$idFuncionario'  and c.idSituacao = '1'

                          union

                          select
                    		c.idCliente,
                    		pj.nomeFantasia AS nome,
                    		pj.cnpj AS cpfCnpj
                    	  from cliente c
                    		inner join pessoajuridica pj on c.idCliente = pj.idCliente
                    		inner join Usuarioitemcliente aei on c.idCliente=aei.idCliente
                    	  where

                          aei.idFuncionario='$idFuncionario' and c.idSituacao NOT IN ('3')
                    		order by nome";
		$this->con->conectar();
		$this->con->query($sql);
		if($this->con->numRows()>0){
			$linhas = array();
			$linhas = $this->con->getArrayResult();
			return $linhas;
		}
		else return false;
	}
	
	public function atualizarSenha($cod,$senhaNova){
        $sql = "update funcionario set senha='$senhaNova' where idFuncionario='$cod'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
