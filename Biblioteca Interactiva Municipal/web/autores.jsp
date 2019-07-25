<%-- 
    Document   : agregarAsignatura
    Created on : Oct 14, 2018, 2:11:23 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>    
        <title>Autores</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
        <script src="js/Autores.js" type="text/javascript"></script>
        <%@ include file="header.jsp" %>
    </head>
    
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        
        <div class="containerDataTableForm"> 
        <div class="registroDataTableForm">
        <div class="tituloAutoresForm">Autores</div>
        <div class="divisionTitulo"></div>   
        <div class="input-bar" style="width: 1000px; display: block;">
        <div class="input-bar-item">
          <form action="AgregarAutor" method="POST" id="autorForm" class="log">
                <label><h2>Agregar Autor:</h2></label>        

            <div class="form-group" style="display: flex; height: 35px; width: 500px;">
                <input type="text" class="form-control" id="autor" name="autor" minlength="1" maxlength="50" required oninvalid="this.setCustomValidity('Favor llenar este campo')" oninput="this.setCustomValidity('')" >
                <span class="input-group-btn">
                  <button type="submit" onclick="agreAutor()" class="btn btn-success" id="botonAgregar">Agregar</button>
                </span>
            </div>
          </form>
        </div>
        </div>
                
            <div class="container" style="margin-top:50px; ">
                
                               
                <h2  style="align-content: center;">Buscar Autores</h2><br><br>
                <div style="align-content:center;" >
                <table class="table table-striped table-bordered table-hover" id="mydata" style=" margin-left: auto;margin-right: auto;">

                <thead>
                 <tr>
                      <th class="th-sm">Nombre
                      </th>
                      <th class="th-sm">Editar
                      </th>
                      <th class="th-sm">Eliminar
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
                
                
            </div>
        </div>
        <div class="modal fade" id="myModalAutor" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Modificar Autor
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                       
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false" id="formModal">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="AutorId" name="AutorId">
                                    </div>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <button type="submit" onclick="modificarAutor()" class=" btn btn-success">Guardar</button>
                                        <button type="reset" class="btn btn-danger" id="cancelar" >Cancelar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">En esta pantalla puede modificar un autor.</span>
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