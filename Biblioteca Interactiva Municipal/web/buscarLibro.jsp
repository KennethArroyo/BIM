<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="bim.entidades.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Libro</title>
        <%@include file="librerias.jsp"%>
        <jsp:useBean id="libros" scope="request" type="ArrayList<Libro>" class="java.util.ArrayList"/>
    </head>
    
    <body>
        <%@include file="header.jsp"%>
            <!--Fondo de Pantalla-->
            <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"> 
                
            <div class="container">
                <h2>Buscar Libros</h2>
                <br>
                <div class="container">
                    <form action="BuscarLibro">
                      <div class="form-group">
                        <label for="sel1">Buscar Por:
                        <select id="select" class="form-control" id="sel1" name="sellist1">
                          <option>Autor</option>
                          <option>Título</option>
                        </select></label>
                        <br><br>
                        <div class="input-group" id="search-bar">
                            <input type="text" class="form-control" placeholder="Buscar" name="search">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                        <br>
                      </div>
                    </form>
                  </div>
                    <table class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" id="tabla-libros">
                        <thead>
                            <tr>
                                <th>Firstname</th>
                                <th>Lastname</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                              <td>John</td>
                              <td>Doe</td>
                              <td>john@example.com</td>
                            </tr>
                            <tr>
                              <td>Mary</td>
                              <td>Moe</td>
                              <td>mary@example.com</td>
                            </tr>
                            <tr>
                              <td>July</td>
                              <td>Dooley</td>
                              <td>july@example.com</td>
                            </tr>
                        </tbody>
                    </table>
            </div>

            </div> 
            
    </body> 
    
    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>
