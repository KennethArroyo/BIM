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
        <script src="js/PestamosSolicitados.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp"%>
                    
        <div class="container" style="margin-top:150px; ">
        <h2  style="align-content: center;">Préstamos Solicitados</h2><br><br>
        <table class="table table-striped table-bordered table-hover" id="mydataTodosPrestamo">
            
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
    
     
        </body>

            <footer>
                <%@include file="footer.jsp"%>
            </footer>
    </body>
</html>
