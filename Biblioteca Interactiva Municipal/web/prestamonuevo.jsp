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
        <script src="js/PRESTAMON.js" type="text/javascript"></script>
        <script src="js/modals.js" type="text/javascript"></script>
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    </head>
    
    <body>
    <%@include file="header.jsp"%>
                    
        <div class="container" style="margin-top:150px; ">
        <h2  style="align-content: center;">Préstamo de Libros</h2><br><br>
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
                                <div class="col-lg-6">
                                    <label style="color: red;">&nbsp; La fecha de devolución sera 8 días después a la fecha elegida</label>
                                </div>
                                <div class="col-lg-6">
                                    <label for="libro" >Libro elegido:</label>
                                    <input class="form-control" type="disabled" style="border:none" id="libro" name="libro">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="fechaInicio">Seleccione la fecha para realizar el préstamo:</label>
                                </div>
                                <div class="col-md-4">
                                    <input type="hidden" id="idLibro">
                                </div>
                                <div class="col-md-4">
                                    <input type="hidden" id="cantidad">
                                </div>

                                <div class="col-md-4">
                                    <input class="form-control" type="date" name="fechaInicio" id="fechaInicio">
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

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
        <footer>
            <br><br><br><br><br><br>
            <%@ include file="footer.jsp" %>
        </footer>
    
</html>
