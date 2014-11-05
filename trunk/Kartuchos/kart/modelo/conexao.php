<?php
	class Conexao{
        private $host = "localhost";
		private $user = "kartuchos";
		private $pass = "manutencao";
		private $database = "homologacao";
		private $result;		
		private $conexao;
		
		public function conectar(){
			if(!$this->conexao)
				$this->conexao = @mysql_connect($this->host,$this->user,$this->pass);				
				if(!$this->conexao){
					echo "Erro na Conexão.<br><b>MySQL : </b> ".mysql_error()."<br>";
					die();
				}
				else{
					if(!mysql_select_db($this->database,$this->conexao)){
						echo "Erro ao selecionar database.<br><b>MySQL : </b> ".mysql_error()."<br>";
						die();
					}
				}
			return $this->conexao;
		}
		
		public function query($sql){
            //echo "<BR>".$sql;
            $this->conectar();
			$this->result =  mysql_query($sql);
			return $this->result;
		}
		
		public function numRows(){
			if(!empty($this->result)){				
				return mysql_num_rows($this->result);
			}
			return false;
		}
		
		public function affectedRows(){
			if(!empty($this->result)){				
				return mysql_affected_rows();
			}
			return false;
		}
		
		public function getResult($indice,$atributo){
			return mysql_result($this->result,$indice,$atributo);
		}
		/*
		* $linhas[i].nomegrupo
		*/
		public function getArrayResult(){
			$linhas = false;
			if($this->result){
				$linhas = array();
				while ($row = mysql_fetch_array($this->result)) {				
					$linhas[] = $row;
				}			
			}
			return $linhas;
		}
		public function getUniqResult(){
			if($this->result){
				return $dados = mysql_fetch_array($this->result);
			}
			return false;
		}
		
		public function desconectar(){
			if($this->conexao!=false)
				mysql_close($this->conexao);
			$this->conexao = false;
		}
		
		public function getError(){
			if(mysql_error())echo "<p><b>Erro:</b> ".mysql_error()."</p>";
		}
		public function escapeString($str){
			return mysql_real_escape_string($str);
		}
		public function test(){
			echo ":)";
		}
	}
