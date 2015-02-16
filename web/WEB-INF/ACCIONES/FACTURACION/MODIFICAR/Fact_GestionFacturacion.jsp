<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/FACTURACION/GESTION/Fact_GestionFacturacion.js"></script>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/FACTURACION/GESTION/Fact_GestionFacturacionAddServ.js"></script>
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
            <div class="col-md-2 col-xs-0 col-sm-0"></div>
            <div class="col-md-8 col-xs-12 col-sm-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <td colspan="4" class="alert alert-info text-center"><h3>Datos del Cliente</h3></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 20%"><b>CEDULA:</b></td>
                            <td style="width: 30%"><s:text name="cliente.clien_cedula" /></td>
                            <td style="width: 20%"><b>CORREO:</b></td>
                            <td style="width: 30%"><s:text name="cliente.clien_correo" /></td>
                        </tr>
                        <tr>
                            <td><b>NOMBRE:</b></td>
                            <td colspan="3"><s:text name="cliente.clien_nombres" /> <s:text name="cliente.clien_apellidos" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-2 col-xs-0 col-sm-0"></div>
        </div>
        <div class="row">
            <div class="col-md-2 col-xs-0 col-sm-0"></div>
            <div class="col-md-8 col-xs-12 col-sm-12">
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
                <table class="table table-bordered">
                    <tr>
                        <td class="alert alert-info text-center" colspan="6" ><h3>Valores de Facturaci&oacute;n</h3></td>
                    </tr>
                    <tr>
                        <s:if test="%{factura != null}">
                        </s:if>
                        <s:else>
                            <td style="width: 15%;"><b>Valor Iva:</b></td>
                            <td style="width: 18%;">0</td>
                            <td style="width: 15%;"><b>Valores Totales:</b></td>
                            <td style="width: 18%;">0</td>
                            <td style="width: 15%;"><b>Total a Pagar:</b> </td>
                            <td style="width: 17%;">0</td>
                        </s:else>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="agregar()"><span class="glyphicon glyphicon-plus"></span>&nbsp;Agregar</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="remover()"><span class="glyphicon glyphicon-minus"></span>&nbsp;Remover</button>                            
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-2 col-xs-0 col-sm-0"></div>
        </div>
        <!-- Inicio popups de la pagina-->
        <!-- Dialogo en el cual se elige si se va ha adicionar un servicio o un producto-->
        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="dialogoAddServProd">
            <div class="modal-dialog">                
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Elección Producto o Servicio</h4>
                    </div>
                    <div class="modal-body">
                        ¿Desea adicionar un producto o un servicio?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            CERRAR
                        </button>
                        <button type="button" class="btn btn-primary" id="sevicioAdd">
                            SERVICIO
                        </button>
                        <button type="button" class="btn btn-primary" id="productoAdd">
                            PRODUCTO
                        </button>                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Muestra un formulario con las opciones de Filtro con las cuales el usuario podra reservar una habitacion -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="dialogoFiltroReservServ">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Filtros Reserva Habitaciones</h4>
                    </div>
                    <div class="modal-body">
                        <div style="width: 100%;text-align: center">POSIBLES FILTROS PARA RESERVA DE HABITACION</div>
                        <div class="alert alert-danger" style="display: none;" ><h3><span id="msgError"></span></h3></div>
                        <form>
                            <div class="form-group">
                                <label for="fecha" class="control-label">Fecha:</label>
                                <input type="text" class="form-control" id="fechaReserv">
                            </div>
                            <div class="form-group">
                                <label for="numPersonas" class="control-label">Número de Personas:</label>
                                <input type="text" class="form-control" id="numPersonasReserv">
                            </div>
                            <div class="form-group">
                                <label for="numDias" class="control-label">Numero de Días:</label>
                                <input type="text" class="form-control" id="numDiasReserv">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            CERRAR
                        </button>
                        <button type="button" class="btn btn-primary" id="buscarPosibleReservHab">
                            BUSCAR
                        </button>                        
                    </div>
                </div>                
            </div>
        </div>
        <!-- Fin popups de la pagina-->
    </body>
</html>