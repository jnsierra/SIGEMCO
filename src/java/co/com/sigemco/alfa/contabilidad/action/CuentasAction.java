/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.action;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.sigemco.alfa.contabilidad.dto.CuentaDto;
import co.com.sigemco.alfa.contabilidad.logica.CuentaLogica;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *Clase encargada de realizar las acciones de la  cuenta
 * @author SISCOMPUTO
 */
public class CuentasAction extends ActionSupport implements SessionAware, UsuarioHabilitado{
    private Map session;
    private Usuario usuario;
    private CuentaDto cuenta;
    private String accion;

    public String insertarCuenta(){
        CuentaLogica logica = null;
        try {
            logica = new CuentaLogica();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return SUCCESS;
    }
    public void validate(){
        
    }
    
    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }
    
    public CuentaDto getCuenta() {
        return cuenta;
    }

    public void setCuenta(CuentaDto cuenta) {
        this.cuenta = cuenta;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
}
