<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <title>Agregar libro</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container" style="background-image:url(imagenes/bg.jpg)">
                <h2  style="align-content: center;">Agregar Libros</h2>
                <br>
                <form action="AgregarLibro" method="post" class="log">
                    <div class="form-group">
                        <label for="clasificacion">Clasificación</label>
                        <input type="text" class="form-control" id="input-text" name="clasificacion">
                    </div>

                    <div class="form-group">
                        <label for="titulo">Titulo</label>
                        <input type="text" class="form-control" id="input-text" name="titulo">
                    </div>

                    <div class="form-group">
                        <label for="autor">Autor</label>
                        <input type="text" class="form-control" id="input-text"name="autor">
                    </div>

                    <div class="form-group">
                        <label for="asignatura">Asignatura</label>
                        <select class="form-control" id="input-text" name="asignatura">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="estado">Estado</label>
                        <select class="form-control" id="input-text" name="estado" name="estado">
                            <option>Bueno</option>
                            <option>Regular</option>
                            <option>Malo</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="copias">Cantidad de copias</label>
                        <input type="text" class="form-control" id="input-text" name="copias">
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="fisico" value="1">
                        <label class="form-check-label" for="fisico">&nbsp Libro Físico</label>
                    </div>   

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="digital" value="1">
                        <label class="form-check-label" for="digital">&nbsp Libro Digital</label>
                    </div>

                    <div class="form-group">
                        <label for="comentario">Comentario corto</label>
                        <textarea class="form-control" maxlength="25" rows="3" id="input-text" name="comentario"></textarea>
                    </div>

                    <input type="submit" class="btn btn-default" value="Agregar">
                </form>
                <br>
            </div>    
        </div>  
    </body>
    
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>  
</html>