/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Conecta.Login;
import javax.faces.bean.ManagedBean;

@ManagedBean
public class UsuarioBean {

    private String masp;
    private String senha;
    private String nome;

    public String getLogin(String usuario, String senha) {
        String pag = "erro";
        Login login = new Login();
        String displayName = login.efetuaLogin(usuario, senha);

        if (!displayName.equals("null")) {
            pag = "home";
            this.nome = displayName;
        }

        MessagesView ms = new MessagesView();
        ms.info(nome, "Bem vindo!");
        
        return pag;
    }

    public void getDisplayName(String usuario) {
        
        /*
         if(nome != null){
         return "Bem vindo " + nome;
         }
        
         return "";
         */
    }

    public String getMasp() {
        return masp;
    }

    public void setMasp(String masp) {
        this.masp = masp;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
