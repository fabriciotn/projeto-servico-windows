package com.mb;

import java.io.File;
import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.TreeNode;

@ManagedBean(name="treeBasicView")
@ViewScoped
public class FileDownloadView implements Serializable {

	private TreeNode root;
    
    @PostConstruct
    public void init() {
        root = new DefaultTreeNode("Root", null);
        TreeNode node0 = new DefaultTreeNode("Node 0", root);
    }
 
    public TreeNode getRoot() {
        return root;
    }
	
	public List<String> download() {
		String dir = "c:/";
		
		List<String> listaDeArquivos = new ArrayList<String>();

		File diretorio = new File(dir);
		File fList[] = diretorio.listFiles();

		System.out.println("Numero de arquivos no diretorio : " + fList.length);

		for (int i = 0; i < fList.length; i++) {
			System.out.println(fList[i].getName() + " " + new Date(fList[i].lastModified()));
			listaDeArquivos.add(fList[i].getName() + "<br/>");
		}

		return listaDeArquivos;
	}
}
