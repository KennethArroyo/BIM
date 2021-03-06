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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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
                                    <a href="Principal"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="Principal">Inicio</a></li>
                                        <li class="dropdown"><a href="#">Libros<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="agregarLibro.jsp">Agregar Libro</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="buscarLibroAdmin.jsp">Buscar Libro</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="asignaturas.jsp"><i aria-hidden="true"></i>Asignaturas</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="autores.jsp"><i aria-hidden="true"></i>Autores</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown"><a href="#">Préstamos<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="BuscarTodosPrestamos.jsp">Editar estado de los préstamos</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="ReportesPrestamos.jsp">Reportes de préstamos</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="crearPrestamo.jsp">Crear Préstamo</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="crearPrestamoUsuario.jsp">Crear Préstamo a un usuario</a></li>

                                            </ul>

                                        </li>
                                        <li class="dropdown"><a href="#">Usuarios<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="buscarUsuarios.jsp">Buscar Usuarios</a></li>
                                            </ul>

                                        </li>
                                        <li class="dropdown"><a href="#">Mantenimientos<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <li><a href="mantenimientoActividades.jsp">Mantenimiento de actividades</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="bitacorasUsuarios.jsp">Bitácoras de Usuario</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="bitacorasLibros.jsp">Bitácoras de Libros</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="bitacorasPrestamos.jsp">Bitácoras de Préstamos</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="verSanciones.jsp">Buscar Sanciones</a></li>


                                            </ul>
                                        </li>
                                        <li class="dropdown"><a href="#"><small class="fa fa-user"></small>&nbsp Mi perfil<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">
                                                <ul class="dropdown_selection">
                                                    <li><a href="EditarUsuario.jsp">Editar mi perfil</a></li>
                                                    <div class='divisionmenu'></div>
                                                    <li><a href="VerPrestamosUsuario.jsp">Mis préstamos</a></li>
                                                    <div class='divisionmenu'></div>
                                                    <li><a href="OtrasConfigPerfil.jsp">Deshabilitar perfil</a></li>
                                                </ul>
                                            </ul>
                                        </li>
                                        <li><a href="javascript:cerrar();"><small class="fa fa-sign-out"></small>&nbsp Cerrar sesion</a></li>
                                    </ul>
                                    <div class="hamburger_container">	<!--Menu desplegable, Modo Responsivo-->				
                                        <i class="fa fa-bars" aria-hidden="true" id="hamburguer-icon"></i>
                                    </div>
                                </nav>
                            </div>

                            <div class="anonimo">
                                <div class="logo_container">
                                    <a href="Principal"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="Principal">Inicio</a></li>                           
                                        <li><a href="buscarLibroUsuario.jsp">Buscar Libro</a></li>                                                                                                                    
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
                                    <a href="Principal"><img class="company_logo" src="imagenes/EscudoMunicipal.png"></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu">
                                        <li><a href="Principal">Inicio</a></li>                           
                                        <li><a href="buscarLibroUsuario.jsp">Buscar Libro</a></li>                                                                                               
                                        <li><a href="crearPrestamo.jsp">Crear Préstamo</a></li>                                                                                                                     
                                        <li><a href="">Actividades</a></li>
                                        <li class="dropdown"><a href=""><small class="fa fa-user"></small>&nbsp Mi perfil<i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown_selection">

                                                <li><a href="VerPrestamosUsuario.jsp">Mis préstamos</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="EditarUsuario.jsp">Editar mi perfil</a></li>
                                                <div class='divisionmenu'></div>
                                                <li><a href="OtrasConfigPerfil.jsp">Deshabilitar perfil</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="javascript:cerrar();"><small class="fa fa-sign-out" ></small>Cerrar sesion</a></li>
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
                    <a class="menu_name" href="Principal">Biblioteca Interactiva Municipal</a><br>
                    <ul class="menu_top_nav">
                        <li class="menu_item"><a href="Principal" >Inicio</a></li>
                        <li class="menu_item has-children"><a href="#"> Libros <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                            <ul class="menu_selection"> 
                                <li><a href="agregarLibro.jsp"><i aria-hidden="true"></i>Agregar Libro</a></li> <!--Item del dropdown-->
                                <li><a href="buscarLibroAdmin.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>
                                <li><a href="asignaturas.jsp"><i aria-hidden="true"></i>Asignaturas</a></li>
                                <li><a href="autores.jsp"><i aria-hidden="true"></i>Autores</a></li>
                            </ul>
                        </li>
                        <li class="menu_item has-children"><a href="#">Prestamo<i class="fa fa-angle-down"></i></a>
                            <ul class="menu_selection">
                                <li><a href="BuscarTodosPrestamos.jsp"><i aria-hidden="true"></i>Editar estado de los préstamos</a></li>
                                <li><a href="ReportesPrestamos.jsp"><i aria-hidden="true"></i>Reportes de préstamos</a></li>
                                <li><a href="crearPrestamo.jsp"><i aria-hidden="true"></i>Crear Préstamo</a></li>
                                <li><a href="crearPrestamoUsuario.jsp"><i aria-hidden="true"></i>Crear Préstamo Usuario</a></li>

                            </ul>
                        </li>
                        <li class="dropdown"><a href="#">Mantenimientos<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown_selection">
                                <li><a href="mantenimientoActividades.jsp"><i aria-hidden="true"></i>Mantenimiento de actividades</a></li>
                                <li><a href="bitacorasUsuarios.jsp"><i aria-hidden="true"></i>Bitacoras Usuario</a></li>
                                <li><a href="bitacorasLibros.jsp"><i aria-hidden="true"></i>Bitacoras Libros</a></li>
                                <li><a href="bitacorasPrestamos.jsp"><i aria-hidden="true"></i>Bitacoras Préstamos</a></li>
                                <li><a href="verSanciones.jsp"><i aria-hidden="true"></i>Buscar Sanciones</a></li>

                            </ul>
                        </li>

                        <li class="menu_item has-children"><a href="#">Usuarios <i class="fa fa-angle-down"></i></a>
                            <ul class="menu_selection">
                                <li><a href="buscarUsuarios.jsp"><i aria-hidden="true"></i>Buscar Usuarios</a></li>
                            </ul>
                        </li>
                        <li class="menu_item has-children"><a href=""> &nbsp Mi perfil <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                            <ul class="dropdown_selection"> 
                                <li><a href="VerPrestamosUsuario.jsp"><i aria-hidden="true"></i>Mis prestamos</a></li>
                                <li><a href="EditarUsuario.jsp"><i aria-hidden="true"></i>Editar perfil</a></li>
                                <li><a href="OtrasConfigPerfil.jsp"><i aria-hidden="true"></i>Deshabilitar perfil</a></li>
                            </ul>
                        </li>
                        <li class="menu_item"><a href="javascript:cerrar();"><span class="fa fa-sign-out"></span>&nbspCerrar Sesion</a></li>
                    </ul>
                </div>

                <div class="anonimoR">
                    <a class="menu_name" href="Principal">Biblioteca Interactiva Municipal</a><br>
                    <ul class="menu_top_nav">
                        <li class="menu_item"><a href="Principal" >Inicio</a></li>
                        <li class="menu_item"><a href="buscarLibroUsuario.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>
                        <li class="menu_item"><a href=""><i aria-hidden="true"></i>Actividades</a></li>
                        <li class="menu_item"><a href="registroUsuario.jsp"><span class="fa fa-user-plus"></span>&nbsp Registrarse</a></li>
                        <li class="menu_item"><a href="inicioSesion.jsp"><span class="fa fa-sign-in"></span>&nbsp Iniciar Sesión</a></li>
                    </ul>
                </div>

                <div class="usuarioR">
                    <a class="menu_name" href="Principal">Biblioteca Interactiva Municipal</a><br>
                    <ul class="menu_top_nav">
                        <li class="menu_item"><a href="Principal">Inicio</a></li>
                        <li class="menu_item"><a href="buscarLibroUsuario.jsp"><i aria-hidden="true"></i>Buscar Libro</a></li>     
                        <li class="menu_item"><a href="crearPrestamo.jsp"><i aria-hidden="true"></i>Crear Préstamo</a></li>
                        <li class="menu_item"><a href=""><i aria-hidden="true"></i>Actividades</a></li>
                        <li class="menu_item has-children"><a href=""> &nbsp Mi perfil <i class="fa fa-angle-down"></i></a> <!--Dropdown-->
                            <ul class="menu_selection"> 

                                <li><a href="VerPrestamosUsuario.jsp"><i aria-hidden="true"></i>Mis prestamos</a></li>
                                <li><a href="EditarUsuario.jsp"><i aria-hidden="true"></i>Editar perfil</a></li>
                                <li><a href="OtrasConfigPerfil.jsp"><i aria-hidden="true"></i>Deshabilitar perfil</a></li>
                            </ul>
                        </li>
                        <li class="menu_item"><a href="javascript:cerrar();"><span class="fa fa-sign-in"></span>&nbspCerrar Sesion</a></li>
                    </ul>
                </div>
            </div>
        </div>



    </body>
</html>
