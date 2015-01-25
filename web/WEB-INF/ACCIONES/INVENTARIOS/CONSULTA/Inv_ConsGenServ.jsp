<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio %>/JS/INVENTARIOS/Inv_ConsGenServ.js"></script>
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
                <form action="inv_consGenServ" id="inv_consGenServ" method="post">
                    <div class="tableConsultaMultiFiltro">
                        <table>
                            <tr>
                                <td class="titulo" colspan="3" style="text-align: center;">CONSULTA GENERAL DE SERVICIOS</td>
                            </tr>
                            <tr>
                                <td style="width: 33%;">
                                    <table>
                                        <tr>
                                            <td>
                                                <s:select label="Baño" list="yesNo" headerKey="-1" name="habitacion.bano" headerValue="TODOS" cssStyle="width:70%;" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 33%;">
                                    <table>
                                        <tr>
                                            <td>
                                                <s:select label="Cable" list="yesNo"  name="habitacion.cable" headerKey="-1" cssStyle="width:70%;" headerValue="TODOS" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 34%;">
                                    <table>
                                        <tr>
                                            <td>
                                                <s:select label="Televisión" list="yesNo"  name="habitacion.television"  cssStyle="width:70%;" headerKey="-1" headerValue="TODOS" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <s:select label="Cama Auxiliar"  list="yesNo"  name="habitacion.camaAux" cssStyle="width:70%;" headerKey="-1" headerValue="TODOS" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td><s:textfield label="Numero de Camas" name="habitacion.numCamas" cssStyle="width:70%;"/></td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="text-align: center;">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" > 
                                        <s:param name="function">consultar</s:param>
                                        <s:param name="title">Busqueda de Servicios por filtros</s:param>
                                    </s:include>
                                </td>
                            </tr>
                        </table>                
                    </div>
                </form>
                <br/>
                <br/>
                <br/>                
                <s:if test="%{rtaHabitacion != null }" >
                    <s:set var="variable" value="bandera"/>
                    <div class="tableConsulta" style="width:75%; "> 
                        <table>
                            <tr>
                                <td>Num. Habitación</td>
                                <td>Num. Max. Pers</td>
                                <td>Num. Min. Pers</td>
                                <td>Num Camas</td>
                                <td>Cama Auxiliar</td>
                                <td>% Iva</td>
                                <s:if test="%{#variable.equalsIgnoreCase('S')}">
                                    <td>Acción</td>
                                </s:if>
                            </tr>
                            <s:iterator value="rtaHabitacion">
                                <tr>
                                    <td><s:property value="numHabi"/></td>
                                    <td><s:property value="numMaxPers"/></td>
                                    <td><s:property value="numMinPers"/></td>
                                    <td><s:property value="numCamas"/></td>
                                    <td><s:property value="camaAux"/></td>
                                    <td><s:property value="iva"/></td>
                                    <s:if test="%{#variable.equalsIgnoreCase('S')}">
                                        <td style="height: 25px;">
                                            <s:include value="/WEB-INF/TEMPLATE/botones/update.jsp" >
                                                <s:param name="function">actulizarEspecifico</s:param>
                                                <s:param name="title">Actualizar Habitación Numero: <s:property value="numHabi"/>: </s:param>
                                                <s:param name="paramFunction">'<s:property value="idHabitacion"/>'</s:param>
                                                <s:param name="clase">imagenIconoPeq</s:param>
                                            </s:include>
                                        </td>
                                    </s:if>                                    
                                </tr>
                            </s:iterator>
                        </table>
                    </s:if>                        
            </center>
        </div>
    </body>
</html>
