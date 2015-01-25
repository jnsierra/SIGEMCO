<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
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
    <center>
        <br/>
        <br/>
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
                <br/>
            </div>
            <br/>

            <div class="tableInsert">
                <table>
                    <thead>
                        <tr>
                            <td colspan="2">ACTIVACION O INACTIVACION DE PRODUCTOS</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><s:textfield name="producto.codigo" label="Codigo Producto"/></td>
                        </tr>
                        <tr>
                            <td><s:select label="Estado" list="estadoMap"  name="habitacion.estado" required="true" headerKey="-1" headerValue="ESTADO" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>


        </div>
    </body>
</html>
