<%-- 
    Document   : crearPrestamo
    Created on : 30/09/2018, 11:46:53 PM
    Author     : esteban
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Prestamo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Préstamo</title>
        <%@include file="librerias.jsp"%>
        <script src="js/Prestamos.js" type="text/javascript"></script>
        <script src="js/modals.js" type="text/javascript"></script>
        <link href="estilos/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/datetimepicker.js" type="text/javascript"></script>
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
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
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br>
            <div class="container">
                <h2>Solicitar Préstamos</h2>
                <br>
                <div class="container">
                    <form role="form" onsubmit="return false;">
                        <div class="form-group">
                            <label for="selectBuscar">Buscar libro por:
                                <select class="form-control" id="selectBuscar">
                                    <option value="clasificacion" selected="selected">Clasificación</option>
                                    <option value="asignatura">Asignatura</option>
                                    <option value="titulo">Título</option>
                                    <option value="autor">Autor</option>  
                                </select>
                            </label>
                            <br><br>
                            <div class="input-group" id="search-bar">
                                <input type="text" class="form-control" id="textobuscar" placeholder="Buscar" >
                                <div class="input-group-btn">
                                    <button  class="btn btn-default" onclick="buscar()" ><i class="fa fa-search" id="buscar"></i></button>
                                </div>
                            </div>
                            <br>
                        </div>
                    </form>
                </div>               
            </div> 
            <div class="table-responsive">
                <table border="2" class="table table-striped" id="tablaLibros"></table>
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
                        <form role="form" onsubmit="return false" id="formModal">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="fechaInicio">Seleccione la fecha para realizar el préstamo:</label>

                                </div>
                                <div class="col-md-4">
                                    <input type id="idLibro">
                                </div>
                                <div class="col-md-4">
                                    <input type id="cantidad">
                                </div>
                                <div class="col-md-4">
                                    <input type="date" name="fechaInicio" id="fechaInicio">
                                </div>             
                            </div>
                            <div class="row"> 
                                <div class="col-md-4">
                                   
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="solicitarPrestamo" id="prestamoAction"/>
                                         <button type="submit" onclick="solicitarPrestamo()" class=" btn btn-success">Solicitar</button>
                                        <button type="reset" onclick="cancelar()" class="btn btn-danger" >Cancelar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <br><br><br><br><br><br>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
