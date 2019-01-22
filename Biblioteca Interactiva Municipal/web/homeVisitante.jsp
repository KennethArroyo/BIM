<%-- 
    Document   : homeVisitante
    Created on : 15/01/2019, 09:10:22 PM
    Author     : esteban
--%>

<html>
    <head>
        <%@ include file="librerias.jsp" %>
    </head>
    <body>
        <!-- Header -->
        <header class="header trans_300">
            <!-- Top Navigation --> 
            <div class="top_nav">
                <div class="company_name">BIBLIOTECA INTERACTIVA MUNICIPAL</div>
            </div>
            <!-- Main Navigation -->
            <!--Menu Principal, Vista Normal-->
            <div class="main_nav_container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-24">
                            <div class="administrador">
                                <div class="logo_container">
                                    <a href="principal.jsp"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
                                </div>
                                <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li><a href="principal.jsp">Inicio</a></li>                           
                                    <li><a href="buscarLibro.jsp">Buscar Libro</a></li>                                                                                               
                                    <li><a href="crearPrestamo.jsp">Crear Préstamo</a></li>                                                                                                                     
                                    <li><a href="">Actividades</a></li>
                                    <li class="dropdown"><a href=""><small class="fa fa-user"></small>&nbsp Mi perfil<i class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_selection">
                                            <li><a href="">Libros descargados</a></li>
                                            <li><a href="">Mis préstamos</a></li>
                                            <li><a href="">Editar mi perfil</a></li>
                                        </ul>
                                    </li>                                  
                                </ul>
                                    <div class="hamburger_container">	<!--Menu desplegable, Modo Responsivo-->				
                                        <i class="fa fa-bars" aria-hidden="true" id="hamburguer-icon"></i>
                                    </div>
                                </nav>
                            </div>
                            <div class="anonimo">
                                <div class="logo_container">
                                    <a href="principal.jsp"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
                                </div>
                                <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li><a href="principal.jsp">Inicio</a></li>                           
                                    <li><a href="buscarLibro.jsp">Buscar Libro</a></li>                                                                                               
                                    <li><a href="crearPrestamo.jsp">Crear Préstamo</a></li>                                                                                                                     
                                    <li><a href="">Actividades</a></li>
                                    <li class="dropdown"><a href=""><small class="fa fa-user"></small>&nbsp Mi perfil<i class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_selection">
                                            <li><a href="">Libros descargados</a></li>
                                            <li><a href="">Mis préstamos</a></li>
                                            <li><a href="">Editar mi perfil</a></li>
                                        </ul>
                                    </li>                                  
                                </ul>
                                    <div class="hamburger_container">	<!--Menu desplegable, Modo Responsivo-->				
                                        <i class="fa fa-bars" aria-hidden="true" id="hamburguer-icon"></i>
                                    </div>
                                </nav>
                            </div>
                            <div class="usuario">
                                <div class="logo_container">
                                    <a href="principal.jsp"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
                                </div>
                                <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li><a href="principal.jsp">Inicio</a></li>                           
                                    <li><a href="buscarLibro.jsp">Buscar Libro</a></li>                                                                                               
                                    <li><a href="crearPrestamo.jsp">Crear Préstamo</a></li>                                                                                                                     
                                    <li><a href="">Actividades</a></li>
                                    <li class="dropdown"><a href=""><small class="fa fa-user"></small>&nbsp Mi perfil<i class="fa fa-angle-down"></i></a>
                                        <ul class="dropdown_selection">
                                            <li><a href="">Libros descargados</a></li>
                                            <li><a href="">Mis préstamos</a></li>
                                            <li><a href="">Editar mi perfil</a></li>
                                        </ul>
                                    </li>                                  
                                </ul>
                                    <div class="hamburger_container">	<!--Menu desplegable, Modo Responsivo-->				
                                        <i class="fa fa-bars" aria-hidden="true" id="hamburguer-icon"></i>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </header>

        <!--Menu Principal, Modo Responsivo-->
        <div class="fs_menu_overlay"></div>
        <div class="hamburger_menu">
            <div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
            <div class="hamburger_menu_content text-right">
                <a class="menu_name" href="principal.jsp">Biblioteca Interactiva Municipal</a><br>
                <ul class="menu_top_nav">
                    <li class="menu_item"><a href="principal.jsp" >Inicio</a></li>                                           
                    <li><a href="buscarLibro.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>                                                                                                                     
                    <li><a href="crearPrestamo.jsp"><i aria-hidden="true"></i>Crear Préstamo</a></li>                                                
                    <li class="menu_item"><a href="">Actividades</a></li>
                    <li class="menu_item has-children"><a href="#">Mi perfil<i class="fa fa-sign-user"></i></a>
                        <ul class="menu_selection">
                            <li><a href=""><i aria-hidden="true">Libros descargados</i>></a></li>
                            <li><a href=""><i aria-hidden="true">Mis préstamos</i></a></li>
                            <li><a href=""><i aria-hidden="true">Editar mi perfil</i></a></li>
                        </ul>
                    </li>                                      
                </ul>
            </div>
        </div>
        <div class="main_slider" style="background-image:url(imagenes/slider_book.jpg)"></div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
