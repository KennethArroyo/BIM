<%-- 
    Document   : AgregarLibro
    Created on : Sep 16, 2018, 12:49:32 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar libro</title>
        <%@ include file="librerias.jsp" %>
    </head>
    <body>
        <div class="super_container">
            <%@ include file="header.jsp" %>
            <div class="form-group"></div>
            <div class="formu">
            <form action="AgregarLibro" method="post" class="log">
            <div class="form-group">
              <label for="clasificacion">Clasificación</label>
              <input type="text" class="form-control">
            </div>
                
            <div class="form-group">
              <label for="titulo">Titulo</label>
              <input type="text" class="form-control">
            </div>
                
            <div class="form-group">
              <label for="autor">Autor</label>
              <input type="text" class="form-control">
            </div>
                
            <div class="form-group">
              <label for="asignatura">Asignatura</label>
              <select class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select>
            </div>
                
            <div class="form-group">
              <label for="estado">Estado</label>
              <select class="form-control" height="80">
                <option>Bueno</option>
                <option>Regular</option>
                <option>Malo</option>
              </select>
            </div>
                
            <div class="form-group">
              <label for="copias">Cantidad de copias</label>
              <input type="text" class="form-control">
            </div>
                
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="1">
                <label class="form-check-label" for="fisico">&nbsp;Tipo Físico
                </label>
             </div>   
                
             <div class="form-check">
                <input class="form-check-input" type="checkbox" value="1">
                <label class="form-check-label" for="digital">&nbsp;Tipo Digital
                </label>
             </div>
                
            <div class="form-group">
              <label for="comentario">Comentario corto</label>
              <textarea class="form-control" maxlength="25" rows="3"></textarea>
            </div>
          </form>
          </div>  
           </div>
            <%@ include file="footer.jsp" %>
        </div>
    </body>
</html>
