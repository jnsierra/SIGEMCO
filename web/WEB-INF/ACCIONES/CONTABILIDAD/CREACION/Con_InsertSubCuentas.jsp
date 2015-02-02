<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/ADMINISTRACION/PERMISOS/Adm_UpdPermisos.js"></script>
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
                <s:form theme="simple" action="Con_InsertSubCuentas" name="SubCuentas" id="SubCuentas">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center"><h3>INGRESAR SUBCUENTAS</h3></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Cuenta</td>
                                <td><s:textfield cssClass="form-control" name="cuenta" id="cuenta"/></td>
                            </tr>
                            <tr>
                                <td>Código:</td>
                                <td><s:textfield cssClass="form-control" name="codigo" id="codigo"/></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><s:textfield cssClass="form-control" name="nombre" id="nombre"/></td>
                            </tr>
                        </tbody>
                    </table>
                </s:form>
            </div>
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
        </div>
    </body>
</html>
