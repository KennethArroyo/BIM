<%-- 
    Document   : bitacorasPrestamos
    Created on : 03/05/2019, 04:45:10 PM
    Author     : esteban montero
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Prestamo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Bitacoras Prestamos</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/BitacorasPrest.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
    </head>
   <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
    <%@include file="header.jsp"%>
        <form action="Descarga" id="descarga" method="GET" enctype="multipart/form-data"></form>
                    
        <div class="containerDataTableForm">
        <div class='registroDataTableForm'>    
        <h2  class='tituloDataTableForm'>Bitácoras de Prestamos</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover" id="mydata">
        <thead>
         <tr>
              
              <th class="th-sm">Identificación Usuario
              </th>
              <th class="th-sm">Libro
              </th>
              <th class="th-sm">Fecha Inicio
              </th>
              <th class="th-sm">Fecha Final
              </th>
              <th class="th-sm">Accion
              </th>
              <th class="th-sm">fecha de accion
              </th>
              <th class="th-sm">Usuario
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

                  
        
        <form role="form" action="Descarga" id="descarga" method="POST">
        </form>   
        
    
        </body>

        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
</html>
