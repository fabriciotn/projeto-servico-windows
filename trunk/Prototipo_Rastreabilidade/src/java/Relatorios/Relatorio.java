package Relatorios;

import Conecta.ConectaOracle;
import java.awt.HeadlessException;
import java.awt.Image;
import java.net.URL;
import java.sql.Connection;
import java.util.Calendar;
import java.util.HashMap;
import javax.swing.ImageIcon;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

public class Relatorio {

    private Connection connection;
    Calendar data = Calendar.getInstance();

    public byte[] armazem(int DataInicio, int DataFim, String ano, String hospital, String caminho_imagem) throws JRException {
        byte[] relatorio = null;
        try {
            URL arquivo = getClass().getResource("RepoEstatisticaHBH.jasper");
            JasperReport arquivoJasper = (JasperReport) JRLoader.loadObject(arquivo);
            this.connection = ConectaOracle.conecta();
            HashMap map = new HashMap();
            map.put("diaInicio", DataInicio);
            map.put("diaFim", DataFim);
            map.put("ano", ano);
            map.put("hosp", hospital);
            map.put("caminho_imagem", caminho_imagem);
            relatorio = JasperRunManager.runReportToPdf(arquivoJasper, map, this.connection);
            //rel = JasperFillManager.fillReport(arquivoJasper, map, this.connection);

        } catch (HeadlessException e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return relatorio;
    }
}
