/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.action;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.hotel.validacion.ValidaCampos;
import co.com.sigemco.alfa.contabilidad.dto.ClaseDto;
import co.com.sigemco.alfa.contabilidad.logica.ClaseLogica;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 * Clase encargada de realizar las acciones de la clase
 * @author SISCOMPUTO
 */
public class ClaseAction extends ActionSupport implements SessionAware, UsuarioHabilitado {
    
    private Map session;
    private Usuario usuario;
    private String accion;
    private ClaseDto clase;
    /**
     * Funcion encargada de realizar la accion de insertar una clase
     * @return 
     */
    public String insertarClase(){
        ClaseLogica logica = null;
        try {
            logica = new ClaseLogica();
            String valida = logica.insertarClase(clase);
            if(valida.equalsIgnoreCase("Ok")){
                addActionMessage("Clase insertada correctamente");
                clase = null;
            }else {
                addActionError("Error al insertar la clase");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }
    
    public void validate(){
        ValidaCampos valida = new ValidaCampos();
        if(accion.equalsIgnoreCase("insertar")){
            if(!valida.validaNulo(clase.getClas_nombre())){
                addActionError("El campo nombre no puede ser nulo");
            }
             if(!valida.validaNulo(clase.getClas_codigo())){
                addActionError("El campo codigo no puede ser nulo");
            }
            if(!valida.validaNumerico(clase.getClas_codigo())){
                addActionError("El campo codigo debe ser numerico");
            }           
        }
        valida = null;
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

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public ClaseDto getClase() {
        return clase;
    }

    public void setClase(ClaseDto clase) {
        this.clase = clase;
    }
    
}
