<%-- 
    Document   : mantenimientoActividades
    Created on : Mar 9, 2019, 1:31:09 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="librerias.jsp" %>
        <script src="js/Actividades.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento Actividades</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div>
                        <h2 style="align-content: center;"><center>Mantenimiento de actividades</center></h2>
                    </div>
                    <form action="Actividades" onsubmit="return true" id="formAct" enctype="multipart/form-data" method="POST">
                        <div class="form-group" id="groupUsuario">
                            <label>Nombre de la imagen (con extension)</label>
                            <input type="text" class="form-control" id="nombre" name="nombre"autofocus="true" placeholder="Nombre.jpg" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                        </div>
                        <div class="form-group" id="group">
                            <label for="imagen">Imagen de actividad</label>
                            <input type="file" class="form-control" id="imagen" name="imagen" required oninvalid="this.setCustomValidity('Favor elegir imagen')"
                                oninput="this.setCustomValidity('')">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-success" from="formAct" id="enviar">Agregar</button>
                            <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                        </div>
                    </form>
                <div class="col-md-4"></div>
            </div>
            
            <div class="table-responsive">
                <table border="2" class="table table-striped" id="tablaActividades"></table>
            </div>  
        </div>
        </div>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
