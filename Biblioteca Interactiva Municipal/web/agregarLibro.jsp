<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <script src="js/FormularioLib.js" type="text/javascript"></script>
        <title>Agregar libro</title>
        <%@ include file="header.jsp" %>

    </head>
    
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        
        <div class="containerAgregarLibroForm" >
                <div class='registroAgregarLibroForm'>
                <form onsubmit="return agregarLibro()" autocomplete="off" action="AgregarLibro" method="POST" enctype="multipart/form-data" id="libForm" class="log">

                <h2  class='tituloAgregarLibroForm'>Agregar Libros</h2>
                <div class='divisionTitulo'></div>
                <ul class="errorMessages"></ul>
                    <div class="row" style='width: 950px;'>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="clasificacion">Clasificación</label>
                                <input type="text" class="form-control" id="clasificacion" name="clasificacion" minlength="1" maxlength="15" required 
                                oninput="this.setCustomValidity('')">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="titulo">Titulo</label>
                                <input type="text" class="form-control" id="titulo" name="titulo" minlength="1" maxlength="50" required 
                                oninput="this.setCustomValidity('')">
                            </div>
                        </div>
                    </div>
                    <div class="row" style='width: 950px;'>
                        <div class="col-lg-4">
                            <label>¡Por favor registre primero los autores del libro!</label>
                        </div>
                     </div>
                    <div class="row" style='width: 950px;'>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <div class="autocomplete">
                                <label for="autor1">Autor (obligatorio)</label>
                                <input type="text" class="form-control" id="autor1" name="Autor" required 
                                oninput="this.setCustomValidity('')">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="autor2">Autor (opcional)</label>
                                <input type="text" class="form-control" id="autor2" name="autor">
                            </div>
                        </div>
                    </div>
                    <div class="row" style='width: 950px;'>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="autor3">Autor (opcional)</label>
                                <input type="text" class="form-control" id="autor3" name="autor">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="autor4">Autor (opcional)</label>
                                <input type="text" class="form-control" id="autor4" name="autor">
                            </div>
                        </div>
                    </div>
                    <div class="row" id="autores">
                        <div class="col-lg-4">
                            <div class="form-group">
                               <label for="agregarAut">Agregar mas autores</label><br>
                               <button type="button" onclick="agregarCampoAutor()" style="background-color:rgba(255,250,255,0.0); border:none;" 
                               id="agregarAut" onclick="showResults();"><img src="imagenes/add.png" /></button>
                            </div>
                        </div>
                    </div>
                    <div class="row" style='width: 950px;'>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="asignatura">Asignatura</label>
                                <select class="form-control" id="asignatura" name="asignatura">
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="estado">Estado</label>
                                <select class="form-control" id="estado" name="estado" name="estado">
                                    <option>Bueno</option>
                                    <option>Regular</option>
                                    <option>Malo</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row" style='width: 950px;'>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="copias">Cantidad de copias</label>
                                <input type="text" class="form-control" id="copias" name="copias" pattern="[0-9]" required>
                            </div><br>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="imagenPDF">Portada</label>
                                <input type="file" name="imagenPDF" class="file" id="imagenPDF">
                            </div>
                        </div>
                    </div>
                    <div class="row" style='width: 950px;'><br>
                        <div class="col-lg-4">
                            <div class="form-check">
                                <label for="fisico"><input class="form-check-input" type="checkbox" id="fisico" name="fisico" value="1">
                                    Libro Físico</label>
                            </div>  
                            <div class="form-check">
                                <label for="digital"><input class="form-check-input" type="checkbox" id="digital" name="digital" value="1" onclick="onClickDigital()">
                                    Libro Digital</label>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="comentario">Comentario corto</label>
                                <textarea class="form-control" maxlength="50" rows="2" id="comentario" name="comentario"></textarea>
                            </div>
                        </div>
                    </div>
                <div class="form-group" id="mi_div">
                <button type="submit" class="btn btn-success" id="botonAgregar" form="libForm" >Agregar</button>
                 <a href="Principal" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                </div>
                </form>
                </div>
            </div>
    </body>
        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
</html>