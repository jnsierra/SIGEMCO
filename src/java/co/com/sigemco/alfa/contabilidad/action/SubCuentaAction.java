/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.action;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.sigemco.alfa.contabilidad.dto.ClaseDto;
import co.com.sigemco.alfa.contabilidad.dto.CuentaDto;
import co.com.sigemco.alfa.contabilidad.dto.GrupoDto;
import co.com.sigemco.alfa.contabilidad.dto.SubCuentaDto;
import co.com.sigemco.alfa.contabilidad.logica.ClaseLogica;
import co.com.sigemco.alfa.contabilidad.logica.CuentaLogica;
import co.com.sigemco.alfa.contabilidad.logica.GrupoLogica;
import co.com.sigemco.alfa.contabilidad.logica.SubCuentaLogica;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 * Funcion encargada de las acciones de Subcuenta
 *
 * @author SISCOMPUTO
 */
public class SubCuentaAction extends ActionSupport implements SessionAware, UsuarioHabilitado {

    Usuario usuario;
    Map Session;
    CuentaDto cuenta;
    GrupoDto grupo;
    ClaseDto clase;

    /**
     * Funcion encargada de realizar la accion de insertar una subcuenta
     *
     * @return
     */
    public String insertSubCuenta() {
        SubCuentaDto subCuenta = null;
        try {
            SubCuentaLogica subCuentaLogica = new SubCuentaLogica();
            String rta = subCuentaLogica.insertSubCuenta(clase, cuenta, grupo);
            if (rta.equalsIgnoreCase("ok")) {
                addActionError("Error al insertar SubCuenta");
            } else {
                addActionError("SubCuenta insertada correctamente");
            }
            subCuenta = new SubCuentaDto();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Map getSession() {
        return Session;
    }

    public void setSession(Map Session) {
        this.Session = Session;
    }

    public CuentaDto getCuenta() {
        return cuenta;
    }

    public void setCuenta(CuentaDto cuenta) {
        this.cuenta = cuenta;
    }

    public GrupoDto getGrupo() {
        return grupo;
    }

    public void setGrupo(GrupoDto grupo) {
        this.grupo = grupo;
    }

    public ClaseDto getClase() {
        return clase;
    }

    public void setClase(ClaseDto clase) {
        this.clase = clase;
    }

}
