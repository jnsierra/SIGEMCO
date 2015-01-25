/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.hotel.action.facturacion;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.dto.Cliente;
import co.com.hotel.dto.Habitacion;
import co.com.hotel.logica.cliente.Fac_ClienteLogica;
import co.com.hotel.logica.facturacion.Fac_FacturacionLogica;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.hotel.validacion.ValidaCampos;
import co.com.hotel.validacion.ValidaDuplicados;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author SOFIA
 */
public class Fact_FacturacionAction extends ActionSupport implements SessionAware, UsuarioHabilitado {

    private Cliente cliente;
    private Usuario usuario;
    private Map session;
    private String existeCliente;
    private String numPersonas;
    private String numHabitacion;
    private String fechaInicial;
    private String fechaFinal;
    private String numDias;
    //Respuesta consulta de habitaciones con capacidad necesaria
    private ArrayList<Habitacion> rtaCon;
    //Respuesta con la capacidad y la disponibilidad de reserva
    private ArrayList<Habitacion> rtaConDispo;
    //Respuesta con todas las habitaciones del hotel
    private ArrayList<Habitacion> rtaTodas;

    @SkipValidation
    public String buscaHabitacion() {
        ValidaCampos valida = new ValidaCampos();
        boolean val = valida.validaNulo(numPersonas);
        clearErrorsAndMessages();
        if (val == false) {
            addActionError("El campo numero de personas no puede ser vacio");
            return INPUT;
        }
        val = valida.validaNulo(numHabitacion);
        if (val == false) {
            addActionError("El campo numero de habitación de personas no puede ser vacio");
            return INPUT;
        }
        val = valida.validaNumerico(numPersonas);
        if (val == false) {
            addActionError("El campo numero de personas debe ser numerico");
            return INPUT;
        }
        val = valida.validaNumerico(numHabitacion);
        if (val == false) {
            addActionError("El campo numero de habitación debe ser numerico");
            return INPUT;
        }
        Fac_FacturacionLogica logica = null;
        try {
            logica = new Fac_FacturacionLogica();
            rtaCon = logica.buscarHabitacionesNumPersNumHab(numPersonas, numHabitacion);
            rtaConDispo = logica.buscarHabitacionesNumPersNumHab(numPersonas, fechaInicial,usuario.getIdTius(),numDias);
            rtaTodas = logica.buscarHabitaciones();
            if(rtaCon == null){
                addActionError("La consulta no arrojo ningun resultado");
                return INPUT;
            }                
        } catch (Exception e) {
        }finally{
            logica = null;
        }
        return SUCCESS;
    }

    @SkipValidation
    public String consultaCliente() {
        Fac_ClienteLogica clienteLogica = new Fac_ClienteLogica();
        Cliente clienteAux = null;
        clienteAux = clienteLogica.buscaClienteXCedula(cliente.getCedula());
        if (clienteAux == null) {
            addActionError("Cliente inexistente en el sistema. Por favor ingrese los siguientes datos basicos del cliente");
            existeCliente = "N";
            return "inexistente";
        } else {
            cliente = clienteAux;
        }
        return "existe";
    }

    public String insertarCliente() {
        Fac_ClienteLogica clienteLogica = new Fac_ClienteLogica();
        try {
            String rta = clienteLogica.insertaCliente(cliente);
            System.out.println("Esta es la rta: " + rta);
        } catch (Exception e) {
            System.out.println("Error Fact_FacturacionAction.insertarCliente " + e);
        } finally {
            clienteLogica = null;
        }
        return SUCCESS;
    }

    public void validate() {
        clearErrorsAndMessages();
        ValidaCampos valida = new ValidaCampos();
        boolean rtaValida = false;
        rtaValida = valida.validaNulo(cliente.getNombres().trim());
        if (rtaValida == false) {
            addActionError("El campo nombres no puede ser Nulo");
            existeCliente = "N";
        }
        rtaValida = valida.validaNulo(cliente.getApellidos().trim());
        if (rtaValida == false) {
            addActionError("El campo Apellidos no puede ser Nulo");
            existeCliente = "N";
        }
        rtaValida = valida.validaNulo(cliente.getMail().trim());
        if (rtaValida == false) {
            addActionError("El campo Correo no puede ser Nulo");
            existeCliente = "N";
        }
        rtaValida = valida.validaCorreo(cliente.getMail().trim());
        if (rtaValida == false) {
            addActionError("El campo Correo no tiene el formato deseado");
            existeCliente = "N";
        }
        ValidaDuplicados duplicados = new ValidaDuplicados();
        rtaValida = duplicados.verificaCorreo(cliente.getMail());
        if (rtaValida == false) {
            addActionError("El campo Correo ya existe en la base de datos");
            existeCliente = "N";
        }
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
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

    public String getExisteCliente() {
        return existeCliente;
    }

    public void setExisteCliente(String existeCliente) {
        this.existeCliente = existeCliente;
    }

    public String getNumPersonas() {
        return numPersonas;
    }

    public void setNumPersonas(String numPersonas) {
        this.numPersonas = numPersonas;
    }

    public String getNumHabitacion() {
        return numHabitacion;
    }

    public void setNumHabitacion(String numHabitacion) {
        this.numHabitacion = numHabitacion;
    }

    public ArrayList<Habitacion> getRtaCon() {
        return rtaCon;
    }

    public void setRtaCon(ArrayList<Habitacion> rtaCon) {
        this.rtaCon = rtaCon;
    }

    public String getFechaInicial() {
        return fechaInicial;
    }

    public void setFechaInicial(String fechaInicial) {
        this.fechaInicial = fechaInicial;
    }

    public String getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(String fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public String getNumDias() {
        return numDias;
    }

    public void setNumDias(String numDias) {
        this.numDias = numDias;
    }

    public ArrayList<Habitacion> getRtaConDispo() {
        return rtaConDispo;
    }

    public void setRtaConDispo(ArrayList<Habitacion> rtaConDispo) {
        this.rtaConDispo = rtaConDispo;
    }

    public ArrayList<Habitacion> getRtaTodas() {
        return rtaTodas;
    }

    public void setRtaTodas(ArrayList<Habitacion> rtaTodas) {
        this.rtaTodas = rtaTodas;
    }
}
