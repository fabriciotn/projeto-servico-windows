/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexao.Conecta;
import POJO.Paciente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 *
 * @author Fabricio T. Nascimento
 * @date 29/10/2014
 */
public class PacienteDAO {

    private Connection connection;

    public PacienteDAO() {
        Conecta con = new Conecta();
        this.connection = con.conecta();
    }

    //INSERIR PACIENTE
    public Paciente getPaciente(int id) {
        String sql = "SELECT * FROM PACIENTE WHERE ID = ?";
        ResultSet rs;
        PreparedStatement ps = null;
        Paciente paciente = new Paciente();
        try {
            ps = this.connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                paciente.setId(rs.getInt("ID"));
                paciente.setNome(rs.getString("NOME"));
                paciente.setCpf(rs.getString("CPF"));
                paciente.setRg(rs.getString("RG"));
                paciente.setNomeDoPai(rs.getString("NOME_DO_PAI"));
                paciente.setNomeDaMae(rs.getString("NOME_DA_MAE"));
                paciente.setAbo(rs.getString("ABO"));
                paciente.setRh(rs.getString("RH"));
                paciente.setEndereco(rs.getString("ENDERECO"));
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

        return paciente;
    }

    public boolean insert(Paciente paciente) {
        String sql = "INSERT INTO PACIENTE ("
                + " NOME,"
                + " CPF,"
                + " RG,"
                + " NOME_DO_PAI,"
                + " NOME_DA_MAE,"
                + " ABO,"
                + " RH,"
                + " ENDERECO) "
                + " VALUES(?,?,?,?,?,?,?,?)";
        
        PreparedStatement ps = null;
        try {
            ps = this.connection.prepareStatement(sql);

            ps.setString(1, paciente.getNome());
            ps.setString(2, paciente.getCpf());
            ps.setString(3, paciente.getRg());
            ps.setString(4, paciente.getNomeDoPai());
            ps.setString(5, paciente.getNomeDaMae());
            ps.setString(6, paciente.getAbo());
            ps.setString(7, paciente.getRh());
            ps.setString(8, paciente.getEndereco());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                ps.close();
            } catch (SQLException ex) {
            }
            return false;
        }
        return true;
    }
}
