<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/FACTURACION/Fac_InsertClienFactura.js"></script>        
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
                <s:form action="Fac_consCliente" name="Fac_consCliente" id="Fac_consCliente" theme="simple">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center" ><h3>FACTURACIÓN</h3></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center" ><h3>Registro de cliente para inicio de Facturación</h3></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Cedula Cliente: </td>
                                <td><s:textfield cssClass="form-control" name="cliente.cedula" required="true" /></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2" style="text-align: right;" >
                                    <s:include value="/WEB-INF/TEMPLATE/botones/client.jsp" >
                                        <s:param name="title">Buscar Cliente</s:param>
                                        <s:param name="function">inicio</s:param>
                                    </s:include>
                                </td>
                            </tr>                    
                        </tfoot>
                    </table>
                </s:form>
            </div>
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
        </div>
        <div class="row" id="clienteNuevo" style="display: none;">
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <s:form action="Fac_nuevoCliente" name="Fac_nuevoCliente" id="Fac_nuevoCliente" theme="simple">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center" ><h3>NUEVO CLIENTE</h3></td>
                            </tr>                            
                        </thead>
                        <tbody>
                            <tr>
                                <td>Ceula:</td>
                                <td style="text-align: left"><b><s:text name="cliente.cedula"/></b>
                                        <s:textfield name="cliente.cedula" style="display:none"/>
                                </td>
                            </tr>
                            <tr>
                                <td><s:textfield label="Nombres*" name="cliente.nombres"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Apellidos*" name="cliente.apellidos"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Correo*" name="cliente.mail"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Fecha de Nacimiento" name="cliente.fechaNac"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Telefono" name="cliente.tel"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Celular" name="cliente.cel"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Dirección" name="cliente.direccion"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Departamento" name="cliente.departamentoRes"/></td>                                
                            </tr>
                            <tr>
                                <td><s:textfield label="Ciudad" name="cliente.ciudadResi" /></td>                                
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/newClient.jsp" >
                                        <s:param name="function">insertar</s:param>
                                        <s:param name="title">Adicionar Cliente a la base de Datos</s:param>                                    
                                    </s:include>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">Recuerde que los campos obligatorios son (*)</td>
                            </tr>
                        </tfoot>
                    </table>                    
                </s:form>
            </div>
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
        </div>

        <br/>
        <br/>
        <div id="clienteNuevo" style="display:none">

        </div>
        <s:set name="cliente" value="%{existeCliente}" />
        <s:if test="%{#cliente.equalsIgnoreCase('N')}">            
            <script>
                $('#clienteNuevo').show('fold');
            </script>
        </s:if>
    </body>
</html>
