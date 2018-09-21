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
        <!--Fondo de Pantalla-->
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"> 

            <div class="container">
                <h2>Buscar Libros</h2>
                <br>
                <div class="container">
                    <form role="form" onsubmit="return false;">
                        <div class="form-group">
                            <label for="sel1">Buscar Por:
                                <select id="select" class="form-control" id="sel1" name="sellist1">
                                    <option>autor</option>
                                    <option>Título</option>
                                </select></label>
                            <br><br>
                            <div class="input-group" id="search-bar">
                                <input type="text" class="form-control" id="textobuscar" placeholder="Buscar" >
                                <div class="input-group-btn">
                                    <button  class="btn btn-default" onclick="buscarLibroAutor()" ><i class="fa fa-search" id="buscar"></i></button>
                                </div>
                            </div>
                            <br>
                        </div>
                    </form>
                </div>

            </div>
            <div class="container" >
                <table border="1" class="table" id="tablaLibros"></table>
            </div>
        </div> 


    </body> 

    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>