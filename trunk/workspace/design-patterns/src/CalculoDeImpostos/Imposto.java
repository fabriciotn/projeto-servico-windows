package CalculoDeImpostos;

public abstract class Imposto {

	protected Imposto outroImposto;
	
	public Imposto(Imposto ouutroImposto){
		this.outroImposto = ouutroImposto;
	}
	
	public Imposto() {
		this.outroImposto = null;
	}
	
	public abstract double calcula(Orcamento orcamento);
	
	protected double calculoDoOutroImposto(Orcamento orcamento) {
		if(outroImposto == null){
			return 0;
		}
		return outroImposto.calcula(orcamento);
	}
}
