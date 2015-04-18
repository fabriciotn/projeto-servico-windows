package br.org.mg.hemoproject.controle;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import br.org.mg.hemoproject.modelo.Prioridade;

@ManagedBean
public class PrioridadeBean {

	private Map<String, String> prioridadeList = new HashMap<String, String>();
	private Prioridade prioridade;
	
	@PostConstruct
	public void init(){
		prioridadeList.put(prioridade.LEVE.getLabel(), prioridade.LEVE.getLabel());
		prioridadeList.put(prioridade.MODERADO.getLabel(), prioridade.MODERADO.getLabel());
		prioridadeList.put(prioridade.GRAVE.getLabel(), prioridade.GRAVE.getLabel());
		prioridadeList.put(prioridade.CRITICO.getLabel(), prioridade.CRITICO.getLabel());
	}

	public Map<String, String> getPrioridadeList() {
		return prioridadeList;
	}

	public void setPrioridadeList(Map<String, String> prioridadeList) {
		this.prioridadeList = prioridadeList;
	}

	public Prioridade getPrioridade() {
		return prioridade;
	}

	public void setPrioridade(Prioridade prioridade) {
		this.prioridade = prioridade;
	}
	
	
}
