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
        <script src="js/Sesion.js" type="text/javascript"></script>
        <script src="js/Header.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Header -->
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
                                        <li class="dropdown"><a href="#">Libros<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="agregarLibro.jsp">Agregar<br>Libro</a></li>
                                                <li><a href="buscarLibro.jsp">Buscar Libro</a></li>
                                                <li><a href="asignaturas.jsp"><i aria-hidden="true"></i>Asignaturas</a></li>
                                                <li><a href="autores.jsp"><i aria-hidden="true"></i>Autores</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown"><a href="">Préstamos<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="crearPrestamo.jsp">Crear Préstamo</a></li>
                                                <li><a href="crearPrestamoUsuario.jsp">Crear Préstamo Usuario</a></li>
                                            </ul>

                                        </li>
                                        <li><a href="">Actividades</a></li>
                                        <li class="dropdown"><a href=""><small class="fa fa-user"></small>&nbsp Mi perfil<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="editarUsuario.jsp">Editar mi perfil</a></li>
                                                
                                            </ul>
                                        </li>
                                        <li><a href="javascript:cerrar();">Cerrar sesion</a></li>
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
                                        <li><a href="">Actividades</a></li>      
                                        <li class="my_account_item"><a href="registroUsuario.jsp"><small class="fa fa-user-plus" ></small>&nbsp Registrarse</a></li>
                                        <li><a href="inicioSesion.jsp"><small class="fa fa-sign-in" ></small>&nbsp Iniciar Sesión</a></li>
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
                                        <li><a href="javascript:cerrar();">Cerrar sesion</a></li>
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
                <div class="administradorR">
                    <a class="menu_name" href="principal.jsp">Biblioteca Interactiva Municipal</a><br>
                    <ul class="menu_top_nav">
                        <li class="menu_item"><a href="principal.jsp" >Inicio</a></li>
                        <li class="menu_item has-children"><a href=""> Libros <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                            <ul class="menu_selection"> 
                                <li><a href="agregarLibro.jsp"><i aria-hidden="true"></i>Agregar Libro</a></li> <!--Item del dropdown-->
                                <li><a href="buscarLibro.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>
                                <li><a href="asignaturas.jsp"><i aria-hidden="true"></i>Asignaturas</a></li>
                                <li><a href="autores.jsp"><i aria-hidden="true"></i>Autores</a></li>
                            </ul>
                        </li>
                        <li class="menu_item has-children"><a href="#">Prestamo <i class="fa fa-angle-down"></i></a>
                            <ul class="menu_selection">
                                <li><a href="crearPrestamo.jsp"><i aria-hidden="true"></i>Crear Préstamo</a></li>
                                <li><a href="crearPrestamoUsuario.jsp"><i aria-hidden="true"></i>Crear Préstamo Usuario</a></li>
                            </ul>
                        </li>
                        <li class="menu_item has-children"><a href=""> &nbsp Mi perfil <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                            <ul class="menu_selection"> 
                                <li><a href=""><i aria-hidden="true"></i>Libros descargados</a></li> <!--Item del dropdown-->
                                <li><a href=""><i aria-hidden="true"></i>Mis prestamos</a></li>
                                <li><a href=""><i aria-hidden="true"></i>Editar perfil</a></li>
                                <li><a href=""><i aria-hidden="true"></i>Autores</a></li>
                            </ul>
                        </li>
                        <li class="menu_item"><a href="javascript:cerra();" >Cerrar Sesion</a></li>
                    </ul>
                </div>

                <div class="anonimoR">
                    <a class="menu_name" href="principal.jsp">Biblioteca Interactiva Municipal</a><br>
                    <ul class="menu_top_nav">
                        <li class="menu_item"><a href="principal.jsp" >Inicio</a></li>
                        <li class="menu_item"><a href="buscarLibro.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>
                        <li class="menu_item"><a href="">Actividades</a></li>
                        <li class="menu_item"><a href="registroUsuario.jsp"><span class="fa fa-user-plus"></span>&nbsp Registrarse</a></li>
                        <li class="menu_item"><a href="inicioSesion.jsp"><span class="fa fa-sign-in"></span>&nbsp Iniciar Sesión</a></li>
                    </ul>
                </div>

                <div class="usuarioR">
                    <a class="menu_name" href="principal.jsp">Biblioteca Interactiva Municipal</a><br>
                    <ul class="menu_top_nav">
                        <li class="menu_item"><a href="principal.jsp" >Inicio</a></li>
                        <li class="menu_item"><a href="buscarLibro.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>     
                        <li class="menu_item"><a href="crearPrestamo.jsp"><i aria-hidden="true"></i>Crear Préstamo</a></li>
                        <li class="menu_item"><a href="">Actividades</a></li>
                        <li class="menu_item has-children"><a href=""> &nbsp Mi perfil <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                            <ul class="menu_selection"> 
                                <li><a href=""><i aria-hidden="true"></i>Libros descargados</a></li> <!--Item del dropdown-->
                                <li><a href=""><i aria-hidden="true"></i>Mis prestamos</a></li>
                                <li><a href=""><i aria-hidden="true"></i>Editar perfil</a></li>
                                <li><a href=""><i aria-hidden="true"></i>Autores</a></li>
                            </ul>
                        </li>
                        <li class="menu_item"><a href="javascript:cerrar();" >Cerrar Sesion</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </body>
</html>
