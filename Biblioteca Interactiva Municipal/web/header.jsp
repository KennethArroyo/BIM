<%-- 
    Document   : header
    Created on : Sep 14, 2018, 11:31:12 PM
    Author     : Kenneth
--%>

<%-- 
    Document   : header
    Created on : Sep 14, 2018, 11:31:12 PM
    Author     : Kenneth
--%>

<!DOCTYPE html>
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
					<div class="logo_container">
						<a href="principal.jsp"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
					</div>
					<nav class="navbar">
                                            <ul class="navbar_menu">
                                                <li><a href="principal.jsp">Inicio</a></li>
                                                    <li class="dropdown"><a href="#">Libros<i class="fa fa-angle-down"></i></a>
                                                        <ul class="dropdown_selection">
                                                            <li><a href="agregarLibro.jsp">Agregar Libro</a></li>
                                                            <li><a href="buscarLibro.jsp">Buscar Libro</a></li>
                                                            <li><a href="">Habilitar/Deshabilitar Libro</a></li>
                                                        </ul>
                                                    </li>
                                                <li><a href="">Prestamo</a></li>
                                                <li><a href="">Actividades</a></li>
                                                <li class="my_account_item"><a href="#"><small class="fa fa-user-plus" ></small>&nbsp Registrarse</a></li>
                                                <li><a href="#"><small class="fa fa-sign-in" ></small>&nbsp Iniciar Sesión</a></li>
                                            </ul>
                                            <div class="hamburger_container">	<!--Menu desplegable, Modo Responsivo-->				
                                                <i class="fa fa-bars" aria-hidden="true" id="hamburguer-icon"></i>
                                            </div>
					</nav>
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
                    <a class="menu_name" href="#">Biblioteca Interactiva Municipal</a><br>
                        <ul class="menu_top_nav">
                            <li class="menu_item"><a href="#" >Inicio</a></li>
                                <li class="menu_item has-children"><a href="#"> Libros <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                                    <ul class="menu_selection"> 
                                        <li><a href="agregarLibro.jsp"><i aria-hidden="true"></i>Agregar Libro</a></li> <!--Item del dropdown-->
                                        <li><a href="buscarLibro.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>
                                        <li><a href=""><i aria-hidden="true"></i>Habilitar/Deshabilitar Libro</a></li>
                                    </ul>
                                </li>
                            <li class="menu_item"><a href="">Prestamo</a></li>
                            <li class="menu_item"><a href="">Actividades</a></li>
                            <li class="menu_item"><a href=""><span class="fa fa-user-plus"></span>&nbsp Registrarse</a></li>
                            <li class="menu_item"><a href=""><span class="fa fa-sign-in"></span>&nbsp Iniciar Sesión</a></li>
                        </ul>
                </div>
        </div>
    </body>
</html>
