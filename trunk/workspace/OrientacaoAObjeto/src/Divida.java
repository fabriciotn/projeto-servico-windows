
public class Divida {

	private double valorTotalDaDivida;
	private double valorJaPago;
	String nomeDoCredor;
	String cnpjDoCredor;
	
	public double getValorTotalDaDivida() {
		return valorTotalDaDivida;
	}
	public void setValorTotalDaDivida(double valorTotalDaDivida) {
		this.valorTotalDaDivida = valorTotalDaDivida;
	}
	public String getNomeDoCredor() {
		return nomeDoCredor;
	}
	public void setNomeDoCredor(String nomeDoCredor) {
		this.nomeDoCredor = nomeDoCredor;
	}
	public String getCnpjDoCredor() {
		return cnpjDoCredor;
	}
	public void setCnpjDoCredor(String cnpjDoCredor) {
		this.cnpjDoCredor = cnpjDoCredor;
	}
	public double getValorJaPago() {
		return valorJaPago;
	}
	
	public void paga(double valor){
		valorJaPago += valor;
	}	
}