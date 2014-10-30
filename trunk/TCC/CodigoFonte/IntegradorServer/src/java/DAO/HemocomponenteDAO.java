/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Conexao.Conecta;
import POJO.Hemocomponente;
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
public class HemocomponenteDAO {
private Connection connection;

    public HemocomponenteDAO() {
        Conecta con = new Conecta();
        this.connection = con.conecta();
    }

    public Hemocomponente getHemocomponente(String codigoBolsa) {
        String sql = "SELECT * FROM HEMOCOMPONENTE WHERE CODIGO=?";
        ResultSet rs;
        PreparedStatement ps = null;
        Hemocomponente bolsa = new Hemocomponente();
        try {
            ps = this.connection.prepareStatement(sql);
            ps.setString(1, codigoBolsa);
            rs = ps.executeQuery();
            if (rs.next()) {
                bolsa.setCodigo(rs.getString("CODIGO"));
                bolsa.setDescricao(rs.getString("DESCRICAO"));
                bolsa.setAbo(rs.getString("ABO"));
                bolsa.setRh(rs.getString("RH"));
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
        
        return bolsa;
    }
}
