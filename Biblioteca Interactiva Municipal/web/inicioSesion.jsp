<%-- 
    Document   : inicioSesion
    Created on : 14/01/2019, 10:46:39 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Inicio de Sesión</title>
        <%@include file="librerias.jsp"%>
        <script src="js/modals.js" type="text/javascript"></script>
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="js/Sesion.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div>
                        <h2 style="align-content: center;"><center>Iniciar Sesión</center></h2>
                    </div>
                    <br/>
                    <form onsubmit="return false" role="form" id="formLogin" method="POST">
                        <div class="form-group" id="groupUsuario">
                            <label for="cedula">Identificación</label>
                            <input type="text" class="form-control" id="usuario" autofocus="true" placeholder="Identificación" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                        </div>

                        <div class="form-group" id="show_hide_password-verify">
                            <label for="nombre">Contraseña:</label>
                            <input type="password" class="form-control" id="contrasena" placeholder="Contraseña" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-success" onclick="iniciar()" id="enviar">Ingresar</button>
                            <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                        </div>
                        
                        <div class="form-group">
                            <button class="btn btn-link" onclick="levantarModal()">¿Olvidó su contraseña?</button>
                        </div>

                        <div class="form-group height25" >
                            <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                <strong id="mesajeResultNeg">Info!</strong> 
                                <span id="mesajeResultText">Digite su identificación y contraseña para Iniciar Sesión</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        </div>
        <div class="modal fade" id="myModalRecuperar" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Recuperar contraseña
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false" id="formModal">
                                    <div class="form-group">
                                        <label for="correo">Correo</label>
                                        <input type="text" class="form-control" id="correo" name="correo">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" onclick="enviarCorreo()" class=" btn btn-success">Enviar</button>
                                        <button type="reset" onclick="cancelar()" class="btn btn-danger" >Cancelar</button>
                                    </div>
                                
                            <div class="form-group height25" >
                                <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Info!</strong> 
                                    <span id="mesajeResultText">En esta pantalla puede ingresar su correo para enviar una contraseña temporal</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
