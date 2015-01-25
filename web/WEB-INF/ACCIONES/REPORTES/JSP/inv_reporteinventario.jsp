<%@page import="co.com.hotel.datos.session.Parametros"%>
<%@page import="co.com.hotel.datos.session.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String permisos = usuario.getPermisos();
    Parametros parametros = (Parametros) session.getAttribute("parametros");
%>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
            <script type="text/javascript" src="<%=RutaSitio %>/JS/REPORTES/inv_reporteinventario.js"></script>
            <script>
                function inicializarFechas() {
                    var fechaFin = '<%=parametros.getFechaManana()%>';
                    var fechaIni = '<%=parametros.getFechaUnMesAtras()%>';
                    document.getElementById('fechaIni').value = fechaIni;
                    document.getElementById('fechaFin').value = fechaFin;
                }
        </script>
        <style>
            #accordion { 
                width: 20%; 
                font-size: 15px;
                margin-left: 4%;
            }
            #accordion a:hover{
                font-weight: bold;
                //text-transform:uppercase;
            }

            #tabs{
                margin-left: 26%;
                width: 70%;
                position:absolute;
                top: 0px;
                margin-top: 250px;

            }
            #tabs a{
                font-size: 12px;

            }

        </style>
    </head>
    <body>
        <s:div cssClass="header">
            <s:include value="/WEB-INF/NEWTEMPLATE/FrameTop.jsp" > 
                <s:param name="nombre"><s:text name="usuario.apellido"/> <s:text name="usuario.nombre"/></s:param>
                <s:param name="perfil"><s:text name="usuario.NomPerfil"/></s:param>
                <s:param name="ultimoIngreso"><s:text name="usuario.ultimoIngreso"/></s:param>
            </s:include>
        </s:div>
        <s:div cssClass="navigator">
            <s:include value="/WEB-INF/NEWTEMPLATE/menu.jsp">
                <s:param name="title"><s:property value="usuario.usuario" /></s:param>
            </s:include> 
        </s:div>
        <div id="contenido">
            <br>
            <br>
            <br>
            <!-- Ini Menu de Reportes -->
            <div id="accordion">
                <h3>Usuarios</h3>
                <div>
                    <a href="reenvioGeneral.action?accion=431">Activos</a><br/>
                    <a>Facturacion Usuarios</a><br/>
                </div>
                <%
                    if (permisos.indexOf(".RpIn1.") > 0) {
                %>
                <h3>Inventario</h3>
                <div>
                    <%
                        if (permisos.indexOf(".RpIn1.") > 0) {
                    %>
                    <a>Promedio ponderado</a>
                    <%
                        }
                    %>

                </div>                
                <%
                    }
                %>
            </div>
            <!-- Fin Menu de Reportes -->
            <!--Hasta qui va el template de reportes -->
            <form action="inv_consProdPorFiltro" id="inv_consProdPorFiltro" autocomplete="off">                
                <s:textfield name="accion" value="consultaProdXFiltroIndv" cssStyle="display:none"/>                
                <s:textfield name="producto.id" cssStyle="display:none;"/>
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Busqueda</a></li>
                        <li><a href="#tabs-2">Explicación</a></li>
                        <li><a href="#tabs-3">Filtros - Generar</a></li>
                    </ul>
                    <div id="tabs-1">
                        <div class="errorMensajes" style="display: none;">
                            <s:if test="hasActionErrors()">
                                <div class="errors">
                                    <s:actionerror/>
                                    <script>
                                        mostrarMsnErr();
                                    </script>
                                </div>
                            </s:if>
                        </div>
                        <div class="tableConsultaMultiFiltro">
                            <table>
                                <tr width="100%">
                                    <td colspan="3" align="center" class="titulo">PROMEDIO PONDERADO</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><s:textfield label="Codigo" name="producto.codigo"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><s:textfield label="Nombre" name="producto.nombre"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><s:textfield label="Referencia" name="producto.referencia" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="text-align: center;">
                                        <a class="btnConsulta" onclick="buscaProducto()" style="cursor:pointer">Buscar</a>
                                    </td>
                                </tr>
                            </table>                        
                        </div>                    
                    </div>
                    <div id="tabs-2">
                        <p>
                            Este reporte nos sirve para ver las entradas y salidas detalladas de cada producto.                       
                        </p>
                        <p>
                            En la pestaña <b>BUSQUEDA</b> podremos seleccionar el producto del cual queremos conocer su inventario.
                        </p>
                        <p>
                            Despues de esto En la pestaña <b>FILTROS - GENERAR</b> encontraremos los datos detallados del producto,
                            podemos filtrarlo en el rango de fechas que nosotros deseemos y exportar en pdf el inventario por promedio ponderado y                        
                        </p>
                    </div>
                    <div id="tabs-3">
                        <s:set name="variable" value="bandera" />
                        <s:if test="%{#variable.equalsIgnoreCase('S')}">                            
                            <p>
                                Si realmente este es producto que buscas genera el reporte 
                            </p>
                            <div class="tableConsultaMultiFiltro">                            
                                <table>
                                    <tr width="100%">
                                        <td colspan="2" align="center" class="titulo">Detalle Producto</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50%;">
                                            <table>
                                                <tr>
                                                    <td style="width: 40%; text-align: right"><b>Codigo: </b></td>
                                                    <td><s:text name="producto.codigo"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 50%;">
                                            <table>
                                                <tr>
                                                    <td style="width: 40%; text-align: right"><b>Referencia: </b></td>
                                                    <td><s:text name="producto.referencia"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style="width: 40%;text-align: right"><b>Nombre: </b></td>
                                                    <td><s:text name="producto.nombre"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style="width: 40%;text-align: right"><b>Descripción: </b></td>
                                                    <td><s:text name="producto.descripcion"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 50px;">
                                        <td>
                                            <table>
                                                <tr>
                                                    <td style="width: 40%;text-align: right;"><b>Marca: </b></td>
                                                    <td><s:text name="producto.marca"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: center;">
                                            <table>
                                                <tr>
                                                    <td style="width: 40%;text-align: right;">
                                                        <b>Productos <br/>Disponibles: </b>
                                                    </td>
                                                    <td><s:text name="producto.cantidad"/></td>
                                                </tr>
                                            </table>
                                        </td>

                                    </tr>
                                </table>                                
                            </div> 
                            <br>
                            <br>
                            <div class="tableConsultaMultiFiltro">
                                <table>
                                    <tr>
                                        <td colspan="2" align="center" class="titulo">Detalle Producto</td>
                                    </tr>                                                    
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <s:textfield label="Fecha Inicial" name="fechaIni" cssClass="calendar"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <s:textfield label="Fecha Final" name="fechaFin" cssClass="calendar"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 35px;text-align: right;">
                                            <a class="btnElimina" style="font-weight: bold;color: white;" onclick="generaReporte('<s:text name="producto.id"/>')">GENERAR REPORTE ONLINE</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <script>
                                inicializarFechas();
                            </script>
                        </s:if>
                        <s:else>                            
                            <p>
                                Primero debe Realizar la busqueda del producto en la pestaña <b>BUSQUEDA</b>
                            </p>
                        </s:else>
                    </div>
                </div>
            </form>
        </div>
        <form action="rep_generarReporte" style="display: none;">
            <input type="text" name="PNOMBRE_REPORTE"/>
            <input type="text" name="parametros" />
            <input type="text" name="nombre_Jasper" value="inv_promedioPonderado.jasper"/>
            <input type="text" name="SALIDA" value="PDF"/>
        </form>
    </body>
</html>