/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.Integrador;

import DAO.HemocomponenteDAO;
import POJO.Hemocomponente;
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
}
