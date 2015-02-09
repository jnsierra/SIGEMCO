/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.contabilidad.dao.CuentaDao;
import co.com.sigemco.alfa.contabilidad.dto.CuentaDto;

/**
 *
 * @author SISCOMPUTO
 */
public class CuentaLogica {
    
    public String insertar(CuentaDto objDto){
        String rta = "";
        CuentaDao objDao =null; 
        try (EnvioFunction Function = new EnvioFunction()){
            objDao = poblarDto(objDto);
            boolean valida = Function.enviarUpdate(objDao.insertar());
            if(valida){
                rta="OK";
                return rta;
            }else{
                rta="Error";
                return rta;
            }
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Error CuentaLogica.insertar "+e;
        }
        return rta;
    }
    public CuentaDao poblarDto(CuentaDto objDto ){
        CuentaDao objDao = new CuentaDao();
        try {
            objDto.setCue_codigo(objDao.getCue_codigo());
            objDto.setCue_gru(objDao.getCue_gru());
            objDto.setCue_nombre(objDao.getCue_nombre());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return objDao;
    }
    
}
