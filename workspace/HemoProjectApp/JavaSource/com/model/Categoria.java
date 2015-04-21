package com.model;

public enum Categoria {
    CONFIGURACAO("Configura��o"),
    DESENVOLVIMENTO("Desenvolvimento"),
    TREINAMENTO("Treinamento"),
    FLUXO("Defini��o de Fluxo");
    
    private String label;
    
    private Categoria(String label){
    	this.label = label;
    }

	public String getLabel() {
		return label;
	}
}
