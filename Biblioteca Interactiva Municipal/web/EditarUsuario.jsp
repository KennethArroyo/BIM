<%-- 
    Document   : EditarUsuario
    Created on : 29/01/2019, 07:34:26 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Usuario</title>
        <%@ include file="librerias.jsp" %>
        <%@ include file="header.jsp" %>
        
    </head>

    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
       
        <div class="containerForm">
        <div class="registroForm">    
        <h2 class="tituloForm">Editar Mi Perfil</h2>
        <div class="divisionTitulo"></div>
                <form role="form" id="regUsuarios" onsubmit="return false;">
                    <div class="form-group">
                        <label for="identificacion">Identificación</label>
                        <div class="input-group" style="width: 10px;">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown"></button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" data="Nacional">Nacional</a>
                                    <a class="dropdown-item" data="Extranjero">Extranjero</a>
                                </div>
                            </div>
                            <input type="text" class="form-control" id="identificacion" name="identificacion" pattern="([0-9]{9,12})" minlength="9" maxlength="12" required readonly>

                        </div>
                        <p>Formato Nacional(9 Digitos): 0-0000-0000 <br> Formato Extranjero(12 Digitos): 0000-0000-0000</p>
                    </div>


                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" pattern="(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ].*" minlength="1" maxlength="20">
                    </div>

                    <div class="form-group">
                        <label for="Apellidos">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" pattern="(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ].*" minlength="1" maxlength="22">
                    </div>

                    <div class="form-group">
                        <label for="lugar_residencia">Lugar de Residencia</label>
                        <input type="text" class="form-control" id="lugar_residencia" name="lugar_residencia" minlength="1" maxlength="30">
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" pattern="[0-9]{8}">
                        <p>Formato: 0000-0000</p>
                    </div>                

                    <%-- Contrasena mejor hacerlo por aparte, y ningun campo tienen que ser required

                        <div class="form-group" id="show_hide_password">
                        <label for="contrasena">Contraseña</label>

                        <input type="password" class="form-control" id="contrasena" name="contrasena"  
                               pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" required>
                        <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
                        <p>Debe tener al menos una mayúscula, una minúscula, un número y debe contener como mínimo 8 caracteres</p>
                    </div>

                    <div class="form-group" id="show_hide_password-verify">
                        <label for="verificacontrasena">Repetir Contraseña</label>
                        <input type="password" class="form-control" id="verificacontrasena" name="verificacontrasena" required>
                        <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
                    </div>--%>

                    <div class="form-group">
                        <label for="ref_trab_est">Referencia Lugar de Trabajo/Estudio</label>
                        <input type="text" class="form-control" id="ref_trab_est" name="ref_trab_est" minlength="1" maxlength="30" required>
                    </div>

                    <div id="mi_div">    
                        <div class="form-group">
                            <button type="submit" class="btn btn-success" onclick="modificarUsuario()"  >Guardar cambios</button>
                            <a href="Principal" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                        </div>
                    </div>
                </form>
               
            </div>    
        </div>  
        <script src="js/UsuarioAdmin.js" type="text/javascript"></script>

    </body>

        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
</html>
