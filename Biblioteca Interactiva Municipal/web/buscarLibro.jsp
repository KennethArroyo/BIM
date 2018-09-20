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
        <title>Buscar Libro</title>
        <%@include file="librerias.jsp"%>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/Libros.js" type="text/javascript"></script>
        <%--<jsp:useBean id="libros" scope="request" type="ArrayList<Libro>" class="java.util.ArrayList"/>
        --%>
    </head>

    <body>
        <%@include file="header.jsp"%>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Modal Header</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <p>This is a small modal.</p>
                    </div>
                </div>
            </div>
        </div>
        <!--Fondo de Pantalla-->
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"> 

            <div class="container">
                <h2>Buscar Libros</h2>
                <br>
                <div class="container">
                    <form>
                        <div class="form-group">
                            <label for="sel1">Buscar Por:
                                <select id="select" class="form-control" id="sel1" name="sellist1">
                                    <option>Autor</option>
                                    <option>Título</option>
                                </select></label>
                            <br><br>
                            <div class="input-group" id="search-bar">
                                <input type="text" class="form-control" placeholder="Buscar" id="textobuscar">
                                <div class="input-group-btn">
                                    <button  class="btn btn-default" onclick="busca()" ><i class="fa fa-search" id="buscar"></i></button>
                                </div>
                            </div>
                            <br>
                        </div>
                    </form>
                </div>
                <div>
                    <table border="1" class="table table-hover table-condensed" id="tablaLibros"></table>
                </div>
            </div>

        </div> 

    </body> 

    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>