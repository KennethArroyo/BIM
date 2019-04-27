<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Bitacoras Libros</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/BitacorasLibs.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
    </head>

    <body>
    <%@include file="header.jsp"%>
        <form action="Descarga" id="descarga" method="GET" enctype="multipart/form-data">

        </form>
                    
        <div class="container" style="margin-top:150px; ">
        <h2  style="align-content: center;">Bitacoras Libros</h2><br><br>
        <table class="table table-striped table-bordered table-hover" id="mydata">
            
        <thead>
         <tr>
              <th class="th-sm">Clasificacion
              </th>
              <th class="th-sm">Titulo
              </th>
              <th class="th-sm">Estado del Libro
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
        
        
        <form role="form" action="Descarga" id="descarga" method="POST">
        </form>   
        
    
        </body>

            <footer>
                <%@include file="footer.jsp"%>
            </footer>
        </html>
