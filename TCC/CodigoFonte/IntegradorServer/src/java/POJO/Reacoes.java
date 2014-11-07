/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package POJO;

/**
 *
 * @author Fabricio T. Nascimento
 * @date 29/10/2014
 */
public class Reacoes {
    private int id;
    private int idUtilizacao;
    private String dataProcedimento;
    private String reacao;
    private int idPaciente;
    private String nomePaciente;

    public String getDataProcedimento() {
        return dataProcedimento;
    }

    public void setDataProcedimento(String dataProcedimento) {
        this.dataProcedimento = dataProcedimento;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNomePaciente() {
        return nomePaciente;
    }

    public void setNomePaciente(String nomePaciente) {
        this.nomePaciente = nomePaciente;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUtilizacao() {
        return idUtilizacao;
    }

    public void setIdUtilizacao(int idUtilizacao) {
        this.idUtilizacao = idUtilizacao;
    }

    public String getReacao() {
        return reacao;
    }

    public void setReacao(String reacao) {
        this.reacao = reacao;
    }
    
    
}
