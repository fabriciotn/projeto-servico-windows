package com.model;

public enum Status {
    ABERTO("Aberto"),
    FECHADO("Fechado"),
    ANALISE("Em análise"),
    EXECUCAO("Em execução");
    
    private String label;
    
    private Status(String label) {
		this.label = label;
	}
    
    public String getLabel(){
    	return label;
    }
}
