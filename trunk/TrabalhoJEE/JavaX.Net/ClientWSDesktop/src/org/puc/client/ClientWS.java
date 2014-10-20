package org.puc.client;

import javax.swing.JOptionPane;

public class ClientWS {

    public static void main(String[] args) {
        try {
            org.tempuri.ContaLetras service = new org.tempuri.ContaLetras();
            org.tempuri.ContaLetrasSoap port = service.getContaLetrasSoap();

            String mensagem = port.contarLetras(JOptionPane.showInputDialog("Digite seu nome"));
            JOptionPane.showMessageDialog(null, mensagem);
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Ocorreu algum erro!\n"
                    + "Contate o administrador do sistema.\n" + e.getMessage());
        }

    }
}
