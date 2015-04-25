package com.mb;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Date;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.StreamedContent;
import org.primefaces.model.TreeNode;

@ManagedBean(name = "treeBasicView")
@ViewScoped
public class BasicView implements Serializable {

	private TreeNode root;
	private String dir;

	@PostConstruct
	public void init() {
		FacesContext facesContext = FacesContext.getCurrentInstance();
		ServletContext scontext = (ServletContext) facesContext
				.getExternalContext().getContext();
		dir = scontext.getRealPath("/WEB-INF/anexos/");

		File diretorio = new File(dir);
		File fList[] = diretorio.listFiles();

		System.out.println("Numero de arquivos no diretorio : " + fList.length);

		root = new DefaultTreeNode("Root", null);
		TreeNode node0;

		for (int i = 0; i < fList.length; i++) {
			System.out.println(fList[i].getName() + " "
					+ new Date(fList[i].lastModified()));

			node0 = new DefaultTreeNode(fList[i].getName(), root);
		}
	}

	public TreeNode getRoot() {
		return root;
	}

	private StreamedContent file;

	public void FileDownloadView() {
		InputStream stream;

		File diretorio = new File(dir);
		File fList[] = diretorio.listFiles();

		for (int i = 0; i < fList.length; i++) {

			try {
				//stream = ((ServletContext)FacesContext.getCurrentInstance().getExternalContext().getContext()).getResourceAsStream(dir+fList[i].getName());  
		        //file = new DefaultStreamedContent(stream, "image/jpg", fList[i].getName());  
		        
				stream = new FileInputStream(new File(dir + fList[i].getName()));
				file = new DefaultStreamedContent(stream);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public StreamedContent getFile() {
		return file;
	}
}