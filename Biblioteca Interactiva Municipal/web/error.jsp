<%-- 
    Document   : Error
    Created on : Feb 25, 2019, 9:29:35 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="librerias.jsp" %>
        <%@ include file="header.jsp" %>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
         <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            <div class="container" style="align-self: center; padding-top: 10%">
                    <label for="error"></label>
                        <div class="form-group height25" >
                            <i class="material-icons" style="font-size: 45px; margin-left: 39%;">mood_bad</i>
                                <div class="alert alert-warning hiddenDiv" id="mesajeResult">
                                    <strong id="mesajeResultNeg">Importante</strong> 
                                    <span id="mesajeResultText"><%String name = (String)request.getAttribute("error"); %>
                                        <%= name%>
                                    </span>
                                </div>
                                    <a class="btn btn-primary" onclick="volver()" role="button" style="margin-left: 35%;">Volver</a>
                            </div>
            </div>
        </div>
    </body>
    <script>
function volver() {
  window.history.back();
}
</script>
    
    
    
    <footer>
        <br><br><br><br><br><br>
        <%@ include file="footer.jsp" %>
    </footer> 
</html>
