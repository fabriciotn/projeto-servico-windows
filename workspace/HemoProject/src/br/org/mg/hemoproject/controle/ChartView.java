package br.org.mg.hemoproject.controle;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
 
@ManagedBean
public class ChartView implements Serializable {
 
    private BarChartModel animatedModel2;
 
    @PostConstruct
    public void init() {
        createAnimatedModels();
    }
 
    public BarChartModel getAnimatedModel2() {
        return animatedModel2;
    }
 
    private void createAnimatedModels() {
        animatedModel2 = initBarModel();
        animatedModel2.setTitle("Pendências por setor");
        animatedModel2.setAnimate(true);
        animatedModel2.setLegendPosition("ne");
        Axis yAxis = animatedModel2.getAxis(AxisType.Y);
        yAxis.setMin(0);
        yAxis.setMax(200);
    }
     
    private BarChartModel initBarModel() {
        BarChartModel model = new BarChartModel();
 
        ChartSeries fracionamento = new ChartSeries();
        fracionamento.setLabel("Fracionamento");
        fracionamento.set("",200);        
        
        ChartSeries controleQualidade = new ChartSeries();
        controleQualidade.setLabel("Controle de Qualidade");
        controleQualidade.set("", 98);
        
        ChartSeries sorologia = new ChartSeries();
        sorologia.setLabel("Sorologia");
        sorologia.set("", 150);
        
        ChartSeries imuno = new ChartSeries();
        imuno.setLabel("Imuno");
        imuno.set("", 90);
        
        ChartSeries nat = new ChartSeries();
        nat.setLabel("NAT");
        nat.set("", 90);

        
        model.addSeries(fracionamento);
        model.addSeries(controleQualidade);
        model.addSeries(sorologia);
        model.addSeries(imuno);
        model.addSeries(nat);
         
        return model;
    }
     
    
    
}