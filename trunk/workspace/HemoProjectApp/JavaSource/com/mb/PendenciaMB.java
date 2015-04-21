package com.mb;

import java.io.Serializable;
import java.util.List;

import com.facade.PendenciaFacade;
import com.model.Pendencia;

public class PendenciaMB extends AbstractMB implements Serializable{

	private static final long serialVersionUID = 1L;

	private Pendencia pendencia;
	private List<Pendencia> pendencias;
	private PendenciaFacade pendenciaFacade;

	public PendenciaFacade getPendenciaFacade() {
		if (pendenciaFacade == null) {
			pendenciaFacade = new PendenciaFacade();
		}

		return pendenciaFacade;
	}

	public Pendencia getPendencia() {
		if (pendencia == null) {
			pendencia = new Pendencia();
		}

		return pendencia;
	}

	public void setPendencia(Pendencia pendencia) {
		this.pendencia = pendencia;
	}

	public void createPendencia() {
		try {
			getPendenciaFacade().createPendencia(pendencia);
			closeDialog();
			displayInfoMessageToUser("Created With Sucess");
			loadPendencias();
			resetPendencia();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, we could not create. Try again later");
			e.printStackTrace();
		}
	}
	
	public void updatePendencia() {
		try {
			getPendenciaFacade().updatePendencia(pendencia);
			closeDialog();
			displayInfoMessageToUser("Updated With Sucess");
			loadPendencias();
			resetPendencia();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, we could not create. Try again later");
			e.printStackTrace();
		}
	}
	
	public void deletePendencia() {
		try {
			getPendenciaFacade().deletePendencia(pendencia);
			closeDialog();
			displayInfoMessageToUser("Deleted With Sucess");
			loadPendencias();
			resetPendencia();
		} catch (Exception e) {
			keepDialogOpen();
			displayErrorMessageToUser("Ops, we could not create. Try again later");
			e.printStackTrace();
		}
	}

	public List<Pendencia> getAllPendencias() {
		if (pendencias == null) {
			loadPendencias();
		}

		return pendencias;
	}

	private void loadPendencias() {
		pendencias = getPendenciaFacade().listAll();
	}

	public void resetPendencia() {
		pendencia = new Pendencia();
	}
}
