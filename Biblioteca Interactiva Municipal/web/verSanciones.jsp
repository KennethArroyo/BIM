<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>
<%--<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Libro"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.*" session="true" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Sanciones</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/Sanciones.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
            <%@include file="header.jsp"%>
    </head>

    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
                    
        <div class="containerDataTableForm">
        <div class='registroDataTableForm'>    
        <h2  class='tituloDataTableForm'>Buscar Sanciones</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover" id="mydata">
            
        <thead>
         <tr>
              <th class="th-sm">Fecha Inicio
              </th>
              <th class="th-sm">Fecha Final
              </th>
              <th class="th-sm">Estado
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
       
    
        </body>

        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
        </html>
