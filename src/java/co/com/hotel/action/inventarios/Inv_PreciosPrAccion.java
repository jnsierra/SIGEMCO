/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.hotel.action.inventarios;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.dto.PrecioProducto;
import co.com.hotel.dto.Producto;
import co.com.hotel.logica.productos.Inv_ProductoLogica;
import co.com.hotel.logica.sede.Adm_SedeLogica;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.hotel.validacion.ValidaCampos;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author nicolas
 */
public class Inv_PreciosPrAccion extends ActionSupport implements SessionAware, UsuarioHabilitado {

    private Usuario usuario;
    private Map session;
    private Producto producto;
    private List<PrecioProducto> listaPreciosPr;
    private String accion;
    private Map<String, String> sedes;

    public String buscaProductoEspecifico() {
        Adm_SedeLogica sedeLogica = new Adm_SedeLogica();
        this.sedes = sedeLogica.obtieneSedes();
        Inv_ProductoLogica logica = new Inv_ProductoLogica();
        try {
            producto = logica.buscaProductosXCodigo(producto.getCodigo());
            if (producto != null) {
                listaPreciosPr = logica.buscaHistorialPreciosProd(producto.getId());
            } else {
                addActionError("No existe ningún producto con estos criterios de busqueda ");
            }

        } catch (Exception e) {
            System.out.println("Error Inv_PreciosPrAccion.buscaProductoEspecifico " + e);
        }
        return SUCCESS;
    }

    public String paramPrecioPr() {
        Adm_SedeLogica sedeLogica = new Adm_SedeLogica();
        this.sedes = sedeLogica.obtieneSedes();
        Inv_ProductoLogica logica = new Inv_ProductoLogica();
        try {
            String rta = logica.parametrizaPrecioPr(producto.getId(), usuario.getIdTius(), producto.getPrecio(), producto.getSede());
            if (rta.equalsIgnoreCase("Ok")) {
                addActionMessage("Parametrizacion de precio correctamente");
                producto = null;
            } else {
                addActionError("Error al adicionar el producto");
            }
        } catch (Exception e) {
            System.out.println("Error Inv_PreciosPrAccion.paramPrecioPr");
        }
        return SUCCESS;
    }

    public void validate() {
        ValidaCampos valida = new ValidaCampos();
        Adm_SedeLogica sedeLogica = new Adm_SedeLogica();
        this.sedes = sedeLogica.obtieneSedes();
        if (accion.equalsIgnoreCase("buscarProducto")) {

        } else if (accion.equalsIgnoreCase("parametrizarPr")) {
            if (!valida.validaNulo(producto.getPrecio())) {
                addActionError("El campo precio no puede ser nulo");
            }if(producto.getSede().equalsIgnoreCase("-1")){
                addActionError("Por favor seleccione la sede a la cual desea parametrizarle el precio");
            }
        }
        valida = null;
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

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public List<PrecioProducto> getListaPreciosPr() {
        return listaPreciosPr;
    }

    public void setListaPreciosPr(List<PrecioProducto> listaPreciosPr) {
        this.listaPreciosPr = listaPreciosPr;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public Map<String, String> getSedes() {
        return sedes;
    }

    public void setSedes(Map<String, String> sedes) {
        this.sedes = sedes;
    }
}
