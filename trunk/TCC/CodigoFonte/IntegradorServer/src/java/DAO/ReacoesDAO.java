/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexao.Conecta;
import POJO.Reacoes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fabricio T. Nascimento
 * @date 06/11/2014
 */
public class ReacoesDAO {

    private Connection connection;

    public ReacoesDAO() {
        Conecta con = new Conecta();
        this.connection = con.conecta();
    }

    public boolean insert(Reacoes reacao) {
        String sql = "INSERT INTO reacoes("
                + " ID_UTILIZACAO,"
                + " REACAO)"
                + " VALUES(?,?)";
        PreparedStatement ps = null;
        try {
            ps = this.connection.prepareStatement(sql);

            ps.setInt(1, reacao.getIdUtilizacao());
            ps.setString(2, reacao.getReacao());

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

    public List<Reacoes> getReacoes(String nome) {
        String sql = "SELECT"
                + " p.ID as CodPaciente,"
                + " p.NOME as NomePaciente,"
                + " u.ID as CodProcedimento,"
                + " u.DATA as DataProcedimento,"
                + " r.REACAO as Reacao"
                + " FROM"
                + " integrador.paciente as p,"
                + " integrador.utilizacao as u,"
                + " integrador.reacoes as r"
                + " WHERE u.COD_PACIENTE = p.ID"
                + " AND u.ID = r.ID_UTILIZACAO"
                + " AND p.NOME LIKE ?";
        ResultSet rs;
        PreparedStatement ps = null;
        List<Reacoes> reacoes = new ArrayList<>();
        try {
            ps = this.connection.prepareStatement(sql);
            ps.setString(1, "%" + nome + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reacoes reacao = new Reacoes();
                reacao.setIdPaciente(rs.getInt("CodPaciente"));
                reacao.setNomePaciente(rs.getString("NomePaciente"));
                reacao.setIdUtilizacao(rs.getInt("CodProcedimento"));
                reacao.setDataProcedimento(rs.getString("DataProcedimento"));
                reacao.setReacao(rs.getString("Reacao"));

                reacoes.add(reacao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return reacoes;
    }
}
