<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <script src="js/FormularioLib.js" type="text/javascript"></script>
        <title>Agregar libro</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container" style="background-image:url(imagenes/bg.jpg)">
                <h2  style="align-content: center;">Agregar Libros</h2>
                <br>
                <form onsubmit="return agregarLibro()" action="AgregarLibro" method="post" id="libForm" class="log">
                    <div class="form-group">
                        <label for="clasificacion">Clasificación</label>
                        <input type="text" class="form-control" id="clasificacion" name="clasificacion" required>
                    </div>

                    <div class="form-group">
                        <label for="titulo">Titulo</label>
                        <input type="text" class="form-control" id="titulo" name="titulo" required>
                    </div>

                    <div class="form-group">
                        <label for="autor">Autor</label>
                        <input type="text" class="form-control" id="autor"name="autor" required>
                    </div>

                    <div class="form-group">
                        <label for="asignatura">Asignatura</label>
                        <select class="form-control" id="asignatura" name="asignatura">
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="estado">Estado</label>
                        <select class="form-control" id="estado" name="estado" name="estado">
                            <option>Bueno</option>
                            <option>Regular</option>
                            <option>Malo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="copias">Cantidad de copias</label>
                        <input type="text" class="form-control" id="copias" name="copias">
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="fisico" name="fisico" value="1">
                        <label class="form-check-label" for="fisico">&nbsp Libro Físico</label>
                    </div>   

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="digital" name="digital" value="1" onclick="onClickDigital()">
                        <label class="form-check-label" for="digital">&nbsp Libro Digital</label>
                    </div>

                    <div class="form-group">
                        <label for="comentario">Comentario corto</label>
                        <textarea class="form-control" maxlength="30" rows="2" id="comentario" name="comentario"></textarea>
                    </div>

                </form>
                <br>
                <div class="form-group">
                <input type="submit" class="btn btn-default" form="libForm" value="Agregar">
                </div>
                <br>
            </div>    
        </div>  
    </body>
    
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>  
</html>