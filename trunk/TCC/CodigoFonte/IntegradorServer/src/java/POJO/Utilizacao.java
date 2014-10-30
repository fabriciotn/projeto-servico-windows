/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

import java.util.Calendar;

/**
 *
 * @author Fabricio T. Nascimento
 * @date 29/10/2014
 */
public class Utilizacao {
    private int id;
    private int codPaciente;
    private String codHemocomponente;
    private String data;
    private String motivo;
    private String responsavel;
    private String obs;
    private int codInstituicao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCodPaciente() {
        return codPaciente;
    }

    public void setCodPaciente(int codPaciente) {
        this.codPaciente = codPaciente;
    }

    public String getCodHemocomponente() {
        return codHemocomponente;
    }

    public void setCodHemocomponente(String codHemocomponente) {
        this.codHemocomponente = codHemocomponente;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public int getCodInstituicao() {
        return codInstituicao;
    }

    public void setCodInstituicao(int codInstituicao) {
        this.codInstituicao = codInstituicao;
    }
    
    
}
