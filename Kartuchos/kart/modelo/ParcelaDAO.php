<?php
require_once('conexao.php');

class ParcelaDAO{
	private $con;

	public function ParcelaDAO(){
		$this->con = new Conexao();
	}
	
	public function getPagamentosCliente($idCliente){
        $sql = "SELECT
                'Pagamento' AS tipo,
            	OS.idOrdemServico,
            	p.idParcela,
            	p.descricao,
            	p.valorBase,
            	p.multa,
            	p.juros,
            	(p.valorBase + p.multa + p.juros) AS valorTotal,
            	date_format(p.dataPrevistaPagamento, '%d/%m/%Y') AS dataPrevistaPagamento,
            	date_format(p.dataPagamento, '%d/%m/%Y - %H:%i:%s') AS dataPagamento,
            	p.notaFiscal,
            	s.idSituacaoParcela,
            	s.nome AS nomeStatus
            	FROM parcela p
            	INNER JOIN ordemservico os ON p.idOrdemServico = os.idOrdemServico
            	INNER JOIN situacaoparcela s ON p.idSituacaoParcela = s.idSituacaoParcela
            	INNER JOIN cliente c ON os.idCliente = c.idCliente
            	WHERE os.idCliente = '$idCliente' AND c.idSituacao NOT IN (3)
            	ORDER BY p.dataPagamento desc
            	limit 0,15";
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
	
	public function getResumoFinanceiro($i,$j){
        $sql = "SELECT * FROM (
		SELECT SUM(p.valorBase + p.juros + p.multa) AS valorPrevistoReceber
		FROM parcela p
		WHERE  p.dataPrevistaPagamento BETWEEN '".$i."-".$j."-"."01' AND '".$i."-".$j."-"."31' AND flgReceber = '1'
		) A,
		(
		SELECT SUM(p.valorBase + p.juros + p.multa) AS valorRecebido
		FROM parcela p
                WHERE  p.dataPagamento BETWEEN '".$i."-".$j."-"."01' AND '".$i."-".$j."-"."31' AND flgReceber = '1'
		) B,
		(
		SELECT SUM(p.valorBase + p.juros + p.multa) AS valorPrevistoPagar
		FROM parcela p
		WHERE  p.dataPrevistaPagamento BETWEEN '".$i."-".$j."-"."01' AND '".$i."-".$j."-"."31' AND flgReceber = '0'
		) C,
		(
		SELECT SUM(p.valorBase + p.juros + p.multa) AS valorPago
		FROM parcela p
		WHERE  p.dataPagamento BETWEEN '".$i."-".$j."-"."01' AND '".$i."-".$j."-"."31' AND flgReceber = '0'
		) D";
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
	
    public function getContasBancarias($idContaBancaria,$idBanco){
       $sql = "SELECT cb.idContaBancaria, b.nome AS nomeBanco, cb.nome AS nomeContaBancaria
	           FROM contabancaria cb
	           LEFT JOIN banco b ON cb.banco = b.idBanco
               WHERE cb.idContaBancaria LIKE '%$idContaBancaria%' AND b.idBanco LIKE '%$idBanco%'
	           ORDER BY b.nome, cb.nome";
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

    public function getTotalPago($idConta,$empresa){
        $sql = "SELECT SUM(p.valorBase) AS totalPago
	            FROM parcela p
				WHERE idContaBancaria = '$idConta' AND p.empresa LIKE '%$empresa%'
                      AND idSituacaoParcela = '2' AND flgReceber = '0'";
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
	
	public function getTotalRecebido($idConta,$empresa){
        $sql = "SELECT SUM(p.valorBase) AS totalRecebido
	            FROM parcela p
	            WHERE idContaBancaria = '$idConta' AND p.empresa LIKE '%$empresa%'
                      AND idSituacaoParcela = '2' AND flgReceber = '1'";
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
	
	public function getParcelasPagar($dataInicio,$dataTermino,$idContaBancaria,$classe,$subClasse){

    if($dataInicio and $dataTermino)
       $pData = " AND p.dataPrevistaPagamento BETWEEN '$dataInicio' AND '$dataTermino' ";
    else if ($dataInicio)
       $pData = " AND p.dataPrevistaPagamento > '$dataInicio' ";
    else if ($dataTermino)
       $pData = " AND p.dataPrevistaPagamento < '$dataTermino' ";
    else
       $pData = "";


        $sql = "SELECT
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.numBoleto,
                p.notaFiscal,
                p.empresa,
                e.nome as nomeEmpresa,               
                date_format(p.dataPrevistaPagamento,'%Y%m%d') AS dataPrevistaPagamentoS,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                p.observacoes,
                p.flgPatrimonio,
                p.flgDespesaFixa,
                p.idFornecedor,
                c.descricao as classe,
                sc.descricao as subclasse,
                sp.nome AS nomeSituacaoParcela,
                cb.idContaBancaria,
                cb.nome AS nomeContaBancaria,
                b.nome AS nomeBanco,
                fp.nome as formaPagamento
                FROM parcela p
                LEFT JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                LEFT JOIN contaBancaria cb ON p.idContaBancaria = cb.idContaBancaria
                LEFT JOIN formaPagamento fp ON p.idFormaPagamento = fp.idFormaPagamento
                LEFT JOIN banco b ON cb.banco = b.idBanco
                LEFT JOIN classe c ON c.idClasse = p.classe
                LEFT JOIN subClasse sc ON sc.idSubClasse = p.subClasse
                LEFT JOIN loja e ON e.idLoja = p.empresa
                WHERE p.idSituacaoParcela = '1'
                AND (p.dataPagamento IS NULL OR p.dataPagamento = '0000-00-00 00:00:00')
                $pData
                AND flgReceber = '0'
                AND cb.idContaBancaria LIKE '%$idContaBancaria%'
                AND p.classe LIKE '%$classe%'
                AND p.subclasse LIKE '%$subclasse%'
                ORDER BY p.dataPrevistaPagamento desc";
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
	
	public function getParcelasPagas($dataInicio,$dataTermino,$cliente){
        $sql = "SELECT * FROM (
                SELECT
                os.idOrdemServico,
                pj.nomeFantasia as nome,
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.notaFiscal,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                sp.nome AS nomeSituacaoParcela
                FROM parcela p
                LEFT JOIN ordemservico os ON p.idOrdemServico = os.idOrdemServico
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                LEFT JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                WHERE p.idSituacaoParcela = '2'
                AND p.dataPagamento BETWEEN '$dataInicio' AND '$dataTermino'
                AND flgReceber = '0' AND pj.nomeFantasia LIKE '$cliente%'

                UNION

                SELECT
                os.idOrdemServico,
                pf.nome,
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.notaFiscal,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                sp.nome AS nomeSituacaoParcela
                FROM parcela p
                LEFT JOIN ordemservico os ON p.idOrdemServico = os.idOrdemServico
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoafisica pf ON c.idCliente =pf.idCliente
                LEFT JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                WHERE p.idSituacaoParcela = '2'
                AND p.dataPagamento BETWEEN '$dataInicio' AND '$dataTermino'
                AND flgReceber = '0' AND pf.nome LIKE '$cliente%'
                )A
                ORDER BY dataPagamento";
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
	
	public function getParcelasReceber($dataInicio,$dataTermino,$contaBancaria,$cliente){
        
        if ($dataInicio and $dataTermino)
            $pData = " AND p.dataPrevistaPagamento BETWEEN '$dataInicio' AND '$dataTermino' ";
        else if ($dataInicio)
            $pData = " AND p.dataPrevistaPagamento > '$dataInicio' ";
        else if ($dataTermino)
            $pData = " AND p.dataPrevistaPagamento < '$dataTermino' ";
        else
            $pData = "";
            
            $sql = "SELECT
                os.idOrdemServico,
                os.idCliente,
                pf.nome as nomeCliente,
                pj.nomeFantasia as nomeCliente,
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.numBoleto,
                p.notaFiscal,
                p.empresa,
                e.nome as nomeEmpresa,
                date_format(p.dataPrevistaPagamento,'%Y%m%d') AS dataPrevistaPagamentoS,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                p.observacoes,
                sp.nome AS nomeSituacaoParcela,
                cb.idContaBancaria,
                cb.nome AS nomeContaBancaria,
                b.nome AS nomeBanco,
                fp.nome as formaPagamento
                FROM parcela p
                LEFT JOIN ordemservico os ON p.idOrdemServico = os.idOrdemServico
                LEFT JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                LEFT JOIN contaBancaria cb ON p.idContaBancaria = cb.idContaBancaria
                LEFT JOIN banco b ON cb.banco = b.idBanco
                LEFT JOIN loja e ON e.idLoja = p.empresa
                LEFT JOIN formaPagamento fp ON p.idFormaPagamento = fp.idFormaPagamento
                LEFT JOIN pessoafisica pf ON os.idCliente = pf.idCliente
    			LEFT JOIN pessoajuridica pj ON os.idCliente = pj.idCliente
                WHERE p.idSituacaoParcela = '1'
                AND (p.dataPagamento IS NULL OR p.dataPagamento = '0000-00-00 00:00:00')
                 $pData
                AND flgReceber = '1'
                AND cb.idContaBancaria LIKE '%$contaBancaria%'
                AND (pf.nome LIKE '%$cliente%' OR pj.nomeFantasia LIKE '%$cliente%')
                ORDER BY p.dataPrevistaPagamento desc";
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
	
	public function getParcelasRecebidas($dataInicio,$dataTermino,$contaBancaria,$cliente){
        $sql = "SELECT * FROM (
                SELECT
                os.idOrdemServico,
                pj.nomeFantasia as nomeCliente,
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.notaFiscal,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                sp.nome AS nomeSituacaoParcela
                FROM parcela p
                LEFT JOIN ordemservico os ON p.idOrdemServico = os.idOrdemServico
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoajuridica pj ON c.idCliente = pj.idCliente
                LEFT JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                WHERE p.idSituacaoParcela = '2'
                AND (p.dataPagamento IS NOT NULL AND p.dataPagamento <> '0000-00-00 00:00:00')
                AND p.dataPagamento BETWEEN '$dataInicio' AND '$dataTermino'
                AND flgReceber = '1' AND pj.nomeFantasia LIKE '$cliente%'

                UNION

                SELECT
                os.idOrdemServico,
                pj.nome as nomeCliente,
                p.idParcela,
                p.descricao,
                p.valorBase,
                p.juros,
                p.multa,
                p.notaFiscal,
                date_format(p.dataPrevistaPagamento,'%d/%m/%Y') AS dataPrevistaPagamento,
                date_format(p.dataPagamento,'%d/%m/%Y') AS dataPagamento,
                p.idSituacaoParcela,
                sp.nome AS nomeSituacaoParcela
                FROM parcela p
                LEFT JOIN ordemservico os ON p.idOrdemServico = os.idOrdemServico
                INNER JOIN cliente c ON os.idCliente = c.idCliente
                INNER JOIN pessoafisica pj ON c.idCliente = pj.idCliente
                LEFT JOIN situacaoparcela sp ON p.idSituacaoParcela = sp.idSituacaoParcela
                WHERE p.idSituacaoParcela = '3'
                AND (p.dataPagamento IS NOT NULL AND p.dataPagamento <> '0000-00-00 00:00:00')
                AND p.dataPagamento BETWEEN '$dataInicio' AND '$dataTermino'
                AND flgReceber = '1' AND pj.nome LIKE '$cliente%'
                )A
                ORDER BY dataPagamento";
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
	
	public function getDespesasFixas(){
       $sql = "SELECT
                p.idParcelaInicial,
                p.descricao,
                p.valor,
                p.diaVencimento,
                p.mesVencimento,
                p.anoInicio,
                p.empresa,
                e.nome as nomeEmpresa,    
                c.idClasse,
                c.descricao as classe,
                sc.idSubClasse,
                sc.descricao as subClasse,
                cb.idContaBancaria,
                cb.nome AS nomeContaBancaria,
                b.nome AS nomeBanco
                FROM despesafixa p           
                LEFT JOIN contaBancaria cb ON p.idContaBancaria = cb.idContaBancaria
                LEFT JOIN banco b ON cb.banco = b.idBanco
                LEFT JOIN classe c ON c.idClasse = p.classe
                LEFT JOIN subClasse sc ON sc.idSubClasse = p.subClasse
                LEFT JOIN loja e ON e.idLoja = p.empresa";
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
	
	public function inserirParcela($idOrdemServico,$idFornecedor, $usuario, $idFormaPagamento, $dataCriacao, $descricao, $valorBase,
                                   $dataPrevistaPagamento, $numBoleto, $notaFiscal, $idSituacaoParcela, $observacoes, $idContaBancaria,
                                   $flgReceber, $empresa, $classe, $subclasse, $flgDespesaFixa){

        $sql = "INSERT INTO parcela (idOrdemServico,idFornecedor, idUsuarioCriacao, idFormaPagamento, dataCriacao, descricao, valorBase,
                                     dataPrevistaPagamento, numBoleto, notaFiscal, idSituacaoParcela, observacoes, idContaBancaria,
                                     flgReceber, empresa, classe, subclasse, flgDespesaFixa)
			      VALUES ('$idOrdemServico','$idFornecedor', '$usuario','$idFormaPagamento', now(), '$descricao', '$valorBase', '$dataPrevistaPagamento',
                          '$numBoleto', '$notaFiscal', '$idSituacaoParcela', '$observacoes', '$idContaBancaria', '$flgReceber', '$empresa','$classe',
                          '$subclasse','$flgDespesaFixa')";
                          
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
	
        public function inserirDespesaFixa($idParcelaInicial,$diaVencimento, $mesVencimento, $anoInicio, $valor, $descricao, $empresa, 
                                           $classe, $subclasse,  $idContaBancaria){

        $sql = "INSERT INTO despesafixa (idParcelaInicial,diaVencimento, mesVencimento, anoInicio, valor, descricao, empresa, 
                                           classe, subclasse,  idContaBancaria)
			      VALUES ('$idParcelaInicial','$diaVencimento', '$mesVencimento', '$anoInicio', '$valor', '$descricao', '$empresa', 
                                      '$classe', '$subclasse',  '$idContaBancaria')";
                          
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
        
	public function atualizarParcela($idParcela,$descricao,$valorBase,$multa,$juros,$idContaBancaria, $idFormaPagamento,
                                                 $empresa,$dataPagamento,$dataPrevistaPagamento,$numBoleto,$notaFiscal,$idSituacaoParcela,$flgPatrimonio,$flgDespesaFixa,
                                                 $observacoes){

        $sql = "UPDATE parcela SET
					valorBase = '$valorBase',
					multa = '$multa',
					juros = '$juros',
					idContaBancaria = '$idContaBancaria',
					idFormaPagamento = '$idFormaPagamento',
					empresa = '$empresa',
					dataPagamento = '$dataPagamento',
                                        dataPrevistaPagamento = '$dataPrevistaPagamento',
					numBoleto = '$numBoleto',
					notaFiscal = '$notaFiscal',
					idSituacaoParcela = '$idSituacaoParcela',
					flgPatrimonio = '$flgPatrimonio',
					flgDespesaFixa = '$flgDespesaFixa',
					observacoes = '$observacoes'
				WHERE idParcela = '$idParcela'";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
        
        public function atualizarStatusParcela($idParcela,$dataPagamento,$idSituacaoParcela){

        $sql = "UPDATE parcela SET dataPagamento = '$dataPagamento', idSituacaoParcela = '$idSituacaoParcela' WHERE idParcela = '$idParcela'";
		$this->con->conectar();
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
	
	public function removerDespesaFixa($idDespesaFixa){
		$sql = "delete from despesafixa where idDespesaFixa = '$idDespesaFixa'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
