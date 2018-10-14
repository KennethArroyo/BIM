<%-- 
    Document   : agregarAsignatura
    Created on : Oct 14, 2018, 2:11:23 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <script src="js/FormularioLib.js" type="text/javascript"></script>
        <title>Agregar Asignatura</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container" style="width: 450px; align-self: center">
                <h3  style="align-content: center;">Agregar Asignatura</h3>
                <br>
                <form action="AgregarAsignatura" method="POST" id="asigForm" class="log">
                    <div class="form-group" style="width: 300px">
                        <label for="asignatura">Asignatura</label>
                        <input type="text" class="form-control" id="asignatura" name="asignatura" required>
                    </div>
                <div id="mi_div">    
                <div class="form-group">
                <button type="submit" class="btn btn-success" id="botonAgregar" >Agregar</button>
                 <a href="principal.jsp" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                </div>
                </div>
                </form>
                <br>
            </div>    
        </div>  
    </body>
    
    <footer>
        <br><br><br><br><br><br>
        <%@ include file="footer.jsp" %>
    </footer>  
</html>