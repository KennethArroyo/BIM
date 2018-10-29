/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function getAsignaturas(){
            $.ajax({type: "GET", 
                  url:"GetAsignaturas",
                  success: 
                    function(obj){
                      dibujarTabla(obj);
                    },
                  error: function(status){
                         window.alert("Ha ocurrido un error con la lista de asignaturas");
                    }                    
                });   
            });



function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaLibros").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead class='thead-dark'/>");
    var row = $("<tr />");
    head.append(row);
    $("#tablaAsignaturas").append(head);
    //row.append($("<th>ID<b></b></th>"));
    row.append($("<th>NOMBRE<b></b></th>"));
    row.append($("<th>EDITAR<b></b></th>"));
    row.append($("<th>ELIMINAR<b></b></th>"));
    //row.append($("<th>HAB/DESHAB<b></b></th>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de un libro

    var row = $("<tr/>");
    $("#tablaAsignaturas").append(row);
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($('<td><button type="button" class="btn btn-info" onclick="ModificarAsig(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button></td>'));
    row.append($('<td><button type="button" class="btn btn-danger" onclick="EliminarAsig(' + rowData.id + ');">' + '<img src="imagenes/lead_pencil.png"/>' + '</button></td>'));

    //row.append($('<td><button type="button" class="btn btn-danger" onclick="deshabilitarLibro('+rowData.id+');">'+'del'+'</button></td>'));          

}
