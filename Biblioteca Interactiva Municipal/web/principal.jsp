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


<script>
 const mySiema = new Siema({duration: 600,easing: 'cubic-bezier(.11,.73,.57,1.53)', loop: true});
 document.querySelector('#prev').addEventListener('click',() => mySiema.prev());
 document.querySelector('#next').addEventListener('click',() => mySiema.next());
</script>
    </body>
    <footer><%@ include file="footer.jsp" %></footer>
</html>
