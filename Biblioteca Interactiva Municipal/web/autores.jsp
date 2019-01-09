<%-- 
    Document   : agregarAsignatura
    Created on : Oct 14, 2018, 2:11:23 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
        <script src="js/Autores.js" type="text/javascript"></script>
        <title>Autores</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container col-md-4" style="align-self: center">
                <h3  style="align-content: center;">Agregar Asignatura</h3>
                <br>
                <form action="AgregarAsignatura" method="POST" id="asigForm" class="log">
                    <div class="form-group" col-sm-3 col-md-4>
                        <input type="text" class="form-control" id="asignatura" name="asignatura" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
    oninput="this.setCustomValidity('')">
                    </div>
                <div id="mi_div">    
                <div class="form-group">
                <button type="submit" class="btn btn-success" id="botonAgregar" >Agregar</button>
                 <a href="principal.jsp" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                </div>
                </div>
                </form>
                <br>
                <div class="table-responsive">
                    <table border="2" class="table table-striped" id="tablaAsignaturas">
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModalAsignatura" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Modificar Asignatura
                            <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>
                       
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false" id="formModal">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="AsigId" name="AsigId">
                                    </div>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <button type="submit" onclick="modificarAsig()" class=" btn btn-success">Guardar</button>
                                        <button type="reset" onclick="cancelar()" class="btn btn-danger" >Cancelar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">En esta pantalla puede modificar una asignatura.</span>
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