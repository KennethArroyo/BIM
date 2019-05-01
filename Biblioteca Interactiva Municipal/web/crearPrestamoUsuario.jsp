<%-- 
    Document   : prestamonuevo
    Created on : Feb 11, 2019, 10:01:03 AM
    Author     : arroy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Prestamo"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Préstamo</title>
        <%@include file="librerias.jsp"%>
        <script src="js/Prestamos.js" type="text/javascript"></script>
        <script src="js/modals.js" type="text/javascript"></script>
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
        <%@include file="header.jsp"%>
    </head>
    
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
                    
        <div class="containerDataTableForm">
        <div class="registroDataTableForm">    
        <h2 class="tituloDataTableForm">Préstamo de Libros</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover" id="mydata">
            
        <thead>
         <tr>
              <th class="th-sm">Clasificación
              </th>
              <th class="th-sm">Autor
              </th>
              <th class="th-sm">Título
              </th>
              <th class="th-sm">Estado del Libro
              </th>
              <th class="th-sm">Comentario
              </th>
              <th class="th-sm">Cantidad de Copias
              </th>
              <th class="th-sm">Asignatura
              </th>
              <th class="th-sm">Préstamo
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
        
            <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Crear Préstamo
                            <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return true" id="formModalUs">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="hidden" id="idLibro">
                                </div>
                                <div class="col-md-4">
                                    <input type="hidden" id="cantidad">
                                </div>  
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                <label style="color: red;">La fecha de devolución sera 8 días después a la fecha elegida</label>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-lg-6">
                                    <label for="fechaInicio">Seleccione la fecha para realizar el préstamo:</label>
                                    <input class="form-control" type="date" name="fechaInicio" id="fechaInicio" required>
                                </div> 
                                <div class="col-lg-6">
                                    <label for="libro" >Libro elegido para prestamo:</label>
                                    <input class="form-control" type="disabled" id="libro" name="libro">
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="cedUsuario">Ingrese la cedula del usuario: <br></label>
                                    <input class="form-control" type="text" name="cedUsuario" id="cedUsuario" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-10" id="VerUsuario">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div style="margin-left: 15px;">
                                <input class="form-control" type="button" onclick="return validarCed()" value="Verificar usuario" class="btn btn-info btn-sm">
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;"> 
                                <div class="col-md-4" style="margin-left: 250px;">
                                    <div class="form-group">
                                        <button onclick="validar()" class="btn btn-success">Solicitar</button>
                                        <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">Esta seccion le permite crear un prestamo para un usuario</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
   
        <%@ include file="footer.jsp" %>
    
</html>
