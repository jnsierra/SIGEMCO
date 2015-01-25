/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.inventario.action;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.dto.Sede;
import co.com.hotel.logica.sede.Adm_SedeLogica;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.hotel.validacion.ValidaCampos;
import co.com.sigemco.alfa.inventario.dto.RemisionDto;
import co.com.sigemco.alfa.inventario.logica.ReferenciaLogica;
import co.com.sigemco.alfa.inventario.logica.RemisionLogica;
import com.opensymphony.xwork2.ActionSupport;
import java.util.HashMap;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 * Clase encargada de realizar las acciones y redireccionar a las paginas de las
 * remisiones del sistema
 *
 * @author nicolas
 */
public class RemisionAction extends ActionSupport implements UsuarioHabilitado, SessionAware {

    private Usuario usuario;
    private Map session;
    private RemisionDto remision;
    private String accion;
    private Map<String, String> tipoPlan;
    private Map<String, String> sedes;
    private Map<String, String> referencias;

    public String insertarRemision() {
        RemisionLogica logica = null;
        try {
            logica = new RemisionLogica();
            this.remision.setRmce_tius_ent(usuario.getIdTius());
            String rta = logica.insertaRemision(remision);
            if (rta.equalsIgnoreCase("Ok")) {
                addActionMessage("Celular ingresado correctamente");
            } else {
                addActionError("Error al ingresar el Equipo Celular \n" + rta);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public void validate() {
        Adm_SedeLogica sedeLogica = new Adm_SedeLogica();
        this.sedes = sedeLogica.obtieneSedes();
        this.tipoPlan = new HashMap<String, String>();
        tipoPlan.put("pr", "PREPAGO");
        tipoPlan.put("ps", "POSTPAGO");
        ReferenciaLogica refeLogica = new ReferenciaLogica();
        this.referencias = refeLogica.obtieneIdDescrReferenciaActivos();
        ValidaCampos valida = new ValidaCampos();
        if (accion.equalsIgnoreCase("insertar")){
            if(remision.getRmce_refe().equalsIgnoreCase("-1")){
                addActionError("Debe seleccionar la referencia del Equipo Celular");
            }else if(!valida.validaNulo(remision.getRmce_imei())){
                addActionError("El campo Imei no puede ser nulo");
            }else if(!valida.validaNulo(remision.getRmce_iccid())){
                addActionError("El campo iccid no puede ser nulo");
            }else if(!valida.validaNulo(remision.getRmce_valor())){
                addActionError("El campo Valor de Venta no puede ser nulo");
            }else if(!valida.validaNumerico(remision.getRmce_valor())){
                addActionError("El campo Valor de venta debe ser numerico");
            }else if(!valida.validaNulo(remision.getRmce_comision())){
                addActionError("El campo comision no puede ser nulo");
            }else if(!valida.validaNumerico(remision.getRmce_comision())){
                addActionError("El campo comision debe ser numerico");
            }else if(remision.getRmce_tppl().equalsIgnoreCase("-1")){
                addActionError("Seleccione el tipo de plan del equipo celular");
            }else if(!valida.validaNulo(remision.getRmce_fcve())){
                addActionError("El campo fecha de Vencimiento no puede ser nulo");
            }else if(remision.getRmce_sede().equalsIgnoreCase("-1")){
                addActionError("Debe seleccionar la sede en cual estara el equipo celular");
            }
        }
        valida = null;
    }

    public RemisionDto getRemision() {
        return remision;
    }

    public void setRemision(RemisionDto remision) {
        this.remision = remision;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public Map<String, String> getTipoPlan() {
        return tipoPlan;
    }

    public void setTipoPlan(Map<String, String> tipoPlan) {
        this.tipoPlan = tipoPlan;
    }

    public Map<String, String> getSedes() {
        return sedes;
    }

    public void setSedes(Map<String, String> sedes) {
        this.sedes = sedes;
    }

    public Map<String, String> getReferencias() {
        return referencias;
    }

    public void setReferencias(Map<String, String> referencias) {
        this.referencias = referencias;
    }
}
