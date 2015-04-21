
package br.org.mg.hemoproject.modelo;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Projeto {

    @Id
    @GeneratedValue
    private Long id;
    
    private String nome;
    
    //@OneToMany
    //private List<Pendencia> pendencias;

    //public List<Pendencia> getPendencias() {
    //    return pendencias;
    //}

    //public void setPendencias(List<Pendencia> pendencias) {
    //    this.pendencias = pendencias;
    //}

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Long getId() {
        return id;
    }
    
    
}
