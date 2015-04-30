package com.mb;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LegendPlacement;

import com.facade.PendenciaFacade;

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
		animatedModel2.setLegendPosition("su");
		animatedModel2.setLegendCols(2);
		animatedModel2.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
		animatedModel2.setShowPointLabels(true);

		Axis yAxis = animatedModel2.getAxis(AxisType.Y);
		yAxis.setLabel("Quantidade de pendências");

	}

	private BarChartModel initBarModel() {
		String sql = "SELECT s.nome, "
				+ "COUNT(*) AS qtd_Pendencia "
				+ "FROM Pendencia p, Setor s "
				+ "WHERE p.setor.id = s.id "
				+ "AND p.status <> 'FECHADO' "
				+ "GROUP BY s.nome";

		PendenciaFacade facade = new PendenciaFacade();
		List<Object[]> lista = facade.buscaComQuery(sql);

		BarChartModel model = new BarChartModel();
		ChartSeries setor;
		for (Object[] objects : lista) {
			setor = new ChartSeries(objects[0].toString());
			setor.set("Setores", (Number) objects[1]);
			model.addSeries(setor);
		}

		return model;
	}

}