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
            <script type="text/javascript" src="<%=RutaSitio%>/JS/CONTABILIDAD/PUC/Con_InsertCuenta.js"></script>
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
                <s:form theme="simple" action="Con_InsertCuenta" name="Con_InsertCuenta" id="Con_InsertCuenta">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center"><h3>INGRESAR CUENTAS</h3></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Grupo</td>
                                <td><s:textfield cssClass="form-control" name="cuenta.cue_gru" id="grupo"/></td>
                            </tr>
                            <tr>
                                <td>Código:</td>
                                <td><s:textfield cssClass="form-control" name="cuenta.cue_codigo" id="codigo"/></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><s:textfield cssClass="form-control" name="cuenta.cue_nombre" id="nombre"/></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/add.jsp" >
                                        <s:param name="function">insertar</s:param>
                                        <s:param name="title">Insertar Cuenta</s:param>
                                    </s:include>
                                    <s:include value="/WEB-INF/TEMPLATE/botones/clean.jsp" />                                    
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </s:form>
            </div>
            <div class="col-md-3 col-sm-0 col-xs-0"></div>
        </div>
    </body>
</html>
