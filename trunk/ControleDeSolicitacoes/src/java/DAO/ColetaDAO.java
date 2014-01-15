/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Coleta;
import Conecta.ConectaOracle;
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
public class ColetaDAO {
    private Connection connection;

    public ColetaDAO(){
        this.connection = ConectaOracle.conecta();
    }

    
    /*
     * Inclui amostra
     */
    public boolean adiciona(Coleta coleta){
        String sql = "INSERT INTO RASTREABILIDADE (AMOSTRA, TIPO_BOLSA, LOTE_BOLSA, DTHR_INICIO_COLETA, OPERADOR_INICIO_COLETA) VALUES(?, ?, ?, ?, ?)";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            ps.setString(1, coleta.getAmostra());
            ps.setString(2, coleta.getTipoBolsa());
            ps.setString(3, coleta.getLoteBolsa());
            ps.setTimestamp(4, new java.sql.Timestamp(coleta.getDtHrInicioColeta().getTimeInMillis()));
            ps.setString(5, coleta.getOpeInicioColeta());

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    /*
     * Busca os dados de uma amostra
     */
    public List<Coleta> getAmostra(String amostra){
        List<Coleta> coletas = new ArrayList<Coleta>();
        String sql = "SELECT * FROM RASTREABILIDADE WHERE AMOSTRA = ? ";

            try{
                PreparedStatement ps = this.connection.prepareStatement(sql);
                ps.setString(1, amostra);
                ResultSet rs = ps.executeQuery();

                Calendar dtHrInicioColeta  = Calendar.getInstance();
                Calendar dtHrFimColeta  = Calendar.getInstance();
                
                while(rs.next()){
                    Coleta coleta = new Coleta();
                    coleta.setAmostra(rs.getString("AMOSTRA"));
                    coleta.setTipoBolsa(rs.getString("TIPO_BOLSA"));
                    coleta.setLoteBolsa(rs.getString("LOTE_BOLSA"));
                    dtHrInicioColeta.setTime(rs.getTimestamp("DTHR_INICIO_COLETA"));
                    coleta.setDtHrInicioColeta(dtHrInicioColeta);
                    coleta.setOpeInicioColeta(rs.getString("OPERADOR_INICIO_COLETA"));
                    coleta.setPeso(rs.getInt("PESO"));
                    coleta.setTempoColeta(rs.getInt("TEMPO_COLETA"));
                    
                    if(rs.getTimestamp("DTHR_FIM_COLETA") != null){
                        dtHrFimColeta.setTime(rs.getTimestamp("DTHR_FIM_COLETA"));
                        coleta.setDtHrFimColeta(dtHrFimColeta);
                    }
                    
                    coleta.setOpeFimColeta(rs.getString("OPERADOR_FIM_COLETA"));
   
                    coletas.add(coleta);
                }
                rs.close();
                ps.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        return coletas;
    }
    
    
    /*
     * Atualiza os dados de uma amostra
     */
    public boolean edita(Coleta coleta, String amostra){
        String sql = "UPDATE RASTREABILIDADE SET "
                //+ " TIPO_BOLSA = ?"
                //+ ", LOTE_BOLSA = ?"
               // + ", DTHR_INICIO_COLETA = ?"
               // + ", OPERADOR_INICIO_COLETA = ?"
                + " PESO = ?"
                + ", TEMPO_COLETA = ?"
                + ", DTHR_FIM_COLETA = ?"
                + ", OPERADOR_FIM_COLETA = ?"
                + " WHERE AMOSTRA = ?";
        try{
            PreparedStatement ps = this.connection.prepareStatement(sql);

            //ps.setString(1, coleta.getTipoBolsa());
            //ps.setString(2, coleta.getLoteBolsa());
            //ps.setTimestamp(3, new java.sql.Timestamp(coleta.getDtHrInicioColeta().getTimeInMillis()));
            //ps.setString(4,coleta.getOpeInicioColeta());
            ps.setInt(1, coleta.getPeso());
            ps.setInt(2, coleta.getTempoColeta());
            ps.setTimestamp(3, new java.sql.Timestamp(coleta.getDtHrFimColeta().getTimeInMillis()));
            ps.setString(4,coleta.getOpeFimColeta());
            ps.setString(5, amostra);

            ps.execute();
            ps.close();
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        
        return true;
    }
}
