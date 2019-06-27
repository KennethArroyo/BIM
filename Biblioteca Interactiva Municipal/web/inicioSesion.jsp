<%-- 
    Document   : inicioSesion
    Created on : 14/01/2019, 10:46:39 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.*" session="true" %>--%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Inicio de Sesión</title>
        <%@include file="librerias.jsp"%>
        <script src="js/Sesion.js" type="text/javascript"></script>
        <script src="js/modals.js" type="text/javascript"></script>
        <%@ include file="header.jsp" %>

    </head>
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">

                <div class="containerInicioSesionForm">                        
                    <div class="registroInicioSesionForm">    
                    <h2 class='tituloInicioSesionForm'>Iniciar Sesión</h2>       
                    <div class='divisionTitulo'></div>    
                    <form onsubmit="return false" role="form" id="formLogin" method="POST">
                        <div class="form-group" id="groupUsuario">
                            <label for="cedula">Identificación</label>
                            <input type="text" class="form-control" id="usuario" autofocus="true" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                        </div>

                        <div class="form-group" id="show_hide_password">
                            <label for="contrasena">Contraseña:</label>
                            <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                            <a><i class="fa fa-eye-slash field-icon" aria-hidden="true" style="margin-left: 450px;"></i></a>
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
                                        <button type="reset" class="btn btn-danger" id="cancelar2" >Cancelar</button>
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
        
    </body>
        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
                
<script>
    $(document).ready(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );
        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
    });
});                
                    
</script>            
</html>
