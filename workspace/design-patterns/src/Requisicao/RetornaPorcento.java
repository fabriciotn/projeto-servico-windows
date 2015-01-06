package Requisicao;

public class RetornaPorcento implements Resposta{

	Resposta proximaResposta;

	@Override
	public void responde(Requisicao req, Conta conta) {
		if (req.equals(Formato.PORCENTO)) {
			System.out.println("%" + conta.getTitular()
					+ "%" + conta.getSaldo()
					+ "%");
		}else{
			proximaResposta.responde(req, conta);;
		}
	}

	@Override
	public void setProxima(Resposta resposta) {
		this.proximaResposta = resposta;
	}
}
