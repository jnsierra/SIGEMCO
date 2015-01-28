<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/INVENTARIOS/Inv_ConsProducto.js"></script>
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
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="Mensajes" style="display: none;">
                    <s:if test="hasActionErrors()">
                        <div class="alert alert-danger" id="info" role="alert" ><h4><s:actionerror /></h4></div>
                        <script>
                            mostrarMsn();
                        </script>
                    </s:if>
                </div>
                <div class="MensajesOk" style="display: none;">
                    <s:if test="hasActionMessages()">
                        <div class="alert alert-success" id="info" role="alert" ><h4><s:actionmessage/></h4></div>
                        <script>
                            mostrarMsnOk();
                        </script>
                    </s:if>
                </div>
                <s:form action="inv_consProdPorFiltrosGen" id="inv_consProdPorFiltrosGen" theme="simple">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12 thumbnail">
                        <div class="row">
                            <div class="form-group col-md-12 col-sm-12 col-xs-12 ">
                                <div class="alert alert-success text-center"  role="alert" ><h3>CONSULTA GENERAL DE PRODUCTOS</h3></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Nombre Producto:<br>
                                <s:textfield name="producto.nombre" placeholder="Filtro" cssClass="form-control" />
                            </div>
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Descripción Producto:<br>
                                <s:textfield name="producto.descripcion" placeholder="Filtro" cssClass="form-control"/>
                            </div>
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Referencia:<br>
                                <s:textfield name="producto.referencia" placeholder="Filtro" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Codigo:<br>
                                <s:textfield name="producto.codigo" placeholder="Filtro" cssClass="form-control" />
                            </div>
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Marca:<br>
                                <s:textfield name="producto.marca" label="Marca" placeholder="Filtro" cssClass="form-control"/>
                            </div>
                            <div class="form-group col-md-4 col-sm-4 col-xs-4 ">
                                <br>
                                <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp">
                                    <s:param name="function">buscaGeneral</s:param>
                                    <s:param name="title">Busca Productos</s:param>
                                </s:include>
                            </div>
                        </div>                            
                    </div>                        
                </s:form>
            </div>
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
        </div>
        <br/>
        <div class="row">
            <div class="col-md-2 col-sm-0 col-xs-0"></div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <s:if test="%{rtaConsProd != null}" >
                    <s:set var="permisoActualizar" value="bandera" />
                    <s:set var="permisoParPrecio" value="permisoParam" />
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Referencia</th>
                                <th>Codigo</th>
                                <th>Cant. Existentes</th>
                                <th>Marca</th>
                                    <s:if test="%{#permisoActualizar.equalsIgnoreCase('S') || #permisoParPrecio.equalsIgnoreCase('S')}">
                                    <th>Acción</th>
                                    </s:if>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 0;
                            %>
                            <s:iterator value="rtaConsProd">                            
                                <%
                                    if (i % 2 == 0) {
                                %>
                                <tr class="active">
                                    <%
                                    } else {
                                    %>
                                <tr>
                                    <%
                                        }
                                        i++;
                                    %>
                                    <td><s:property value="nombre"/></td>
                                    <td><s:property value="descripcion"/></td>
                                    <td><s:property value="referencia"/></td>
                                    <td><s:property value="codigo"/></td>
                                    <td><s:property value="cantidad"/></td>
                                    <td><s:property value="marca"/></td>
                                    <s:if test="%{#permisoActualizar.equalsIgnoreCase('S') || #permisoParPrecio.equalsIgnoreCase('S')}">                                
                                        <td style="height: 25px;">
                                            <s:if test="%{#permisoActualizar.equalsIgnoreCase('S')}">
                                                <s:include value="/WEB-INF/TEMPLATE/botones/update.jsp" >
                                                    <s:param name="function">actulizarEspecifico</s:param>
                                                    <s:param name="title">Actualizar Producto <s:property value="codigo"/> </s:param>
                                                    <s:param name="paramFunction">'<s:property value="id"/>'</s:param>
                                                    <s:param name="clase">imagenIconoPeq</s:param>
                                                </s:include>
                                            </s:if>
                                            <s:if test="%{#permisoParPrecio.equalsIgnoreCase('S')}">
                                                <s:include value="/WEB-INF/TEMPLATE/botones/parametrizar.jsp" >
                                                    <s:param name="title">Parametrizar precio del Producto <s:property value="codigo"/></s:param>
                                                    <s:param name="function">parametirzarPrecio</s:param>                                                
                                                    <s:param name="parametros">'<s:property value="codigo"/>'</s:param>                                                
                                                </s:include>

                                            </s:if>
                                        </td>
                                    </s:if>                                    
                                </tr>
                            </s:iterator>
                        <tbody>
                    </table>
                </s:if>

            </div>
            <div class="col-md-2 col-sm-0 col-xs-0"></div>
        </div>        
        <form action="inv_UpdProducto" method="post" id="inv_UpdProducto"> 
            <s:textfield name="producto.id" cssStyle="display:none;" cssClass="idProductoUpdate"/>
            <s:textfield name="accion" cssStyle="display:none" value="updProductoIndv"/>
            <s:textfield name="subAccion" cssStyle="display:none" value="consulta" />        
        </form>

        <s:form theme="simple" action="inv_BuscaProducto" method="post"  id="inv_BuscaProducto" cssStyle="display:none;">
            <s:textfield name="accion" cssStyle="display:none" value="buscarProducto" />
            <s:textfield name="producto.codigo" />
        </s:form>
    </body>
</html>
