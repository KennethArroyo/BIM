<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <script src="js/modals.js" type="text/javascript"></script>
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
                            <div class="input-group" style="width: 10px;">
                            <div class="input-group-prepend">
                              <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown"></button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" data="Nacional">Nacional</a>
                                <a class="dropdown-item" data="Extranjero">Extranjero</a>
                              </div>
                            </div>
                            <input type="text" class="form-control" id="identificacion" name="identificacion" pattern="([0-9]{9,12})"required>
                            
                        </div>
                        <p>Formato Nacional(9 Digitos): 0-0000-0000 <br> Formato Extranjero(12 Digitos): 0000-0000-0000</p>
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
                        <p>Formato: 0000-0000</p>
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

<!-- Modal -->
<div class="modal fade" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aviso</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label>Una vez registrado, se le enviará a su correo un código para verificar su cuenta</label>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
        <script src="js/Usuarios.js" type="text/javascript"></script>
    </body>
    
    <footer>
        <br><br><br><br><br><br>
        <%@ include file="footer.jsp" %>
    </footer>  
</html>