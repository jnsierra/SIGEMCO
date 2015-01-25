/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.hotel.action.reenvio;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.dto.Empresa;
import co.com.hotel.logica.categoria.Inv_CategoriaLogica;
import co.com.hotel.logica.empresa.Emp_EmpresaLogica;
import co.com.hotel.logica.perfil.Adm_PerfilLogica;
import co.com.hotel.logica.sede.Adm_SedeLogica;
import co.com.hotel.logica.usuarios.Adm_UsuarioLogica;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.sigemco.alfa.inventario.logica.ReferenciaLogica;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author SOFIA
 */
public class reenvioGeneral extends ActionSupport implements UsuarioHabilitado, SessionAware {

    private int accion;
    private Usuario usuario;
    private Map session;
    //El primer numero el modulo, el segundo submodulo, el tercero accion(insert'1', update'2', inactivar'3', consulta'4', operativo'5'): 
    //ejemplo
    // 121  (1)Modulo de administracion (2)perfiles (1)Insert
    //MODULO ADMINISTRACION (Primer digito 1)
    public static final int ADM_CON_USUARIO = 110;
    public static final int ADM_INS_USUARIO = 111;
    public static final int ADM_UPD_USUARIO = 112;
    public static final int ADM_INS_PERFIL = 121;
    public static final int ADM_UPD_PERFIL = 122;
    public static final int ADM_CON_PERFIL = 124;
    public static final int ADM_INS_EMPRESA = 131;   //Parametros generales de la empresa
    public static final int ADM_INS_SEDE = 141;   //
    public static final int ADM_UPD_SEDE = 142;   //
    public static final int ADM_CON_SEDE = 144;   //

    //MODULO INVENTARIOS (Primer digito 2)
    public static final int INV_INS_PRODUCTO = 211;
    public static final int INV_INS_PRODEXIS = 219; //El ultimo digito es nueve ya que  ya existe la insercion de productos
    public static final int INV_UPD_PRODUCTO = 212;
    public static final int INV_CON_PRODUCTO = 214;
    public static final int INV_ACI_PRODUCTO = 215; //Activa o inactiva productos 
    public static final int INV_PAR_PRECIOSPR = 216; //Parametrizacion de precios de productos

    public static final int INV_INS_SERVICIO = 221;
    public static final int INV_CON_SERVICIO = 224;
    public static final int INV_UPD_SERVICIO = 222;
    public static final int INV_ACI_SERVICIO = 225; //Activa o inactiva un servicios
    public static final int INV_PAR_PRECIOSV = 231; //Parametrizacion de precios de servicios
    //Paginas de Movimientos de inventario
    public static final int INV_INS_MOVINVENTARIO = 241;
    public static final int INV_UPD_MOVINVENTARIO = 242;
    public static final int INV_CON_MOVINVENTARIO = 244;
    //Paginas de Celulares
    public static final int INV_INS_CELULAR = 251;
    //Paginas Referencias de celulares
    public static final int INV_INS_REFERENCIA = 261;
    public static final int INV_UPD_REFERENCIA = 262;
    public static final int INV_CON_REFERENCIA = 264;

    //MODULO FACTURACION (Primer digito 3)
    public static final int FAC_INS_FACTURA = 311;
    public static final int FAC_UPD_FACTURA = 312;
    //MODULO DE REPORTES (Primer digito 4)
    // Este modulo tiene una numeracion especial
    // primer digito(3) segundo (inventarios = 1, productos = 2 , usuarios= 3)
    public static final int REP_INV_PONDERADO = 411;
    public static final int REP_INV_USUARIOS = 431;//Reportes de usuarios
    //Listas iniciales de las paginas
    private List<String> perfiles;
    private List<String> estadoUsuario;
    private List<String> gravamen;
    private Map<String, String> yesNo;
    private Map<String, String> estadoMap;
    private Map<String, String> perfilesMap;
    private Map<String, String> sedes;
    private Map<String, String> categorias;
    private Map<String, String> referencias;

