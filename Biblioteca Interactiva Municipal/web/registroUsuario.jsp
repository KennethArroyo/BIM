<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <script src="js/modals.js" type="text/javascript"></script>
        <title>Registro de Usuarios</title>
        <%@ include file="header.jsp" %>
    </head>
    
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
            <div class="containerForm">
                <br>
                <form action="RegistrarUsuario" method="POST" id="regUsuarios">
                    <div class="registroForm">
                    <h2 class="tituloForm">Registro de Usuarios</h2>
                    <div class='divisionTitulo'></div>

                    <div class="form-group">
                        <label for="identificacion">Identificación</label>
                            <div class="input-group">
                            <div class="input-group-prepend">
                              <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown"></button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" data="Nacional">Nacional</a>
                                <a class="dropdown-item" data="Extranjero">Extranjero</a>
                              </div>
                            </div>
                            <input type="text" class="form-control" id="identificacion" name="identificacion" pattern="([0-9]{9,12})"required>
                            
                        </div>
                        <p>Formato Nacional(9 Digitos): 000000000 <br> Formato Extranjero(12 Digitos): 000000000000</p>
                    </div>


                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" pattern="(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ].*" required>
                    </div>

                    <div class="form-group">
                        <label for="Apellidos">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" pattern="(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ].*" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="lugar_residencia">Lugar de Residencia</label>
                        <input type="text" class="form-control" id="lugar_residencia" name="lugar_residencia" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" pattern="[0-9]{8}" required>
                        <p>Formato: 00000000</p>
                    </div>
                    
                    <div class="form-group">
                        <label for="correo">Correo</label>
                        <input type="text" class="form-control" id="correo" name="correo" required>
                        <p>Formato: ejemplo@dominio.com</p>
                    </div>                 
                    
                    <div class="form-group" id="show_hide_password">
                        <label for="contrasena">Contraseña</label>                        
                        <input type="password" class="form-control" id="contrasena" name="contrasena"  
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" required>
                        <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
                        <p>Debe tener al menos una mayúscula, una minúscula, un número y debe contener como mínimo 8 caracteres</p>
                    </div>
                    
                    <div class="form-group" id="show_hide_password">
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
                        <a href="Principal" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                    </div>
                </div>
                </form>
                <br>
            </div>    
           </div>  
          
        

        <script src="js/Usuarios.js" type="text/javascript"></script>
    </body>
    
        <footer>
            <%@include file="footer.jsp"%>        
        </footer>

</html>