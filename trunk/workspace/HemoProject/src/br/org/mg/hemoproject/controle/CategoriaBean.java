package br.org.mg.hemoproject.controle;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import br.org.mg.hemoproject.modelo.Categoria;

@ManagedBean
public class CategoriaBean {

	private Map<String, String> categoriaList = new HashMap<String, String>();
	private Categoria categoria;
	
	@PostConstruct
	public void init(){
		categoriaList.put(categoria.CONFIGURACAO.getLabel(), categoria.CONFIGURACAO.getLabel());
		categoriaList.put(categoria.DESENVOLVIMENTO.getLabel(), categoria.DESENVOLVIMENTO.getLabel());
		categoriaList.put(categoria.TREINAMENTO.getLabel(), categoria.TREINAMENTO.getLabel());
		categoriaList.put(categoria.FLUXO.getLabel(), categoria.FLUXO.getLabel());
		
	}

	public Map<String, String> getCategoriaList() {
		return categoriaList;
	}

	public void setCategoriaList(Map<String, String> categoriaList) {
		this.categoriaList = categoriaList;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	
}
