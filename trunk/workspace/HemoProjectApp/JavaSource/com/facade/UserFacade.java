package com.facade;

import com.dao.UserDAO;
import com.model.User;
import com.util.ADAuthenticator;

public class UserFacade {
	private UserDAO userDAO = new UserDAO();

	public User isValidLogin(String masp, String password) {
		User user = validaAD(masp, password);

		if (user == null) {
			userDAO.beginTransaction();
			user = userDAO.findUserByMasp(masp);
			userDAO.closeTransaction();
			
			if (user == null || user.getPassword() == null || !user.getPassword().equals(password)) {
				return null;
			}
		}

		return user;
	}

	public User validaAD(String masp, String password) {
		// instanciando a classe ADAuthenticator para fazer
		// a validação do MASP e senha no servidor do AD
		ADAuthenticator a = new ADAuthenticator();

		User usuarioAd = a.authenticate(masp, password);

		if (usuarioAd == null)
			return null;

		return usuarioAd;
	}
}