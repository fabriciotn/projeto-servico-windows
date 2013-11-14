/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package REPORTS;

import Conecta.ConectaOracle;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author 12546446
 */
public class ChamaReport {

    public void ChamaReport(Map parametros) {
        System.out.println("Gerando relatório...");
        // lista com os nossos clientes
        Connection conn = ConectaOracle.conecta();
        
        // compilacao do JRXML
        JasperReport report = null;
        try {
            report = JasperCompileManager.compileReport("C:\\Users\\12546446\\Desktop\\ProjetosSVN\\Prototipo_Rastreabilidade\\src\\java\\REPORTS\\RepoEstatisticaHBH.jrxml");
        } catch (JRException ex) {
            System.err.println("JRException ERRRROOOO = " + ex);
        }
        // preenchimento do relatorio, note que o metodo recebe 3 parametros: 
        // 1 - o relatorio 
        // 
        // 2 - um Map, com parametros que sao passados ao relatorio 
        // no momento do preenchimento. No nosso caso eh null, pois nao 
        // estamos usando nenhum parametro 
        // 
        // 3 - o data source. Note que nao devemos passar a lista diretamente, 
        // e sim "transformar" em um data source utilizando a classe 
        // JRBeanCollectionDataSource

        JasperPrint print = null;
        try {
            //print = JasperFillManager.fillReport(report, null, new JRBeanCollectionDataSource(lista));
            print = JasperFillManager.fillReport(report, parametros, conn);
        } catch (JRException ex) {
            System.err.println("JRException ERRRROOOO = " + ex);
        }
        try {
            JasperRunManager.runReportToPdf(report, parametros);
        } catch (JRException ex) {
            System.out.println("ex = " + ex);
        }
    }
}
