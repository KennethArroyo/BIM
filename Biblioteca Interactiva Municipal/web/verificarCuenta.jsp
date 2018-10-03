<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <title>Verificación de Cuenta</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container" style="background-image:url(imagenes/bg.jpg)">
                <h2  style="align-content: center;">Verificación de Cuenta</h2>
                <br>
                <form action="VerificarUsuario" method="POST" id="regUsuarios">
                    <div class="form-group">
                        <label for="ref_trab_est">Correo a Verificar </label>
                        <input type="text" class="form-control" id="correo" name="correo" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="ref_trab_est">Código de Verificación </label>
                        <input type="text" class="form-control" id="codverificacion" name="codverificacion" required>
                    </div>
                    
                <div id="mi_div">    
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" id="botonRegistrar" form="regUsuarios" >Agregar</button>
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