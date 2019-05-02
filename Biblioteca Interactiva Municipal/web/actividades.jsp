<%-- 
    Document   : Actividades
    Created on : Mar 9, 2019, 11:35:07 AM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/siema.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actividades</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container" style="text-align: center; background-image:url(imagenes/bg.jpg)" >
            <div>
                <h2 style="align-content: center; margin-top: 20%;"><center>Actividades de la Municipalidad<br>de Santo Domingo</center></h2>
            </div>
            <div class="siema">
                <div><img src="imagenes/book3.jpg" alt=""></div>
                <div><img src="imagenes/book3.jpg" alt=""></div>
                <div><img src="imagenes/book3.jpg" alt=""></div>
                <div><img src="imagenes/book3.jpg" alt=""></div>
            </div>
            <br>
            <button id="prev" class="btn btn-info">Anterior</button>
            <button id="next" class="btn btn-info">Siguiente</button>
        </div>
<script>
 const mySiema = new Siema({duration: 600,easing: 'cubic-bezier(.11,.73,.57,1.53)', loop: true});
 document.querySelector('#prev').addEventListener('click',() => mySiema.prev());
 document.querySelector('#next').addEventListener('click',() => mySiema.next());
</script>
    </body>
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>  
</html>
