<?php
require_once('conexao.php');

class FuncionarioDAO{
	private $con;

	public function FuncionarioDAO(){
		$this->con = new Conexao();
	}
	
	public function getFuncionarios($nome){
        $sql = "SELECT
                f.idFuncionario,
        		f.idSituacao,
        		f.idFuncao,
        		f.nome AS nomeFuncionario,
        		f.endereco,
        		f.bairro,
        		f.cidade,
        		f.cep,
        		f.estado AS idEstado,
        		f.telefone,
        		f.celular,
        		f.email,
        		f.observacoes,
        		f.usuario,
        		f.senha,
        		fu.nome AS nomeFuncao,
        		s.nome AS nomeSituacao,
        		e.nome AS nomeEstado,
        		p.idPerfil,
        		p.nome as nomePerfil,
        		l.idLoja,
        		l.nome as nomeLoja
        		FROM
        		funcionario f
        		LEFT JOIN funcao fu ON f.idFuncao = fu.idFuncao
        		LEFT JOIN situacaofuncionario s ON f.idSituacao = s.idSituacaoFuncionario
        		LEFT JOIN estado e ON f.estado = e.idEstado
        		LEFT JOIN perfil p ON f.idPerfil = p.idPerfil
        		LEFT JOIN loja l ON f.idLoja = l.idLoja
        		WHERE f.nome LIKE '%$nome%' AND f.idSituacao = '1'
                ORDER BY f.nome";
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
        
        public function getMenu($idFuncionario){
          $sql = "SELECT * FROM menu
                WHERE idMenu IN
		(SELECT im.idMenu FROM itemMenu im
		INNER JOIN funcionarioItemMenu fim ON im.idItemMenu = fim.idItemMenu 
		WHERE idFuncionario = '$idFuncionario')";
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
	
	public function getPermissoes(){
        $sql = "SELECT * from itemmenu";
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
	
        public function verificaItemMenu($idItemMenu,$idFuncionario){
         $sql = "SELECT privilegio FROM funcionarioitemmenu WHERE idItemMenu='$idItemMenu' and idFuncionario='$idFuncionario'";
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
        
        public function verificaAlteracaoItemMenu($idItemMenu,$idFuncionario){
         $sql = "SELECT privilegio FROM funcionarioitemmenu WHERE idItemMenu='$idItemMenu' and idFuncionario='$idFuncionario' and privilegio=1";
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
        
	public function getFuncionario($idFuncionario){
        $sql = "SELECT
                f.idFuncionario,
        		f.idSituacao,
        		f.idFuncao,
        		f.nome AS nomeFuncionario,
        		f.endereco,
        		f.bairro,
        		f.cidade,
        		f.cep,
        		f.estado AS idEstado,
        		e.nome as estado,
        		f.telefone,
        		f.celular,
        		f.email,
        		f.observacoes,
        		f.usuario,
        		f.senha,
        		fu.nome AS nomeFuncao,
        		s.nome AS nomeSituacao,
        		e.nome AS nomeEstado,
        		p.idPerfil,
        		p.nome as nomePerfil,
        		l.idLoja,
        		l.nome as loja
        		FROM
        		funcionario f
        		LEFT JOIN funcao fu ON f.idFuncao = fu.idFuncao
        		LEFT JOIN situacaofuncionario s ON f.idSituacao = s.idSituacaoFuncionario
        		LEFT JOIN estado e ON f.estado = e.idEstado
        		LEFT JOIN perfil p ON f.idPerfil = p.idPerfil
        		LEFT JOIN loja l ON f.idLoja = l.idLoja
        		WHERE f.idFuncionario = $idFuncionario";
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
	
	public function getPermissoesFuncionarios($idFuncionario){
        $sql = "SELECT id.iditemmenu, m.idmenu, id.nome as itemMenu, m.nome as menu,  2 as privilegio
                FROM itemmenu id, menu m
                where id.idmenu=m.idmenu and id.idItemMenu not in (select idItemMenu from funcionarioitemmenu where idfuncionario=$idFuncionario)

                UNION

                SELECT id.iditemmenu, m.idmenu, id.nome as itemMenu, m.nome as menu,  privilegio
                FROM funcionarioitemmenu f, itemmenu id, menu m
                where id.idmenu=m.idmenu and f.iditemmenu=id.iditemmenu and f.idfuncionario=$idFuncionario order by idmenu, iditemmenu";
                
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

    public function inserirFuncionario($nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,
                                       $usuario,$senha,$loja,$observacoes){
        $senha = md5($senha);
        $sql = "insert into funcionario (nome,endereco,bairro,cidade,estado,cep,telefone,celular,email,
                                         usuario,senha,idLoja,observacoes,idSituacao)
                values('$nome','$endereco','$bairro','$cidade','$estado','$cep','$telefone','$celular','$email',
                       '$usuario','$senha','$loja','$observacoes',1)";
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

	public function atualizarFuncionario($idFuncionario,$nome,$endereco,$bairro,$cidade,$estado,$cep,$telefone,$celular,$email,
                                         $usuario,$senha,$loja,$observacoes){
		$sql = "update funcionario set nome='$nome', endereco='$endereco',bairro='$bairro',cidade='$cidade',estado='$estado',cep='$cep',
                                       telefone='$telefone',celular='$celular',
                                       email='$email',usuario='$usuario',senha='$senha',idLoja='$loja',observacoes='$observacoes'
                        where idFuncionario = '$idFuncionario'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function inserirPermissoes($idFuncionario,$idItemMenu,$privilegio){
		$sql = "insert into funcionarioItemMenu(idFuncionario,idItemmenu,privilegio) values('$idFuncionario','$idItemMenu','$privilegio')";
		$this->con->query($sql) ? $result=true : $result=false;
		//$this->con->desconectar();
		return $result;
	}

	public function removerFuncionario($idFuncionario){
		$sql = "delete from funcionario where idFuncionario = '$idFuncionario'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function removerPermissoes($idFuncionario){
		$sql = "delete from funcionarioItemMenu where idFuncionario = '$idFuncionario'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
