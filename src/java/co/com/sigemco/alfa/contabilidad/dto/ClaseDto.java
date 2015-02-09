/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.dto;

/**
 * Clase responsable de transferir los datos de la clase
 * @author SISCOMPUTO
 */
public class ClaseDto {

    private String clas_clas;
    private String clas_estado;
    private String clas_nombre;
    private String clas_codigo;

    public String getClas_codigo() {
        return clas_codigo;
    }

    public void setClas_codigo(String clas_codigo) {
        this.clas_codigo = clas_codigo;
    }
    
    public String getClas_clas() {
        return clas_clas;
    }

    public void setClas_clas(String clas_clas) {
        this.clas_clas = clas_clas;
    }

    public String getClas_estado() {
        return clas_estado;
    }

    public void setClas_estado(String clas_estado) {
        this.clas_estado = clas_estado;
    }

    public String getClas_nombre() {
        return clas_nombre;
    }

    public void setClas_nombre(String clas_nombre) {
        this.clas_nombre = clas_nombre;
    }
    
    

}
