
package br.org.mg.hemoproject.modelo;

import java.util.Calendar;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Pendencia {

    @Id
    @GeneratedValue
    private Long id;
    private String titulo;
    @OneToOne
    private Setor setor;
    private String itemDoEdital;
    @Lob
    private String descricao;
    @Enumerated(EnumType.STRING)
    private Status status;
    @Enumerated(EnumType.STRING)
    private Categoria categoria;
    @Enumerated(EnumType.STRING)
    private Enum prioridade;
    @Lob
    private String obs;
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar dataDaPendencia;

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Setor getSetor() {
        return setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

    public String getItemDoEdital() {
        return itemDoEdital;
    }

    public void setItemDoEdital(String itemDoEdital) {
        this.itemDoEdital = itemDoEdital;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Enum getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(Enum prioridade) {
        this.prioridade = prioridade;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public Calendar getData() {
        return dataDaPendencia;
    }

    public void setData(Calendar data) {
        this.dataDaPendencia = data;
    }

    public Long getId() {
        return id;
    }
    
    
}
