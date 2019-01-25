<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Libro</title>
         <!--<script src="https://code.jquery.com/jquery-1.10.2.js"></script>-->
        <script src="js/Libros.js" type="text/javascript"></script>
        <!--<link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>-->     
        <script src="js/modals.js" type="text/javascript"></script>
        <!--FILES DATATABLE-->
        <link href="DataTables-1.10.18/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.foundation.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.foundation.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.jqueryui.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.semanticui.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/dataTables.semanticui.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/datatables.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="DataTables-1.10.18/js/dataTables.bootstrap.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.foundation.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.foundation.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.jqueryui.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.semanticui.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/dataTables.semanticui.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/datatables.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/datatables.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <!--FIN-->
    </head>

    <body>
        <%@include file="header.jsp"%>
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
        <!--Fondo de Pantalla-->
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"> 

            <div class="container">
                <h2>Buscar Libros</h2>
                <br>
                <div class="container">
                    <form role="form" onsubmit="return false;">
                        <div class="form-group">

                            <label for="selectBuscar">Buscar Por:
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
            <%--<div class="container" >
                <table border="1" class="table" id="tablaLibros"></table>
            </div>--%>
            <div class="table-responsive">
                <table class="table table-striped" id="tablaLibros"></table>
            </div>

        </div>
        <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Modificar Libros
                            <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>

                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false" id="formModal">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="clasificacion">Clasificación</label>
                                        <input type="text" class="form-control" id="clasificacion" name="clasificacion" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="titulo">Titulo</label>
                                        <input type="text" class="form-control" id="titulo" name="titulo" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="autor">Autor</label>
                                        <input type="text" class="form-control" id="autor"name="autor" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="asignatura">Asignatura</label>
                                        <select class="form-control" id="asignatura">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">         
                                    <div class="form-group">
                                        <label for="estado">Estado</label>
                                        <select class="form-control" id="estado">
                                            <option value="1" selected="selected">BUENO</option>
                                            <option value="2">REGULAR</option>
                                            <option value="3">MALO</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="copias">Cantidad de copias</label>
                                        <input type="text" class="form-control" id="copias" name="copias">
                                    </div>
                                </div>
                            </div>

                            <br>
                            <input type="file" name="imagenPDF" class="file" id="imagenPDF">
                            <br>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="fisico"><input class="form-check-input" type="checkbox" id="fisico" name="fisico">
                                        Libro Físico</label>
                                </div> 
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="digital"><input class="form-check-input" type="checkbox" id="digital" name="digital" onclick="onClickDigital()">
                                        Libro Digital</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="comentario">Comentario corto</label>
                                    <textarea class="form-control" maxlength="30" rows="2" id="comentario" name="comentario"></textarea>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="modificarLibro" id="libroAction"/>
                                        <button type="submit" onclick="modificarLibro()" class=" btn btn-success">Guardar</button>
                                        <button type="reset" onclick="cancelar()" class="btn btn-danger" >Cancelar</button>
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