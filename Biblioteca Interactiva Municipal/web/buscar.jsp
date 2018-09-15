<%-- 
    Document   : buscar
    Created on : Sep 15, 2018, 12:11:31 AM
    Author     : Kenneth
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Buscar Libro</title>
        <%@include file="librerias.jsp"%>
    </head>
    
    <body>
        <%@include file="header.jsp"%>
            <!-- Slider -->
            <!--Fondo de Pantalla-->
            <div class="main_slider" style="background-image:url(imagenes/bg.jpg)"> 
                
            <div class="container">
                <h2>Buscar Libros</h2>
                <div class="container">
                    <form action="/action_page.php">
                      <div class="form-group">
                        <label for="sel1">Asignatura:
                        <select id="select" class="form-control" id="sel1" name="sellist1">
                          <option>Ciencia</option>
                          <option>Matemática</option>
                          <option>Física</option>
                          <option>Literatura</option>
                        </select></label>
                        <label for="sel1">Buscar Por:
                        <select id="select" class="form-control" id="sel1" name="sellist1">
                          <option>Autor</option>
                          <option>Título</option>
                        </select></label>
                          <br>
                            <input type="text" id="input" class="form-control" placeholder="Search" name="search">
                        <br>
                      </div>
                      <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                  </div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Firstname</th>
                                <th>Lastname</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                              <td>John</td>
                              <td>Doe</td>
                              <td>john@example.com</td>
                            </tr>
                            <tr>
                              <td>Mary</td>
                              <td>Moe</td>
                              <td>mary@example.com</td>
                            </tr>
                            <tr>
                              <td>July</td>
                              <td>Dooley</td>
                              <td>july@example.com</td>
                            </tr>
                        </tbody>
                    </table>
            </div>

            </div> 
            
    </body> 
  
    <footer>
        <br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
    </footer>
</html>
