<%-- 
    Document   : BuscarTodosPrestamos
    Created on : 16/03/2019, 06:16:22 PM
    Author     : esteban montero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Préstamos</title>
        <%@include file="librerias.jsp"%>
        <script src="js/BuscarTodosPrestamos.js" type="text/javascript"></script>
        <script src="js/modals.js" type="text/javascript"></script>    
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
        
        <%@include file="header.jsp"%>
</head>
<body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">

    <div class="containerDataTableForm">
        <div class="registroDataTableForm">
            <h2 class="tituloDataTableForm">Préstamos</h2>
            <div class="divisionTitulo"></div>
            <table class="table table-striped table-bordered table-hover" id="mydataTodosPrestamo">

                <thead>
                    <tr>
                        <th class="th-sm">Nombre Usuario
                        </th>
                        <th class="th-sm">Fecha Inicio
                        </th>
                        <th class="th-sm">Fecha Final
                        </th>
                        <th class="th-sm">Nombre libro
                        </th>
                        <th class="th-sm">Estado
                        </th>
                        <th class="th-sm">Cambiar estado
                        </th>
                    </tr>
                </thead>

                <tfoot>
                </tfoot>

                <tbody>
                </tbody>
            </table>
        </div>
    </div>    

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalTitle">Modal Header</h4>
                </div>
                <div class="modal-body" id="myModalMessage">
                    <p>This is a small modal.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalFormulario" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header"> 
                    <h4 class="modal-title" id="myModalTitle">Editar estado préstamo
                        <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>

                </div>
                <div class="modal-body" id="myModalMessage">
                    <form role="form" onsubmit="return false" id="formModal">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="titulo" >Libro:</label>
                                <input class="form-control" style="border:none" id="titulo" name="titulo">
                                
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="estado">Estado</label>
                                <select class="form-control" id="estado">
                                    <option value="1">Solicitado</option>
                                    <option value="2">Prestado</option>
                                    <option value="3">Devuelto</option>

                                </select>    
                            </div>      
                        </div>
                        <div class="row"> 
                            <div class="col-md-4">                                    

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="hidden" value="modificarEstadoPrestamo" id="Estadoaction"/>
                                    <button type="submit" onclick="modificarEstadoPrestamo()" class=" btn btn-success">Cambiar</button>
                                    <button type = "reset" class="btn btn-danger" id="cancelar" >Cancelar</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalSancion" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header"> 
                    <h4 class="modal-title" id="myModalTitle">Sancion
                        <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>

                </div>
                <div class="modal-body" id="myModalMessage">
                    <form role="form" onsubmit="return false" id="formModal">
                        <div class="row">
                            <div class="col-lg-10"> 
                                <div class="form-group">
                                    <h2 style="color:#FF0000">  Este libro ha sido devuelto en una fecha posterior a la entrega oficial</h2>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <b>  ¿Desea aplicar una sanción?.</b>
                                    <b>  Una sanción no le permitira al usuario realizar préstamos hasta que acabe el período de la misma.</b>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="diasSancion"><b>Digite la cantidad de días en las que se aplicará la sanción</b></label>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">

                                    <input type="text" id="diasSancion" name="diasSancion" maxlength="4" size="4">
                                </div>
                            </div>
                        </div>
                        <div class="row"> 

                            <div class="col-lg-8">
                                <div class="form-group">
                                    <input type="hidden" value="crearSancion" id="Sancionaction"/>
                                    <button type="submit" onclick="crearSancion()" class=" btn btn-success">Sancionar</button>
                                    <button type = "reset" class="btn btn-danger" id="cancelar2" >No aplicar sanción</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</body>
<footer>
    <%@include file="footer.jsp"%>        
</footer>
</html>
