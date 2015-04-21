package com.mb;

import java.io.Serializable;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import com.facade.SetorFacade;
import com.model.Setor;

@ViewScoped
@ManagedBean
public class SetorMB extends AbstractMB implements Serializable {
	private static final long serialVersionUID = 1L;

	private static final String SELECTED_SETOR = "selectedSetor";

	private Setor setor;
	private List<Setor> setores;

	private SetorFacade setorFacade;

	public void createSetor() {
		try {
			getSetorFacade().createSetor(setor);
			closeDialog();
			displayInfoMessageToUser("Created With Sucess");
			loadSetores();
			resetSetor();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, we could not create. Try again later");
			e.printStackTrace();
		}
	}

	public void updateSetor() {
		try {
			getSetorFacade().updateSetor(setor);
			closeDialog();
			displayInfoMessageToUser("Updated With Sucess");
			loadSetores();
			resetSetor();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, we could not create. Try again later");
			e.printStackTrace();
		}
	}

	public void deleteSetor() {
		try {
			getSetorFacade().deleteSetor(setor);
			closeDialog();
			displayInfoMessageToUser("Deleted With Sucess");
			loadSetores();
			resetSetor();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, we could not create. Try again later");
			e.printStackTrace();
		}
	}
	
	public SetorFacade getSetorFacade() {
		if (setorFacade == null) {
			setorFacade = new SetorFacade();
		}

		return setorFacade;
	}

	public Setor getSetor() {
		if (setor == null) {
			setor = new Setor();
		}

		return setor;
	}

	public void setSetor(Setor setor) {
		this.setor = setor;
	}

	public List<Setor> getAllSetores() {
		if (setores == null) {
			loadSetores();
		}

		return setores;
	}

	private void loadSetores() {
		setores = getSetorFacade().listAll();
	}

	public void resetSetor() {
		setor = new Setor();
	}
}