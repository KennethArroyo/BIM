<%-- 
    Document   : BuscarTodosPrestamos
    Created on : 16/03/2019, 06:16:22 PM
    Author     : esteban montero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Préstamos</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/BuscarTodosPrestamos.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp"%>
                    
        <div class="container" style="margin-top:150px; ">
        <h2  style="align-content: center;">Préstamos</h2><br><br>
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
                                    <label for="id" >Préstamo:</label>
                                    <input class="form-control" type="disabled" style="border:none" id="id" name="id">
                                </div>
                                <%--<div class="col-lg-6">
                                    <label for="identificacion" >Usuario:</label>
                                    <input class="form-control" type="disabled" style="border:none" id="identificacion" name="identificacion">
                                </div>--%>
                                
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
    </body>
</html>
