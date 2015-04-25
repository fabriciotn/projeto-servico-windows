package com.mb;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
public class FileUploadView {

    private UploadedFile file;

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public void upload(FileUploadEvent event) {
        file = event.getFile();

        if (file != null) {

        	FacesContext facesContext = FacesContext.getCurrentInstance();
            ServletContext scontext = (ServletContext) facesContext.getExternalContext().getContext();
            String caminho = scontext.getRealPath("/WEB-INF/anexos/");
            
            //File file1 = new File("C:\\", file.getFileName());
        	
            File file1 = new File(caminho, file.getFileName());
            
            System.out.println(file1.getPath());
            
            try {
                FileOutputStream fos = new FileOutputStream(file1);
                fos.write(event.getFile().getContents());
                fos.close();

                FacesContext instance = FacesContext.getCurrentInstance();
                instance.addMessage("mensagens", new FacesMessage(
                        FacesMessage.SEVERITY_ERROR,
                        file.getFileName() + " anexado com sucesso", null));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }            
        }
    }
}