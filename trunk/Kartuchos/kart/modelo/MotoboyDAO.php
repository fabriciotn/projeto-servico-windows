<?php
require_once('conexao.php');

class MotoboyDAO{
	private $con;

	public function MotoboyDAO(){
		$this->con = new Conexao();
	}
	
	public function getMotoboys($nome){
       $sql = "SELECT
                idMotoboy,
        		nome,
        		endereco,
        		telefone,
        		celular,
        		observacoes,
        		situacao
     		   FROM
        		motoboy
        	   WHERE nome LIKE '%$nome%'";

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
	
	
	public function getMotoboy($idMotoboy){
        $sql = "SELECT
        		idMotoboy,
        		nome,
        		endereco,
        		telefone,
        		celular,
        		observacoes,
        		situacao
        		FROM
        		motoboy
        		WHERE idMotoboy = '$idMotoboy'";
		
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
	

    public function inserirMotoboy($nome,$endereco,$telefone,$celular,$situacao,$observacoes){

        $sql = "insert into motoboy (nome,endereco,telefone,celular,situacao,observacoes)
                values('$nome','$endereco','$telefone','$celular','$situacao','$observacoes')";
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
	
	public function atualizarMotoboy($idMotoboy,$nome,$endereco,$telefone,$celular,$situacao,$observacoes){
		$sql = "update motoboy set nome='$nome',endereco='$endereco',telefone='$telefone',celular='$celular',
                                situacao='$situacao',observacoes='$observacoes'
                        where idMotoboy = '$idMotoboy'";
		$this->con->query($sql) ? $result=true : $result=false;
        $this->con->desconectar();
		return $result;
	}
	public function removerMotoboy($idMotoboy){
		$sql = "delete from motoboy where idMotoboy = '$idMotoboy'";
		$this->con->query($sql) ? $result=true : $result=false;
		$this->con->desconectar();
		return $result;
	}
}
