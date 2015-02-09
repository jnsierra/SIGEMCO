/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.dao;

/**
 *
 * @author SISCOMPUTO
 */
public class CuentaDao {
    private String cue_gru;					
    private String cue_estado;              
    private String cue_nombre; 				
    private String cue_codigo;	

    public String getCue_gru() {
        return cue_gru;
    }

    public void setCue_gru(String cue_gru) {
        this.cue_gru = cue_gru;
    }

    public String getCue_estado() {
        return cue_estado;
    }

    public void setCue_estado(String cue_estado) {
        this.cue_estado = cue_estado;
    }

    public String getCue_nombre() {
        return cue_nombre;
    }

    public void setCue_nombre(String cue_nombre) {
        this.cue_nombre = cue_nombre;
    }

    public String getCue_codigo() {
        return cue_codigo;
    }

    public void setCue_codigo(String cue_codigo) {
        this.cue_codigo = cue_codigo;
    }
    public String insertar(){
        String sql;
        sql="INSERT INTO co_tcue(";
        sql="cue_cue, cue_gru, cue_estado, cue_nombre, cue_codigo) ";
        sql=" VALUES ((select count(*)+1 from co_tcue ), "+ this.getCue_gru() +", UPPER('A'), "+ this.getCue_nombre() +", "+ this.getCue_codigo() +")";
        return sql;
    }
}
