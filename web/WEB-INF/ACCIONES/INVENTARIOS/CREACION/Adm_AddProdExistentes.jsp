<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/INVENTARIOS/Adm_AddProdExistentes.js"></script>
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
        <div class="row">
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
            <div class="col-md-6 col-xs-12 col-sm-12">
                <div class="Mensajes" style="display: none;">
                    <s:if test="hasActionErrors()">
                        <div class="alert alert-danger" id="info" role="alert" ><h4><s:actionerror /></h4></div>
                        <script>
                            mostrarMsn();
                        </script>
                    </s:if>
                </div>
                <s:set name="variable" value="bandera" />
                <s:if test="%{#variable.equalsIgnoreCase('S')}">
                    <s:form theme="simple" action="inv_consPrIndAddExistente" id="inv_consPrIndAddExistente" autocomplete="off">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12 thumbnail">
                            <div class="alert alert-success text-center"  role="alert" ><h3>BUSQUEDA DEL PRODUCTO</h3></div>
                            Código:<br>
                            <s:textfield cssClass="form-control" name="producto.codigo"  placeholder="Codigo del Producto" /><br>
                            <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp" > 
                                <s:param name="function">buscarProductoIndividual</s:param>
                                <s:param name="title">Busqueda Individual por Codigo</s:param>
                            </s:include>

                            </tr>
                            </tfoot>
                        </div>
                        <s:textfield name="accion" value="consIndividual" cssStyle="display:none"/>
                    </s:form>
                </s:if>                
                <s:else>                    
                    <table class="table thumbnail">
                        <thead>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center"><b>PRODUCTO EL CUAL SE ADICIONARA AL INVENTARIO</b></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td >
                                    <table>
                                        <tr>
                                            <td>Código:<td>
                                            <td><s:textfield cssClass="form-control" name="producto.codigo" readonly="true"/></td>
                                        </tr>
                                    </table>
                                </td>
                                <td >
                                    <table>
                                        <tr>
                                            <td>Nombre:</td>
                                            <td><s:textfield cssClass="form-control"  name="producto.nombre" readonly="true" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>Descripción:</td>
                                            <td><s:textfield cssClass="form-control" name="producto.descripcion" readonly="true"/></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>Marca:</td>
                                            <td ><s:textfield cssClass="form-control" name="producto.marca" readonly="true" /></td>
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
                <div class="mensajesOk" style="display: none;">
                    <s:if test="hasActionMessages()">
                        <s:actionmessage/>
                        <script>
                            mostrarMsn();
                        </script>
                    </s:if>                
                </div>                           
            </div> 
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
        </div>
        <div id="informacion" title="Información" style="display: none;">
            <div id="mensaje"></div>
        </div>
    </body>
</html>
