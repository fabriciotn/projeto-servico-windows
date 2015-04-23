package com.util;

import java.util.List;

import com.facade.PendenciaFacade;

public class Testes {

	public static void main(String[] args) {
		String sql = "select p.id as id, "
				+ "p.titulo as titulo, "
				+ "p.categoria as categoria, "
				+ "p.status as status, "
				+ "s.nome as setor, "
				+ "count(*) as qtd_Pendencia "
				+ "from Pendencia p, "
				+ "Setor s where p.setor = s.id "
				+ "group by s";
		
		PendenciaFacade facade = new PendenciaFacade();
		List<Object[]> lista = facade.buscaComQuery(sql);
		
		for (Object[] objects : lista) {
			System.out.println(objects[0]);
			System.out.println(objects[1]);
			System.out.println(objects[2]);
			System.out.println(objects[3]);
			System.out.println(objects[4]);
			System.out.println(objects[5]);
		}
	}
}
