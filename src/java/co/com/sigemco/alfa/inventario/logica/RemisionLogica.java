/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.inventario.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.inventario.dao.RemisionDao;
import co.com.sigemco.alfa.inventario.dto.RemisionDto;

/**
 * Clase encargada de la logica de las remisones del sistema
 *
 * @author nicolas
 */
public class RemisionLogica {

    /**
     * Funcion encargada de realizar la logica de insersion de una remision
     *
     * @return
     */
    public String insertaRemision(RemisionDto objDto) {
        String rta = "";
        RemisionDao objDao = null;
        try (EnvioFunction function = new EnvioFunction()) {
            objDao = poblarDao(objDto);            
            if(function.enviarUpdate(objDao.insert())){
                rta = "Ok";
            }else{
                rta = "Error al insertar";
            }
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Error RemisionLogica.insertaRemision " + e;
        }
        return rta;
    }

    public RemisionDao poblarDao(RemisionDto objDto) {
        RemisionDao rta = null;
        try {
            rta = new RemisionDao();
            rta.setRmce_rmce(objDto.getRmce_rmce());
            rta.setRmce_refe(objDto.getRmce_refe());
            rta.setRmce_imei(objDto.getRmce_imei());
            rta.setRmce_iccid(objDto.getRmce_iccid());
            rta.setRmce_valor(objDto.getRmce_valor());
            rta.setRmce_comision(objDto.getRmce_comision());
            rta.setRmce_tppl(objDto.getRmce_tppl());
            rta.setRmce_fcve(objDto.getRmce_fcve());
            rta.setRmce_fcsl(objDto.getRmce_fcsl());
            rta.setRmce_fcen(objDto.getRmce_fcen());
            rta.setRmce_tius_ent(objDto.getRmce_tius_ent());
            rta.setRmce_tius_sal(objDto.getRmce_tius_sal());
            rta.setRmce_codigo(objDto.getRmce_codigo());
            rta.setRmce_sede(objDto.getRmce_sede());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rta;
    }
}
