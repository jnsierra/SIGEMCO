/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.inventario.dao;

/**
 *
 * @author nicolas
 */
public class RemisionDao {

    private String rmce_rmce;
    private String rmce_refe;
    private String rmce_imei;
    private String rmce_iccid;
    private String rmce_valor;
    private String rmce_comision;
    private String rmce_tppl;
    private String rmce_fcve;
    private String rmce_fcsl;
    private String rmce_fcen;
    private String rmce_tius_ent;
    private String rmce_tius_sal;
    private String rmce_codigo;
    private String rmce_sede;
    private String rmce_estado;
    private String rmce_pagado;
    private String rmce_comdev;

    public String getRmce_rmce() {
        return rmce_rmce;
    }

    public void setRmce_rmce(String rmce_rmce) {
        this.rmce_rmce = rmce_rmce;
    }

    public String getRmce_imei() {
        return rmce_imei;
    }

    public void setRmce_imei(String rmce_imei) {
        this.rmce_imei = rmce_imei;
    }

    public String getRmce_iccid() {
        return rmce_iccid;
    }

    public void setRmce_iccid(String rmce_iccid) {
        this.rmce_iccid = rmce_iccid;
    }

    public String getRmce_valor() {
        return rmce_valor;
    }

    public void setRmce_valor(String rmce_valor) {
        this.rmce_valor = rmce_valor;
    }

    public String getRmce_comision() {
        return rmce_comision;
    }

    public void setRmce_comision(String rmce_comision) {
        this.rmce_comision = rmce_comision;
    }

    public String getRmce_tppl() {
        return rmce_tppl;
    }

    public void setRmce_tppl(String rmce_tppl) {
        this.rmce_tppl = rmce_tppl;
    }

    public String getRmce_fcve() {
        return "to_date('" + rmce_fcve + "','mm/dd/yyyy')";
    }

    public void setRmce_fcve(String rmce_fcve) {
        this.rmce_fcve = rmce_fcve;
    }

    public String getRmce_fcsl() {
        return rmce_fcsl;
    }

    public void setRmce_fcsl(String rmce_fcsl) {
        this.rmce_fcsl = rmce_fcsl;
    }

    public String getRmce_fcen() {
        return rmce_fcen;
    }

    public void setRmce_fcen(String rmce_fcen) {
        this.rmce_fcen = rmce_fcen;
    }

    public String getRmce_tius_ent() {
        return rmce_tius_ent;
    }

    public void setRmce_tius_ent(String rmce_tius_ent) {
        this.rmce_tius_ent = rmce_tius_ent;
    }

    public String getRmce_tius_sal() {
        return rmce_tius_sal;
    }

    public void setRmce_tius_sal(String rmce_tius_sal) {
        this.rmce_tius_sal = rmce_tius_sal;
    }

    public String getRmce_codigo() {
        return rmce_codigo;
    }

    public void setRmce_codigo(String rmce_codigo) {
        this.rmce_codigo = rmce_codigo;
    }

    public String getRmce_sede() {
        return rmce_sede;
    }

    public void setRmce_sede(String rmce_sede) {
        this.rmce_sede = rmce_sede;
    }

    public String getRmce_refe() {
        return rmce_refe;
    }

    public void setRmce_refe(String rmce_refe) {
        this.rmce_refe = rmce_refe;
    }

    public String getRmce_estado() {
        return rmce_estado;
    }

    public void setRmce_estado(String rmce_estado) {
        this.rmce_estado = rmce_estado;
    }

    public String getRmce_pagado() {
        return rmce_pagado;
    }

    public void setRmce_pagado(String rmce_pagado) {
        this.rmce_pagado = rmce_pagado;
    }

    public String getRmce_comdev() {
        return rmce_comdev;
    }

    public void setRmce_comdev(String rmce_comdev) {
        this.rmce_comdev = rmce_comdev;
    }

    /**
     * Funcion la cual retorna el query pra realizar la insercion a la base de
     * datos de remisiones de celulares
     *
     * @return
     */
    public String insert() {
        String insert = "";
        insert += "INSERT INTO in_trmce(";
        insert += "            rmce_refe, rmce_imei, rmce_iccid, rmce_valor, rmce_comision,    ";
        insert += "            rmce_tppl, rmce_fcve, rmce_tius_ent, rmce_sede)values(";
        insert += "'" + this.getRmce_refe() + "'";
        insert += ",'" + this.getRmce_imei() + "'";
        insert += ",'" + this.getRmce_iccid() + "'";
        insert += ",'" + this.getRmce_valor() + "'";
        insert += ",'" + this.getRmce_comision() + "'";
        insert += ",'" + this.getRmce_tppl() + "'";
        insert += "," + this.getRmce_fcve() + "";
        insert += ",'" + this.getRmce_tius_ent() + "'";
        insert += ",'" + this.getRmce_sede() + "')";
        return insert;
    }

    /**
     * Funcion la cual se encarga de generar el sql para la consulta general por
     * filtros
     *
     * @return
     */
    public String consultaGeneralXFiltros() {
        String select = "";
        select += "SELECT rmce_rmce, rmce_refe, rmce_imei, rmce_iccid, to_char(rmce_valor,'LFM9,999,999.99') rmce_valor , rmce_comision,  \n";
        select += "       rmce_tppl, rmce_fcve, rmce_fcsl, rmce_fcen, rmce_tius_ent, rmce_tius_sal,\n";
        select += "       rmce_codigo, rmce_sede, rmce_estado, rmce_pagado, rmce_comdev            \n";
        select += "  FROM in_trmce                                                                \n";
        return select;
    }

}
