package br.org.mg.hemoproject.controle;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import br.org.mg.hemoproject.modelo.Status;

@ManagedBean
public class StatusBean {

	private Map<String, String> statusList = new HashMap<String, String>();
	private Status status;

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@PostConstruct
	public void init(){
		statusList.put(status.ABERTO.getLabel(), status.ABERTO.getLabel());
		statusList.put(status.ANALISE.getLabel(), status.ANALISE.getLabel());
		statusList.put(status.EXECUCAO.getLabel(), status.EXECUCAO.getLabel());
		statusList.put(status.FECHADO.getLabel(), status.FECHADO.getLabel());
		
	}
	
	public Map<String, String> getStatusList() {
		return statusList;
	}

	public void setStatusList(Map<String, String> statusList) {
		this.statusList = statusList;
	}
	
	
}
