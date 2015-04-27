package com.mb;

import java.io.Serializable;
import java.util.GregorianCalendar;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import com.facade.IteracaoFacade;
import com.model.Iteracao;
import com.model.Pendencia;
import com.model.User;

@ViewScoped
@ManagedBean
public class IteracaoMB extends AbstractMB implements Serializable{

	private static final long serialVersionUID = 1L;

	private Iteracao iteracao;
	private List<Iteracao> iteracaos;
	private IteracaoFacade iteracaoFacade;
	private HtmlOutputText pendenciaId;
	private Pendencia pendencia;

	public void setaPendencia() {
		pendencia = (Pendencia) pendenciaId.getAttributes().get("pendenciaId");
    }
	
	public HtmlOutputText getPendenciaId() {
		return pendenciaId;
	}

	public void setPendenciaId(HtmlOutputText pendenciaId) {
		this.pendenciaId = pendenciaId;
	}

	public IteracaoFacade getIteracaoFacade() {
		if (iteracaoFacade == null) {
			iteracaoFacade = new IteracaoFacade();
		}

		return iteracaoFacade;
	}

	public Iteracao getIteracao() {
		if (iteracao == null) {
			iteracao = new Iteracao();
		}

		return iteracao;
	}

	public void setIteracao(Iteracao iteracao) {
		this.iteracao = iteracao;
	}

	public String createIteracao() {
		try {
			User user = (User) FacesContext.getCurrentInstance()
					.getExternalContext().getSessionMap().get("user");
			
			iteracao.setUsuario(user);
			iteracao.setPendencia(pendencia);

			// Seta a data de criação da iteracao
			iteracao.setDataDaPendencia(new GregorianCalendar());

			getIteracaoFacade().createIteracao(iteracao);
			closeDialog();
			displayInfoMessageToUser("Registrado com sucesso!");
			loadIteracaos();
			resetIteracao();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, ocorreu algum problema. Tente novamente!");
			e.printStackTrace();
			return "/erro.xhtml";
		}

		return "";
	}

	public void updateIteracao() {
		try {
			getIteracaoFacade().updateIteracao(iteracao);
			closeDialog();
			displayInfoMessageToUser("Atualizado com sucesso!");
			loadIteracaos();
			resetIteracao();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, ocorreu algum problema. Tente novamente!");
			e.printStackTrace();
		}
	}

	public void deleteIteracao() {
		try {
			getIteracaoFacade().deleteIteracao(iteracao);
			closeDialog();
			displayInfoMessageToUser("Deletado com sucesso!");
			loadIteracaos();
			resetIteracao();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, ocorreu algum problema. Tente novamente!");
			e.printStackTrace();
		}
	}

	public void deleteIteracao(String id) {
		int idIteracao = Integer.parseInt(id);
		iteracao = iteracaoFacade.findIteracao(idIteracao);
		deleteIteracao();
	}

	public List<Iteracao> getAllIteracoes() {
		if (iteracaos == null) {
			loadIteracaos();
		}

		return iteracaos;
	}

	private void loadIteracaos() {
		iteracaos = getIteracaoFacade().listAll();
	}

	public void resetIteracao() {
		iteracao = new Iteracao();
	}
	
	public Iteracao pesquisaIteracao(){
		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(true);
		
		int id = (Integer) session.getAttribute("id");
		int iteracaoId = id;
		iteracao = iteracaoFacade.findIteracao(iteracaoId);
		
		return iteracao;
	}
}
