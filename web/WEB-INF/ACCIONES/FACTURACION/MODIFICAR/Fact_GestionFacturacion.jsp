<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/TEMPLATE/cabecera.jsp"></s:include>
        <s:head /> 
        <script type="text/javascript" src="/PROYECTOHOTEL/JS/FACTURACION/GESTION/Fact_GestionFacturacion.js"></script>
        <script type="text/javascript" src="/PROYECTOHOTEL/JS/FACTURACION/GESTION/Fact_GestionFacturacionAddProd.js"></script>
        <script type="text/javascript" src="/PROYECTOHOTEL/JS/FACTURACION/GESTION/Fact_GestionFacturacionAddServ.js"></script>
        <script type="text/javascript" src="/PROYECTOHOTEL/JS/FACTURACION/GESTION/Fact_GestionFacturacionMinusProd.js"></script>
        <script type="text/javascript" src="/PROYECTOHOTEL/JS/FACTURACION/GESTION/Fact_GestionFacturacionMinusServ.js"></script>
    </head>
    <body>
        <s:div cssClass="header">
            <s:include value="/WEB-INF/TEMPLATE/FrameTop.jsp" > 
                <s:param name="nombre"><s:text name="usuario.apellido"/> <s:text name="usuario.nombre"/></s:param>
                <s:param name="perfil"><s:text name="usuario.NomPerfil"/></s:param>
                <s:param name="ultimoIngreso"><s:text name="usuario.ultimoIngreso"/></s:param>
            </s:include>
        </s:div>
        <br/>
        <s:div cssClass="navigator">
            <s:include value="/WEB-INF/TEMPLATE/menuHorizontal.jsp">
                <s:param name="title"><s:property value="usuario.usuario" /></s:param>
            </s:include> 
        </s:div>
    <center>
        <div id="contenido">
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
            <s:form id="Fact_UpdtFactura" action="Fact_UpdtFactura" theme="simple">
                <s:textfield name="listDetServ" cssStyle="display:none"/>
                <s:textfield name="listDetProd" cssStyle="display:none"/>
                <s:textfield name="factura.fact_fact" cssStyle="display:none" id="fact_fact"/>
                <div class="tableInsert" style="width: 95%">
                    <table>
                        <thead>
                            <tr>
                                <td colspan="4">Informaci&oacute;n de la Factura</td>
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <td><b>Factura No.</b> <s:text name="factura.fact_fact" /></td>
                                <td><b>Cliente: </b> <s:text name="factura.cliente.apellidos" /> <s:text name="factura.cliente.nombres" /></td>
                                <td><b>Cedula Cliente: </b> <s:text name="factura.cliente.cedula" /></td>
                                <td><b>Facturo:</b> <s:text name="factura.usuarioFacturo" /></td>                                
                            </tr>
                            <tr>
                                <td><b>Valor Iva: </b> <s:text name="factura.fact_vlr_iva" /></td>
                                <td><b>Valor Totales:</b> <s:text name="factura.fact_vlr_total" /></td>
                                <td colspan="2"><b>Total a Pagar:</b> <s:text name="factura.fact_vlr_total_iva" /></td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: righ;">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/add.jsp"  >
                                        <s:param name="function">adicionarItems</s:param>
                                        <s:param name="title">Adici&oacute;n de Productos o Servicios</s:param>
                                        <s:param name="estilo">width: 30px;height: 30px;</s:param>                                        
                                    </s:include>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <s:include value="/WEB-INF/TEMPLATE/botones/minus.jsp"  >
                                        <s:param name="function">eliminarItems</s:param>
                                        <s:param name="title">Eliminar Items de la Factura</s:param>
                                        <s:param name="clase">imagenIconoPeq</s:param>
                                    </s:include>    
                                </td>
                            </tr>
                        </tbody>
                    </table>                    
                    <br/>
                    <div class="tableConsultaMultiFiltro" style="width: 90%">
                        <table>
                            <tr>
                                <td class="titulo" colspan="9" style="text-align: center">Detalle factura Servicios</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: center; font-weight: bolder" class="titulo">Detalles</td>
                                <td colspan="3" style="text-align: center; font-weight: bolder" class="titulo">Valores</td>
                            </tr>
                            <tr class="titulo">
                                <td>Id</td>
                                <td>Fecha</td>
                                <td>Habitación</td>
                                <td>Num. Días</td>
                                <td>Costo por noche</td>
                                <td>Reservación</td>
                                <td>Iva Habitación</td>
                                <td>Hospedaje Habitacion</td>
                                <td>Habitación Total</td>
                            </tr>
                            <%
                                int i = 0;
                            %>
                            <s:iterator value="factura.detalleServicio">
                                <%
                                    i++;
                                    if (i % 2 == 0) {
                                %>
                                <tr>
                                    <%
                                    } else {
                                    %>
                                <tr style="background-color: #D6E3E2;">
                                    <%
                                        }
                                    %>                            
                                    <td style="text-align: center;"><s:property value="dtsv_dtsv"/></td>
                                    <td><s:property value="dtsv_fecha"/></td>
                                    <td style="text-align: center;"><s:property value="numHabitacion"/></td>
                                    <td style="text-align: center;"><s:property value="diasReserv"/></td>
                                    <td><s:property value="precioHabitacion"/></td>
                                    <td style="text-align: center;"><s:property value="dtsv_rvha"/></td>
                                    <td><s:property value="dtsv_valor_iva"/></td>
                                    <td><s:property value="dtsv_valor_sv"/></td>
                                    <td><s:property value="dtsv_valor_venta"/></td>                                
                                </tr>
                            </s:iterator>
                            <tr>
                                <td colspan="9">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td class="titulo" colspan="3" style="text-align: center;">Valores Servicios&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="text-align: right;" colspan="2"><b>Valor Total Iva Hospedaje:</b></td>
                                <td><s:text name="factura.valorIva" /></td>
                            </tr>
                            <tr>
                                <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="text-align: right;" colspan="2"><b>Valor Total Hospedaje:</b></td>
                                <td><s:text name="factura.valorServicio" /></td>
                            </tr>
                            <tr>
                                <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="text-align: right;background-color: #D6E3E2;" colspan="2"><b>Valor Total Hospedaje (Sevicio+Iva):</b></td>
                                <td style="background-color: #D6E3E2;"><s:text name="factura.valorTotal" /></td>
                            </tr>
                        </table>
                    </div>
                </div>  
                <br/>
                <br/>
                <%--- Desde aqui empieza la logica de los detalles de los productos---%>
                <div class="tableInsert" style="width: 95%">  
                    <div class="tableConsultaMultiFiltro" style="width: 90%">
                        <table style="width: 100%">
                            <tr>
                                <td class="titulo" colspan="9" style="text-align: center">Detalle factura Productos</td>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align: center; font-weight: bolder" class="titulo">Detalles</td>
                                <td colspan="4" style="text-align: center; font-weight: bolder" class="titulo">Valores</td>
                            </tr>
                            <tr class="titulo">
                                <td>Id</td>
                                <td>Cantidad</td>
                                <td>Fecha</td>
                                <td>IdProducto</td>
                                <td>Nombre Producto</td>
                                <td>Unitario</td>
                                <td>Total</td>
                                <td>Iva</td>
                                <td>Total</td>
                            </tr>
                            <%
                                int j = 0;
                            %>
                            <s:iterator value="factura.detalleProducto">
                                <%
                                    j++;
                                    if (j % 2 == 0) {
                                %>
                                <tr>
                                    <%
                                    } else {
                                    %>
                                <tr style="background-color: #D6E3E2;">
                                    <%
                                        }
                                    %>                            
                                    <td style="text-align: center;"><s:property value="dtpr_dtpr"/></td>
                                    <td><s:property value="dtpr_cant"/></td>
                                    <td style="text-align: center;"><s:property value="dtpr_fecha"/></td>
                                    <td style="text-align: center;"><s:property value="dtpr_dska"/></td>
                                    <td><s:property value="nombProducto"/></td>
                                    <td><s:property value="dtpr_vl_uni_prod"/></td>
                                    <td><s:property value="dtpr_valor_pr"/></td>
                                    <td><s:property value="dtpr_valor_iva"/></td>                                    
                                    <td><s:property value="dtpr_valor_venta"/></td>                                
                                </tr>
                            </s:iterator>
                            <tr>
                                <td colspan="9">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td class="titulo" colspan="4" style="text-align: center;">Valores Productos&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="text-align: right;" colspan="3"><b>Valor Total Iva Productos:</b></td>
                                <td><s:text name="factura.valorIvaPro" /></td>
                            </tr>
                            <tr>
                                <td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="text-align: right;" colspan="3"><b>Valor Total Productos:</b></td>
                                <td><s:text name="factura.valorProductos" /></td>
                            </tr>
                            <tr>
                                <td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="text-align: right;background-color: #D6E3E2;" colspan="3"><b>Valor Total Hospedaje (Productos+Iva):</b></td>
                                <td style="background-color: #D6E3E2;"><s:text name="factura.valorTotalProd" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
                            <br/>
                            <br/>
                            <a onclick="ejecutarReporteFactura('<s:text name="factura.fact_fact" />')" >Generar Factura</a>
            </s:form>
    </center>
    <div id="choseAdd" title="Adicion de Productos o Servicios">
        <p>&#191;Desea Adicionar Productos o Servicios a esta Factura&#63;</p>
    </div>
    <div id="choseMinus" title="Eliminacion Productos o Servicios">
        <p>&#191;Desea Remover Productos o Servicios a esta Factura&#63;</p>
    </div>    
    <div id="listaRemoveServ" title="Selección de Servicios a Eliminar" style="text-align: center"> 
        <br/>
        <table id="tablaServRemove" class="ui-widget ui-widget-content">

        </table>
    </div>
    <div id="confirmaEliminaServ" title="Confirmaci&oacute;n">
        &#191;Esta seguro que desea realizar Esta operacion&#63;. Esto afectara 
        directamente la informaci&oacute;n de la factura.
    </div>    
    <div id="informacion" title="Mensaje">
        <div id="mensaje"></div>
    </div>
    <div id="adicionProductos" title="Filtros de Adición de Productos">
        <p class="validateTips">Digite Los filtros de Busqueda del Producto a Adicionar</p>
        <fieldset>
            <table>
                <tr>
                    <td>Codigo:</td>
                    <td><input name="addCodigoProducto" id="addCodigoProducto" placeholder="..." class="text ui-widget-content ui-corner-all"/></td>
                    <td>Referencia:</td>
                    <td><input name="addReferenciaProducto" id="addReferenciaProducto" placeholder="..." class="text ui-widget-content ui-corner-all"/></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td colspan="3">
                        <input name="addNombreProducto" id="addNombreProducto"  placeholder="..." class="text ui-widget-content ui-corner-all" style="width: 100%"/>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div id="listaAddProd" title="Selección de Productos a Adicionar" style="text-align: center"> 
        <br/>
        <table id="tablaAddProd" class="ui-widget ui-widget-content">
            <p class="validateTipsAddProd">Digite la cantidad de productos que desea</p>

        </table>
    </div>
    <s:form action="Fact_BuscaFacEspecificaGestion" id="recargarFactura" cssStyle="display:none;">
        <s:textfield name="factura.fact_fact" />        
    </s:form>
    <div id="listaRemooveProd" title="Selección de Productos a Eliminar" style="text-align: center">         
        <p class="validateTipsRemoveProd">Seleccióne los productos que desea eliminar</p>
        <br/>
        <table id="tablaRemoveProd" class="ui-widget ui-widget-content" style="width: 100%;">
            

        </table>
    </div>
    <div id="addServicioFiltro" title="Filtros para obtener la lista de posibles opciones">
        <p class="validateTipsAddServ"></p>       
        <fieldset>
            <label for="fecha">Fecha:</label><br/>
            <input type="text" id="fechaReserva" size="30" readonly="readonly"/><br/>
            <label for="numPersonas">Numero de Personas:</label><br/>
            <input type="text" id="numPersonas" size="30"><br/>
            <label for="numDias">Numero de Días:</label><br/>
            <input type="text" id="numDias" size="30"><br/>
        </fieldset>
    </div>
    <div id="listaAddServ" title="Selección de Servicios a Adicionar" style="text-align: center">         
        <p class="validateTipsRemoveProd">Seleccióne los servicios que desee Adicionar</p>
        <table id="tablaAddServ" class="ui-widget ui-widget-content" style="width: 100%;">
        </table>
    </div>
    <br/>
</body>
</html>
