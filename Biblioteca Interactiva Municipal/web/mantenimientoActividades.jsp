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
        <%@ include file="header.jsp" %>
    </head>
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        
        <div class="containerMantenimientoForm">
                    <div class='registroMantenimientoForm'>
                    <h2 class='tituloMantenimientoForm'>Mantenimiento de actividades</h2>
                    <div class='divisionTitulo'></div>
                    <form action="Actividades" onsubmit="return true" id="formAct" enctype="multipart/form-data" method="POST">
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
                    <br><br><br>
                
        <table class="table table-striped table-bordered table-hover compact" id="mydata">
            
        <thead >
         <tr>
              <th class="th-sm">Nombre
              </th>
              <th class="th-sm">Eliminar
              </th>
            </tr>
        </thead>

        <tbody>
        </tbody>
        </table>
        </div>
        </div>
    </body>

    <%@ include file="footer.jsp" %>
</html>
