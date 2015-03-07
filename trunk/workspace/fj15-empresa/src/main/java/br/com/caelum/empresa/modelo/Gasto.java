package br.com.caelum.empresa.modelo;

import java.util.Calendar;

public class Gasto {
	private double valor;
	private String tipo;
	private Funcionario funcionario;
	private Calendar data;
	boolean pgtoEmDinheiro;
	
	public Gasto(double valor, String tipo, Funcionario funcionario,
			Calendar data, boolean pgtoEmDinheiro) {
		super();
		this.valor = valor;
		this.tipo = tipo;
		this.funcionario = funcionario;
		this.data = data;
		this.pgtoEmDinheiro = pgtoEmDinheiro;
	}

	@Override
	public String toString() {
		return "Gasto [tipo=" + tipo + ", data=" + data + "]";
	}
	
	
}
