<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Estado de Libros</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/reporteEstados.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
        <%@include file="header.jsp"%>
    </head>

    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        <form action="Descarga" id="descarga" method="GET" enctype="multipart/form-data">
        </form>
                    
        <div class="containerDataTableForm">
        <div class='registroDataTableForm'>    
        <h2  class='tituloDataTableForm'>Buscar Libros</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover" id="mydata">
            
        <thead>
         <tr>
              
              <th class="th-sm">Autor
              </th>
              <th class="th-sm">Título
              </th>
              <th class="th-sm">Estado del Libro
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
