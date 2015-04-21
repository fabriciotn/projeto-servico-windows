package com.model;

public enum Status {
    ABERTO("Aberto"),
    FECHADO("Fechado"),
    ANALISE("Em an�lise"),
    EXECUCAO("Em execu��o");
    
    private String label;
    
    private Status(String label) {
		this.label = label;
	}
    
    public String getLabel(){
    	return label;
    }
}
