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
        <%@include file="librerias.jsp"%>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/Libros.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
        <%--<jsp:useBean id="libros" scope="request" type="ArrayList<Libro>" class="java.util.ArrayList"/>
        --%>
    </head>

    <body>
        <%@include file="header.jsp"%>
         <%--<div class="modal fade" id="myModal" role="dialog">
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
        </div>--%>
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
                                    <option value="ident">ID</option>
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
                <table border="2" class="table" id="tablaLibros"></table>
            </div>
           <%-- <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar / Modificar Choferes
                    </div>
                    <div class="modal-body" id="myModalMessage">
            <div class="form-group">
                        <label for="clasificacion">Clasificación</label>
                        <input type="text" class="form-control" id="clasificacion" name="clasificacion" required>
                    </div>

                    <div class="form-group">
                        <label for="titulo">Titulo</label>
                        <input type="text" class="form-control" id="titulo" name="titulo" required>
                    </div>

                    <div class="form-group">
                        <label for="autor">Autor</label>
                        <input type="text" class="form-control" id="autor"name="autor" required>
                    </div>

                    <div class="form-group">
                        <label for="asignatura">Asignatura</label>
                        <select class="form-control" id="asignatura" name="asignatura">
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="estado">Estado</label>
                        <select class="form-control" id="estado" name="estado" name="estado">
                            <option>Bueno</option>
                            <option>Regular</option>
                            <option>Malo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="copias">Cantidad de copias</label>
                        <input type="text" class="form-control" id="copias" name="copias">
                    </div>
                    
                    <br>
                    <input type="file" name="imagenPDF" class="file" id="imagenPDF">
                    <br>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="fisico" name="fisico" value="1">
                        <label class="form-check-label" for="fisico">Libro Físico</label>
                    </div>   

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="digital" name="digital" value="1" onclick="onClickDigital()">
                        <label class="form-check-label" for="digital">Libro Digital</label>
                    </div>
                    <div class="form-group">
                        <label for="comentario">Comentario corto</label>
                        <textarea class="form-control" maxlength="30" rows="2" id="comentario" name="comentario"></textarea>
                    </div>
                    <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>--%>
        </div> 


    </body> 

    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>