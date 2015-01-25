<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <s:head/>
        <script>
            function insertar() {
                document.getElementById("adm_insertHabitacion").submit();
            }
            //---------------------------------------------------------------
            function cleanForm() {
                document.getElementById("habitacion_numHabi").value = "";
                document.getElementById("habitacion_numMaxPers").value = "";
                document.getElementById("habitacion_numMinPers").value = "";
                document.getElementById("habitacion_iva").value = "";
                document.getElementById("habitacion_bano").value = "-1";
                document.getElementById("habitacion_television").value = "-1";
                document.getElementById("habitacion_cable").value = "-1";
                document.getElementById("habitacion_numCamas").value = "";
                document.getElementById("habitacion_camaAux").value = "-1";
            }

        </script>
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
        <br>
    <center>
        <s:if test="hasActionErrors()">
            <div class="errorMensajes" style="display: none;">
                <div class="errors">
                    <s:actionerror/>                                               
                    <script>
                        mostrarMsnErr();
                    </script>
                </div>
            </div>
            <br>
            <br>
        </s:if>
        <form action="adm_insertHabitacion" name="adm_insertHabitacion" id="adm_insertHabitacion">
            <div class="tableInsert">
                <table>
                    <thead>
                        <tr>
                            <td colspan="2">INGRESAR HABITACIONES</td>
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
                                <s:include value="/WEB-INF/TEMPLATE/botones/add.jsp" >
                                    <s:param name="function">insertar</s:param>
                                    <s:param name="title">Insertar Habitación</s:param>                                    
                                </s:include>
                                <s:include value="/WEB-INF/TEMPLATE/botones/clean.jsp" />
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>            
        </form>
        <br>
        <div class="mensajesOk" style="display: none;">
            <s:if test="hasActionMessages()">
                <s:actionmessage/>
                <script>
                    mostrarMsn();
                </script>
            </s:if>                
        </div>
    </body>
</html>