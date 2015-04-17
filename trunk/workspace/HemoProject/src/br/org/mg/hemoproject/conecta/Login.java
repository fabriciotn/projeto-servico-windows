package br.org.mg.hemoproject.conecta;

public class Login {

    public String efetuaLogin(String usuario, String senha) {
        //instanciando a classe ADAuthenticator para fazer
        //a valida��o do MASP e senha no servidor do AD
        ADAuthenticator a = new ADAuthenticator();
        
        String displayName = a.authenticate(usuario, senha);

        if (usuario.equals("admin")) {
            
            return "Administrador";
        }
        
        return displayName;
    }
}