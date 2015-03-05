package br.com.caelum.empresa.modelo;

import java.util.Calendar;

public class Gasto {
	private double valor;
	private String tipo;
	private Funcionario funcionario;
	private Calendar data;
	boolean pgtoEmDinheiro;
	
	public boolean isPgtoEmDinheiro() {
		return pgtoEmDinheiro;
	}
	public void setPgtoEmDinheiro(boolean pgtoEmDinheiro) {
		this.pgtoEmDinheiro = pgtoEmDinheiro;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public Funcionario getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}
	public Calendar getData() {
		return data;
	}
	public void setData(Calendar data) {
		this.data = data;
	}
	
	
}
