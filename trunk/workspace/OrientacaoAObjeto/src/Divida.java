public class Divida {

	private String credor;
	private Cnpj cnpjCredor;
	private double total;
	private Pagamentos pagamentos = new Pagamentos();

	public Pagamentos getPagamentos() {
		return pagamentos;
	}

	public double getTotal() {
		return this.total;
	}
	
	public void setTotal(double total) {
		this.total = total;
	}

	public String getCredor() {
		return this.credor;
	}

	public Cnpj getCnpjCredor() {
		return this.cnpjCredor;
	}

	public void setCnpjCredor(Cnpj cnpjCredor) {
		this.cnpjCredor = cnpjCredor;
	}

	public void setCredor(String credor) {
		this.credor = credor;
	}

	public double valorAPagar() {
		return this.total - this.pagamentos.getValorPago();
	}
}