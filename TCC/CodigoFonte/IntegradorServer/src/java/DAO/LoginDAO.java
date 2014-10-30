/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexao.Conecta;
import POJO.Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Fabricio T. Nascimento
 * @date 29/10/2014
 */
public class LoginDAO {

    private Connection connection;

    public LoginDAO() {
        this.connection = Conecta.connection;
    }

    public Login validaUsuario(String login, String pass) {
        String sql = "SELECT * FROM LOGIN WHERE LOGIN=? AND PASS=?";
        ResultSet rs;
        PreparedStatement ps = null;
        Login usuario = new Login();
        try {
            ps = this.connection.prepareStatement(sql);

            ps.setString(1, login);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            if (rs.next()) {
                usuario.setLogin(rs.getString("LOGIN"));
                usuario.setNome(rs.getString("NOME"));
                usuario.setCodInstituicao(rs.getInt("COD_INSTITUICAO"));
                usuario.setEmail(rs.getString("EMAIL"));
                ps.close();
            } else {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return usuario;
    }
}
