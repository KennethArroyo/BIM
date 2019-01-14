<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="librerias.jsp" %>
        <link href="estilos/sweetalert2.css" rel="stylesheet" type="text/css"/>
        <script src="js/sweetalert2.js" type="text/javascript"></script>
        <script src="js/FormularioLib.js" type="text/javascript"></script>
        <title>Agregar libro</title>
    </head>
    
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            
            <div class="container col-lg-8 " style="align-self: center">
                <h2  style="align-content: center;">Agregar Libros</h2>
                <br>
                <form onsubmit="return agregarLibro()" autocomplete="off" action="AgregarLibro" method="POST" enctype="multipart/form-data" id="libForm" class="log">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="clasificacion">Clasificación</label>
                                <input type="text" class="form-control" id="clasificacion" name="clasificacion" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="titulo">Titulo</label>
                                <input type="text" class="form-control" id="titulo" name="titulo" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <div class="autocomplete">
                                <label for="autor">Autor (obligatorio)</label>
                                <input type="text" class="form-control" id="autor" name="autor" required oninvalid="this.setCustomValidity('Favor llenar este campo')"
                                oninput="this.setCustomValidity('')">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="autor">Autor (opcional)</label>
                                <input type="text" class="form-control" id="autor2" name="autor">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="autor">Autor (opcional)</label>
                                <input type="text" class="form-control" id="autor3" name="autor">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="autor">Autor (opcional)</label>
                                <input type="text" class="form-control" id="autor4" name="autor">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                               <label for="agregarAut">Agregar mas autores</label><br>
                               <button type="button" style="background-color:rgba(255,250,255,0.0); border:none;" 
                               id="agregarAut" onclick="showResults();"><img src="imagenes/add.png" /></button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
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
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="copias">Cantidad de copias</label>
                                <input type="text" class="form-control" id="copias" name="copias">
                            </div><br>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="imagenPDF">Portada</label>
                                <input type="file" name="imagenPDF" class="file" id="imagenPDF">
                            </div>
                        </div>
                    </div>
                    <div class="row"><br>
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
                                <textarea class="form-control" maxlength="30" rows="2" id="comentario" name="comentario"></textarea>
                            </div>
                        </div>
                    </div>
                <div class="form-group" id="mi_div">
                <button type="submit" class="btn btn-success" id="botonAgregar" form="libForm" >Agregar</button>
                 <a href="principal.jsp" id="cancel" name="cancel" class="btn btn btn-danger">Cancelar</a>
                </div>
                </form>
                <br>
            </div>    
        </div> 
    </body>
   <div class="container">
    <footer class="footer">
        <%@ include file="footer.jsp" %>
    </footer>
   </div>
</html>