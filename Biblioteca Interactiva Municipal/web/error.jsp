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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
         <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"><br> 
            <div class="container" style="align-self: center; padding-left: 35%; padding-top: 10%">
                <div class="form-group">
                    <label for="error"></label>
                        <textarea class="form_control" rows="6" id="error"><%String name = (String)request.getAttribute("error"); %>
                            <%= name%>
                        </textarea>
                </div>
            </div>
        </div>
    </body>
    
    
    
    <footer>
        <br><br><br><br><br><br>
        <%@ include file="footer.jsp" %>
    </footer> 
</html>
