/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.Integrador;

import DAO.HemocomponenteDAO;
import DAO.PacienteDAO;
import DAO.ReacoesDAO;
import DAO.UtilizacaoDAO;
import POJO.Hemocomponente;
import POJO.Paciente;
import POJO.Reacoes;
import POJO.Utilizacao;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Fabrício Teixeira
 */
@WebService(serviceName = "IntegraWS")
public class IntegraWS {

    /**
     * Método que envia os dados do hemocomponente para o hospital client.
     *
     * @param numeroBolsa
     * @return
     */
    @WebMethod(operationName = "RecebeDadosHemocomponente")
    public Hemocomponente getData(@WebParam(name = "numeroBolsa") String numeroBolsa) {
        HemocomponenteDAO hemoDao = new HemocomponenteDAO();
        Hemocomponente bolsa = new Hemocomponente();

        bolsa = hemoDao.getHemocomponente(numeroBolsa);

        return bolsa;
    }

    /**
     * Método que envia os dados do paciente para o hospital client.
     *
     * @param id
     * @return
     */
    @WebMethod(operationName = "RecebeDadosPaciente")
    public Paciente getPaciente(@WebParam(name = "id") int id) {
        PacienteDAO pacDao = new PacienteDAO();
        Paciente paciente = new Paciente();

        paciente = pacDao.getPaciente(id);

        return paciente;
    }

    /**
     * Método que recebe os dados dos pacientes para gravar
     *
     * @param nome
     * @param pai
     * @param rg
     * @param cpf
     * @param mae
     * @param endereco
     * @param rhPac
     * @param aboPac
     * @return
     */
    @WebMethod(operationName = "GravaPaciente")
    public boolean insertPaciente(
            @WebParam(name = "nome") String nome,
            @WebParam(name = "cpf") String cpf,
            @WebParam(name = "rg") String rg,
            @WebParam(name = "pai") String pai,
            @WebParam(name = "mae") String mae,
            @WebParam(name = "aboPac") String aboPac,
            @WebParam(name = "rhPac") String rhPac,
            @WebParam(name = "enderco") String endereco) {

        PacienteDAO pacienteDao = new PacienteDAO();
        Paciente paciente = new Paciente();

        paciente.setNome(nome);
        paciente.setCpf(cpf);
        paciente.setRg(rg);
        paciente.setNomeDoPai(pai);
        paciente.setNomeDaMae(mae);
        paciente.setAbo(aboPac);
        paciente.setRh(rhPac);
        paciente.setEndereco(endereco);

        boolean retorno = pacienteDao.insert(paciente);

        return retorno;
    }

    /**
     * Método que grava os dados referente a utilização do hemocomponente
     *
     * @param codPaciente
     * @param data
     * @param codHemocomponente
     * @param motivo
     * @param codInstituicao
     * @param obs
     * @param responsavel
     * @return
     */
    @WebMethod(operationName = "GravaUtilizacao")
    public boolean insertUtilizacao(
            @WebParam(name = "codPaciente") int codPaciente,
            @WebParam(name = "codHemocomponente") String codHemocomponente,
            @WebParam(name = "data") String data,
            @WebParam(name = "motivo") String motivo,
            @WebParam(name = "responsavel") String responsavel,
            @WebParam(name = "obs") String obs,
            @WebParam(name = "codInstituicao") int codInstituicao) {

        UtilizacaoDAO procedimentoDao = new UtilizacaoDAO();
        Utilizacao procedimento = new Utilizacao();

        procedimento.setCodPaciente(codPaciente);
        procedimento.setCodHemocomponente(codHemocomponente);
        procedimento.setData(data);
        procedimento.setMotivo(motivo);
        procedimento.setResponsavel(responsavel);
        procedimento.setObs(obs);
        procedimento.setCodInstituicao(codInstituicao);

        boolean retorno = procedimentoDao.insert(procedimento);

        return retorno;
    }

    /**
     * Método que envia os dados de reações transfusionais para os hospitais
     * client.
     *
     * @param nomePaciente
     * @return List<Reacoes> reacoes
     * 
     */
    @WebMethod(operationName = "ListarReacoes")
    public List<Reacoes> listReacoes(@WebParam(name = "nomePaciente") String nomePaciente) {
        ReacoesDAO reacoesDao = new ReacoesDAO();
        return reacoesDao.getReacoes(nomePaciente);
    }
    
    /**
     * Método responsável pela gravação das reações adversas nas transfusões
     * 
     * @param reacao
     * @return
     */
    @WebMethod(operationName = "GravarReacoes")
    public boolean insertReacoes(@WebParam(name = "reacao") Reacoes reacao) {
        ReacoesDAO reacoesDao = new ReacoesDAO();
        return reacoesDao.insert(reacao);
    }
}
