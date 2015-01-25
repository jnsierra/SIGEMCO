/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.hotel.logica.reportes;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.persistencia.general.EnvioFunction;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 *
 * @author nicolas
 */
public class Rep_ReporteLogica {
    
    public String generarFactura(String fact_fact,String ruta,String rutaDestino){
        String  rta="Ok";
        EnvioFunction function = new EnvioFunction();
        Connection conn= null; 
        try {
            conn = this.generarConexion();
            String ubicacionReporte = ruta;
            Map<String,Object> properties = new HashMap<String, Object>();
            properties.put("fact_fact", Integer.parseInt(fact_fact));
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(ubicacionReporte);
            JasperPrint print = JasperFillManager.fillReport(jasperReport, properties, conn);
            JasperExportManager.exportReportToPdfFile(print, rutaDestino);            
        } catch (Exception e) {
            System.out.println("Error Rep_ReporteLogica.generarFactura " +e);
            rta = "Error " + e;
        }finally{
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Rep_ReporteLogica.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rta;
    }
    
    public Connection generarConexion(){
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://127.0.0.1:5432/Hotel";
            con = DriverManager.getConnection(url, "postgres", "1234");
        } catch (Exception e) {
            System.out.println("Error al realizar la conexion...");
            e.printStackTrace();
        }
        return con;
    }
    
    public String generarReporteUsuarios(Usuario usua,String ruta,String rutaDestino){
        String  rta="Ok";
        EnvioFunction function = new EnvioFunction();
        Connection conn= null; 
        try {
            conn = this.generarConexion();
            String ubicacionReporte = ruta;
            Map<String,Object> properties = new HashMap<String, Object>();
            //properties.put("fact_fact", Integer.parseInt(fact_fact));
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(ubicacionReporte);
            JasperPrint print = JasperFillManager.fillReport(jasperReport, properties, conn);
            JasperExportManager.exportReportToPdfFile(print, rutaDestino);            
        } catch (Exception e) {
            System.out.println("Error Rep_ReporteLogica.generarFactura " +e);
            rta = "Error " + e;
        }finally{
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Rep_ReporteLogica.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rta;
    }
    
}
