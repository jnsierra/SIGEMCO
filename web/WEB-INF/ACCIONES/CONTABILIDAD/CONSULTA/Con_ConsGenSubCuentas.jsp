<%-- 
    Document   : Con_ConsGenCuentas
    Created on : 16/02/2015, 02:23:02 PM
    Author     : SISCOMPUTO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/CONTABILIDAD/PUC/Con_ConsGenCuentas.js" ></script>
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
            <div class="col-md-6 col-xs-0 col-sm-0">
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
                <div class="row ">
                    <div class="alert alert-info col-md-12 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <h3>CLASE:<br>
                                <a href="reenvioGeneral.action?accion=514">
                                    <h4><s:text name="clase.clas_codigo" /> <s:text name="clase.clas_nombre" /></h4>
                                </a>
                            </h3>
                        </div>
                        <div class="form-group">
                            <h3>GRUPO:<br>
                                <a onclick="buscaClase('<s:text name="clase.clas_clas" />')">
                                    <h4><s:text name="grupo.grup_codigo" /> <s:text name="grupo.grup_nombre" /></h4>
                                </a>
                            </h3>
                        </div>
                        <div class="form-group">
                            <h3>CUENTA:<br>
                                <a onclick="buscaClase('<s:text name="clase.clas_clas" />')">
                                    <h4><s:text name="cuenta.cuen_codigo" /> <s:text name="cuenta.cuen_nombre" /></h4>
                                </a>
                            </h3>
                        </div>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <s:text name="clase.clas_descripcion" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group alert alert-warning">
                    <h3>SubCuentas
                    <a class="text-right btn btn-danger">Crear SubCuenta</a>
                    </h3>
                    </div>
                    <div class="panel panel-warning" style="max-height: 250px;overflow-y: scroll;">
                        <table class="table table-hover">
                            <tbody>
                                <s:iterator value="cuenta.subCuenta" >
                                    <tr>
                                        <td><s:property value="sbcu_codigo" /></td>
                                        <td><a ><s:property value="sbcu_nombre" /></a></td>
                                    </tr>
                                </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
        </div>
    </body>
</html>
