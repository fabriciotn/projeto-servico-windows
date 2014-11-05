<?php
require_once('conexao.php');

class ImpressoraDAO{
	private $con;

	public function ImpressoraDAO(){
		$this->con = new Conexao();
	}
	
	public function getImpressoras($marca,$patrimonio,$complemento){
       if($complemento)
         $complemento = " and situacao='À disposição' ";

       $sql = "SELECT
                    *
        		FROM
                    impressora
        		WHERE marca LIKE '%$marca%' and patrimonio LIKE '%$patrimonio%'
        		$complemento
                ORDER BY marca";

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
	
	public function getImpressorasLocacao($idLocacao,$mes,$ano){
         $sql = "select
     	       i.idImpressora,
               i.marca,
               i.modelo,
               i.numSerie,
               i.tipo_impressao,
               i.patrimonio,
               i.setor,
               i.tipo,
               dm.mes,
               dm.ano
               from impressora i
               RIGHT JOIN impressora_locacao il ON i.idImpressora=il.idImpressora
               LEFT JOIN dados_mensais_locacao dm on il.idImpressora = dm.idImpressora AND dm.mes='$mes' and dm.ano='$ano'
               where il.idLocacao = '$idLocacao'";

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
	
	
	public function getImpressora($idImpressora){
        $sql = "SELECT
                    *
        		FROM
                    impressora
        		WHERE idImpressora='$idImpressora'";
		
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
        
        public function getClienteImpressora($idImpressora){
        $sql = "SELECT nome, c.idCliente, @tipoCliente:='PF' as tipoCliente
	            FROM cliente c
	            INNER JOIN pessoafisica pf on c.idCliente = pf.idCliente and c.idCliente=(SELECT
       il.idLocacao
     FROM impressora i
     INNER JOIN impressora_locacao il on i.idImpressora = il.idImpressora
        		WHERE i.idImpressora='$idImpressora')
                UNION

                SELECT nomeFantasia as nome, c.idCliente,  @tipoCliente:='PJ' as tipoCliente
                FROM cliente c
                INNER JOIN pessoajuridica pj on c.idCliente = pj.idCliente and c.idCliente=(SELECT
       il.idLocacao
     FROM impressora i
     INNER JOIN impressora_locacao il on i.idImpressora = il.idImpressora
        		WHERE i.idImpressora='$idImpressora')";
		
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
	

    public function inserirImpressora($marca,$modelo,$patrimonio,$numSerie,$num_copias_inicial,
                                      $num_digit_Inicial,$tipo,$tipo_impressao,$situacao,$setor,$observacoes){

        $sql = "insert into impressora (marca,modelo,patrimonio,numSerie,num_copias_inicial,
                                        num_digit_Inicial,tipo,tipo_impressao,situacao,setor,observacoes)
                values('$marca','$modelo','$patrimonio','$numSerie','$num_copias_inicial',
                        '$num_digit_Inicial','$tipo','$tipo_impressao','$situacao','$setor','$observacoes')";
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
	
	public function atualizarImpressora($idImpressora,$marca,$modelo,$patrimonio,$numSerie,$num_copias_inicial,
                                        $num_digit_Inicial,$tipo,$tipo_impressao,$situacao,$setor,$observacoes){
		$sql = "update impressora set marca='$marca',modelo='$modelo',patrimonio='$patrimonio',numSerie='$numSerie',
                                      num_copias_inicial='$num_copias_inicial',num_digit_Inicial='$num_digit_Inicial',
                                      tipo='$tipo',tipo_impressao='$tipo_impressao',situacao='$situacao',setor='$setor',observacoes='$observacoes'
                        where idImpressora = '$idImpressora'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	
	public function inserirImpressoraLocacao($idImpressora,$idLocacao){
		$sql = "INSERT INTO impressora_locacao(idImpressora,idLocacao) values ('$idImpressora','$idLocacao')";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	
	public function atualizarStatus($idImpressora,$status){
		$sql = "UPDATE impressora SET situacao='$status' WHERE idImpressora='$idImpressora'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	
        public function removerImpressoraLocacao($idImpressora,$idLocacao){
		$sql = "delete from impressora_locacao where idImpressora = '$idImpressora' and idLocacao='$idLocacao'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
        public function removerImpressora($idImpressora){
		$sql = "delete from impressora where idLoja = '$idImpressora'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
