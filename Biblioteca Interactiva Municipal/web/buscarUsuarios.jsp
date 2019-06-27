<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>
<%--<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Usuario"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.*" session="true" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Usuario</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/BuscarUsuarios.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
        <%@include file="header.jsp"%>
    </head>

    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
                    
        <div class="containerDataTableForm">
        <div class="registroDataTableForm">    
        <h2 class="tituloDataTableForm">Buscar Usuarios</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover compact" id="mydata">
            
        <thead >
         <tr>
              <th class="th-sm">Identificación
              </th>
              <th class="th-sm">Nombre
              </th>
              <th class="th-sm">Apellidos
              </th>
              <th class="th-sm">Lugar de Residencia
              </th>
              <th class="th-sm">Teléfono
              </th>
              <th class="th-sm">Correo
              </th>
              <th class="th-sm">Trabajo/Centro de Estudio
              </th>
              <th class="th-sm"> Perfil Habilitado
              </th>
              <th class="th-sm"> Editar tipo de Usuario
              </th>
              <th class="th-sm"> Cambiar estado de Usuario
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
                        <h4 class="modal-title" id="myModalTitle">Editar Tipo Usuario
                            <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>

                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false" id="formModal">
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="identificacion" >Usuario:</label>
                                    <input class="form-control" type="disabled" style="border:none" id="identificacion" name="identificacion">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                <label for="tipo">Tipo</label>
                                        <select class="form-control" id="tipo">
                                            <option value="1">Administrador</option>
                                            <option value="2">Visitante</option>
                                   
                                        </select>    
                                </div>      
                            </div>
                            <div class="row"> 
                                <div class="col-md-4">                                    
                                
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="cambiarTipoUsuario" id="Tipoaction"/>
                                        <button type="submit" onclick="cambiarTipoUsuario()" class=" btn btn-success">Cambiar</button>
                                        <button type="reset" class="btn btn-danger" id="cancelar" >Cancelar</button>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="modal fade" id="myModalFormulario2" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Haabilitar/Deshabilitar Usuario
                            <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>

                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false" id="formModal">
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="identificacion2" >Usuario:</label>
                                    <input class="form-control" type="disabled" style="border:none" id="identificacion2" name="identificacion2">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                <label for="habilitado">Acción</label>
                                        <select class="form-control" id="habilitado">
                                            <option value="1">Habilitar</option>
                                            <option value="2">Deshabilitar</option>
                                   
                                        </select>    
                                </div>      
                            </div>
                            <div class="row"> 
                                <div class="col-md-4">                                    
                                
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" value="cambiarEstadoUsuario" id="Estadoaction"/>
                                        <button type="submit" onclick="cambiarEstadoUsuario()" class=" btn btn-success">Cambiar</button>
                                        <button type="reset" class="btn btn-danger"  id="cancelar2" >Cancelar</button>
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
