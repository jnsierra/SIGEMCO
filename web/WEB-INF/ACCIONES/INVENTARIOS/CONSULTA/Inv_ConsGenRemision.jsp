<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio %>/JS/INVENTARIOS/Inv_ConsGenRemision.js"></script>
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
            <div class="col-md-1 col-sm-0 col-xs-0"></div>
            <div class="col-md-10 col-sm-12 col-xs-12">
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
                <s:form action="inv_consRemPorFiltrosGen" id="inv_consRemPorFiltrosGen" theme="simple">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12 thumbnail">
                        <div class="row">
                            <div class="form-group col-md-12 col-sm-12 col-xs-12 ">
                                <div class="alert alert-success text-center"  role="alert" ><h3>CONSULTA GENERAL DE EQUIPOS CELULARES EN PRESTAMO</h3></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-2 col-sm-4 col-xs-4">
                                Referencia:<br>
                                <s:select cssClass="form-control" list="referencias" name="remision.rmce_refe"  headerKey="-1" headerValue="Referencia del Equipo" />
                            </div>
                            <div class="form-group col-md-2 col-sm-4 col-xs-4">
                                Tipo de Plan:<br>
                                <s:select cssClass="form-control" list="tipoPlan" name="remision.rmce_tppl"  headerKey="-1" headerValue="Plan del equipo" />
                            </div>
                            <div class="form-group col-md-2 col-sm-4 col-xs-4">
                                Sede:<br>
                                <s:select cssClass="form-control" list="sedes" name="remision.rmce_sede"  headerKey="-1" headerValue="Sede de ingreso del equipo" />
                            </div>                                                        
                            <div class="form-group col-md-3 col-sm-6 col-xs-6">
                                Imei:<br>
                                <s:textfield name="remision.rmce_imei" cssClass="form-control" />
                            </div> 
                            <div class="form-group col-md-3 col-sm-6 col-xs-6">
                                Iccid:<br>
                                <s:textfield name="remision.rmce_iccid" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Margen de Fechas<br>
                                <table>
                                    <tr>
                                        <td>
                                            <div class="input-group date" >
                                                <s:textfield name="remision.rmce_fcve" cssClass="form-control" readonly="true"/>
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                        </td>
                                        <td>
                                            A
                                        </td>
                                        <td>
                                            <div class="input-group date" >
                                                <s:textfield name="remision.fechaBeteween" cssClass="form-control" readonly="true"/>
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                                Valor:<br>
                                <table>
                                    <tr>
                                        <td><s:textfield name="remision.rmce_valor" cssClass="form-control" /></td>
                                        <td>A</td>
                                        <td><s:textfield name="remision.valorBeteween" cssClass="form-control" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form-group col-md-2 col-sm-2 col-xs-2">
                                Estado:<br>
                                <s:select cssClass="form-control" list="estadoEqCeluar" name="remision.rmce_estado"  headerKey="-1" headerValue="Ubicacion del Equipo Celular" />                                
                            </div>
                            <div class="form-group col-md-2 col-sm-2 col-xs-2">
                                Pagado en Central:<br>
                                <s:select cssClass="form-control" list="yesNo" name="remision.rmce_pagado"  headerKey="-1" headerValue="Cancelado en Claro" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10 col-sm-10 col-xs-10"></div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <s:include value="/WEB-INF/TEMPLATE/botones/find.jsp">
                                    <s:param name="function">buscaGeneral</s:param>
                                    <s:param name="title">Busca Productos</s:param>
                                </s:include>
                            </div>
                        </div>
                    </div>
                </s:form>
            </div>
            <div class="col-md-1 col-sm-0 col-xs-0"></div>
        </div>
    </body>
</html>
