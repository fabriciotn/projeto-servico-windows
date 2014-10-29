package Conexao;

import java.sql.*;
import javax.swing.JOptionPane;

public class Conecta {
    static final String USER = "root";
    static final String PASS = "root";
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://localhost/integrador";
    public static Connection connection;

    public Connection conecta() {
        try {
            Class.forName(JDBC_DRIVER); //carrega classe de dados do BD
            System.out.println("Driver JDBC carregado com sucesso!");

            //estabelece conexão com o BD
            connection = DriverManager.getConnection(DB_URL,USER,PASS);
            System.out.println("Conexão estabelecida - Banco " + DB_URL);
            //connection.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Falha ao se conectar!\n"+e.toString());
            e.printStackTrace();
        }
        return connection;
    }
}
