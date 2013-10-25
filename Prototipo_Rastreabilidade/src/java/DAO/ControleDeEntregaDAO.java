/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conecta.ConectaOracle;
import POJO.ControleDeEntrega;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author 12546446
 */
public class ControleDeEntregaDAO {
    private Connection connection;

    public ControleDeEntregaDAO() {
        this.connection = ConectaOracle.conecta();
    }

    /*
     * Inclui Reacao
     */
    public boolean adiciona(ControleDeEntrega controleEntrega) {
        String sql = "INSERT INTO CONTROLE_ENTREGA ("
                + "AMOSTRA,"
                + "MOTIVO,"
                + "HEMOCOMPONENTE,"
                + "OUTRO_HEMOCOMP, "
                + "DESTINO,"
                + "DATAHORA,"
                + "OPERADOR) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, controleEntrega.getAmostra());
            ps.setString(2, controleEntrega.getMotivo());
            ps.setString(3, controleEntrega.getHemocomponente());
            ps.setString(4, controleEntrega.getOutroHemocomp());
            ps.setString(5, controleEntrega.getDestino());
            ps.setTimestamp(6, new java.sql.Timestamp(controleEntrega.getDataHora().getTimeInMillis()));
            ps.setString(7, controleEntrega.getOperador());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /*
     * Busca os dados de uma amostra
     */
    public List<ControleDeEntrega> getAmostra(String amostra) {
        List<ControleDeEntrega> controle = new ArrayList<ControleDeEntrega>();
        String sql = "SELECT * FROM CONTROLE_ENTREGA WHERE AMOSTRA = ? ";

        try {
            PreparedStatement ps = this.connection.prepareStatement(sql);
            ps.setString(1, amostra);
            ResultSet rs = ps.executeQuery();

            Calendar dataHora = Calendar.getInstance();

            while (rs.next()) {
                ControleDeEntrega controleEntrega = new ControleDeEntrega();
                controleEntrega.setAmostra(rs.getString("AMOSTRA"));
                controleEntrega.setMotivo(rs.getString("MOTIVO"));
                controleEntrega.setHemocomponente(rs.getString("HEMOCOMPONENTE"));
                controleEntrega.setOutroHemocomp(rs.getString("OUTRO_HEMOCOMP"));
                controleEntrega.setDestino(rs.getString("DESTINO"));
                dataHora.setTime(rs.getTimestamp("DATAHORA"));
                controleEntrega.setDataHora(dataHora);
                controleEntrega.setOperador(rs.getString("OPERADOR"));

                controle.add(controleEntrega);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return controle;
    }
}