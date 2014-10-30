/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexao.Conecta;
import POJO.Paciente;
import POJO.Utilizacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Fabricio T. Nascimento
 * @date 30/10/2014
 */
public class UtilizacaoDAO {

    private Connection connection;

    public UtilizacaoDAO() {
        Conecta con = new Conecta();
        this.connection = con.conecta();
    }

    public boolean insert(Utilizacao procedimento) {
        String sql = "INSERT INTO utilizacao("
                + " COD_PACIENTE,"
                + " COD_HEMOCOMPONENTE,"
                + " DATA,"
                + " MOTIVO,"
                + " RESPONSAVEL,"
                + " OBS,"
                + " COD_INSTITUICAO)"
                + " VALUES(?,?,?,?,?,?,?)";
        
        PreparedStatement ps = null;
        try {
            ps = this.connection.prepareStatement(sql);

            ps.setInt(1, procedimento.getCodPaciente());
            ps.setString(2, procedimento.getCodHemocomponente());
            ps.setString(3, procedimento.getData());
            ps.setString(4, procedimento.getMotivo());
            ps.setString(5, procedimento.getResponsavel());
            ps.setString(6, procedimento.getObs());
            ps.setInt(7, procedimento.getCodInstituicao());

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
