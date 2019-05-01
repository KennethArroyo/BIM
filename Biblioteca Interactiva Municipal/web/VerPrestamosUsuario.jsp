<%-- 
    Document   : VerPrestamosUsuario
    Created on : 21/02/2019, 02:52:41 PM
    Author     : esteban
--%>
<%@page import ="java.util.ArrayList"%>
<%@page import="bim.entidades.Prestamo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mis préstamos</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/BuscarPrestamosUsuario.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <%@include file="header.jsp"%>

    </head>
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">                    
        <div class="containerDataTableForm">
        <div class="registroDataTableForm">    
        <h2 class="tituloDataTableForm">Mis Préstamos</h2>
        <div class="divisionTitulo"></div>
        <table class="table table-striped table-bordered table-hover" id="mydataPrestamo">
            
        <thead>
         <tr>
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

                <%@include file="footer.jsp"%>
</html>
