/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Reacoes;
import Conecta.ConectaOracle;
import java.sql.Clob;
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
public class ReacoesDAO {

    private Connection connection;

    public ReacoesDAO() {
        this.connection = ConectaOracle.conecta();
    }

    /*
     * Inclui Reacao
     */
    public boolean adiciona(Reacoes reacao) {
        String sql = "INSERT INTO REACOES ("
                + "AMOSTRA,"
                + "REACAO,"
                + "OBSERVACAO,"
                + "PA1,"
                + "PA2,"
                + "PULSO,"
                + "PRESCRICAO,"
                + "LOTE,"
                + "DTHR_PRESCRICAO,"
                + "OPERADOR) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, reacao.getAmostra());
            ps.setString(2, reacao.getReacao());
            ps.setString(3, reacao.getObservacao());
            ps.setInt(4, reacao.getPa1());
            ps.setInt(5, reacao.getPa2());
            ps.setInt(6, reacao.getPulso());
            ps.setString(7, reacao.getPrescricao());
            ps.setString(8, reacao.getLote());
            ps.setTimestamp(9, new java.sql.Timestamp(reacao.getDtHrReacao().getTimeInMillis()));
            ps.setString(10, reacao.getOpeReacao());

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
    public List<Reacoes> getReacoes(String amostra) {
        List<Reacoes> coletas = new ArrayList<Reacoes>();
        String sql = "SELECT * FROM REACOES WHERE AMOSTRA = ? ORDER BY DTHR_PRESCRICAO";

        try {
            PreparedStatement ps = this.connection.prepareStatement(sql);
            ps.setString(1, amostra);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Calendar dtHrReacao = Calendar.getInstance();
                Reacoes reacao = new Reacoes();
                reacao.setAmostra(rs.getString("AMOSTRA"));
                reacao.setReacao(rs.getString("REACAO")); 
                reacao.setPa1(rs.getInt("PA1"));
                reacao.setPa2(rs.getInt("PA2"));
                reacao.setPulso(rs.getInt("PULSO"));
                reacao.setLote(rs.getString("LOTE"));
                reacao.setOpeReacao(rs.getString("OPERADOR"));
                
                //Conversão do tipo Clob para String
                Clob observacaoClob = rs.getClob("OBSERVACAO");
                String observacaoStr = observacaoClob.getSubString(new Long(1).longValue(), new Long(observacaoClob.length()).intValue());
                reacao.setObservacao(observacaoStr);
                
                //Conversão do tipo Clob para String
                Clob prescricaoClob = rs.getClob("PRESCRICAO");
                String prescricaoStr = prescricaoClob.getSubString(new Long(1).longValue(), new Long(prescricaoClob.length()).intValue());
                reacao.setPrescricao(prescricaoStr);
                
                //dtHrReacao.setTime(rs.getTimestamp("DTHR_PRESCRICAO"));
                //reacao.setDtHrReacao(dtHrReacao);
                
                if (rs.getTimestamp("DTHR_PRESCRICAO") != null) {
                    dtHrReacao.setTime(rs.getTimestamp("DTHR_PRESCRICAO"));
                }
                
                reacao.setDtHrReacao(dtHrReacao);

                coletas.add(reacao);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return coletas;
    }
}
