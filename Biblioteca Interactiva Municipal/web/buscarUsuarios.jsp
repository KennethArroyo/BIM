<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Usuario</title>
        <a href="librerias.jsp"></a>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/BuscarUsuarios.js" type="text/javascript"></script>
        <link href="estilos/bootstrap4/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/modals.js" type="text/javascript"></script>
    </head>

    <body>
    <%@include file="header.jsp"%>
                    
        <div class="container" style="margin-top:150px; ">
        <h2  style="align-content: center;">Buscar Usuarios</h2><br><br>
        <table class="table table-striped table-bordered table-hover" id="mydata">
            
        <thead>
         <tr>
              <th class="th-sm">Identificación
              </th>
              <th class="th-sm">Nombre
              </th>
              <th class="th-sm">Apellidos
              </th>
              <th class="th-sm">Lugar de Residencia
              </th>
              <th class="th-sm">Teléfono
              </th>
              <th class="th-sm">Correo
              </th>
              <th class="th-sm">Trabajo/Centro de Estudio
              </th>
              <th class="th-sm"> Perfil Habilitado
              </th>
            </tr>
        </thead>

        <tfoot>
        </tfoot>

        <tbody>
        </tbody>
        </table>
        </div>
    
        </body>

            <footer>
                <%@include file="footer.jsp"%>
            </footer>
        </html>
