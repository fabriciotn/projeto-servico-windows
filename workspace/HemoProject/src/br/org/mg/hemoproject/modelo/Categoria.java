package br.org.mg.hemoproject.modelo;

public enum Categoria {
    CONFIGURACAO("Configuração"),
    DESENVOLVIMENTO("Desenvolvimento"),
    TREINAMENTO("Treinamento"),
    FLUXO("Definição de Fluxo");
    
    private String label;
    
    private Categoria(String label){
    	this.label = label;
    }

	public String getLabel() {
		return label;
	}
}
