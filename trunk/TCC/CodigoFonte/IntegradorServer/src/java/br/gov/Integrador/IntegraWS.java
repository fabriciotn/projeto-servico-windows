/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.Integrador;

import DAO.HemocomponenteDAO;
import DAO.PacienteDAO;
import POJO.Hemocomponente;
import POJO.Paciente;
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
     */
    @WebMethod(operationName = "RecebeDados")
    public Hemocomponente getData(@WebParam(name = "numeroBolsa") String numeroBolsa) {
        HemocomponenteDAO hemoDao = new HemocomponenteDAO();
        Hemocomponente bolsa = new Hemocomponente();

        bolsa = hemoDao.getHemocomponente(numeroBolsa);

        return bolsa;
    }
    
    
    /**
     * Método que envia os dados do paciente para o hospital client.
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
}
