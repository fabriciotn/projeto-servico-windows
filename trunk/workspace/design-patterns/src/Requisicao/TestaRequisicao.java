package Requisicao;

public class TestaRequisicao {

	public static void main(String[] args) {
		Conta c1 = new Conta("Fabricio", 1000.0);
		c1.deposita(200.0);
		
		OrdenadorDeRequisicoes ordenador = new OrdenadorDeRequisicoes();
		
	}
}
