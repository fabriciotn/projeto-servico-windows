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

    public String getLogin(String usuario, String senha) {
        String pag = "erro";

        Login login = new Login();

        if (login.efetuaLogin(usuario, senha)) {
            pag = "home";
        }

        return pag;
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
}
