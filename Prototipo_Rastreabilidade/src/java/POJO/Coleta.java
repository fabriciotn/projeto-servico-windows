package POJO;

import java.util.Calendar;

public class Coleta {
    private String amostra;
    private String tipoBolsa;
    private String loteBolsa;
    private Calendar dtHrInicioColeta;
    private String opeInicioColeta;
    private int peso;
    private int tempoColeta;
    private Calendar dtHrFimColeta;
    private String opeFimColeta;

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public int getTempoColeta() {
        return tempoColeta;
    }

    public void setTempoColeta(int tempoColeta) {
        this.tempoColeta = tempoColeta;
    }

    public Calendar getDtHrFimColeta() {
        return dtHrFimColeta;
    }

    public void setDtHrFimColeta(Calendar dtHrFimColeta) {
        this.dtHrFimColeta = dtHrFimColeta;
    }

    public String getOpeFimColeta() {
        return opeFimColeta;
    }

    public void setOpeFimColeta(String opeFimColeta) {
        this.opeFimColeta = opeFimColeta;
    }

    public String getAmostra() {
        return amostra;
    }

    public void setAmostra(String amostra) {
        this.amostra = amostra;
    }

    public String getTipoBolsa() {
        return tipoBolsa;
    }

    public void setTipoBolsa(String tipoBolsa) {
        this.tipoBolsa = tipoBolsa;
    }

    public String getLoteBolsa() {
        return loteBolsa;
    }

    public void setLoteBolsa(String loteBolsa) {
        this.loteBolsa = loteBolsa;
    }

    public Calendar getDtHrInicioColeta() {
        return dtHrInicioColeta;
    }

    public void setDtHrInicioColeta(Calendar dtHrInicioColeta) {
        this.dtHrInicioColeta = dtHrInicioColeta;
    }

    public String getOpeInicioColeta() {
        return opeInicioColeta;
    }

    public void setOpeInicioColeta(String opeInicioColeta) {
        this.opeInicioColeta = opeInicioColeta;
    }

}
