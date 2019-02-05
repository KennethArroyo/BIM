<%-- 
    Document   : recuperarContrasena
    Created on : Feb 2, 2019, 1:10:37 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="js/CambioClave.js" type="text/javascript"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div>
      <img src="imagenes/padlock.png" id="icon" alt="Pass Icon" />
    </div>

    <!-- Login Form -->
    <form onsubmit="return false" role="form" id="formCambiarPass" method="POST">
            <div class="form-group" id="groupUsuario">
                <label for="cedula">Contraseña temporal</label>
                <input type="text" class="form-control" id="temporal" autofocus="true" style="width:70%; margin-left:15%;" placeholder="Temporal" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                       oninput="this.setCustomValidity('')">
            </div>
        
            <div class="form-group" id="show_hide_password">
                <label for="contrasena">Contraseña</label>

                <input type="password" class="form-control" id="contrasena" placeholder="Contraseña" style="width:70%; margin-left:15%;" name="contrasena"  
                pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" required>
                <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
                <p>Debe tener al menos una mayúscula, una minúscula, un número y debe contener como mínimo 8 caracteres</p>
            </div>

            <div class="form-group" id="show_hide_password-verify">
                <label for="verificacontrasena">Repetir Contraseña</label>
                <input type="password" class="form-control" id="verificacontrasena" placeholder="Contraseña" style="width:70%; margin-left:15%;" name="verificacontrasena" required>
                <a><i class="fa fa-eye-slash field-icon" aria-hidden="true"></i></a>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-success" onclick="cambiarClave()" id="enviar">Ingresar</button>
                <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
            </div>
    </form> 

  </div>
</div>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
