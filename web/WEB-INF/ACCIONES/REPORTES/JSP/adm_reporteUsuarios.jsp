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
            <script type="text/javascript" src="<%=RutaSitio %>/JS/REPORTES/adm_reporteUsuarios.js"></script>
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
                    <a href="reenvioGeneral.action?accion=411">Promedio ponderado</a>
                    <%
                        }
                    %>

                </div>                
                <%
                    }
                %>
            </div>
            <!-- Fin Menu de Reportes -->
            <form action="adm_usuariosRep" id="adm_usuariosRep" autocomplete="off">
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Busqueda</a></li>
                        <li><a href="#tabs-2">Explicación</a></li>
                    </ul>
                    <div id="tabs-1">
                        <div class="tableConsultaMultiFiltro">
                            <table>
                                <tr>
                                    <td colspan="2" align="center" class="titulo" >Usuarios de la aplicacion</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><s:select label="Perfil de Usuario" list="perfilesMap"  name="usuarioRep.idPerfil" required="true" headerKey="-1" headerValue="Todos"/></td>                                               
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table>
                                            <tr> 
                                                <td><s:select label="Estado" list="estadoMap"  name="usuarioRep.estado" headerKey="-1" headerValue="Todos" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right;">
                                        <a class="btnElimina" style="font-weight: bold;color: white;" onclick="generaReporte()">GENERAR REPORTE PDF</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                </tr>
                            </table>                        
                        </div>
                    </div>
                    <div id="tabs-2">
                        <p>
                            Este reporte Muestra los usuarios que estan activos, no activos o
                            todos los usuarios de la aplicacion
                        </p>
                        <p>
                            En la pestaña <b>BUSQUEDA</b> podremos realizar los filtros para la generacion del reporte.
                        </p>
                        <p>
                            Despues de esto En la pestaña <b>GENERAR</b> podremos generar el reporte en pdf o online
                        </p>
                    </div>
                </div>                
            </form>
        </div>
    </body>
</html>
