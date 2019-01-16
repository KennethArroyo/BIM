<%-- 
    Document   : inicioSesion
    Created on : 14/01/2019, 10:46:39 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Inicio de Sesión</title>
        <%@include file="librerias.jsp"%>
        <script src="js/modals.js" type="text/javascript"></script>
        <link href="estilos/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div>
                        <h2 style="align-content: center;"><center>Iniciar Sesión</center></h2>
                    </div>
                    <br/>
                    <form role="form" onsubmit="return false;" id="formLogin">
                        <div class="form-group" id="groupUsario">
                            <label for="cedula">Usuario:</label>
                            <input type="text" class="form-control" id="usuario" autofocus="true" placeholder="Usuario">
                        </div>

                        <div class="form-group" id="groupPassword">
                            <label for="nombre">Contraseña:</label>
                            <input type="password" class="form-control" id="contrasena" placeholder="Contraseña" >
                        </div>

                        <div class="form-group">
                            <input type="hidden" value="agregarPersona" id="personasAction"/>
                            <button type="submit" class="btn btn-success" id="enviar">Ingresar</button>
                            <button type="reset" class="btn btn-danger" id="cancelar">Cancelar</button>
                        </div>

                        <div class="form-group height25" >
                            <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                <strong id="mesajeResultNeg">Info!</strong> 
                                <span id="mesajeResultText">Digite su usuario y contraseña para Iniciar Sesión</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        </div>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </body>
</html>
