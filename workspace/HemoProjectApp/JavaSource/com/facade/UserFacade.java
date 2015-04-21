package com.facade;

import com.dao.UserDAO;
import com.model.User;
import com.util.ADAuthenticator;

public class UserFacade {
	private UserDAO userDAO = new UserDAO();

	public User isValidLogin(String masp, String password) {
		userDAO.beginTransaction();
		User user = userDAO.findUserByMasp(masp);

		if(!validaAD(masp, password)){
			if (user == null || user.getPassword() == null || !user.getPassword().equals(password)) {
				return null;
			}
		}

		return user;
	}
	
	public boolean validaAD(String masp, String password){
		 //instanciando a classe ADAuthenticator para fazer
        //a validação do MASP e senha no servidor do AD
        ADAuthenticator a = new ADAuthenticator();
        
        String displayName = a.authenticate(masp, password);
        
        if(displayName == "null")
        	return false;
        
        return true;
	}
}