import java.util.HashMap;

public class BalancoEmpresa {
	private HashMap<String, Divida> dividas = new HashMap<String, Divida>();

	public void registraDivida(Divida divida) {
		dividas.put(divida.getCnpjCredor().getCnpjCredor(), divida);
	}

	public void pagaDivida(String cnpj, Pagamento pagamento) {
		Divida divida = dividas.get(cnpj);
		if (divida != null) {
			divida.getPagamentos().registra(pagamento);
		}
	}
}