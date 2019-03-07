<%-- 
    Document   : principal
    Created on : Sep 14, 2018, 11:44:07 PM
    Author     : Kenneth
--%>

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
    </head>
    <body>
        <div class="super_container">
            <%@ include file="header.jsp" %>
            
            
                <!-- Slider -->
                   <!-- <div class="main_slider" style="background-image:url(imagenes/slider_book.jpg)"></div> !-->
                    
                    <div id="carouselActividades" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                          <li data-target="#carouselActividades" data-slide-to="0" class="active"></li>
                          <li data-target="#carouselActividades" data-slide-to="1"></li>
                          <li data-target="#carouselActividades" data-slide-to="2"></li>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="imagenes/book1.jpg" alt="Los Angeles" width="1100" height="500">
                              <div class="carousel-caption">
                                <h3>ACTIVIDAD #1</h3>
                              </div>
                          </div>
                          <div class="carousel-item">
                            <img src="imagenes/book2.jpg" alt="Chicago" width="1100" height="500">
                              <div class="carousel-caption">
                                <h3>ACTIVIDAD #2</h3>
                              </div>
                          </div>
                          <div class="carousel-item">
                            <img src="imagenes/book3.jpg" alt="New York" width="1100" height="500">
                              <div class="carousel-caption">
                                <h3>ACTIVIDAD #3</h3>
                              </div>
                          </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#carouselActividades" data-slide="prev">
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#carouselActividades" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a>
                      </div>

                    
            <%@ include file="footer.jsp" %>
        </div>
    </body>
</html>
