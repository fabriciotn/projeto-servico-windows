package br.com.ttf.auditoria.mb;

import java.io.IOException;
import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import br.com.ttf.auditoria.modelo.Usuario;

@SessionScoped
@ManagedBean(name="ususarioMB")
public class UsuarioMB implements Serializable {
	public static final String INJECTION_NAME = "#{usuarioMB}";
	private static final long serialVersionUID = 1L;

	private Usuario usuario;

	public boolean isAdministrador() {
		return usuario.isAdministrador();
	}
	public boolean isMaster() {
		return usuario.isMaster();
	}
	public boolean isAudior() {
		return usuario.isAuditor();
	}
	public boolean isRestrito() {
		return usuario.isRestrito();
	}

	public void logOut() throws IOException {
		getRequest().getSession().invalidate();
		FacesContext.getCurrentInstance().getExternalContext().redirect("index.xhtml");
		//return "/restrito/index.xhtml";
	}

	private HttpServletRequest getRequest() {
		return (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
	}

	public Usuario getUser() {
		return usuario;
	}

	public void setUser(Usuario usuario) {
		this.usuario = usuario;
	}
}