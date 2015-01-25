<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
            <script type="text/javascript" src="<%=RutaSitio %>/JS/INVENTARIOS/Adm_AddProdExistentes.js"></script>
        <s:head/>
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
            <center>
                <br/>
                <br/>
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
                <br/>
                <s:set name="variable" value="bandera" />
                <s:if test="%{#variable.equalsIgnoreCase('S')}">
                    <form action="inv_consPrIndAddExistente" id="inv_consPrIndAddExistente" autocomplete="off">
                        <div class="tableInsert" style="width:50%; ">
                            <table>
                                <thead>
                                    <tr>
                                        <td colspan="2" align="center">Busqueda del producto Producto</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <s:textfield label="CODIGO" name="producto.codigo" cssClass="codigoProducto" placeholder="Codigo del Producto" cssStyle="width: 250px;"/>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td style="text-align: right" colspan="2">
                                            <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" > 
                                                <s:param name="function">buscarProductoIndividual</s:param>
                                                <s:param name="title">Busqueda Individual por Codigo</s:param>
                                            </s:include>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <s:textfield name="accion" value="consIndividual" cssStyle="display:none"/>
                    </form>
                </s:if>                
                <s:else>                    
                    <br/>
                    <br/>
                    <div class="tableConsultaMultiFiltro" style="width: 70%"> 
                        <table>
                            <thead>
                                <tr>
                                    <td style="text-align: center; height: 30px;" colspan="2" class="titulo"><b>PRODUCTO EL CUAL SE ADICIONARA AL INVENTARIO</b></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 50%">
                                        <table>
                                            <tr>
                                                <td style="width: 30%"><s:textfield label="CODIGO" name="producto.codigo" readonly="true"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 50%">
                                        <table>
                                            <tr>
                                                <td style="width: 30%"><s:textfield label="NOMBRE" name="producto.nombre" readonly="true" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="width: 30%"><s:textfield label="DESCRIPCIÓN" name="producto.descripcion" readonly="true"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="width: 30%"><s:textfield label="MARCA" name="producto.marca" readonly="true" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2" style="height: 40px;text-align: right">
                                        <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" > 
                                            <s:param name="function">buscarProductoIndividual</s:param>
                                            <s:param name="title">Iniciar Busqueda de Nuevo</s:param>
                                            <s:param name="link">href="reenvioGeneral.action?accion=219"</s:param>                                            
                                        </s:include>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <form action="inv_addProdExstInv" id="inv_addProdExstInv">
                        <s:textfield name="producto.marca" cssStyle="display:none;"/>
                        <s:textfield name="producto.descripcion" cssStyle="display:none;"/>
                        <s:textfield name="producto.nombre" cssStyle="display:none;"/>
                        <s:textfield name="producto.codigo" cssStyle="display:none;" />
                        <s:textfield name="producto.id" cssStyle="display:none;"/>
                        <s:textfield name="accion" value="addProductosExistents" cssStyle="display:none;"/>

                        <div class="tableConsultaMultiFiltro" style="width: 70%"> 
                            <table>
                                <thead>
                                    <tr>
                                        <td class="titulo" colspan="2" style="text-align: center; height: 35px;"><b>INSERCION DE PRODUCTOS AL INVENTARIO</b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="width: 50%">
                                            <table>
                                                <tr>
                                                    <td style="width: 30%"><s:textfield label="No. Productos" name="addicionProd.noProductos"/></td>
                                                <tr>
                                            </table>
                                        </td>
                                        <td style="width: 50%">
                                            <table>
                                                <tr>
                                                    <td style="width: 30%"><s:textfield label="Costo" cssClass="addicionProdCosto" name="addicionProd.costo" title="Recuerda que el costo del Producto es lo que le pagaste al proveedor por todos los productos adquiridos no por cada unidad del producto"/></td>
                                                <tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50%">
                                            <table>
                                                <tr>
                                                    <td style="width: 30%"><s:select label="Movimiento de Inventario"  name="addicionProd.movInv" list="movInventarios" headerKey="-1" headerValue="Seleccione un Movimiento.." onchange="cambioMovimento(this.value)"/></td>
                                                <tr>
                                            </table>
                                        </td>
                                        <td style="width: 50%">
                                            <table>
                                                <tr>
                                                    <td style="width: 30%"><s:textfield name="addicionProd.natuMov" label="Naturaleza del Movimiento" cssClass="natMov"/></td>
                                                <tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td style="text-align: right; height: 35px;" colspan="2">
                                            <s:include value="/WEB-INF/TEMPLATE/botones/insertMovimiento.jsp" > 
                                                <s:param name="function">ingresoProducto</s:param>
                                                <s:param name="title">Adicionar Movimiento</s:param>
                                            </s:include>
                                        </td>
                                    </tr>
                                <tfoot>
                            </table>
                        </div>
                    </form>
                </s:else>               
                <br/>
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
        </div>    
        <div id="informacion" title="Información" style="display: none;">
            <div id="mensaje"></div>
        </div>
    </body>
</html>