    //Mapas Necesarios para Referencias de Celular
    private Map<String, String> camara;
    private Map<String, String> memoria;
    private Map<String, String> pantalla;

    //Mapas necesarios para los movimientos de inventario
    private Map<String, String> naturalezaMvIn;
    private Map<String, String> usuarioImplicado;
    //Tipo plan
    private Map<String, String> tipoPlan;

    private String modifica;
    private String bandera;
    private String estado;
    private Empresa empresa;

    /**
     *
     * @return
     */
    public String execute() {
        String nextPage = "";
        Adm_PerfilLogica periflObj = null;
        Adm_UsuarioLogica usuarioObj = null;
        Adm_SedeLogica sedeLogica = null;
        Inv_CategoriaLogica cateLogica = null;
        ReferenciaLogica refeLogica = null;
        try {
            switch (this.accion) {
                case ADM_CON_USUARIO:
                    periflObj = new Adm_PerfilLogica();
                    this.perfiles = periflObj.obtieneNomPerfil();
                    usuarioObj = new Adm_UsuarioLogica();
                    this.estadoUsuario = usuarioObj.obtieneEstadoUsuario();
                    sedeLogica = new Adm_SedeLogica();
                    this.sedes = sedeLogica.obtieneSedes();
                    nextPage = "adm_con_usuario";
                    break;
                case ADM_INS_USUARIO:
                    periflObj = new Adm_PerfilLogica();
                    sedeLogica = new Adm_SedeLogica();
                    this.perfiles = periflObj.obtieneNomPerfil();
                    this.sedes = sedeLogica.obtieneSedes();
                    nextPage = "adm_ins_usuario";
                    break;
                case ADM_UPD_USUARIO:
                    periflObj = new Adm_PerfilLogica();
                    this.estadoMap = new HashMap<String, String>();
                    this.estadoMap.put("A", "Activo");
                    this.estadoMap.put("I", "Inactivo");
                    this.perfilesMap = periflObj.obitnePerfilIdNombre();
                    modifica = "N";
                    sedeLogica = new Adm_SedeLogica();
                    this.sedes = sedeLogica.obtieneSedes();
                    nextPage = "adm_upd_usuario";
                    break;
                case ADM_INS_PERFIL:
                    nextPage = "adm_ins_perfil";
                    break;
                case ADM_UPD_PERFIL:
                    nextPage = "adm_upd_perfil";
                    break;
                case ADM_CON_PERFIL:
                    nextPage = "adm_con_perfil";
                    break;
                case ADM_INS_EMPRESA:
                    nextPage = "adm_ins_empresa";
                    Emp_EmpresaLogica logica = new Emp_EmpresaLogica();
                    empresa = logica.obtieneDatosEmpresa();
                    break;
                case INV_INS_PRODUCTO:
                    nextPage = "inv_ins_producto";
                    sedeLogica = new Adm_SedeLogica();
                    this.sedes = sedeLogica.obtieneSedes();
                    cateLogica = new Inv_CategoriaLogica();
                    this.categorias = cateLogica.obtieneCategorias();
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    break;
                case INV_INS_PRODEXIS:
                    bandera = "S";
                    nextPage = "inv_ins_prodexis";
                    break;
                case FAC_INS_FACTURA:
                    nextPage = "fac_ins_factura";
                    break;
                case INV_INS_SERVICIO:
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    nextPage = "inv_ins_servicio";
                    break;
                case INV_CON_SERVICIO:
                    nextPage = "inv_con_servicio";
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    break;
                case INV_UPD_SERVICIO:
                    nextPage = "inv_upd_servicio";
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    break;
                case INV_CON_PRODUCTO:
                    nextPage = "inv_con_producto";
                    break;
                case INV_UPD_PRODUCTO:
                    nextPage = "inv_upd_producto";
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    break;
                case REP_INV_PONDERADO:
                    nextPage = "rep_inv_ponderado";
                    break;
                case INV_ACI_PRODUCTO:
                    nextPage = "inv_aci_producto";
                    this.estadoMap = new HashMap<String, String>();
                    this.estadoMap.put("A", "Activo");
                    this.estadoMap.put("I", "Inactivo");
                    break;
                case INV_ACI_SERVICIO:
                    nextPage = "inv_aci_servicio";
                    this.estadoMap = new HashMap<String, String>();
                    this.estadoMap.put("A", "Activo");
                    this.estadoMap.put("I", "Inactivo");
                    break;
                case INV_PAR_PRECIOSPR:
                    nextPage = "inv_par_preciospr";
                    break;
                case INV_PAR_PRECIOSV:
                    nextPage = "inv_par_preciosv";
                    break;

                case INV_INS_CELULAR:
                    sedeLogica = new Adm_SedeLogica();
                    this.sedes = sedeLogica.obtieneSedes();
                    this.tipoPlan = new HashMap<String, String>();                    
                    this.tipoPlan.put("ps", "dos");
                    this.tipoPlan.put("pr", "uno");
                    refeLogica = new ReferenciaLogica();
                    this.referencias = refeLogica.obtieneIdDescrReferenciaActivos();
                    nextPage = "inv_ins_celular";
                    break;
                case FAC_UPD_FACTURA:
                    nextPage = "fac_upd_factura";
                    this.estado = "inicial";
                    break;
                case REP_INV_USUARIOS:
                    periflObj = new Adm_PerfilLogica();
                    this.perfilesMap = periflObj.obitnePerfilIdNombre();
                    this.estadoMap = new HashMap<String, String>();
                    this.estadoMap.put("A", "Activo");
                    this.estadoMap.put("I", "Inactivo");
                    nextPage = "rep_inv_usuarios";
                    break;
                case INV_INS_MOVINVENTARIO:
                    nextPage = "inv_ins_movinventario";
                    naturalezaMvIn = new HashMap<String, String>();
                    this.naturalezaMvIn.put("I", "Ingreso");
                    this.naturalezaMvIn.put("E", "Egreso");
                    this.usuarioImplicado = new HashMap<String, String>();
                    this.usuarioImplicado.put("C", "Cliente");
                    this.usuarioImplicado.put("P", "Proveedor");
                    this.usuarioImplicado.put("N", "Ninguno");
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    break;

                case INV_INS_REFERENCIA:
                    nextPage = "inv_ins_referencia";
                    break;
                case INV_UPD_REFERENCIA:
                    nextPage = "inv_upd_referencia";
                    break;
                case INV_CON_REFERENCIA:
                    nextPage = "Inv_ConReferencia";
                    this.camara = new HashMap<String, String>();
                    this.camara.put("8", "MENOS DE 8");
                    this.camara.put("13", "ENTRE 8 Y 13");
                    this.camara.put("14", "MAS DE 13 ");

                    this.pantalla = new HashMap<String, String>();
                    this.pantalla.put("4", "MENOS DE 4");
                    this.pantalla.put("5", "MAS DE 4");

                    this.memoria = new HashMap<String, String>();
                    this.memoria.put("16", "MENOS DE 16");
                    this.memoria.put("32", "ENTRE 16 Y 32");
                    this.memoria.put("33", "MAS DE 33");


                    

                    this.estadoMap = new HashMap<String, String>();
                    this.estadoMap.put("A", "Activo");
                    this.estadoMap.put("I", "Inactivo");

                    break;

                case INV_UPD_MOVINVENTARIO:
                    nextPage = "inv_upd_movinventario";
                    naturalezaMvIn = new HashMap<String, String>();
                    this.naturalezaMvIn.put("I", "Ingreso");
                    this.naturalezaMvIn.put("E", "Egreso");
                    this.usuarioImplicado = new HashMap<String, String>();
                    this.usuarioImplicado.put("C", "Cliente");
                    this.usuarioImplicado.put("P", "Proveedor");
                    this.usuarioImplicado.put("N", "Ninguno");
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    break;
                case INV_CON_MOVINVENTARIO:
                    nextPage = "inv_con_movinventario";
                    naturalezaMvIn = new HashMap<String, String>();
                    this.naturalezaMvIn.put("I", "Ingreso");
                    this.naturalezaMvIn.put("E", "Egreso");
                    this.usuarioImplicado = new HashMap<String, String>();
                    this.usuarioImplicado.put("C", "Cliente");
                    this.usuarioImplicado.put("P", "Proveedor");
                    this.usuarioImplicado.put("N", "Ninguno");
                    this.yesNo = new HashMap<String, String>();
                    this.yesNo.put("S", "Si");
                    this.yesNo.put("N", "No");
                    this.modifica = "N";
                    break;
                case ADM_CON_SEDE:
                    nextPage = "adm_con_sede";

                    break;
                case ADM_INS_SEDE:
                    nextPage = "adm_ins_sede";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        periflObj = null;
        return nextPage;
    }

    public int getAccion() {
        return accion;
    }

    public void setAccion(int accion) {
        this.accion = accion;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public List<String> getPerfiles() {
        return perfiles;
    }

    public void setPerfiles(List<String> tipoUsuario) {
        this.perfiles = tipoUsuario;
    }

    public Map getSession() {
        return session;
    }

    public List<String> getEstadoUsuario() {
        return estadoUsuario;
    }

    public void setEstadoUsuario(List<String> estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    /**
     * Funcion utilizada para evitar que los usuarios vean datos que no deban.
     *
     * @return retorna si la excepcion fue realizada correctamente
     */
    public boolean limpiar() {
        try {
            perfiles.clear();
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    public List<String> getGravamen() {
        return gravamen;
    }

    public void setGravamen(List<String> gravamen) {
        this.gravamen = gravamen;
    }

    public Map<String, String> getYesNo() {
        return yesNo;
    }

    public void setYesNo(Map<String, String> yesNo) {
        this.yesNo = yesNo;
    }

    public String getModifica() {
        return modifica;
    }

    public void setModifica(String modifica) {
        this.modifica = modifica;
    }

    public Map<String, String> getPerfilesMap() {
        return perfilesMap;
    }

    public void setPerfilesMap(Map<String, String> perfilesMap) {
        this.perfilesMap = perfilesMap;
    }

    public Map<String, String> getEstadoMap() {
        return estadoMap;
    }

    public void setEstadoMap(Map<String, String> estadoMap) {
        this.estadoMap = estadoMap;
    }

    public String getBandera() {
        return bandera;
    }

    public void setBandera(String bandera) {
        this.bandera = bandera;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public Map<String, String> getNaturalezaMvIn() {
        return naturalezaMvIn;
    }

    public void setNaturalezaMvIn(Map<String, String> naturalezaMvIn) {
        this.naturalezaMvIn = naturalezaMvIn;
    }

    public Map<String, String> getUsuarioImplicado() {
        return usuarioImplicado;
    }

    public void setUsuarioImplicado(Map<String, String> usuarioImplicado) {
        this.usuarioImplicado = usuarioImplicado;
    }

    public Map<String, String> getSedes() {
        return sedes;
    }

    public void setSedes(Map<String, String> sedes) {
        this.sedes = sedes;
    }

    public Map<String, String> getCategorias() {
        return categorias;
    }

    public void setCategorias(Map<String, String> categorias) {
        this.categorias = categorias;
    }

    public Map<String, String> getTipoPlan() {
        return tipoPlan;
    }

    public void setTipoPlan(Map<String, String> tipoPlan) {
        this.tipoPlan = tipoPlan;
    }

    public Map<String, String> getCamara() {
        return camara;
    }

    public void setCamara(Map<String, String> camara) {
        this.camara = camara;
    }

    public Map<String, String> getMemoria() {
        return memoria;
    }

    public void setMemoria(Map<String, String> memoria) {
        this.memoria = memoria;
    }

    public Map<String, String> getPantalla() {
        return pantalla;
    }

    public void setPantalla(Map<String, String> pantalla) {
        this.pantalla = pantalla;
    }

    public Map<String, String> getReferencias() {
        return referencias;
    }

    public void setReferencias(Map<String, String> referencias) {
        this.referencias = referencias;
    }
    
}
