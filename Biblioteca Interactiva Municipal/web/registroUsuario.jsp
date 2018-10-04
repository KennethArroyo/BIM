<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <title>Registro de Usuarios</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container" style="background-image:url(imagenes/bg.jpg)">
                <h2  style="align-content: center;">Registro de Usuarios</h2>
                <br>
                <form action="RegistrarUsuario" method="POST" id="regUsuarios">
                    <div class="form-group">
                        <label for="identificacion">Identificación</label>
                        <input type="text" class="form-control" id="identificacion" name="identificacion" required>
                    </div>

                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>

                    <div class="form-group">
                        <label for="Apellidos">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="lugar_residencia">Lugar de Residencia</label>
                        <input type="text" class="form-control" id="lugar_residencia" name="lugar_residencia" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="correo">Correo</label>
                        <input type="text" class="form-control" id="correo" name="correo" required>
                        <p>Formato: ejemplo@dominio.com</p>
                    </div>                 
                    
                    <div class="form-group" id="show_hide_password">
                        <label for="contrasena">Contraseña</label>
                        
                        <input type="password" class="form-control" id="contrasena" name="contrasena"  
                        pattern="(?=.*\d)(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ].*" required>
                        <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
                        <p>Debe tener al menos una mayúscula, una minúscula y un número</p>
                    </div>
                    
                    <div class="form-group" id="show_hide_password-verify">
                        <label for="verificacontrasena">Repetir Contraseña</label>
                        <input type="password" class="form-control" id="verificacontrasena" name="verificacontrasena" required>
                        <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
                    </div>
                    
                    <div class="form-group">
                        <label for="ref_trab_est">Referencia Lugar de Trabajo/Estudio</label>
                        <input type="text" class="form-control" id="ref_trab_est" name="ref_trab_est" required>
                    </div>
                    
                <div id="mi_div">    
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" id="botonRegistrar" form="regUsuarios" >Registrar</button>
                        <a href="principal.jsp" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                    </div>
                </div>
                </form>
                <br>
            </div>    
        </div>  
        <script src="js/Usuarios.js" type="text/javascript"></script>
    </body>
    
    <footer>
        <br><br><br><br><br><br>
        <%@ include file="footer.jsp" %>
    </footer>  
</html>