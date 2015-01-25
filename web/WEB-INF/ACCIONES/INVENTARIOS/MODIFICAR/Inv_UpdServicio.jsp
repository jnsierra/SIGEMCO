<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <s:head/>
        <script type="text/javascript" src="<%=RutaSitio %>/JS/INVENTARIOS/Inv_UpdServicio.js"></script>
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
        <br/>
        <div id="contenido">
            <form action="adm_updServicio" name="adm_updServicio" id="adm_updServicio">
                <s:textfield name="accion" value="updServicio" cssStyle="display:none;"/>
                <s:textfield name="subAccion" cssStyle="display:none;" value="consulta" />
                <s:textfield name="habitacion.idHabitacion" cssStyle="display:none"/>
                <div class="tableInsert">
                    <table>
                        <thead>
                            <tr>
                                <td colspan="2">ACTUALIZAR HABITACION</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <s:textfield  label="Numero Habitacion*" name="habitacion.numHabi" title="Recuerda que el primer digito es piso en el cual se encuentra la habitación" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:textfield label="Num. Maximo de Personas*" name="habitacion.numMaxPers" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:textfield label="Num. Minimo de Personas*" name="habitacion.numMinPers" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:textfield label="Iva" name="habitacion.iva" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:select label="Baño" list="yesNo"  name="habitacion.bano" headerKey="-1" headerValue="Servicio Baño" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:select label="Televisión" list="yesNo"  name="habitacion.television" headerKey="-1" headerValue="Servicio de Televisión" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:select label="Cable" list="yesNo"  name="habitacion.cable" headerKey="-1" headerValue="Servicio de Cable" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:textfield label="Numero de Camas" name="habitacion.numCamas" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:select label="Cama Auxiliar"  list="yesNo"  name="habitacion.camaAux" headerKey="-1" headerValue="Cama Auxiliar" />
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <span class="spanUpdate">
                                        <s:include value="/WEB-INF/TEMPLATE/botones/modify.jsp" >
                                            <s:param name="function">actualizaServicio</s:param>
                                            <s:param name="title">Actualizar Habitacion</s:param>                                                                        
                                        </s:include>
                                    </span>
                                    <span class="spanConsulta">
                                        <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" >
                                            <s:param name="function">consultaServicio</s:param>
                                            <s:param name="title">Buscar Habiacion</s:param>                                    
                                        </s:include>
                                    </span>
                                    <s:include value="/WEB-INF/TEMPLATE/botones/clean.jsp" />                                    
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>            
            </form>
        </div>
        <br/>
        <div class="mensajesOk" style="display: none;">
            <s:if test="hasActionMessages()">
                <s:actionmessage/>
                <script>
                    mostrarMsn();
                </script>
            </s:if>                
        </div>
    </center>
    <s:set var="bandera" value="bandera"/>
    <s:if test="%{bandera.equalsIgnoreCase('S')}">
        <script>
            manipulaBoton('Actualiza');
        </script>
    </s:if>
    <s:else>
        <script>
            manipulaBoton('Consulta');
        </script>
    </s:else>
</body>
</html>