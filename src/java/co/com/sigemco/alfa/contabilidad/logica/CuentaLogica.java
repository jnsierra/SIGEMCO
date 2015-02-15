/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.contabilidad.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.contabilidad.dao.CuentaDao;
import co.com.sigemco.alfa.contabilidad.dto.CuentaDto;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nicolas
 */
public class CuentaLogica {

    /**
     * Funcion encargada de realizar la logica para obtener las cuentas teniendo
     * en cuenta el id del grupo
     *
     * @param grup_grup
     * @return
     */
    public List<CuentaDto> obtienecuentasXGrupo(String grup_grup) {
        List<CuentaDto> rta = null;
        CuentaDao objDao = null;
        try (EnvioFunction function = new EnvioFunction()) {
            objDao = new CuentaDao();
            ResultSet rs = function.enviarSelect(objDao.cuentasXIdGrupo(grup_grup));
            while (rs.next()) {
                if (rta == null) {
                    rta = new ArrayList<CuentaDto>();
                }
                CuentaDto aux = new CuentaDto();
                aux.setCuen_cuen(rs.getString("cuen_cuen"));
                aux.setCuen_grup(rs.getString("cuen_grup"));
                aux.setCuen_estado(rs.getString("cuen_estado"));
                aux.setCuen_nombre(rs.getString("cuen_nombre"));
                aux.setCuen_codigo(rs.getString("cuen_codigo"));
                aux.setCuen_descripcion(rs.getString("cuen_descripcion"));
                rta.add(aux);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rta;
    }

}
