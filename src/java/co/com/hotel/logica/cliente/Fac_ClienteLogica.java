/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.hotel.logica.cliente;

import co.com.hotel.dto.Cliente;
import co.com.hotel.persistencia.general.EnvioFunction;
import java.sql.ResultSet;

/**
 *
 * @author SOFIA
 */
public class Fac_ClienteLogica {

    public Cliente buscaClienteXCedula(String cedula) {
        Cliente cliente = null;
        EnvioFunction function = new EnvioFunction();
        ResultSet rs = null;
        try {
            String sql = "Select pers_apellido, pers_nombre, pers_cedula, pers_email, pers_tel, pers_cel, pers_dir, pers_dept_resi, pers_ciudad_resi, clien_clien\n";
            sql += "from us_tpers, us_tclien\n";
            sql += "where pers_cedula = '" + cedula + "'\n";
            sql += "and pers_pers = clien_pers";
            rs = function.enviarSelect(sql);
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setApellidos(rs.getString("pers_apellido"));
                cliente.setNombres(rs.getString("pers_nombre"));
                cliente.setCedula(rs.getString("pers_cedula"));
                cliente.setIdCliente(rs.getString("clien_clien"));
                cliente.setMail(rs.getString("pers_email"));
            }
        } catch (Exception e) {
            System.out.println("Error Fac_ClienteLogica.buscaClienteXCedula " + e);
        } finally {
            function.cerrarConexion();
        }
        return cliente;
    }

    public String insertaCliente(Cliente cliente) {
        EnvioFunction function = new EnvioFunction();
        try {
            function.adicionarNombre("US_FINSERT_CLIENTE");
            String param = "";
            param = function.adicionarParametro(cliente.getNombres());
            param = function.adicionarParametro(cliente.getApellidos());
            param = function.adicionarNumeric(cliente.getCedula());
            if (cliente.getMail() == null) {
                cliente.setMail("SIN INFO");
            }
            param = function.adicionarParametro(cliente.getMail());
            if (cliente.getTel() == null) {
                cliente.setTel("SIN INFO");
            }
            param = function.adicionarParametro(cliente.getTel());
            String rtaPg = function.llamarFunction(function.getSql());
            function.recuperarString();
            function.cerrarConexion();
            String[] rtaVector = rtaPg.split("-");
            // Este mensaje lo envia la funcion que envia la funcion de java que
            // confirma que el llamado de a la funcion fue exitiso
            if (rtaVector[1].equalsIgnoreCase("Ok")) {
                //Esta es la respuesta que retorna postgres
                String rtaFunc = function.getRespuesta();
                String[] auxRta = rtaFunc.split("-");
                if ((auxRta[0].trim()).equalsIgnoreCase("OK")) {
                    return auxRta[1];
                } else {
                    return "Error";
                }
            } else {
                return "Error";
            }
        } catch (Exception e) {
            System.out.println("Error Fac_ClienteLogica.insertaCliente");
        } finally {
            function.cerrarConexion();
            function = null;
        }
        return "Error";
    }

}
