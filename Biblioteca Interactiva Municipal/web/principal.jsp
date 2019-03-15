<%-- 
    Document   : principal
    Created on : Sep 14, 2018, 11:44:07 PM
    Author     : Kenneth
--%>

<%@page import="java.util.List"%>
<%@page import="bim.entidades.Actividad"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteca Interactiva Municipal</title>
        <%@ include file="librerias.jsp" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <%@ include file="header.jsp" %>
    </head>
    <body>
        <jsp:useBean id="actividades" scope="request" type="List<Actividad>" class="java.util.ArrayList"/>
        <div class="super_container">
            <div id="carouselActividades" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                            <%for(int i = 0;i<actividades.size();i++){;%>
                            <c:choose>
                                <c:when test="i==0"><li data-target="#carouselActividades" data-slide-to='/<%=i%>' class="active"></li></c:when>
                                <c:otherwise><li data-target="#carouselActividades" data-slide-to='/<%=i%>'></li></c:otherwise>    <!-- else condition -->
                             </c:choose>
                             <%}%>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner">
                            <%for(int i = 0;i<actividades.size();i++){;%>
                            <%Actividad p = actividades.get(i);%>
                            <c:choose>
                                <c:when test="i==0">
                                    <div class="carousel-item active">
                                    <img src='Actividades/<%=p.getNombre()%>' alt="Los Angeles" width="1100" height="500">
                                      <div class="carousel-caption">
                                        <h3>ACTIVIDAD #1</h3>
                                      </div>
                                    </div>
                                </c:when>
                                      <c:otherwise>
                                          <div class="carousel-item">
                                            <img src='Actividades/<%=p.getNombre()%>' alt="Chicago" width="1100" height="500">
                                            <div class="carousel-caption">
                                                <h3>ACTIVIDAD #2</h3>
                                            </div>
                                        </div>
                                      </c:otherwise>    <!-- else condition -->
                             </c:choose>
                             <%}%>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#carouselActividades" data-slide="prev">
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#carouselActividades" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a>
                      </div>
            
            
            
            
            
            
            
            
            
            
                    <div class="siema">
                        <%for(int i = 0;i<actividades.size();i++){;%>
                            <%Actividad p = actividades.get(i);%>
                            <div><img src='Actividades/<%=p.getNombre()%>' alt=""></div>
                        <%}%>
                    </div>
                    <br>
            <button id="prev" class="btn btn-info">Anterior</button>
            <button id="next" class="btn btn-info">Siguiente</button>
        </div>

    </body>
    <footer><%@ include file="footer.jsp" %></footer>
</html>
