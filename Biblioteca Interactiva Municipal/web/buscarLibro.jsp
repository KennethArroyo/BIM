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
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/Libros.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
    </head>

    <body>
    <%@include file="header.jsp"%>
                    
        <div class="container" style="margin-top:150px; ">
        <h2  style="align-content: center;">Buscar Libros</h2><br><br>
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
              <th class="th-sm"> Editar
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
