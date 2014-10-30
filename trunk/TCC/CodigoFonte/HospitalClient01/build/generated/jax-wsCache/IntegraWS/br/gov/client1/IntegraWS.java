
package br.gov.client1;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.8
 * Generated source version: 2.2
 * 
 */
@WebService(name = "IntegraWS", targetNamespace = "http://Integrador.gov.br/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface IntegraWS {


    /**
     * 
     * @param numeroBolsa
     * @return
     *     returns br.gov.client1.Hemocomponente
     */
    @WebMethod(operationName = "RecebeDados")
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "RecebeDados", targetNamespace = "http://Integrador.gov.br/", className = "br.gov.client1.RecebeDados")
    @ResponseWrapper(localName = "RecebeDadosResponse", targetNamespace = "http://Integrador.gov.br/", className = "br.gov.client1.RecebeDadosResponse")
    @Action(input = "http://Integrador.gov.br/IntegraWS/RecebeDadosRequest", output = "http://Integrador.gov.br/IntegraWS/RecebeDadosResponse")
    public Hemocomponente recebeDados(
        @WebParam(name = "numeroBolsa", targetNamespace = "")
        String numeroBolsa);

    /**
     * 
     * @param id
     * @return
     *     returns br.gov.client1.Paciente
     */
    @WebMethod(operationName = "RecebeDadosPaciente")
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "RecebeDadosPaciente", targetNamespace = "http://Integrador.gov.br/", className = "br.gov.client1.RecebeDadosPaciente")
    @ResponseWrapper(localName = "RecebeDadosPacienteResponse", targetNamespace = "http://Integrador.gov.br/", className = "br.gov.client1.RecebeDadosPacienteResponse")
    @Action(input = "http://Integrador.gov.br/IntegraWS/RecebeDadosPacienteRequest", output = "http://Integrador.gov.br/IntegraWS/RecebeDadosPacienteResponse")
    public Paciente recebeDadosPaciente(
        @WebParam(name = "id", targetNamespace = "")
        int id);

    /**
     * 
     * @param rhPac
     * @param enderco
     * @param mae
     * @param pai
     * @param rg
     * @param cpf
     * @param nome
     * @param aboPac
     * @return
     *     returns boolean
     */
    @WebMethod(operationName = "GravaPaciente")
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "GravaPaciente", targetNamespace = "http://Integrador.gov.br/", className = "br.gov.client1.GravaPaciente")
    @ResponseWrapper(localName = "GravaPacienteResponse", targetNamespace = "http://Integrador.gov.br/", className = "br.gov.client1.GravaPacienteResponse")
    @Action(input = "http://Integrador.gov.br/IntegraWS/GravaPacienteRequest", output = "http://Integrador.gov.br/IntegraWS/GravaPacienteResponse")
    public boolean gravaPaciente(
        @WebParam(name = "nome", targetNamespace = "")
        String nome,
        @WebParam(name = "cpf", targetNamespace = "")
        String cpf,
        @WebParam(name = "rg", targetNamespace = "")
        String rg,
        @WebParam(name = "pai", targetNamespace = "")
        String pai,
        @WebParam(name = "mae", targetNamespace = "")
        String mae,
        @WebParam(name = "aboPac", targetNamespace = "")
        String aboPac,
        @WebParam(name = "rhPac", targetNamespace = "")
        String rhPac,
        @WebParam(name = "enderco", targetNamespace = "")
        String enderco);

}
