/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.inventario.logica;

import co.com.hotel.dto.Sede;
import co.com.hotel.logica.sede.Adm_SedeLogica;
import co.com.sigemco.alfa.inventario.dto.PrecioProductoDto;
import co.com.sigemco.alfa.inventario.dto.PrecioSedeDto;
import groovy.util.MapEntry;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 *
 * @author Nicolas
 */
public class PreciosLogica {

    /**
     * Funcion encargada de buscar todos los precios que han sido parametrizados
     * para un producto
     *
     * @param dska_dska llave primaria de la tabla de descripcion de productos
     * @return
     */
    public List<PrecioSedeDto> buscaPreciosSedes(String dska_dska) {
        List<PrecioSedeDto> rta = null;
        try {
            Adm_SedeLogica sedeLogica = new Adm_SedeLogica();
            Map<String, String> sedes = sedeLogica.obtieneSedes();
            for (Entry<String, String> e : sedes.entrySet()) {
                PrecioSedeDto aux = new PrecioSedeDto();
                aux.setSede_sede(e.getKey());
                aux.setSede_nombre(e.getValue());

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rta;
    }

    /**
     * Funcion encargada de realizar la logica para buscar el histrorial de
     * precios de una sede en especifico
     *
     * @param sede_sede String identificador primario para la tabla de sedes
     * @return
     */
    public List<PrecioProductoDto> buscaPrecioSede(String sede_sede, String dska_dska) {
        List<PrecioProductoDto> rta = null;
        try {

        } catch (Exception e) {

        }
        return rta;
    }

}
