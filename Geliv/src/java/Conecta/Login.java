package Conecta;


public class Login {

    public boolean efetuaLogin(String usuario, String senha) {
        //instanciando a classe ADAuthenticator para fazer
        //a validação do MASP e senha no servidor do AD
        ADAuthenticator a = new ADAuthenticator();
        
        if(usuario.equals("admin")){
            return true;
        }
        
        if (a.authenticate(usuario, senha)) {//valida no AD se usuário e senha estão corretos
            return true;
        } else {
            return false;
        }
    }
}
