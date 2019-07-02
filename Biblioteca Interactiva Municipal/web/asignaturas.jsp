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
        <script src="js/Asignaturas.js" type="text/javascript"></script>
        <title>Asignaturas</title>
        <%@ include file="header.jsp" %>

    </head>
    
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        
        <div class="containerDataTableForm">
        <div class="registroDataTableForm">
        <div class="tituloAsignaturasForm">Asignaturas</div>  
        <div class="divisionTitulo"></div>
        <ul class="errorMessages"></ul>
        <div class="input-bar" style="width: 1000px; display: block;">
        <div class="input-bar-item">
          <form action="AgregarAsignatura" method="POST" id="asigForm" class="log">
                <label><h2>Agregar Asignatura:</h2></label>        

            <div class="form-group" style="display: flex; height: 35px; width: 500px;">
                <input type="text" class="form-control" id="asignatura" name="asignatura" required oninvalid="this.setCustomValidity('Favor llenar este campo')" minlength="1" maxlength="50" oninput="this.setCustomValidity('')" minlength="1" maxlength="50" >
                <span class="input-group-btn">
                  <button type="submit" class="btn btn-success" id="botonAgregar">Agregar</button>
                  <!--<a href="asignaturas.jsp" id="cancel" name="cancel" class="btn btn btn-danger" style="text-align: center;">Cancelar</a>!-->
                </span>
            </div>
          </form>
        </div>
      </div>
                
                               
                <h2  style="align-content: center;">Buscar Asignaturas</h2><br><br>
                <div style="align-content:center;" >
                <table class="table table-striped table-bordered table-hover" id="mydata" style=" margin-left: auto;margin-right: auto;">

                <thead>
                 <tr>
                      <th class="th-sm">Nombre
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
                <div class="modal fade" id="myModalAsignatura" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Modificar Asignatura
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
                                        <input type="hidden" class="form-control" id="AsigId" name="AsigId">
                                    </div>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <button type="submit" onclick="modificarAsig()" class=" btn btn-success">Guardar</button>
                                        <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
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
        <%@ include file="footer.jsp" %>
    </footer>  
</html>