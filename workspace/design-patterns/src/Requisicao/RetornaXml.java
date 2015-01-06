package Requisicao;

public class RetornaXml implements Resposta{

	Resposta proximaResposta;
	
	@Override
	public void responde(Requisicao req, Conta conta) {
		if(req.equals(Formato.XML)){
			System.out.println("<conta><titular>" + conta.getTitular() + "</titular>" +
					"<saldo>" + conta.getSaldo() + "</saldo></conta>");
		}else{
			proximaResposta.responde(req, conta);;
		}
	}

	@Override
	public void setProxima(Resposta resposta) {
		this.proximaResposta = resposta;
	}

}
