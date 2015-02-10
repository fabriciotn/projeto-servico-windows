package Descontos;

import CalculoDeImpostos.Orcamento;

public class Aprovado implements EstadoDeUmOrcamento {

	private boolean descontoAplicado = false;

	public void aplicaDescontoExtra(Orcamento orcamento) {
		if (!descontoAplicado) {
			orcamento.valor -= orcamento.valor * 0.02;
			descontoAplicado = true;
		} else {
			throw new RuntimeException("Desconto j� aplicado!");
		}
	}

	@Override
	public void aprova(Orcamento orcamento) {
		throw new RuntimeException("Or�amento j� aprovado!");
	}

	@Override
	public void reprova(Orcamento orcamento) {
		throw new RuntimeException(
				"Or�amento aprovados n�o podem ser reprovados!");
	}

	@Override
	public void finaliza(Orcamento orcamento) {
		orcamento.estadoAtual = new Finalizado();
	}
}
