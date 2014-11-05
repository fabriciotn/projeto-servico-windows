<?php
require_once('conexao.php');

class ColetaDAO{
	private $con;

	public function ColetaDAO(){
		$this->con = new Conexao();
	}


	public function getItensColeta($idOrdemServico){
        $sql = "SELECT
                o.idOrdemServico,
                i.idItemColeta,
                date_format(i.dataCadastro,'%d/%m/%Y') AS dataCadastro,
                i.usuarioCadastro,
                date_format(i.dataAlteracao,'%d/%m/%Y') AS dataAlteracao,
                i.usuarioAlteracao,
                i.descricao,
                i.acessorios,
                i.defeitoRelatado,
                i.codigoBarras,
                i.numeroSerie,
                i.observacoes,
                i.servicoExecutado,
                i.funcionarioProducao,
                i.qdeRecargas,
                f.nome AS nomeFuncionario,
                fa.nome AS nomeFuncionarioAlteracao,
                date_format(i.dataProducao,'%d/%m/%Y') AS dataProducao,
                m.idMotoboy AS idMotoboyColeta,
                m.nome AS nomeMotoboyColeta,
                me.idMotoboy AS idMotoboyEntrega,
                me.nome AS nomeMotoboyEntrega
                FROM itemColeta i
                INNER JOIN funcionario f ON i.usuarioCadastro = f.idFuncionario
                INNER JOIN ordemservico o ON o.idOrdemServico = i.idOrdemServico
                LEFT JOIN funcionario fa ON i.usuarioAlteracao = fa.idFuncionario
                LEFT JOIN motoboy m ON o.idMotoboyColeta = m.idMotoboy
                LEFT JOIN motoboy me ON o.idMotoboyEntrega = me.idMotoboy
                WHERE o.idOrdemServico = '$idOrdemServico'
                ORDER BY descricao";
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
	
    public function atualizarColeta($idOrdemServico,$motoboyColeta,$motoboyEntrega,$status){
        $sql = "UPDATE ordemservico
    			SET  idMotoboyColeta = '$motoboyColeta'
    				,idMotoboyEntrega = '$motoboyEntrega'
    				,idStatus = '$status'
    				,dataColeta = NOW()
    			WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$sql = "UPDATE itemcoleta
		        SET idSetor = '$status'
				WHERE idOrdemServico = '$idOrdemServico'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}

    public function atualizarItemColeta($idItemColeta,$descricao,$acessorios,$defeitoRelatado,$codigoBarras,
                                             $numeroSerie,$observacoes,$qdeRecargas){
        $sql = "UPDATE itemcoleta SET descricao = '$descricao'
                					   ,acessorios = '$acessorios'
                					   ,defeitoRelatado = '$defeitoRelatado'
                					   ,numeroSerie = '$numeroSerie'
                					   ,codigoBarras = '$codigoBarras'
                					   ,observacoes = '$observacoes'
                					   ,qdeRecargas = '$qdeRecargas'
                					   ,usuarioAlteracao = '$codigoUsuario'
                					   ,dataAlteracao = NOW()
					WHERE idItemColeta = '$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function inserirItemColeta($idOrdemServico,$descricao,$acessorios,$defeitoRelatado,$codigoBarras,
                                             $numeroSerie,$observacoes,$qdeRecargas,$usuario){
        $sql = "INSERT INTO itemcoleta
					   (idOrdemServico
					   ,descricao
					   ,acessorios
					   ,defeitoRelatado
					   ,numeroSerie
					   ,codigoBarras
					   ,observacoes
					   ,qdeRecargas
					   ,usuarioCadastro
					   ,dataCadastro)
				 VALUES
					   ('$idOrdemServico'
					   ,'$descricao'
					   ,'$acessorios'
					   ,'$defeitoRelatado'
					   ,'$numeroSerie'
					   ,'$codigoBarras'
					   ,'$observacoes'
					   ,'$qdeRecargas'
					   ,'$usuario'
					   ,NOW())";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
        
        public function removerItemColeta($idItemColeta){
        $sql = "delete from itemcoleta where idItemColeta='$idItemColeta'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	

	
}
