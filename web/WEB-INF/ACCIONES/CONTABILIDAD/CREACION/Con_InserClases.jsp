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
            <script type="text/javascript" src="<%=RutaSitio%>/JS/CONTABILIDAD/PUC/Con_InserClases.js"></script>
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
                <s:form theme="simple" action="Con_InsertClase" name="Con_InsertClase" id="Con_InsertClase">
                    <s:textfield name="accion" value="insertar" cssStyle="display:none" />
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td colspan="2" class="alert alert-info text-center"><h3>INGRESAR CLASES</h3></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Código:</td>
                                <td><s:textfield cssClass="form-control" name="clase.clas_codigo" id="codigo"/></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><s:textfield cssClass="form-control" name="clase.clas_nombre" id="nombre"/></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/add.jsp" >
                                        <s:param name="function">insertar</s:param>
                                        <s:param name="title">Insertar Clase</s:param>
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
