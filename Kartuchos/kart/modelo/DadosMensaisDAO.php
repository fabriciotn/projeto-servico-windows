<?php
require_once('conexao.php');

class DadosMensaisDAO{
	private $con;

	public function DadosMensaisDAO(){
		$this->con = new Conexao();
	}
	
	
        
        public function getDadosMensaiss($marca){
       $sql = "SELECT
                    *
        		FROM
                    DadosMensais
        		WHERE marca LIKE '%$marca%'
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
	
	
	public function getRegistoAnterior($idImpressora,$mes,$ano){
        
        $mes = $mes-1;
        
        $sql = "SELECT
                MAX(total_copias_absoluto) as total_copias_absoluto,
                MAX(total_digit_absoluto) as total_digit_absoluto
		FROM
                dados_mensais_locacao
		WHERE idImpressora = '$idImpressora' AND mes = '$mes' AND ano <= '$ano'";
		
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
        
        public function getDadosMensais($idLocacao,$idImpressora,$mes,$ano){
        $sql = "SELECT idDadosMensaisLocacao,
               total_digit_absoluto, total_digit_absoluto_anterior, total_digit, total_digit_excedentes,
               total_copias_absoluto, total_copias_absoluto_anterior, total_copias, total_coloridas,  total_copias_excedentes,total_coloridas_excedentes,
               valor_total, observacoes
		FROM
                dados_mensais_locacao
		WHERE idLocacao = '$idLocacao' and idImpressora = '$idImpressora' and mes='$mes' and ano='$ano'";
		
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
        
        public function getLocacoesMensais($idLocacao){
        $sql = "select
                    i.idImpressora,
                    i.marca,
                    i.modelo,
                    i.numSerie,
                    i.patrimonio,
                    i.setor,
                    i.tipo,
                    i.tipo_impressao,
                    dm.idDadosMensaisLocacao,
                    dm.mes,
                    dm.ano,
                    dm.total_copias_absoluto_anterior,
                    dm.total_copias_absoluto,
                    dm.total_copias,
                    dm.total_coloridas, 
                    dm.total_digit,
                    dm.valor_total,                    
                    date_format(dm.envioFaturamento, '%d/%m/%Y') AS envioFaturamento
                from impressora i, dados_mensais_locacao dm
                where i.idImpressora=dm.idImpressora and dm.idLocacao = '$idLocacao'
                order by ano desc, mes desc";
		
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
        
        public function getLocacoesMensaisAfericao($idLocacao,$mes,$ano){
        $sql = "select
                    i.idImpressora,
                    i.marca,
                    i.modelo,
                    i.numSerie,
                    i.patrimonio,
                    i.setor,
                    i.tipo,
                    i.tipo_impressao,
                    dm.idDadosMensaisLocacao,
                    dm.mes,
                    dm.ano,
                    dm.total_copias_absoluto_anterior,
                    dm.total_copias_absoluto,
                    dm.total_copias,
                    dm.total_coloridas, 
                    dm.total_digit,
                    dm.valor_total,                    
                    date_format(dm.envioFaturamento, '%d/%m/%Y') AS envioFaturamento
                from impressora i, dados_mensais_locacao dm
                where i.idImpressora=dm.idImpressora and dm.idLocacao = '$idLocacao' and dm.mes='$mes' and dm.ano='$ano'
                order by ano desc, mes desc";
		
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
        
        public function getLocacoesMensaisMes($idLocacao,$idImpressora,$mes,$ano){
        
            $sql = "select
                    i.idImpressora,
                    i.marca,
                    i.modelo,
                    i.numSerie,
                    i.patrimonio,
                    i.tipo,
                    i.tipo_impressao,
                    dm.idDadosMensaisLocacao,
                    dm.mes,
                    dm.ano,
                    dm.total_copias_absoluto_anterior,
                    dm.total_copias_absoluto,
                    dm.total_copias,
                    dm.total_coloridas, 
                    dm.total_digit,
                    dm.valor_total,                    
                    date_format(dm.envioFaturamento, '%d/%m/%Y') AS envioFaturamento
                from impressora i, dados_mensais_locacao dm
                where i.idImpressora=dm.idImpressora and NOT i.idImpressora = '$idImpressora' and dm.idLocacao = '$idLocacao' and dm.mes='$mes' and dm.ano='$ano'
                order by ano desc, mes desc";
		
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
	

    public function inserirDadosMensais($idLocacao,$idImpressora,$total_copias_absoluto_anterior,$total_copias_absoluto,$total_copias,$total_coloridas,
                                   $total_digit_absoluto_anterior,$total_digit_absoluto,$total_digit,$total_copias_excedentes,$total_coloridas_excedentes,
                                   $total_digit_excedentes,$observacoes,$valor_total,$mes,$ano){

        $sql = "INSERT INTO dados_mensais_locacao
                    (idLocacao
                    ,idImpressora
                    ,total_copias_absoluto_anterior
                            ,total_copias_absoluto
                            ,total_copias
                            ,total_coloridas
                            ,total_digit_absoluto_anterior
                            ,total_digit_absoluto
                            ,total_digit
                            ,total_copias_excedentes
                            ,total_coloridas_excedentes
                            ,total_digit_excedentes
                            ,observacoes
                            ,valor_total
                            ,data
                            ,mes
                    ,ano)
              VALUES
                    ('$idLocacao'
                    ,'$idImpressora'
                    ,'$total_copias_absoluto_anterior'
                    ,'$total_copias_absoluto'
                    ,'$total_copias'
                    ,'$total_coloridas'    
                    ,'$total_digit_absoluto_anterior'
                    ,'$total_digit_absoluto'
                    ,'$total_digit'
                    ,'$total_copias_excedentes'
                    ,'$total_coloridas_excedentes'
                    ,'$total_digit_excedentes'
                    ,'$observacoes'
                    ,'$valor_total'
                    ,NOW()
                    ,'$mes'
                    ,'$ano')";
        $this->con->conectar();
        $this->con->query($sql) ? $result=true : $result=false;
        $sql = "UPDATE dados_mensais_locacao SET valor_total = '$valor_total'
                WHERE idlocacao='$idLocacao' AND mes='$mes' AND ano='$ano'";
        $this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	
	public function atualizarDadosMensais($idDadosMensaisLocacao,$idLocacao,$idImpressora,$total_copias_absoluto_anterior,$total_copias_absoluto,$total_copias,$total_coloridas,
                                   $total_digit_absoluto_anterior,$total_digit_absoluto,$total_digit,$total_copias_excedentes,$total_coloridas_excedentes,
                                   $total_digit_excedentes,$observacoes,$valor_total,$mes,$ano){
		$sql = "UPDATE dados_mensais_locacao
                        SET total_copias_absoluto_anterior='$total_copias_absoluto_anterior',
                            total_copias_absoluto='$total_copias_absoluto',
                            total_copias='$total_copias',
                            total_coloridas='$total_coloridas',
                            total_digit_absoluto_anterior='$total_digit_absoluto_anterior',
                            total_digit_absoluto='$total_digit_absoluto',
                            total_digit='$total_digit',
                            total_copias_excedentes='$total_copias_excedentes',
                            total_coloridas_excedentes='$total_coloridas_excedentes',    
                            total_digit_excedentes='$total_digit_excedentes',
                            observacoes='$observacoes',
                            valor_total='$valor_total',
                            data=NOW()
                        WHERE idDadosMensaisLocacao='$idDadosMensaisLocacao'
                              AND idImpressora='$idImpressora'
                              AND mes='$mes'
                              AND ano='$ano'";
        $this->con->conectar();
        $this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	
	public function atualizaValorTotalMes($idLocacao,$mes,$ano,$valor_total){
		$sql = "UPDATE dados_mensais_locacao SET valor_total='$valor_total'
                        WHERE idLocacao='$idLocacao'
                              AND mes='$mes'
                              AND ano='$ano'";
        $this->con->conectar();
        $this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
        
        public function InformaEnvioFaturamento($idLocacao,$mes,$ano){
		$sql = "UPDATE dados_mensais_locacao
                        SET envioFaturamento=NOW()
                        WHERE idLocacao='$idLocacao'                              
                              AND mes='$mes'
                              AND ano='$ano'";
        $this->con->conectar();
        $this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerDadosMensais($idDadosMensais){
		$sql = "delete from DadosMensais where idDadosMensais = '$idDadosMensais'";
        $this->con->conectar();
        $this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
