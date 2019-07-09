<%-- 
    Document   : OtrasConfigPerfil
    Created on : 09/07/2019, 02:37:24 PM
    Author     : esteban montero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deshabilitar perfil</title>
        <%@include file="librerias.jsp"%>
        <script src="js/modals.js" type="text/javascript"></script>    
        
        <%@include file="header.jsp"%>
    </head>
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        
        <div class="containerForm">
            <div class="registroForm">
                <h2 class="tituloForm">Deshabilitar Mi Perfil</h2>
                <div class="divisionTitulo"></div>
                <center><img src="imagenes/remove_user.png" width="200" height="200"/></center>
                <br>
                <center> <button type="submit" class="btn btn-success" onclick="modalDeshabilitar()">Deshabilitar</button></center>
            </div>
        </div>
        <footer>
            <%@include file="footer.jsp"%>        
        </footer>
    </body>


</html>
