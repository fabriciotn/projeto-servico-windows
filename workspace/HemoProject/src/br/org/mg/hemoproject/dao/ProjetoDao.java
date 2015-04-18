package br.org.mg.hemoproject.dao;

import java.util.List;

import br.org.mg.hemoproject.modelo.Projeto;

public interface ProjetoDao {

	public void save(Projeto projeto);
    public Projeto getLivro(long id);
    public List<Projeto> list();
    public void remove(Projeto projeto);
    public void update(Projeto projeto);
}
