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
  <script src="js/siema.min.js"></script>
  <%@ include file="header.jsp" %>
    </head>
    <body style=" background: url(imagenes/bg2.png) no-repeat center center fixed;">
        <jsp:useBean id="actividades" scope="request" type="List<Actividad>" class="java.util.ArrayList"/>
            
                    <div class="siema">
                        <div><img src='Actividades/actividadesmunicipales.jpg' alt=""></div>
                        <%for(int i = 0;i<actividades.size();i++){;%>
                            <%Actividad p = actividades.get(i);%>
                            <div><img src='Actividades/<%=p.getNombre()%>' alt=""></div>
                        <%}%>
                    </div>
                    

<script>
// const mySiema = new Siema({duration: 600,easing: 'cubic-bezier(.11,.73,.57,1.53)', loop: true});
 //document.querySelector('#prev').addEventListener('click',() => mySiema.prev());
 //document.querySelector('#next').addEventListener('click',() => mySiema.next());
    class SiemaWithDots extends Siema {
    addDots() {
        // create a contnier for all dots
        // add a class 'dots' for styling reason
        this.dots = document.createElement('div');
        this.dots.classList.add('dots');

        // loop through slides to create a number of dots
        for(let i = 0; i < this.innerElements.length; i++) {
          // create a dot
          const dot = document.createElement('button');

          // add a class to dot
          dot.classList.add('dots__item');

          // add an event handler to each of them
          dot.addEventListener('click', () => {
            this.goTo(i);
          })

          // append dot to a container for all of them
          this.dots.appendChild(dot);
        }

        // add the container full of dots after selector
        this.selector.parentNode.insertBefore(this.dots, this.selector.nextSibling);
      }

      updateDots() {
        // loop through all dots
        for(let i = 0; i < this.dots.querySelectorAll('button').length; i++) {
          // if current dot matches currentSlide prop, add a class to it, remove otherwise
          const addOrRemove = this.currentSlide === i ? 'add' : 'remove';
          this.dots.querySelectorAll('button')[i].classList[addOrRemove]('dots__item--active');
        }
      }
    };
 
 
 
const mySiemaWithDots = new SiemaWithDots({
  duration: 250,
  loop: true,
       onInit: function(){
        this.addDots();
        this.updateDots();
      },

      // on change trigger method created above
      onChange: function(){
        this.updateDots()
      }
});
// listen for keydown event
setInterval(() => mySiemaWithDots.next(), 5000);

</script>
    </body>
    
    <%@ include file="footer.jsp" %>
</html>
