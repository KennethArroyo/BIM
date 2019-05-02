<%-- 
    Document   : reportes
    Created on : Mar 19, 2019, 9:07:59 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="librerias.jsp" %>
        <script src="js/jspdf.min.js"></script>
        <script src="js/Reportes.js" type="text/javascript"></script>
        <title>Reportes</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="modal fade" id="ModalReportes" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h4 class="modal-title" id="myModalTitle">Generar reportes
                            <button type="button" class="close" id="close-modal" data-dismiss="modal" style="margin-left: 500px;">&times;</button>

                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Generar reporte libros prestados</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                         <button onclick="reportePrestados()" class=" btn btn-primary">Generar</button>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </body
            <footer>
            <%@include file="footer.jsp"%>        
        </footer>
</html>
