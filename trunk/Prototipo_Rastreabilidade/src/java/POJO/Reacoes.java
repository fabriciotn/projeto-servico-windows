package POJO;

import java.util.Calendar;

public class Reacoes {

    private String amostra;
    private String reacao;
    private String observacao;
    private int pa1;
    private int pa2;
    private int pulso;
    private String prescricao;
    private String lote;
    private Calendar dtHrReacao;
    private String opeReacao;

    public String getAmostra() {
        return amostra;
    }

    public int getPulso() {
        return pulso;
    }

    public void setPulso(int pulso) {
        this.pulso = pulso;
    }

    public String getPrescricao() {
        return prescricao;
    }

    public void setPrescricao(String prescricao) {
        this.prescricao = prescricao;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public void setAmostra(String amostra) {
        this.amostra = amostra;
    }

    public String getReacao() {
        return reacao;
    }

    public void setReacao(String reacao) {
        this.reacao = reacao;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Calendar getDtHrReacao() {
        return dtHrReacao;
    }

    public void setDtHrReacao(Calendar dtHrReacao) {
        this.dtHrReacao = dtHrReacao;
    }

    public String getOpeReacao() {
        return opeReacao;
    }

    public void setOpeReacao(String opeReacao) {
        this.opeReacao = opeReacao;
    }

    public int getPa1() {
        return pa1;
    }

    public void setPa1(int pa1) {
        this.pa1 = pa1;
    }

    public int getPa2() {
        return pa2;
    }

    public void setPa2(int pa2) {
        this.pa2 = pa2;
    }
}
