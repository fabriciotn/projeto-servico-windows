import java.util.HashMap;


public class BalancoEmpresa {

	private HashMap<String, Divida> dividas = new HashMap<String, Divida>();
	
	public void criaDivida(String credor, String cnpjCredor, double valor){
		Divida divida = new Divida();
		divida.setCnpjDoCredor(credor);
		divida.setCnpjDoCredor(cnpjCredor);
		divida.setValorTotalDaDivida(valor);
		
		dividas.put(cnpjCredor, divida);
	}
	
	public void pagaDivida(String cnpjCredor, double valor){
		Divida divida = dividas.get(cnpjCredor);
		if(divida != null){
			divida.paga(valor);
		}
	}
}
