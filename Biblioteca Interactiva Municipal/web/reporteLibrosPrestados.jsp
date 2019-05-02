<%-- 
    Document   : BuscarTodosPrestamos
    Created on : 16/03/2019, 06:16:22 PM
    Author     : esteban montero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Préstamos</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/LibrosPrestados.js" type="text/javascript"></script>
        <%@include file="header.jsp"%>

    </head>
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
                    
        <div class="containerDataTableForm">
        <div class="registroDataTableForm">    
        <h2 class="tituloDataTableForm">Libros Prestados Actualmente</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover" id="mydata">
            
        <thead>
         <tr>
             <th class="th-sm">Nombre Usuario
              </th>
              <th class="th-sm">Fecha Inicio
              </th>
              <th class="th-sm">Fecha Final
              </th>
              <th class="th-sm">Nombre libro
              </th>
              <th class="th-sm">Estado
              </th>
            </tr>
        </thead>

        <tfoot>
        </tfoot>

        <tbody>
        </tbody>
        </table>
        </div>
    </div>
     
        </body>
        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
</html>
