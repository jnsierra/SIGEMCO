<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
            <script type="text/javascript" src="<%=RutaSitio %>/JS/INVENTARIOS/Inv_ParPrecio.js"></script>
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
        <br/>
        <br/>
        <br/>
        <div id="contenido"> 
            <center>
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
                <div class="mensajesOk" style="display: none;">
                    <s:if test="hasActionMessages()">
                        <s:actionmessage/>
                        <script>
                            mostrarMsn();
                        </script>
                    </s:if>                
                </div>
                <br/>
                <br/>
                <s:if test="habitacion == null" >
                    <form action="inv_ConsultaServ" id="inv_ConsultaServ" autocomplete="off">
                        <div class="tableInsert">
                            <table>
                                <thead>
                                    <tr>
                                        <td colspan="2">PARAMETRIZACIÓN DE PRECIOS</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Habitación a darle el precio</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><s:textfield label="Numero de habitacion" name="habitacion.numHabi" /></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2">
                                            <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" >
                                                <s:param name="function">consultar</s:param>
                                                <s:param name="title">Buscar Habiacion</s:param>                                    
                                            </s:include>
                                            <s:include value="/WEB-INF/TEMPLATE/botones/clean.jsp" />                                    
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>  
                    </form>
                </s:if>
                <s:else>
                    <form action="inv_ParamPrecioSv" id="inv_ParamPrecioSv" autocomplete="off">
                        <s:textfield name="habitacion.idHabitacion" cssStyle="display:none" />
                        <s:textfield name="habitacion.numHabi" cssStyle="display:none" />
                        <div class="tableInsert">
                            <table>
                                <thead>
                                    <tr>
                                        <td colspan="2">PARAMETRIZACIÓN DE PRECIOS</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Habitación a darle el precio</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="2" style="text-align: center"><b>Datos Basicos Habitación</b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Num Habitacion: <s:text name="habitacion.numHabi" />
                                        </td>
                                        <td>
                                            Id Habitación: <s:text name="habitacion.idHabitacion" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><s:textfield name="habitacion.precio" label="Precio Bruto"/></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2">
                                            <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" >
                                                <s:param name="title">Buscar Otra Habitación</s:param>
                                                <s:param name="link">href="reenvioGeneral.action?accion=231"</s:param>
                                            </s:include>
                                            <s:include value="/WEB-INF/TEMPLATE/botones/parametrizar.jsp" >
                                                <s:param name="title">Parametrizar precio de la habitación</s:param>
                                                <s:param name="function">insertarParametro</s:param>                                                
                                            </s:include>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                    <br/>
                    <br/>
                    <br/>
                    <s:if test="hisPrecio != null">
                        <div class="tableInsert">
                            <table>
                                <thead>
                                    <tr>
                                        <td colspan="3">Historial de Precios</td>
                                    </tr>
                                    <tr>
                                        <td>Fecha</td>
                                        <td>Precio</td>
                                        <td>Estado</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <s:iterator value="hisPrecio">
                                        <tr>
                                            <td><s:property value="prha_fecha"/></td>
                                            <td><s:property value="prha_precio"/></td>
                                            <td><s:property value="prha_estado"/></td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                            </table>
                        </div>
                    </s:if>
                    <s:else>
                        <b>ESTA HABITACION NO TIENE HISTORIAL DE PRECIOS</b>
                    </s:else>
                </s:else>
            </center>
        </div>
    </body>
</html>
