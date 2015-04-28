package com.testes;

import java.io.File;
import java.sql.Date;

public class ArquivosTeste {

	public static void main(String[] args) {
		String dir = "c:/"; 

		File diretorio = new File(dir); 
		File fList[] = diretorio.listFiles(); 

		System.out.println("Numero de arquivos no diretorio : " + fList.length ); 

		for ( int i = 0; i < fList.length; i++ ){ 
		System.out.println(fList[i].getName() +" " + new Date(fList[i].lastModified())); 
		} 
	}
}
