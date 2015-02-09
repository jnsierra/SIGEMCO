/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.contabilidad.dao.ClaseDao;
import co.com.sigemco.alfa.contabilidad.dto.ClaseDto;

/**
 * Clase responsable de realizar la logica de la clase
 *
 * @author SISCOMPUTO
 */
public class ClaseLogica {

    /**
     * Funcion encargada de realizar la logica de insercion de una clase
     *
     * @param objDto Objeto contenedor de los datos a insertar
     * @return retorno si la insercion fue realizada exitosamente
     */
    public String insertarClase(ClaseDto objDto) {
        String rta = "";
        ClaseDao objDao = null;
        try (EnvioFunction function = new EnvioFunction()) {
            objDao = poblarDto(objDto);
            boolean valida = function.enviarUpdate(objDao.insertar());
            if (valida) {
                rta = "Ok";
            } else {
                rta = "Error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Error ClaseLogica.insertarClase " + e;
        }
        return rta;
    }

    public ClaseDao poblarDto(ClaseDto objDto) {
        ClaseDao objDao = new ClaseDao();
        try {
            objDao.setClas_clas(objDto.getClas_clas());
            objDao.setClas_estado(objDto.getClas_estado());
            objDao.setClas_nombre(objDto.getClas_nombre());
            objDao.setClas_codigo(objDto.getClas_codigo());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return objDao;
    }

}
