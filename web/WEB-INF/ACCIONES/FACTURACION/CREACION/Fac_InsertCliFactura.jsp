<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/TEMPLATE/cabecera.jsp"></s:include>
        <s:head/>
        <script type="text/javascript" src="/PROYECTOHOTEL/JS/FACTURACION/Fac_InsertClienFactura.js"></script>        
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
        <br/>
        <br/>
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
        <br>
        <br>
        <form action="Fac_consCliente" name="Fac_consCliente" id="Fac_consCliente">
            <div class="tableInsert">
                <table>
                    <thead>
                        <tr>
                            <td colspan="2">FACTURACIÓN</td>
                        </tr>
                        <tr>
                            <td colspan="2">Registro de cliente para inicio de Facturación</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><s:textfield label="Cedula" name="cliente.cedula" required="true"/></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" >
                                <s:include value="/WEB-INF/TEMPLATE/botones/client.jsp" >
                                    <s:param name="title">Buscar Cliente</s:param>
                                    <s:param name="function">inicio</s:param>
                                </s:include>
                            </td>
                        </tr>                    
                    <tfoot>
                </table>
            </div>
        </form>
        <br/>
        <br/>
        <div id="clienteNuevo" style="display:none">
            <form action="Fac_nuevoCliente" name="Fac_nuevoCliente" id="Fac_nuevoCliente">
                <div class="tableInsert">
                    <table>
                        <thead>
                            <tr>
                                <td colspan="2">Nuevo Cliente</td>
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
                </div>
            </form>
        </div>

    </center>
    <s:set name="cliente" value="%{existeCliente}" />
    <s:if test="%{#cliente.equalsIgnoreCase('N')}">            
        <script>
            $('#clienteNuevo').show('fold');
        </script>
    </s:if>
    <div id="informacion" title="Mensaje">
        <div id="mensaje"></div>
    </div>
</body>
</html>
