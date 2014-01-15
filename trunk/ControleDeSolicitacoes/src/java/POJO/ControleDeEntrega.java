/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.util.Calendar;

/**
 *
 * @author 12546446
 */
public class ControleDeEntrega {
    private String amostra;
    private String motivo;
    private String hemocomponente;
    private String outroHemocomp;
    private String destino;
    private Calendar dataHora;
    private String operador;

    public String getAmostra() {
        return amostra;
    }

    public void setAmostra(String amostra) {
        this.amostra = amostra;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getHemocomponente() {
        return hemocomponente;
    }

    public void setHemocomponente(String hemocomponente) {
        this.hemocomponente = hemocomponente;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Calendar getDataHora() {
        return dataHora;
    }

    public void setDataHora(Calendar dataHora) {
        this.dataHora = dataHora;
    }

    public String getOperador() {
        return operador;
    }

    public void setOperador(String operador) {
        this.operador = operador;
    }   

    public String getOutroHemocomp() {
        return outroHemocomp;
    }

    public void setOutroHemocomp(String outroHemocomp) {
        this.outroHemocomp = outroHemocomp;
    }

}
